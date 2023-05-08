<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

//le tout
Auth::routes();

Route::get('/','HomeController@index')->name('accueil');
Route::get('/home','HomeController@index')->name('home');
Route::get('/produit/','HomeController@produitHome')->name('produitHome');


Route::get('/utilisateurs','AdmController@utilisateurs')->name('utilisateurs');
Route::get('/utilisateur/{id}','AdmController@DetailsUtilisateur')->name('DetailsUtilisateur');
Route::get('/utilisateur/{id}/modifier','AdmController@modifier_utilisateur')->name('ModifierUtilisateur');
Route::post('/utilisateur/{id}/modifier','AdmController@modifier_utilisateur')->name('ModifierUtilisateur');


Route::get('/profile','UserController@profile')->name('profile');
Route::get('/password/update','UserController@update_password')->name('updatePassword');
Route::post('/password/update','UserController@UpdatePassword');
Route::get('/profile/update_photo','UserController@update_photo')->name('update_photo');
Route::post('/profile/update_photo','UserController@UpdatePhoto')->name('UpdatePhoto');
Route::post('/profile/uploadImage','UserController@uploadImage')->name('uploadImage');
Route::post('/profile/upload_image','UserController@upload_image')->name('upload_image');


Route::get('/showpiecejointe/{id}','MediaController@ShowPieceJointe')->name('ShowPieceJointe');


Route::get('commandes','ParametresController@commandes')->name('commandes');
Route::get('commande/{commande_id}','ParametresController@DetailsCommande')->name('DetailsCommande');

//les routes pour gerer produits
Route::get('produits','ParametresController@produits')->name('produits');
Route::post('produits','ParametresController@SaveProduit')->name('SaveProduit');
Route::get('produit/{produit_id}','ParametresController@DetailsProduit')->name('DetailsProduit');
Route::post('supprimer_produit','ParametresController@SupprimerProduit')->name('SupprimerProduit');

Route::post('update_photo_produit/{produit_id}','ParametresController@UpdateProduitPhoto')->name('UpdateProduitPhoto');
Route::post('upload_fichiers/{courrier_id}','ParametresController@UpdateFichiers')->name('UpdateFichiers');

//les routes pour gerer déclarations
Route::get('declarations','ParametresController@declarations')->name('declarations');
Route::post('declarations','ParametresController@SaveDeclaration')->name('SaveDeclaration');
Route::post('declaration/{declaration_id}','ParametresController@SaveDeclarationMarchandise')->name('SaveDeclarationMarchandise');
Route::get('declaration/{declaration_id}','ParametresController@details_declaration')->name('details_declaration');
Route::post('supprimer_declaration','ParametresController@SupprimerDeclaration')->name('SupprimerDeclaration');

Route::post('update_photo_declaration/{declaration_id}','ParametresController@UpdateDeclarationPhoto')->name('UpdateDeclarationPhoto');
Route::post('upload_fichiers/{courrier_id}','ParametresController@UpdateFichiers')->name('UpdateFichiers');

//les routes pour gerer chargements
Route::get('chargements','ParametresController@chargements')->name('chargements');
Route::post('chargements','ParametresController@SaveChargement')->name('SaveChargement');
Route::get('chargement/{chargement_id}','ParametresController@DetailsChargement')->name('DetailsChargement');
Route::post('supprimer_chargement','ParametresController@SupprimerChargement')->name('SupprimerChargement');

Route::post('update_photo_chargement/{chargement_id}','ParametresController@UpdateChargementPhoto')->name('UpdateChargementPhoto');
Route::post('upload_fichiers/{chargement_id}','ParametresController@UpdateFichiers')->name('UpdateFichiers');


//les routes pour gerer empotages
Route::get('empotages','ParametresController@empotages')->name('empotages');
Route::post('empotages','ParametresController@SaveEmpotage')->name('SaveEmpotage');
Route::get('empotage/{empotage_id}','ParametresController@DetailsEmpotage')->name('DetailsEmpotage');
Route::post('supprimer_empotage','ParametresController@SupprimerEmpotage')->name('SupprimerEmpotage');

Route::post('update_photo_empotage/{empotage_id}','ParametresController@UpdateEmpotagePhoto')->name('UpdateEmpotagePhoto');
Route::post('upload_fichiers/{empotage_id}','ParametresController@UpdateFichiers')->name('UpdateFichiers');


//les routes pour gerer declarants
Route::get('declarants','ParametresController@declarants')->name('declarants');
Route::post('declarants','ParametresController@SaveDeclarant')->name('SaveDeclarant');
Route::get('declarant/{declarant_id}','ParametresController@DetailsDeclarant')->name('DetailsDeclarant');
Route::post('supprimer_declarant','ParametresController@SupprimerDeclarant')->name('SupprimerDeclarant');

Route::post('update_photo_declarant/{declarant_id}','ParametresController@UpdateDeclarantPhoto')->name('UpdateDeclarantPhoto');
Route::post('upload_fichiers/{declarant_id}','ParametresController@UpdateFichiers')->name('UpdateFichiers');


//les routes pour gerer expediteur
Route::get('expediteurs','ParametresController@expediteurs')->name('expediteurs');
Route::post('expediteurs','ParametresController@SaveProduit')->name('SaveExpediteur');
Route::get('expediteur/{expediteur_id}','ParametresController@DetailsExpediteur')->name('DetailsExpediteur');
Route::post('supprimer_expediteur','ParametresController@SupprimerExpediteur')->name('SupprimerExpediteur');

Route::post('update_photo_expediteur/{expediteur_id}','ParametresController@UpdateExpediteurPhoto')->name('UpdateExpediteurPhoto');
Route::post('upload_fichiers/{expediteur_id}','ParametresController@UpdateFichiers')->name('UpdateFichiers');

//les routes pour gerer destinataire
Route::get('destinataires','ParametresController@destinataires')->name('destinataires');
Route::post('destinataires','ParametresController@SaveDestinataire')->name('SaveDestinataire');
Route::get('destinataire/{destinataire_id}','ParametresController@DetailsDestinataire')->name('DetailsDestinataire');
Route::post('supprimer_destinataire','ParametresController@SupprimerDestinataire')->name('SupprimerDestinataire');

Route::post('update_photo_destinataire/{destinataire_id}','ParametresController@UpdateDestinatairePhoto')->name('UpdateDestinatairePhoto');
Route::post('upload_fichiers/{destinataire_id}','ParametresController@UpdateFichiers')->name('UpdateFichiers');

//les routes pour gerer agent_douanes
Route::get('agent_douanes','ParametresController@agent_douanes')->name('agent_douanes');
Route::post('agent_douanes','ParametresController@SaveAgent_douane')->name('SaveAgent_douane');
Route::get('agent_douane/{agent_douane_id}','ParametresController@DetailsAgent_douane')->name('DetailsAgent_douane');
Route::post('supprimer_agent_douane','ParametresController@SupprimerAgent_douane')->name('SupprimerAgent_douane');

Route::post('update_photo_agent_douane/{agent_douane_id}','ParametresController@UpdateAgent_douanePhoto')->name('UpdateAgent_douanePhoto');
Route::post('upload_fichiers/{agent_douane_id}','ParametresController@UpdateFichiers')->name('UpdateFichiers');

// Fin agents douane

//les routes pour gerer vehicules
Route::get('vehicules/{option_afficher_formulaire?}','ParametresController@vehicules')->name('vehicules');
Route::get('vehicules_sous_penalite_poste1','ParametresController@vehicules_sous_penalite_poste1')->name('vehicules_sous_penalite_poste1');
Route::get('vehicules_sous_penalite_poste2','ParametresController@vehicules_sous_penalite_poste2')->name('vehicules_sous_penalite_poste2');
Route::post('vehicules','ParametresController@SaveVehicule')->name('SaveVehicule');
Route::get('vehicule/{vehicule_id}','ParametresController@DetailsVehicule')->name('DetailsVehicule');
Route::post('supprimer_vehicule','ParametresController@SupprimerVehicule')->name('SupprimerVehicule');
Route::get('sortie_vehicule/{vehicule_id}/{situation}','ParametresController@sortie_vehicule')->name('sortie_vehicule');
Route::post('sortie_vehicule/{vehicule_id}','ParametresController@SaveSortieVehicule')->name('SaveSortieVehicule');

Route::post('update_photo_vehicule/{vehicule_id}','ParametresController@UpdateVehiculePhoto')->name('UpdateVehiculePhoto');
Route::post('upload_fichiers/{vehicule_id}','ParametresController@UpdateFichiers')->name('UpdateFichiers');

//les routes pour gerer postes
Route::get('postes','ParametresController@postes')->name('postes');
Route::post('postes','ParametresController@SavePoste')->name('SavePoste');
Route::get('poste/{poste_id}','ParametresController@DetailsPoste')->name('DetailsPoste');
Route::post('supprimer_poste','ParametresController@SupprimerPoste')->name('SupprimerPoste');

Route::post('update_photo_poste/{poste_id}','ParametresController@UpdatePostePhoto')->name('UpdatePostePhoto');
Route::post('upload_fichiers/{poste_id}','ParametresController@UpdateFichiers')->name('UpdateFichiers');

// Fin les routes pour gerer postes

//les routes pour gerer regimes
Route::get('regimes','ParametresController@regimes')->name('regimes');
Route::post('regimes','ParametresController@SaveRegime')->name('SaveRegime');
Route::get('regime/{regime_id}','ParametresController@DetailsRegime')->name('DetailsRegime');
Route::post('supprimer_regime','ParametresController@SupprimerRegime')->name('SupprimerRegime');

// fin regime

//les routes pour gerer bureau_sorties
Route::get('bureau_sorties','ParametresController@bureau_sorties')->name('bureau_sorties');
Route::post('bureau_sorties','ParametresController@SaveBureau_sortie')->name('SaveBureau_sortie');
Route::get('bureau_sortie/{bureau_sortie_id}','ParametresController@DetailsBureau_sortie')->name('DetailsBureau_sortie');
Route::post('supprimer_bureau_sortie','ParametresController@SupprimerBureau_sortie')->name('SupprimerBureau_sortie');

// fin bureau_sortie

//les routes pour gerer moyen_transports
Route::get('moyen_transports','ParametresController@moyen_transports')->name('moyen_transports');
Route::post('moyen_transports','ParametresController@SaveMoyen_transport')->name('SaveMoyen_transport');
Route::get('moyen_transport/{moyen_transport_id}','ParametresController@DetailsMoyen_transport')->name('DetailsMoyen_transport');
Route::post('supprimer_moyen_transport','ParametresController@SupprimerMoyen_transport')->name('SupprimerMoyen_transport');

Route::post('update_photo_moyen_transport/{moyen_transport_id}','ParametresController@UpdateMoyen_transportPhoto')->name('UpdateMoyen_transportPhoto');
Route::post('upload_fichiers/{moyen_transport_id}','ParametresController@UpdateFichiers')->name('UpdateFichiers');

Route::get('categories','ParametresController@categories')->name('categories');
Route::post('categories','ParametresController@SaveCategorie')->name('SaveCategorie');
Route::post('supprimer_categorie','ParametresController@SupprimerCategorie')->name('SupprimerCategorie');

Route::get('frais_livraison','ParametresController@FraisLivraison')->name('frais_livraison');
Route::post('frais_livraison','ParametresController@SaveFraisLivraison')->name('SaveFraisLivraison');
Route::post('supprimer_frais_livraison','ParametresController@SupprimerFraisLivraison')->name('SupprimerFraisLivraison');

Route::get('banniere','ParametresController@banniere')->name('banniere');
Route::post('banniere','ParametresController@SaveBanniere')->name('SaveBanniere');
Route::post('supprimer_banniere','ParametresController@SupprimerBanniere')->name('SupprimerBanniere');

//
Route::get('courses','ParametresController@courses')->name('courses');
Route::post('courses','ParametresController@SaveCourse')->name('SaveCourse');
Route::get('course/{course_id}','ParametresController@DetailsCourse')->name('DetailsCourse');
Route::post('supprimer_course','ParametresController@SupprimerCourse')->name('SupprimerCourse');



//sécurité
Route::any('{catchall}', 'SecurityController@SaveRoutes')->where('catchall', '.*');


