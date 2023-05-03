<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Http\Controllers\Controller;
use App\Http\Requests\DeclarationFormRequest;
use Illuminate\Http\Request;
use Auth;
use App\Models\Pays;
use App\Models\BureauDouane;
use App\Models\Materiel;
use App\Models\Declaration;
use App\Models\DeclarationMateriel;
use App\Models\Reglement;
use App\Models\ModeReglement;
use App\Models\Banque;
use App\Models\CompteTresorerie;
use Stdfn;


class DeclarationController extends Controller
{
  
    public function __construct()
    {
        $this->middleware('auth');
    }

	
	public function declarations(Request $request){
		
		#declaration_date_creation à remplacer par declaration_date :: maj before
		
		$whereRaw = ' declaration_statut <> "SUPPRIME" ';
		
		//si pas administrateur, afficher lui seul ses déclarations
		if(Auth::user()->profil_id != 1){
			$whereRaw .= ' and user_id_declarant = "'. Auth::user()->id .'" ';
		}
		
		$bureau_dedouanement  	= $request->b;
		$user_id_declarant    	= $request->u;
		$date_debut 			= !empty($request->db) ? $request->db : '2022-06-01';
		$date_fin   			= !empty($request->df) ? $request->df : date('Y-m-d');
		
		//Données pour recherche
		$bureaux 	= BureauDouane::where(['bureau_douane_statut'=>'VALIDE'])->get()->sortBy('bureau_douane_libelle');
		$users 		= User::where(['profil_id'=>4, 'statut'=>'VALIDE'])->get()->sortBy('societe');
		
		if(Auth::user()->profil_id == 1){
			
			if(!empty($bureau_dedouanement)){ $whereRaw.=  ' AND declaration.bureau_dedouanement = "'.$bureau_dedouanement.'"'; }
			if(!empty($user_id_declarant)){ $whereRaw.=  ' AND declaration.user_id_declarant = "'.$user_id_declarant.'"'; }
			if(!empty($date_debut) && !empty($date_fin)){ $whereRaw.=  ' AND date(declaration_date_creation) BETWEEN "'.$date_debut.'" AND "'.$date_fin.'" '; }
		
		}
		
		$whereRaw.= ' order by declaration_id desc ';
		
		// dd($whereRaw);
		
		$declarations = Declaration::join('tb_users','tb_users.id','declaration.user_id_declarant')
										->whereRaw($whereRaw)
										->get();
		
		
		return view('declaration.declarations',[
					'declarations'=>$declarations, 
					'bureaux'=>$bureaux,
					'users'=>$users,
					'selectedBureauID'=>$bureau_dedouanement,
					'selectedImportateurID'=>$user_id_declarant,
					'date_debut'=>$date_debut,
					'date_fin'=>$date_fin,
					]);
		
	}
	
	public function reglements(){
			
		if(Auth::user()->profil_id == 1){
			
			$reglements = Reglement::join('declaration','declaration.declaration_id','reglement.declaration_id')
									->leftjoin('rcp_mode_reglement','rcp_mode_reglement.mode_reglement_id','reglement.mode_reglement_id')
									->leftJoin('rcp_operateur_mobile_money','rcp_operateur_mobile_money.operateur_mobile_money_id','reglement.operateur_mobile_money_id')
									->whereRaw('reglement_statut <> "ANNULE" ')
									->get();
						
		}else{	
			
			$reglements = Reglement::join('declaration','declaration.declaration_id','reglement.declaration_id')
									->leftjoin('rcp_mode_reglement','rcp_mode_reglement.mode_reglement_id','reglement.mode_reglement_id')
									->leftJoin('rcp_operateur_mobile_money','rcp_operateur_mobile_money.operateur_mobile_money_id','reglement.operateur_mobile_money_id')
									->where(['user_id_declarant'=>Auth::user()->id])
									->whereRaw('reglement_statut <> "ANNULE" ')
									->get();
									
		}						
		
		
		return view('declaration.reglements',['reglements'=>$reglements]);
		
	}
	
	public function factures(){
			
		$declarations = Declaration::where(['user_id_saisie'=>Auth::user()->id])->get();
		
		return view('declaration.declarations',['declarations'=>$declarations]);
		
	}
	
	public function declaration(){
			
		$bureaux_douane 	= BureauDouane::get()->sortBy('bureau_douane_libelle');
		$liste_pays 		= Pays::get()->sortBy('pays_nom');
		$materiels 			= Materiel::get()->sortBy('materiel_libelle');
		$materiels_declares = Materiel::join('declaration_materiel','declaration_materiel.materiel_id','materiel.materiel_id')->get();
		
		return view('declaration.declaration',['bureaux_douane'=>$bureaux_douane, 'materiels'=>$materiels, 'materiels_declares'=>$materiels_declares, 'liste_pays'=>$liste_pays]);
		
	}
	
	//détail d'une déclaration
	public function declaration_ajout_materiel($declaration_id){
		
		$whereRaw = ' declaration_statut <> "SUPPRIME" ';
		
		if(Auth::user()->profil_id != 1){
			$whereRaw .= ' and user_id_declarant = "'. Auth::user()->id .'" ';
		}
		
		$declaration 		= Declaration::join('tb_users','tb_users.id','declaration.user_id_declarant')
											->where(['declaration_id'=>$declaration_id])
											->whereRaw($whereRaw)
											->first();
		
		if(!empty($declaration)){
			
			$liste_pays 		= Pays::get()->sortBy('pays_nom');
			$materiels 			= Materiel::get()->sortBy('materiel_libelle');
			$materiels_declares = Materiel::join('declaration_materiel','declaration_materiel.materiel_id','materiel.materiel_id')
											->where(['declaration_id'=>$declaration_id])->get();
			
			
			return view('declaration.declaration_ajout_materiel',['declaration'=>$declaration, 'materiels'=>$materiels, 'materiels_declares'=>$materiels_declares, 'liste_pays'=>$liste_pays]);
			
		
		}else{
			
			return back()->with('warning','DECLARATION INTROUVABLE');
			
		}
		
	}
	
	
	public function SaveDeclaration(DeclarationFormRequest $request)
    {
	
		$email 		= trim($request->email);
		$password 	= trim($request->password);
		
		$declaration 									= new Declaration();
		$declaration->user_id_declarant					= Auth::user()->id;
		$declaration->user_id_saisie					= Auth::user()->id;
		$declaration->declaration_facture_numero  	 	= Stdfn::genererNumeroFacture();
		$declaration->declaration_attestation_numero  	= Stdfn::genererNumeroAttestation();
		$declaration->declaration_numero				= trim($request->numero);
		$declaration->declaration_hmac_hash				= Stdfn::myHashHmac($declaration->declaration_numero, $declaration->user_id_declarant);
		$declaration->bureau_dedouanement				= trim($request->bureau_dedouanement);
		$declaration->declaration_libelle				= trim($request->libelle);
		$declaration->declaration_code_transitaire		= trim($request->code_transitaire);
		$declaration->declaration_nom_transitaire		= trim($request->nom_transitaire);
		$declaration->declaration_date 					= $request->declaration_date;
		$declaration->declaration_date_creation 		= gmdate('Y-m-d H:i:s');
		
		 
		$declaration->save();
		$declaration_id = $declaration->declaration_id;
		
		//incrémenter le compteur de numéro facture
		Stdfn::IncrementCompteurFacture();
		
		
		return \Redirect::route('declaration_ajout_materiel', $declaration->declaration_id)
						->with('message','DECLARATION ENREGISTRÉE AVEC SUCCÈS !');
		
		
    }
	
	
	public function SaveDeclarationSupport(Request $request)
    {
		
		$declaration_id = trim($request->declaration_id);
		$materiel_id 	= trim($request->materiel_id);
		
		$dm 										= new DeclarationMateriel();
		$dm->user_id								= Auth::user()->id;
		$dm->declaration_id							= $declaration_id;
		$dm->materiel_id							= $materiel_id;
		
		//Vérifier si l'id de la déclaration est la meme que celle dans l'url
		//FORMAT DE L'URL : DOMAINE.TLD/declaration/276/supports
		$url 	   = $_SERVER['HTTP_REFERER'];
		$tab_url   = explode('/', $url);
		$n 		   = sizeof($tab_url);
		$id_in_url = $tab_url[$n - 2];//avant dernier parametre entre // : n-1 etant le dernier parametre
		
		//si les deux id sont égaux alors y a pas eu de manipulation dans le formulaire
		if($id_in_url == $declaration_id){
			
			$declaration = Declaration::find($dm->declaration_id);
			$materiel 	 = Materiel::find($dm->materiel_id);
			
			if(!empty($declaration) && !empty($materiel)){
				
				$dm->declaration_materiel_numero_bl 			= $request->numero_bl;
				$dm->declaration_materiel_quantite 				= $request->quantite;
				$dm->declaration_materiel_poids 				= $request->poids;
				$dm->declaration_materiel_capacite 				= str_replace(' ','',$request->capacite);
				$dm->declaration_materiel_duree_enregistrement 	= str_replace(' ','',$request->duree_enregistrement);
				$dm->declaration_materiel_valeur_douane 		= str_replace(' ','',$request->valeur_douane);
				$dm->declaration_materiel_redevance_rcp 		= $materiel->materiel_taux_rcp/100 * $dm->declaration_materiel_valeur_douane;
				
				
				$dm->declaration_materiel_date_creation 		= gmdate('Y-m-d H:i:s');
				
				
				$dm->save();
				
				

				//maj montant dans la declaration	
				$declaration->declaration_montant_redevance_rcp = $declaration->declaration_montant_redevance_rcp + $dm->declaration_materiel_redevance_rcp;
				$declaration->declaration_facture_solde 		= $declaration->declaration_montant_redevance_rcp;
				$declaration->exists = true;
				$declaration->save();
				
				
				
				return back()->with('message','MATÉRIEL AJOUTÉ A LA DÉCLARATION AVEC SUCCÈS !');
				
			}else{
				
				return back()->with('warning','VEUILLEZ RENSEIGNER CORRECTEMENT LE FORMULAIRE SVP !');
				
			}
		
		}else{
			
			return back()->with('error','DONNÉES INCOHÉRENTES VEEUILLEZ REESAYER !');
			
		}
		
    }
	
	
	
	public function paiement($declaration_id){
			
		$declaration 		= Declaration::join('tb_users','tb_users.id','declaration.user_id_declarant')
											->where(['declaration_id'=>$declaration_id])
											->first();
		
		$declaration->declaration_statut = 'VALIDE';
		$declaration->exists = true;
		$declaration->save();
		
		return view('declaration.paiement',['declaration'=>$declaration]);
		
	}
	
	public function SavePaiement(Request $request){
		
		/*
		$declaration = Declaration::find($request->declaration_id);
		
		$numero_mobile_money = str_replace(' ','',$request->numero_mobile_money);
		$montant_regle 		 = str_replace(' ','',$request->montant_regle);
		
		if(strlen($numero_mobile_money) >= 10 && $montant_regle > 100 ){
			
			$reglement = new Reglement();
			
			$reglement->declaration_id 						= $request->declaration_id;
			$reglement->reglement_numero_mobile_money 		= $numero_mobile_money;
			$reglement->reglement_solde_avant 				= $declaration->declaration_facture_solde;
			$reglement->reglement_montant_regle 			= $montant_regle;
			$reglement->reglement_solde_apres 				= $reglement->reglement_solde_avant - $reglement->reglement_montant_regle;
			
			$reglement->reglement_date_creation 			= gmdate('Y-m-d H:i:s');
			
			//
			$dec->reglement_numero  = Stdfn::genererIdReglement();
			
			$reglement->save();
			
			//incrémenter le compteur de numéro facture
			Stdfn::IncrementCompteurFacture();
			
			
			//maj montant dans la declaration	
			$declaration->declaration_facture_solde 		= $reglement->reglement_solde_apres;
			$declaration->declaration_statut_paiement 		= ($reglement->reglement_solde_apres == 0)? 'PAYE' : 'NON PAYE';
			$declaration->exists = true;
			$declaration->save();
			
			
			return back()->with('message','PAIEMENT EFFECTUÉ AAVEC SUCCÈS !');
			
		}else{
			
			return back()->with('warning','VEUILLEZ RENSEIGNER CORRECTEMENT LE FORMULAIRE SVP !');
		
		}
		*/
		
	}
	
	
	
	public function paiement_info_burida($declaration_id){
			
		$declaration 		= Declaration::join('tb_users','tb_users.id','declaration.user_id_declarant')
											->where(['declaration_id'=>$declaration_id])
											->first();
		
		$declaration->declaration_statut = 'VALIDE';
		$declaration->exists = true;
		$declaration->save();
		
		return view('declaration.paiement_info_burida',['declaration'=>$declaration]);
		
	}
	
	public function paiement_classique($declaration_id){
			
		$declaration 		= Declaration::join('tb_users','tb_users.id','declaration.user_id_declarant')
											->where(['declaration_id'=>$declaration_id])
											->first();
		
		$declaration->declaration_statut = 'VALIDE';
		$declaration->exists = true;
		$declaration->save();
		
		$banques = Banque::get()->sortBy('banque_libelle');
		
		$comptes_tresorerie = CompteTresorerie::get()->sortBy('compte_tresorerie_libelle');
		
		return view('declaration.paiement_classique',['declaration'=>$declaration, 'banques'=>$banques, 'comptes_tresorerie'=>$comptes_tresorerie]);
		
		
	}
	
	//Par un agent du burida - profil = 1
	public function SavePaiementClassique(Request $request){
		
		$declaration = Declaration::find($request->declaration_id);
		
		$mode_reglement 		= $request->mode_reglement;
		$compte_tresorerie 		= $request->compte_tresorerie;
		$numero_cheque_virement = $request->numero_cheque_virement;
		$date_reglement 		= $request->date_reglement;
		$montant_regle 		 	= str_replace(' ','',$request->montant_regle);
		
		if(!empty($mode_reglement) && $montant_regle > 100 ){
			
			$reglement = new Reglement();
			
			$reglement->user_id 							= Auth::user()->id;
			$reglement->declaration_id 						= $request->declaration_id;
			$reglement->mode_reglement_id 					= $mode_reglement;
			$reglement->compte_tresorerie_id 				= $compte_tresorerie;
			$reglement->numero_cheque_virement 				= $numero_cheque_virement;
			$reglement->reglement_numero  					= Stdfn::genererNumeroReglement();
			$reglement->reglement_date_reglement 			= $date_reglement;
			$reglement->reglement_solde_avant 				= $declaration->declaration_facture_solde;
			$reglement->reglement_montant_regle 			= $montant_regle;
			$reglement->reglement_solde_apres 				= $reglement->reglement_solde_avant - $reglement->reglement_montant_regle;
			
			$reglement->reglement_date_creation 			= gmdate('Y-m-d H:i:s');
			
			
			$reglement->save();
			
			//Incrémenter le compteur de numéro reglement
			Stdfn::IncrementCompteurReglement();
			
			
			//maj montant dans la declaration	
			$declaration->declaration_facture_solde 		= $reglement->reglement_solde_apres;
			$declaration->declaration_statut_paiement 		= 'PAYE';
			$declaration->exists = true;
			$declaration->save();
			
			
			return back()->with('message','PAIEMENT EFFECTUÉ AAVEC SUCCÈS !');
			
		}else{
			
			return back()->with('warning','VEUILLEZ RENSEIGNER CORRECTEMENT LE FORMULAIRE SVP !');
		
		}
		
	}
	
	
	//détail d'un règlement
	public function detail_paiement($reglement_id){
			
		//afficher paiement effectué au client
		$reglement 		= Declaration::join('tb_users','tb_users.id','declaration.user_id_declarant')
							->join('reglement','reglement.declaration_id','declaration.declaration_id')
							->join('rcp_mode_reglement','rcp_mode_reglement.mode_reglement_id','reglement.mode_reglement_id')
							->leftJoin('rcp_operateur_mobile_money','rcp_operateur_mobile_money.operateur_mobile_money_id','reglement.operateur_mobile_money_id')
							->where(['reglement_id'=>$reglement_id])
							->first();
		
		
		
		return view('declaration.details_paiement', ['reglement'=>$reglement])
				->with('message', 'VOTRE PAIEMENT A ÉTÉ EFFECTUÉ AVEC SUCCÈS !');
		
		
	}
	
	
}
