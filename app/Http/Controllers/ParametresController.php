<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Http\Requests\ElecteurFormRequest;
use Illuminate\Http\Request;
use Auth;
use App\Commune;
use App\Commande;
use App\Categorie;
use App\declaration;
use App\DeclarationMarchandise; 
use App\Declarant;
use App\Conteneur;
use App\Marchandise;
use App\Expediteur;
use App\Destinataire;
use App\Chargement;
use App\Empotage;  
use App\Agent_douane;
use App\Vehicule;
use App\Entree_sortie;
use App\Poste;
use App\Bureau_sortie;	
use App\regime;
use App\Moyen_transport;		
use App\pays;
use App\Produit;
use App\ProduitFichier;
use App\FraisLivraison;
use App\BureauSortie;
use App\Course;
use App\Parametre;
use Stdfn;
use DB;


class ParametresController extends Controller
{
  
    //
	public function __construct()
    {

        $this->middleware('auth');
		
    }
	
	//:liste des declarations
    public function declarations()
    {
    	$declarations = Declaration::leftjoin('declarant','declarant.declarant_id','declaration.declarant_id')->get();
		$regimes = Regime::get();
		$declarants = Declarant::get();
		$expediteurs = Expediteur::get();
		$destinataires = Destinataire::get();
		$payss = Pays::get();
		$bureau_sorties = Bureau_sortie::get();
		$moyen_transports = Moyen_transport::get();
		return view('declarations',['declarations'=>$declarations, 'regimes'=>$regimes, 'declarants'=>$declarants, 'expediteurs'=>$expediteurs, 'destinataires'=>$destinataires, 'payss'=>$payss, 'bureau_sorties'=>$bureau_sorties, 'moyen_transports'=>$moyen_transports]);
		//return view('declarations',['declarations'=>$declarations, 'regimes'=>$regimes]);
        //return view('declarations',['declarations'=>$declarations]);
    }

	//ajout de declaration
    public function SaveDeclaration(Request $request)
    {
		
		$declaration = new Declaration();
		$declaration->user_id					= Auth::user()->id;
		$declaration->declarant_id				= Auth::user()->id;//$request->declarant_id;
		$declaration->expediteur_id				= $request->expediteur_id;
		$declaration->bureau_sortie_id			= $request->bureau_sortie_id;
		$declaration->regime_id					= $request->regime_id;
		$declaration->moyen_transport_id		= $request->moyen_transport_id;
		$declaration->destinataire_id			= $request->destinataire_id;
		$declaration->pays_id					= $request->pays_id;
		$declaration->declaration_date_creation		= gmdate('Y-m-d H:i:s');
		$declaration->declaration_date			= $request->declaration_date;
		$declaration->declaration_date_fin			= $request->declaration_date_fin;
		$declaration->declaration_date_prise_compte	= $request->declaration_date_prise_compte;
		$declaration->declaration_numero			= $request->declaration_numero;
		$declaration->declaration_user			= $request->declaration_user;
			
		$declaration->save();
		
		$declaration_id = $declaration->declaration_id;


		return back()->with('message','OPÉRATION EFFECTUÉE AVEC SUCCÈS !');
		
	}
	
	public function SaveDeclarationMarchandise(Request $request)
    {
		
		$declaration_id = trim($request->declaration_id);
		$marchandise_id 	= trim($request->marchandise_id);
		$conteneur_id 	= trim($request->conteneur_id);
		
		$dm 										= new DeclarationMarchandise();
		$dm->user_id								= Auth::user()->id;
		$dm->declaration_id							= $declaration_id;
		$dm->marchandise_id							= $marchandise_id;
		$dm->conteneur_id							= $conteneur_id;
		
		$declaration = Declaration::find($dm->declaration_id);
		$marchandise 	 = Marchandise::find($dm->marchandise_id);
		
		if(!empty($declaration) && !empty($marchandise)){
			
			$dm->detail_declaration_valeur 					= $request->valeur_douane;
			$dm->detail_declaration_quantite 				= $request->quantite;
			$dm->detail_declaration_poids_net 				= $request->poids_net;
			
			$dm->detail_declaration_date_creation 			= gmdate('Y-m-d H:i:s');
			
			$dm->save();
			
			return back()->with('message','MARCHANDISE AJOUTÉE A LA DÉCLARATION AVEC SUCCÈS !');
			
		}else{
			
			return back()->with('warning','VEUILLEZ RENSEIGNER CORRECTEMENT LE FORMULAIRE SVP !');
			
		}
		
    }
	
	
	//détails d'un declaration
    public function details_declaration($declaration_id)
    {
		
		$declaration 	= Declaration::Leftjoin('regime','regime.regime_id','declaration.regime_id')
								->where(['declaration_statut'=>'VALIDE','declaration_id'=>$declaration_id])
								->first();

		if(!empty($declaration)){

			$marchandises_declares = DeclarationMarchandise::where(['declaration_id'=>$declaration_id])->get();
			$marchandises = Marchandise::get();
			$conteneurs = Conteneur::get();
				
			return view('details_declaration', ['declaration'=>$declaration,'marchandises'=>$marchandises, 'conteneurs'=>$conteneurs, 'marchandises_declares'=>$marchandises_declares]);
		
		}else{
			
			return Redirect('declarations')->with('warning',"LA DECLARATION QUE VOUS CHERCHEZ N'A PAS ÉTÉ TROUVÉ");
		}
		
	}
	

	//suppression d'une declaration
    public function SupprimerDeclaration(Request $request)
    {
		
		$declaration_id = $request->declaration_id;

		$declaration = Declaration::find($declaration_id);

		if(!empty($declaration)){

			$declaration->declaration_date_suppression 	= gmdate('Y-m-d H:i:s');
			$declaration->declaration_statut 			= "SUPPRIME";
			$declaration->exists 					= true;
			$declaration->save();
			
			echo 1;
			
		}else{
			echo 0;
		}
	}
	

	//Ajout de fichiers à la demande au tout le long du processus declaration
	public function UpdateFichiersDeclaration($declaration_id, Request $request){
		
		$declaration = Declaration::find($declaration_id);
		
		
		$fichier 		= $request->file('declarations_fichiers');
        $fileName	 	= 'declaration_'.$declaration_id.'_'.time().'_'.Auth::user()->id.'_'.$fichier->getClientOriginalName();
        $original_name 	= $fichier->getClientOriginalName();
		
		$mimetype	= $fichier->getMimeType();
		
        $fichier->move(public_path('images/declarations'),$fileName);
		
		
		$piecejointe = new DeclarationFichier();
		
		$piecejointe->user_id 						= Auth::user()->id;
		$piecejointe->declaration_id 				= $declaration_id;
		$piecejointe->autreimage_photo 				= $fileName;
		$piecejointe->autreimage_date_creation 		= gmdate('Y-m-d H:i:s');
		$piecejointe->save();
		
		return $piecejointe;
		
		
	}

	//liste des catégories
    public function categories()
    {	
    	$categories = Categorie::get();

    	$categories = DB::select('select categorie.*, categorie_parente.categorie_nom as categorie_nom_parent, count(*) as nombre_produits 
    		from categorie 
    		LEFT join categorie as categorie_parente on categorie_parente.categorie_id = categorie.categorie_id_parent
    		LEFT join produit on produit.categorie_id = categorie.categorie_id
    		WHERE categorie.categorie_statut="VALIDE"
    		GROUP BY categorie.categorie_id');
			
    	//dd($categories);								
        return view('categories',['categories'=>$categories]);
    }
	
	//ajout d'une catégorie
    public function SaveCategorie(Request $request)
    {
		
		$courrier = new Categorie();
		$courrier->categorie_nom   				= $request->libelle;
		$courrier->categorie_id_parent   		= $request->categorie_id_parent;
		$courrier->categorie_date_creation  	= gmdate('Y-m-d H:i:s');
		
		$courrier->save();
		
		return back()->with('message','OPÉRATION EFFECTUÉE AVEC SUCCÈS !');
		
	}
	

	//suppression
    public function SupprimerCategorie(Request $request)
    {
		
		$categorie_id = $request->categorie_id;

		$categorie = Categorie::find($categorie_id);

		if(!empty($categorie)){

			$categorie->categorie_date_suppression 	= gmdate('Y-m-d H:i:s');
			$categorie->categorie_statut 			= "SUPPRIME";
			$categorie->exists 						= true;
			$categorie->save();
			
			echo 1;
			
		}else{
			echo 0;
		}
	}
	
//liste des declarants
public function declarants()
{
	
$declarants = Declarant::where(['declarant_statut'=>'VALIDE'])->get();
						
	return view('declarants', ['declarants'=>$declarants]);
	
}

//ajout de declarant
public function SaveDeclarant(Request $request)
{

	$declarant	= new Declarant();	
	$declarant->declarant_nom			= $request->declarant_nom;	
	$declarant->declarant_adresse			= $request->declarant_adresse;	
	$declarant->declarant_tel			= $request->declarant_tel;	
	$declarant->declarant_mail			= $request->declarant_mail;	
	$declarant->declarant_user			= $request->declarant_user;	
	$declarant->declarant_date_creation		= gmdate('Y-m-d H:i:s');
	
	$fichier 		= $request->file('declarant_photo');
	$fileName	 	= 'declarant_'.''.time().'_'.Auth::user()->id.'_'.$fichier->getClientOriginalName();
	$original_name 	= $fichier->getClientOriginalName();
	
	$mimetype	= $fichier->getMimeType();
	
	$fichier->move(public_path('images/declarants'),$fileName);


	$declarant->declarant_photo = $fileName;
	$declarant->save();
	
	$declarant_id = $declarant->declarant_id;


	return back()->with('message','OPÉRATION EFFECTUÉE AVEC SUCCÈS !');
	
}

//détails d'un declarant
public function DetailsDeclarant(Request $request)
{
	
	$declarant_id = $request->declarant_id;
	
	$declarant 	= Declarant::where(['declarant_statut'=>'VALIDE','declarant_id'=>$declarant_id])
					->first();
	
	if(!empty($declarant)){

		$piecesjointes = DeclarantFichier::where(['declarant_id'=>$declarant_id])->get();
			
		return view('details_declarant', ['declarant'=>$declarant,'piecesjointes'=>$piecesjointes]);
	
	}else{
		
		return Redirect('declarants')->with('warning',"LE DECLARANT QUE VOUS CHERCHEZ N'A PAS ÉTÉ TROUVÉ");
	}
	
}


//suppression d'un declarant
public function SupprimerDeclarant(Request $request)
{
	
	$declarant_id = $request->declarant_id;

	$declarant = Declarant::find($declarant_id);

	if(!empty($declarant)){

		$declarant->declarant_date_suppression 	= gmdate('Y-m-d H:i:s');
		$declarant->declarant_statut 			= "SUPPRIME";
		$declarant->exists 				= true;
		$declarant->save();
		
		echo 1;
		
	}else{
		echo 0;
	}
}

//Ajout de fichiers à la demande au tout le long du processus declarant
public function UpdateFichiersDeclarant($declarant_id, Request $request){
	
	$declarant = Declarant::find($declarant_id);
	
	$fichier 		= $request->file('declarants_fichiers');
	$fileName	 	= 'declarant_'.$declarant_id.'_'.time().'_'.Auth::user()->id.'_'.$fichier->getClientOriginalName();
	$original_name 	= $fichier->getClientOriginalName();
	
	$mimetype	= $fichier->getMimeType();
	
		$fichier->move(public_path('images/declarants'),$fileName);
	
	
	$piecejointe = new DeclarantFichier();
	
	$piecejointe->user_id 						= Auth::user()->id;
	$piecejointe->declarant_id 					= $declarant_id;
	$piecejointe->autreimage_photo 				= $fileName;
	$piecejointe->autreimage_date_creation 			= gmdate('Y-m-d H:i:s');
	$piecejointe->save();
	
	return $piecejointe;
	
	
}
//liste des expediteurs
public function expediteurs()
{
	
$expediteurs = Expediteur::where(['expediteur_statut'=>'VALIDE'])->get();
						
	return view('expediteurs', ['expediteurs'=>$expediteurs]);
	
}

//ajout de expediteur
public function SaveExpediteur(Request $request)
{

	$expediteur	= new Expediteur();	
	$expediteur->expediteur_nom			= $request->expediteur_nom;	
	$expediteur->expediteur_adresse			= $request->expediteur_adresse;	
	$expediteur->expediteur_tel			= $request->expediteur_tel;	
	$expediteur->expediteur_mail			= $request->expediteur_mail;	
	$expediteur->expediteur_user			= $request->expediteur_user;	
	$expediteur->expediteur_date_creation		= gmdate('Y-m-d H:i:s');
	
	$fichier 		= $request->file('expediteur_photo');
	$fileName	 	= 'expediteur_'.''.time().'_'.Auth::user()->id.'_'.$fichier->getClientOriginalName();
	$original_name 	= $fichier->getClientOriginalName();
	
	$mimetype	= $fichier->getMimeType();
	
	$fichier->move(public_path('images/expediteurs'),$fileName);


	$expediteur->expediteur_photo = $fileName;
	$expediteur->save();
	
	$expediteur_id = $expediteur->expediteur_id;


	return back()->with('message','OPÉRATION EFFECTUÉE AVEC SUCCÈS !');
	
}

//détails d'un expediteur
public function DetailsExpediteur(Request $request)
{
	
	$expediteur_id = $request->expediteur_id;
	
	$expediteur 	= Expediteur::where(['expediteur_statut'=>'VALIDE','expediteur_id'=>$expediteur_id])
					->first();
	
	if(!empty($expediteur)){

		$piecesjointes = ExpediteurFichier::where(['expediteur_id'=>$expediteur_id])->get();
			
		return view('details_expediteur', ['expediteur'=>$expediteur,'piecesjointes'=>$piecesjointes]);
	
	}else{
		
		return Redirect('expediteurs')->with('warning',"LE DECLARANT QUE VOUS CHERCHEZ N'A PAS ÉTÉ TROUVÉ");
	}
	
}


//suppression d'un expediteur
public function SupprimerExpediteur(Request $request)
{
	
	$expediteur_id = $request->expediteur_id;

	$expediteur = Expediteur::find($expediteur_id);

	if(!empty($expediteur)){

		$expediteur->expediteur_date_suppression 	= gmdate('Y-m-d H:i:s');
		$expediteur->expediteur_statut 			= "SUPPRIME";
		$expediteur->exists 				= true;
		$expediteur->save();
		
		echo 1;
		
	}else{
		echo 0;
	}
}

//Ajout de fichiers à la demande au tout le long du processus expediteur
public function UpdateFichiersExpediteur($expediteur_id, Request $request){
	
	$expediteur = Expediteur::find($expediteur_id);
	
	$fichier 		= $request->file('expediteurs_fichiers');
	$fileName	 	= 'expediteur_'.$expediteur_id.'_'.time().'_'.Auth::user()->id.'_'.$fichier->getClientOriginalName();
	$original_name 	= $fichier->getClientOriginalName();
	
	$mimetype	= $fichier->getMimeType();
	
		$fichier->move(public_path('images/expediteurs'),$fileName);
	
	
	$piecejointe = new ExpediteurFichier();
	
	$piecejointe->user_id 						= Auth::user()->id;
	$piecejointe->expediteur_id 					= $expediteur_id;
	$piecejointe->autreimage_photo 				= $fileName;
	$piecejointe->autreimage_date_creation 			= gmdate('Y-m-d H:i:s');
	$piecejointe->save();
	
	return $piecejointe;
	
	
}
//liste des destinataires
public function destinataires()
{
	
$destinataires = Destinataire::where(['destinataire_statut'=>'VALIDE'])->get();
						
	return view('destinataires', ['destinataires'=>$destinataires]);
	
}

//ajout de destinataire
public function SaveDestinataire(Request $request)
{

	$destinataire	= new Destinataire();	
	$destinataire->destinataire_nom			= $request->destinataire_nom;	
	$destinataire->destinataire_adresse			= $request->destinataire_adresse;	
	$destinataire->destinataire_tel			= $request->destinataire_tel;	
	$destinataire->destinataire_mail			= $request->destinataire_mail;	
	$destinataire->destinataire_user			= $request->destinataire_user;	
	$destinataire->destinataire_date_creation		= gmdate('Y-m-d H:i:s');
	
	$fichier 		= $request->file('destinataire_photo');
	$fileName	 	= 'destinataire_'.''.time().'_'.Auth::user()->id.'_'.$fichier->getClientOriginalName();
	$original_name 	= $fichier->getClientOriginalName();
	
	$mimetype	= $fichier->getMimeType();
	
	$fichier->move(public_path('images/destinataires'),$fileName);


	$destinataire->destinataire_photo = $fileName;
	$destinataire->save();
	
	$destinataire_id = $destinataire->destinataire_id;


	return back()->with('message','OPÉRATION EFFECTUÉE AVEC SUCCÈS !');
	
}

//détails d'un destinataire
public function DetailsDestinataire(Request $request)
{
	
	$destinataire_id = $request->destinataire_id;
	
	$destinataire 	= Destinataire::where(['destinataire_statut'=>'VALIDE','destinataire_id'=>$destinataire_id])
					->first();
	
	if(!empty($destinataire)){

		$piecesjointes = DestinataireFichier::where(['destinataire_id'=>$destinataire_id])->get();
			
		return view('details_destinataire', ['destinataire'=>$destinataire,'piecesjointes'=>$piecesjointes]);
	
	}else{
		
		return Redirect('destinataires')->with('warning',"LE DECLARANT QUE VOUS CHERCHEZ N'A PAS ÉTÉ TROUVÉ");
	}
	
}


//suppression d'un destinataire
public function SupprimerDestinataire(Request $request)
{
	
	$destinataire_id = $request->destinataire_id;

	$destinataire = Destinataire::find($destinataire_id);

	if(!empty($destinataire)){

		$destinataire->destinataire_date_suppression 	= gmdate('Y-m-d H:i:s');
		$destinataire->destinataire_statut 			= "SUPPRIME";
		$destinataire->exists 				= true;
		$destinataire->save();
		
		echo 1;
		
	}else{
		echo 0;
	}
}

//Ajout de fichiers à la demande au tout le long du processus destinataire
public function UpdateFichiersDestinataire($destinataire_id, Request $request){
	
	$destinataire = Destinataire::find($destinataire_id);
	
	$fichier 		= $request->file('destinataires_fichiers');
	$fileName	 	= 'destinataire_'.$destinataire_id.'_'.time().'_'.Auth::user()->id.'_'.$fichier->getClientOriginalName();
	$original_name 	= $fichier->getClientOriginalName();
	
	$mimetype	= $fichier->getMimeType();
	
		$fichier->move(public_path('images/destinataires'),$fileName);
	
	
	$piecejointe = new DestinataireFichier();
	
	$piecejointe->user_id 						= Auth::user()->id;
	$piecejointe->destinataire_id 					= $destinataire_id;
	$piecejointe->autreimage_photo 				= $fileName;
	$piecejointe->autreimage_date_creation 			= gmdate('Y-m-d H:i:s');
	$piecejointe->save();
	
	return $piecejointe;
	
	
}
//liste des agent_douanes
public function agent_douanes()
{
	
$agent_douanes = Agent_douane::where(['agent_douane_statut'=>'VALIDE'])->get();
						
	return view('agent_douanes', ['agent_douanes'=>$agent_douanes]);
	
}

//ajout de agent_douane
public function SaveAgent_douane(Request $request)
{

	$agent_douane	= new Agent_douane();	
	$agent_douane->agent_douane_nom			= $request->agent_douane_nom;	
	$agent_douane->agent_douane_adresse			= $request->agent_douane_adresse;	
	$agent_douane->agent_douane_tel			= $request->agent_douane_tel;	
	$agent_douane->agent_douane_mail			= $request->agent_douane_mail;	
	$agent_douane->agent_douane_user			= $request->agent_douane_user;	
	$agent_douane->agent_douane_date_creation		= gmdate('Y-m-d H:i:s');
	
	$fichier 		= $request->file('agent_douane_photo');
	$fileName	 	= 'agent_douane_'.''.time().'_'.Auth::user()->id.'_'.$fichier->getClientOriginalName();
	$original_name 	= $fichier->getClientOriginalName();
	
	$mimetype	= $fichier->getMimeType();
	
	$fichier->move(public_path('images/agent_douanes'),$fileName);


	$agent_douane->agent_douane_photo = $fileName;
	$agent_douane->save();
	
	$agent_douane_id = $agent_douane->agent_douane_id;


	return back()->with('message','OPÉRATION EFFECTUÉE AVEC SUCCÈS !');
	
}

//détails d'un agent_douane
public function DetailsAgent_douane(Request $request)
{
	
	$agent_douane_id = $request->agent_douane_id;
	
	$agent_douane 	= Agent_douane::where(['agent_douane_statut'=>'VALIDE','agent_douane_id'=>$agent_douane_id])
					->first();
	
	if(!empty($agent_douane)){

		$piecesjointes = Agent_douaneFichier::where(['agent_douane_id'=>$agent_douane_id])->get();
			
		return view('details_agent_douane', ['agent_douane'=>$agent_douane,'piecesjointes'=>$piecesjointes]);
	
	}else{
		
		return Redirect('agent_douanes')->with('warning',"LE DECLARANT QUE VOUS CHERCHEZ N'A PAS ÉTÉ TROUVÉ");
	}
	
}


//suppression d'un agent_douane
public function SupprimerAgent_douane(Request $request)
{
	
	$agent_douane_id = $request->agent_douane_id;

	$agent_douane = Agent_douane::find($agent_douane_id);

	if(!empty($agent_douane)){

		$agent_douane->agent_douane_date_suppression 	= gmdate('Y-m-d H:i:s');
		$agent_douane->agent_douane_statut 			= "SUPPRIME";
		$agent_douane->exists 				= true;
		$agent_douane->save();
		
		echo 1;
		
	}else{
		echo 0;
	}
}

//Ajout de fichiers à la demande au tout le long du processus agent_douane
public function UpdateFichiersAgent_douane($agent_douane_id, Request $request){
	
	$agent_douane = Agent_douane::find($agent_douane_id);
	
	$fichier 		= $request->file('agent_douanes_fichiers');
	$fileName	 	= 'agent_douane_'.$agent_douane_id.'_'.time().'_'.Auth::user()->id.'_'.$fichier->getClientOriginalName();
	$original_name 	= $fichier->getClientOriginalName();
	
	$mimetype	= $fichier->getMimeType();
	
		$fichier->move(public_path('images/agent_douanes'),$fileName);
	
	
	$piecejointe = new Agent_douaneFichier();
	
	$piecejointe->user_id 						= Auth::user()->id;
	$piecejointe->agent_douane_id 					= $agent_douane_id;
	$piecejointe->autreimage_photo 				= $fileName;
	$piecejointe->autreimage_date_creation 			= gmdate('Y-m-d H:i:s');
	$piecejointe->save();
	
	return $piecejointe;
	
	
}
//liste des chargements
public function chargements()
{
	
$chargements = Chargement::where(['chargement_statut'=>'VALIDE'])->get();
						
	return view('chargements', ['chargements'=>$chargements]);
	
}

//ajout de chargement
public function SaveChargement(Request $request)
{

	$chargement	= new Chargement();	
	$chargement->chargement_nom			= $request->chargement_nom;	
	$chargement->chargement_adresse			= $request->chargement_adresse;	
	$chargement->chargement_tel			= $request->chargement_tel;	
	$chargement->chargement_mail			= $request->chargement_mail;	
	$chargement->chargement_user			= $request->chargement_user;	
	$chargement->chargement_date_creation		= gmdate('Y-m-d H:i:s');
	
	$fichier 		= $request->file('chargement_photo');
	$fileName	 	= 'chargement_'.''.time().'_'.Auth::user()->id.'_'.$fichier->getClientOriginalName();
	$original_name 	= $fichier->getClientOriginalName();
	
	$mimetype	= $fichier->getMimeType();
	
	$fichier->move(public_path('images/chargements'),$fileName);


	$chargement->chargement_photo = $fileName;
	$chargement->save();
	
	$chargement_id = $chargement->chargement_id;


	return back()->with('message','OPÉRATION EFFECTUÉE AVEC SUCCÈS !');
	
}

//détails d'un chargement
public function DetailsChargement(Request $request)
{
	
	$chargement_id = $request->chargement_id;
	
	$chargement 	= Chargement::where(['chargement_statut'=>'VALIDE','chargement_id'=>$chargement_id])
					->first();
	
	if(!empty($chargement)){

		$piecesjointes = ChargementFichier::where(['chargement_id'=>$chargement_id])->get();
			
		return view('details_chargement', ['chargement'=>$chargement,'piecesjointes'=>$piecesjointes]);
	
	}else{
		
		return Redirect('chargements')->with('warning',"LE DECLARANT QUE VOUS CHERCHEZ N'A PAS ÉTÉ TROUVÉ");
	}
	
}


//suppression d'un chargement
public function SupprimerChargement(Request $request)
{
	
	$chargement_id = $request->chargement_id;

	$chargement = Chargement::find($chargement_id);

	if(!empty($chargement)){

		$chargement->chargement_date_suppression 	= gmdate('Y-m-d H:i:s');
		$chargement->chargement_statut 			= "SUPPRIME";
		$chargement->exists 				= true;
		$chargement->save();
		
		echo 1;
		
	}else{
		echo 0;
	}
}

//Ajout de fichiers à la demande au tout le long du processus chargement
public function UpdateFichiersChargement($chargement_id, Request $request){
	
	$chargement = Chargement::find($chargement_id);
	
	$fichier 		= $request->file('chargements_fichiers');
	$fileName	 	= 'chargement_'.$chargement_id.'_'.time().'_'.Auth::user()->id.'_'.$fichier->getClientOriginalName();
	$original_name 	= $fichier->getClientOriginalName();
	
	$mimetype	= $fichier->getMimeType();
	
		$fichier->move(public_path('images/chargements'),$fileName);
	
	
	$piecejointe = new ChargementFichier();
	
	$piecejointe->user_id 						= Auth::user()->id;
	$piecejointe->chargement_id 					= $chargement_id;
	$piecejointe->autreimage_photo 				= $fileName;
	$piecejointe->autreimage_date_creation 			= gmdate('Y-m-d H:i:s');
	$piecejointe->save();
	
	return $piecejointe;
	
	
}
//liste des empotages
public function empotages()
{
	
$empotages = Empotage::where(['empotage_statut'=>'VALIDE'])->get();
						
	return view('empotages', ['empotages'=>$empotages]);
	
}

//ajout de empotage
public function SaveEmpotage(Request $request)
{

	$empotage	= new Empotage();	
	$empotage->empotage_nom			= $request->empotage_nom;	
	$empotage->empotage_adresse			= $request->empotage_adresse;	
	$empotage->empotage_tel			= $request->empotage_tel;	
	$empotage->empotage_mail			= $request->empotage_mail;	
	$empotage->empotage_user			= $request->empotage_user;	
	$empotage->empotage_date_creation		= gmdate('Y-m-d H:i:s');
	
	$fichier 		= $request->file('empotage_photo');
	$fileName	 	= 'empotage_'.''.time().'_'.Auth::user()->id.'_'.$fichier->getClientOriginalName();
	$original_name 	= $fichier->getClientOriginalName();
	
	$mimetype	= $fichier->getMimeType();
	
	$fichier->move(public_path('images/empotages'),$fileName);


	$empotage->empotage_photo = $fileName;
	$empotage->save();
	
	$empotage_id = $empotage->empotage_id;


	return back()->with('message','OPÉRATION EFFECTUÉE AVEC SUCCÈS !');
	
}

//détails d'un empotage
public function DetailsEmpotage(Request $request)
{
	
	$empotage_id = $request->empotage_id;
	
	$empotage 	= Empotage::where(['empotage_statut'=>'VALIDE','empotage_id'=>$empotage_id])
					->first();
	
	if(!empty($empotage)){

		$piecesjointes = EmpotageFichier::where(['empotage_id'=>$empotage_id])->get();
			
		return view('details_empotage', ['empotage'=>$empotage,'piecesjointes'=>$piecesjointes]);
	
	}else{
		
		return Redirect('empotages')->with('warning',"LE DECLARANT QUE VOUS CHERCHEZ N'A PAS ÉTÉ TROUVÉ");
	}
	
}


//suppression d'un empotage
public function SupprimerEmpotage(Request $request)
{
	
	$empotage_id = $request->empotage_id;

	$empotage = Empotage::find($empotage_id);

	if(!empty($empotage)){

		$empotage->empotage_date_suppression 	= gmdate('Y-m-d H:i:s');
		$empotage->empotage_statut 			= "SUPPRIME";
		$empotage->exists 				= true;
		$empotage->save();
		
		echo 1;
		
	}else{
		echo 0;
	}
}

//Ajout de fichiers à la demande au tout le long du processus empotage
public function UpdateFichiersEmpotage($empotage_id, Request $request){
	
	$empotage = Empotage::find($empotage_id);
	
	$fichier 		= $request->file('empotages_fichiers');
	$fileName	 	= 'empotage_'.$empotage_id.'_'.time().'_'.Auth::user()->id.'_'.$fichier->getClientOriginalName();
	$original_name 	= $fichier->getClientOriginalName();
	
	$mimetype	= $fichier->getMimeType();
	
		$fichier->move(public_path('images/empotages'),$fileName);
	
	
	$piecejointe = new EmpotageFichier();
	
	$piecejointe->user_id 						= Auth::user()->id;
	$piecejointe->empotage_id 					= $empotage_id;
	$piecejointe->autreimage_photo 				= $fileName;
	$piecejointe->autreimage_date_creation 			= gmdate('Y-m-d H:i:s');
	$piecejointe->save();
	
	return $piecejointe;	
}

//liste des vehicules
public function vehicules_sous_penalite_poste1()
{
	$titre_page = 'Gestion des véhicules sous penalité';
	$titre_liste_vehicule = 'Liste des véhicules sous penalité';
	$vehicules = [];

	$parametre_duree = Parametre::where(['parametre_statut'=>'VALIDE','parametre_code'=>'DUREE_STA'])->first();
	$duree_limite 	 = ($parametre_duree)? $parametre_duree->parametre_valeur : 10;
	$duree_limite = 1;
	$where_condition = ' vehicule_statut="VALIDE" AND DATEDIFF(DATE(vehicule_date_sortie1), DATE(vehicule_date_entree1) ) > '. intval($duree_limite);

	//die($where_condition);//Afficher la requete pour voir
	$vehicules = Vehicule::selectRaw(' *, DATEDIFF(DATE(vehicule_date_sortie1), DATE(vehicule_date_entree1) ) AS RETARD ')->whereRaw($where_condition)->get();
	
	return view('vehicules_penalite_poste1', ['vehicules'=>$vehicules, 'titre_page'=>$titre_page, 'titre_liste_vehicule'=>$titre_liste_vehicule]);
	
}

//liste des vehicules
public function vehicules_sous_penalite_poste2()
{
	$titre_page = 'Gestion des véhicules sous penalité';
	$titre_liste_vehicule = 'Liste des véhicules sous penalité';
	$vehicules = [];

	$parametre_duree = Parametre::where(['parametre_statut'=>'VALIDE','parametre_code'=>'DUREE_STA'])->first();
	$duree_limite 	 = ($parametre_duree)? $parametre_duree->parametre_valeur : 10;
	$duree_limite = 1;
	$where_condition = ' vehicule_statut="VALIDE" AND DATEDIFF(DATE(vehicule_date_sortie2), DATE(vehicule_date_entree2) ) > '. intval($duree_limite);

	//die($where_condition);//Afficher la requete pour voir
	$vehicules = Vehicule::selectRaw(' *, DATEDIFF(DATE(vehicule_date_sortie2), DATE(vehicule_date_entree2) ) AS RETARD ')->whereRaw($where_condition)->get();
	
	return view('vehicules_penalite_poste2', ['vehicules'=>$vehicules, 'titre_page'=>$titre_page, 'titre_liste_vehicule'=>$titre_liste_vehicule]);
	
}

//liste des vehicules
public function vehicules($option_afficher_formulaire = null)
{
	$titre_page = 'Gestion des véhicules';
	$titre_liste_vehicule = 'Liste des véhicules';
	$vehicules = [];
	$where_condition = ' vehicule_statut="VALIDE" ';

	if(Auth::user()->profil_id == 2){
		
		$where_condition .= ' AND vehicule_statuts="ENTREE1" ';

	}else if(Auth::user()->profil_id == 3){

		$where_condition .= ' AND (vehicule_statuts="ENTREE1" OR vehicule_statuts="SORTIE1") ';

	}else if(Auth::user()->profil_id == 4){

		$where_condition .= ' AND (vehicule_statuts="SORTIE1" OR vehicule_statuts="ENTREE2") ';

	}else if(Auth::user()->profil_id == 5){

		$where_condition .= ' AND (vehicule_statuts="ENTREE2" OR vehicule_statuts="SORTIE2") ';

	}

	//die($where_condition);//Afficher la requete pour voir

	$vehicules = Vehicule::whereRaw($where_condition)->get();

	return view('vehicules', ['vehicules'=>$vehicules, 'option_afficher_formulaire'=>$option_afficher_formulaire, 'titre_page'=>$titre_page, 'titre_liste_vehicule'=>$titre_liste_vehicule]);
	
}

///
//ajout de vehicule
public function SaveVehicule(Request $request)
{
	$parametre_duree = Parametre::where(['parametre_statut'=>'VALIDE','parametre_code'=>'DUREE_STA'])->first();
	$duree_limite 	 = ($parametre_duree)? $parametre_duree->parametre_valeur : 10;

	$vehicule								=new Vehicule();
	$vehicule->vehicule_duree_limite		= $duree_limite;
	$vehicule->vehicule_code				= $request->vehicule_code;	
	$vehicule->vehicule_marque				= $request->vehicule_marque;	
	$vehicule->vehicule_numero_chassis		= $request->vehicule_numero_chassis;
	$vehicule->vehicule_numero_ldc			= $request->vehicule_numero_ldc;	
	$vehicule->vehicule_immatriculation1	= $request->vehicule_immatriculation1;	
	$vehicule->vehicule_immatriculation2	= $request->vehicule_immatriculation2;	
	$vehicule->vehicule_numero_declaration	= $request->vehicule_numero_declaration;	
	$vehicule->vehicule_nom_conducteur		= $request->vehicule_nom_conducteur;	
	

	if(Auth::user()->profil_id == 2){

		$vehicule->vehicule_date_entree1			= gmdate('Y-m-d H:i:s');
		$vehicule->vehicule_date_creation_entree1	= gmdate('Y-m-d H:i:s');	
		$vehicule->vehicule_user_entree1			= Auth::user()->id;
		$vehicule->vehicule_statuts					= 'ENTREE1';

	}else if(Auth::user()->profil_id == 3){

		$vehicule->vehicule_date_sortie1			= gmdate('Y-m-d H:i:s');
		$vehicule->vehicule_date_creation_sortie1	= gmdate('Y-m-d H:i:s');	
		$vehicule->vehicule_user_sortie1			= Auth::user()->id;
		$vehicule->vehicule_statuts					= 'SORTIE1';

	}else if(Auth::user()->profil_id == 4){

		$vehicule->vehicule_date_entree2			= gmdate('Y-m-d H:i:s');
		$vehicule->vehicule_date_creation_entree2	= gmdate('Y-m-d H:i:s');	
		$vehicule->vehicule_user_entree2			= Auth::user()->id;
		$vehicule->vehicule_statuts					= 'ENTREE2';

	}else if(Auth::user()->profil_id == 5){
		
		$vehicule->vehicule_date_sortie2			= gmdate('Y-m-d H:i:s');
		$vehicule->vehicule_date_creation_sortie2	= gmdate('Y-m-d H:i:s');	
		$vehicule->vehicule_user_sortie2			= Auth::user()->id;
		$vehicule->vehicule_statuts					= 'SORTIE2';

	}

	$vehicule->vehicule_statut				= 'VALIDE';		
	
	$vehicule->save();
	
	return back()->with('message','OPÉRATION EFFECTUÉE AVEC SUCCÈS !');
	
}

//détails d'un vehicule
public function DetailsVehicule(Request $request)
{
	
	$vehicule_id = $request->vehicule_id;
	
	$vehicule 	= Vehicule::where(['vehicule_id'=>$vehicule_id])->first();
	
	if(!empty($vehicule)){

		return view('details_vehicule', ['vehicule'=>$vehicule]);
	
	}else{
		
		return Redirect('vehicules')->with('warning',"LE VEHICULE QUE VOUS CHERCHEZ N'A PAS ÉTÉ TROUVÉ");
	}
	
}


//suppression d'un vehicule
public function SupprimerVehicule(Request $request)
{
	
	$vehicule_id = $request->vehicule_id;

	$vehicule = Vehicule::find($vehicule_id);

	if(!empty($vehicule)){

		$vehicule->vehicule_date_suppression 	= gmdate('Y-m-d H:i:s');
		$vehicule->vehicule_statut 			= "SUPPRIME";
		$vehicule->exists 				= true;
		$vehicule->save();
		
		echo 1;
		
	}else{
		echo 0;
	}
}

public function sortie_vehicule($vehicule_id, $situation){

	$vehicule 	= Vehicule::where(['vehicule_id'=>$vehicule_id])->first();
	$date_du_jour = gmdate('Y-m-d');
	return view('sortie_vehicule_popup', ['vehicule'=>$vehicule, 'situation'=>$situation, 'date_du_jour'=>$date_du_jour]);
	
}

public function SaveSortieVehicule($vehicule_id, Request $request){

	$vehicule = Vehicule::find($vehicule_id);
	$situation = $request->situation;
	
	if($situation == 'sp1'){
			
		$vehicule->vehicule_date_sortie1 			= $request->date_entree_sortie. ' '. gmdate('H:i:s');
		$vehicule->vehicule_statuts 				= 'sortie1';
		$vehicule->vehicule_user_sortie1	 		= Auth::user()->id;
		$vehicule->vehicule_date_creation_sortie1 	= gmdate('Y-m-d H:i:s');

	}else if($situation == 'ep2'){

		$vehicule->vehicule_date_entree2 			= $request->date_entree_sortie. ' '. gmdate('H:i:s');
		$vehicule->vehicule_statuts 				= 'entree2';
		$vehicule->vehicule_user_entree2	 		= Auth::user()->id;
		$vehicule->vehicule_date_creation_entree2 	= gmdate('Y-m-d H:i:s');

	}else if($situation == 'sp2'){
		$vehicule->vehicule_date_sortie2 			= $request->date_entree_sortie. ' '. gmdate('H:i:s');
		$vehicule->vehicule_statuts 				= 'sortie2';
		$vehicule->vehicule_user_sortie2	 		= Auth::user()->id;
		$vehicule->vehicule_date_creation_sortie2 	= gmdate('Y-m-d H:i:s');
	}

	$vehicule->save();
	
	return 1;
	
}

//Ajout de fichiers à la demande au tout le long du processus vehicule
public function UpdateFichiersVehicule($vehicule_id, Request $request){
	
	$vehicule = Vehicule::find($vehicule_id);
	
	$fichier 		= $request->file('vehicules_fichiers');
	$fileName	 	= 'vehicule_'.$vehicule_id.'_'.time().'_'.Auth::user()->id.'_'.$fichier->getClientOriginalName();
	$original_name 	= $fichier->getClientOriginalName();
	
	$mimetype	= $fichier->getMimeType();
	
		$fichier->move(public_path('images/vehicules'),$fileName);
	
	
	$piecejointe = new VehiculeFichier();
	
	$piecejointe->user_id 						= Auth::user()->id;
	$piecejointe->vehicule_id 					= $vehicule_id;
	$piecejointe->autreimage_photo 				= $fileName;
	$piecejointe->autreimage_date_creation 			= gmdate('Y-m-d H:i:s');
	$piecejointe->save();
	
	return $piecejointe;
	
	
}

//liste des postes
public function postes()
{
	
$postes = Poste::where(['poste_statut'=>'VALIDE'])->get();
						
	return view('postes', ['postes'=>$postes]);
	
}

//ajout de poste
public function SavePoste(Request $request)
{

	$poste	= new Poste();	
	$poste->poste_nom			= $request->poste_nom;	
	$poste->poste_adresse			= $request->poste_adresse;	
	$poste->poste_tel			= $request->poste_tel;	
	$poste->poste_mail			= $request->poste_mail;	
	$poste->poste_user			= $request->poste_user;	
	$poste->poste_date_creation		= gmdate('Y-m-d H:i:s');
	
	$fichier 		= $request->file('poste_photo');
	$fileName	 	= 'poste_'.''.time().'_'.Auth::user()->id.'_'.$fichier->getClientOriginalName();
	$original_name 	= $fichier->getClientOriginalName();
	
	$mimetype	= $fichier->getMimeType();
	
	$fichier->move(public_path('images/postes'),$fileName);


	$poste->poste_photo = $fileName;
	$poste->save();
	
	$poste_id = $poste->poste_id;


	return back()->with('message','OPÉRATION EFFECTUÉE AVEC SUCCÈS !');
	
}

//détails d'un poste
public function DetailsPoste(Request $request)
{
	
	$poste_id = $request->poste_id;
	
	$poste 	= Poste::where(['poste_statut'=>'VALIDE','poste_id'=>$poste_id])
					->first();
	
	if(!empty($poste)){

		$piecesjointes = PosteFichier::where(['poste_id'=>$poste_id])->get();
			
		return view('details_poste', ['poste'=>$poste,'piecesjointes'=>$piecesjointes]);
	
	}else{
		
		return Redirect('postes')->with('warning',"LE DECLARANT QUE VOUS CHERCHEZ N'A PAS ÉTÉ TROUVÉ");
	}
	
}


//suppression d'un poste
public function SupprimerPoste(Request $request)
{
	
	$poste_id = $request->poste_id;

	$poste = Poste::find($poste_id);

	if(!empty($poste)){

		$poste->poste_date_suppression 	= gmdate('Y-m-d H:i:s');
		$poste->poste_statut 			= "SUPPRIME";
		$poste->exists 				= true;
		$poste->save();
		
		echo 1;
		
	}else{
		echo 0;
	}
}


	//liste des produits
    public function produits()
    {
    	$produits = Produit::join('categorie','produit.categorie_id','categorie.categorie_id')
    						->where(['produit_statut'=>'VALIDE'])
    						->get();
    						
    	$categories = Categorie::get();
    							
        return view('produits', ['produits'=>$produits,'categories'=>$categories]);
		
    }
	
	
	//ajout de produit
    public function SaveProduit(Request $request)
    {
		
		$produit = new Produit();
		$produit->produit_nom   				= $request->produit_nom;
		$produit->categorie_id   				= $request->categorie_id;
		$produit->produit_description   		= $request->produit_description;
		$produit->produit_prix   				= $request->produit_prix;
		$produit->produit_stock   				= $request->produit_stock;
		$produit->produit_date_creation  		= gmdate('Y-m-d H:i:s');
		
		$fichier 		= $request->file('produit_photo');
        $fileName	 	= 'produit_'.''.time().'_'.Auth::user()->id.'_'.$fichier->getClientOriginalName();
        $original_name 	= $fichier->getClientOriginalName();
		
		$mimetype	= $fichier->getMimeType();
		
        $fichier->move(public_path('images/produits'),$fileName);


		$produit->produit_photo = $fileName;
		$produit->save();
		
		$produit_id = $produit->produit_id;


		return back()->with('message','OPÉRATION EFFECTUÉE AVEC SUCCÈS !');
		
	}
	



	//détails d'un produit
    public function DetailsProduit(Request $request)
    {
		
		$produit_id = $request->produit_id;
		
		$produit 	= Produit::join('categorie','categorie.categorie_id','produit.categorie_id')
								->where(['produit_statut'=>'VALIDE','produit_id'=>$produit_id])
								->first();
		
		if(!empty($produit)){

			$piecesjointes = ProduitFichier::where(['produit_id'=>$produit_id])->get();
				
			return view('details_produit', ['produit'=>$produit,'piecesjointes'=>$piecesjointes]);
		
		}else{
			
			return Redirect('produits')->with('warning',"LE PRODUIT QUE VOUS CHERCHEZ N'A PAS ÉTÉ TROUVÉ");
		}
		
	}
	

	//suppression d'un produit
    public function SupprimerProduit(Request $request)
    {
		
		$produit_id = $request->produit_id;

		$produit = Produit::find($produit_id);

		if(!empty($produit)){

			$produit->produit_date_suppression 	= gmdate('Y-m-d H:i:s');
			$produit->produit_statut 			= "SUPPRIME";
			$produit->exists 					= true;
			$produit->save();
			
			echo 1;
			
		}else{
			echo 0;
		}
	}
	

	//Ajout de fichiers à la demande au tout le long du processus produit
	public function UpdateFichiers($produit_id, Request $request){
		
		$produit = Produit::find($produit_id);
		
		
		$fichier 		= $request->file('produits_fichiers');
        $fileName	 	= 'produit_'.$produit_id.'_'.time().'_'.Auth::user()->id.'_'.$fichier->getClientOriginalName();
        $original_name 	= $fichier->getClientOriginalName();
		
		$mimetype	= $fichier->getMimeType();
		
        $fichier->move(public_path('images/produits'),$fileName);
		
		
		$piecejointe = new ProduitFichier();
		
		$piecejointe->user_id 						= Auth::user()->id;
		$piecejointe->produit_id 					= $produit_id;
		$piecejointe->autreimage_photo 				= $fileName;
		$piecejointe->autreimage_date_creation 		= gmdate('Y-m-d H:i:s');
		$piecejointe->save();
		
		return $piecejointe;
		
		
	}

    public function courses()
    {
		
    	$sql = 'select dim_course.*, commune_retrait.commune_libelle as commune_retrait_libelle, commune_livraison.commune_libelle as commune_livraison_libelle, utilisateur_login, utilisateur_telephone
    	from dim_course 
    	inner join utilisateur USING(utilisateur_id) 
    	inner join dim_commune as commune_retrait on commune_retrait.commune_id = dim_course.commune_id_retrait
    	inner join dim_commune as commune_livraison on commune_livraison.commune_id = dim_course.commune_id_livraison
    	where dim_course.statut <> "SUPPRIME"
    	';					
    		
    	$courses = DB::select($sql);

        return view('courses',['courses'=>$courses]);
		
    }

    public function DetailsCourse($course_id)
    {
		
    	$sql = 'select dim_course.*, commune_retrait.commune_libelle as commune_retrait_libelle, commune_livraison.commune_libelle as commune_livraison_libelle, utilisateur_login, utilisateur_telephone
    	from dim_course 
    	inner join utilisateur USING(utilisateur_id) 
    	inner join dim_commune as commune_retrait on commune_retrait.commune_id = dim_course.commune_id_retrait
    	inner join dim_commune as commune_livraison on commune_livraison.commune_id = dim_course.commune_id_livraison
    	where dim_course.statut <> "SUPPRIME"
    	AND course_id = "'.$course_id.'"
    	';					
    		
    	$course = current(DB::select($sql));

        return view('details_course',['course'=>$course]);
		
    }

    public function setcourselivree(Request $request)
    {
		
		$course_id = $request->course_id;
		
		$course 	= Course::find($course_id);
		
		$course->statut_livraison = 'LIVREE';
		$course->exists = true;
		$course->save();
		
		echo 1;
		
	}



    public function commandes()
    {
		
    	$commandes = Commande::join('tb_users','tb_users.id','commande.utilisateur_id')->get();

    	//dd($commandes);								
        return view('commandes',['commandes'=>$commandes]);
		
    }
	

    public function DetailsCommande(Request $request)
    {
		
		$commande_id = $request->commande_id;
		
		$commande 	= Commande::leftjoin('tb_users','tb_users.id','commande.utilisateur_id')
								->where(['commande_id'=>$commande_id])
								->first();
								
		// dd($commande);
		
		if(!empty($commande)){

			$produits 	= Produit::join('categorie','categorie.categorie_id','produit.categorie_id')
								->join('panier','panier.produit_id','produit.produit_id')
								->join('commande','commande.commande_id','panier.commande_id')
								->where(['commande.commande_id'=>$commande_id])
								->get();
									
			
			return view('details_commande', ['commande'=>$commande,'produits'=>$produits]);
		
		}else{
			
			return Redirect('commandes')->with('warning',"LA COMMANDE QUE VOUS CHERCHEZ N'A PAS ÉTÉ TROUVÉ");
		}
		
	}
	


    public function setcommandelivree(Request $request)
    {
		
		$commande_id = $request->commande_id;
		
		$commande 	= Commande::find($commande_id);
		
		$commande->commande_statut_livraison = 'LIVREE';
		$commande->exists = true;
		$commande->save();
		
		echo 1;
		
	}
	


    public function FraisLivraison()
    {
		
    	$communes = Commune::get();
		
    	$frais_livraison = DB::select('select dim_frais_livraison.*, commune_retrait.commune_libelle as lieu_retrait, commune_livraison.commune_libelle as lieu_livraison
		 from dim_frais_livraison 
		inner join dim_commune as commune_retrait on commune_retrait.commune_id = dim_frais_livraison.commune_id_retrait
		inner join dim_commune as commune_livraison on commune_livraison.commune_id = dim_frais_livraison.commune_id_livraison
		WHERE frais_livraison_statut="VALIDE"
		');
				
        return view('frais_livraison',['frais_livraison'=>$frais_livraison, 'communes'=>$communes]);
		
    }
	
	
    public function SaveFraisLivraison(Request $request)
    {
		
    	$fl = new FraisLivraison();
		$fl->commune_id_retrait   			= $request->commune_id_retrait;
		$fl->commune_id_livraison			= $request->commune_id_livraison;
		$fl->frais_livraison_montant  		= $request->montant;
		$fl->frais_livraison_date_creation  = gmdate('Y-m-d H:i:s');
		$fl->frais_livraison_statut  		= 'VALIDE';
		
		$fl->save();
		
		return back()->with('message','OPÉRATION EFFECTUÉE AVEC SUCCÈS !');
		
    }
	
    public function SupprimerFraisLivraison(Request $request)
    {
		
		$frais_livraison_id = $request->frais_livraison_id;

		$frais_livraison 	= FraisLivraison::find($frais_livraison_id);

		if(!empty($frais_livraison)){

			$frais_livraison->frais_livraison_date_suppression 	= gmdate('Y-m-d H:i:s');
			$frais_livraison->frais_livraison_statut			= "SUPPRIME";
			$frais_livraison->exists 							= true;
			$frais_livraison->save();
			
			echo 1;
			
		}else{
			echo 0;
		}
	}
	
	
	


}


