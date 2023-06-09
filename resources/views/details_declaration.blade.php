@extends('layouts.app')


@section('content')
@if(!empty($declaration))
<ul class="breadcrumb no-border no-radius b-b b-light pull-in"> 
	<li><a href="{{ route('home') }}"><i class="fa fa-home"></i> Accueil</a></li> 
	<li><a href="{{ route('declarations') }}">Déclarations</a></li> 
	<li class="active">Déclaration {{ $declaration->declaration_code }}</li> 
</ul> 

<div class="m-b-md"> 
	<h3 class="m-b-none">Déclaration {{ $declaration->declaration_code }}</h3>
</div>

@if(Session::has('warning'))
	<div class="alert alert-warning">
	  {{Session::get('warning')}}
	</div>
@endif

<style type="text/css">
<!--
.title{
	padding:0px 15px;
}

.dz-preview, .dz-file-preview {
    display: none;
}
#table_justifs{
    border: 1px solid #eee;
	margin-top:0px;
}
#table_justifs th{
    background:#eee;	
}


.select-checkbox option::before {
  content: "\2610";
  width: 1.3em;
  text-align: center;
  display: inline-block;
}
.select-checkbox option:checked::before {
  content: "\2611";
}


ul.no_liste_item li {
  list-style:none;
}

.bold{font-weight:bold;}

-->
</style>

<div class="panel panel-default"> 

		<div class="col-lg-12" style="padding-top:15px;padding-left: 0px;padding-right: 0px;"> 
		<div class="row0"> 
			
			<div class="col-sm-6"> 
				<section class="panel panel-default"> 
					<!--header class="panel-heading bg-info lt no-border title"> 
						<div class="clearfix"> 
							<div class="clear"> 
							<div class="h3 m-t-xs m-b-xs text-white">
							<small style="color:white;">Informations sur le declaration</small>
							<i class="fa fa-circle text-white pull-right text-xs m-t-sm"></i> 
							</div>  
							</div> 
						</div> 
					</header---> 
					<div class="list-group no-radius alt"> 
						<span class="list-group-item"> 
							<span class="badge bg-light">{{ $declaration->declaration_numero }}</span> 
							<i class="fa fa- icon-muted"></i> Numéro 
						</span>		
						<span class="list-group-item"> 
							<span class="badge bg-light">{{ $declaration->declarant->declarant_nom }}</span> 
							<i class="fa fa- icon-muted"></i> Déclarant
						</span>
						<span class="list-group-item"> 
							<span class="badge bg-light">{{ $declaration->expediteur->expediteur_nom }}</span> 
							<i class="fa fa- icon-muted"></i> Expéditeur 
						</span>
						<span class="list-group-item"> 
							<span class="badge bg-light">{{ $declaration->bureau_sortie->bureau_sortie_libelle }}</span> 
							<i class="fa fa- icon-muted"></i> Bureau de sortie 
						</span>
						<span class="list-group-item"> 
							<span class="badge bg-light">{{ $declaration->regime->regime_libelle }}</span> 
							<i class="fa fa- icon-muted"></i> Régime 
						</span>
						<span class="list-group-item"> 
							<span class="badge bg-light">{{ $declaration->moyen_transport->moyen_transport_libelle }}</span> 
							<i class="fa fa- icon-muted"></i> Moyen de transport 
						</span>
						<span class="list-group-item"> 
							<span class="badge bg-light">{{ $declaration->destinataire->destinataire_nom }}</span> 
							<i class="fa fa- icon-muted"></i> Destinataire 
						</span>	
						<span class="list-group-item"> 
							<span class="badge bg-light">{{ $declaration->pays->pays_nom }}</span> 
							<i class="fa fa- icon-muted"></i> Pays 
						</span>	
					</div> 
					
				</section>
			</div>
			
			<div class="col-sm-6"> 
				<section class="panel panel-default"> 
					<!--header class="panel-heading bg-info lt no-border title"> 
						<div class="clearfix"> 
							<div class="clear"> 
							<div class="h3 m-t-xs m-b-xs text-white">
							<small style="color:white;">Informations sur le declaration</small>
							<i class="fa fa-circle text-white pull-right text-xs m-t-sm"></i> 
							</div>  
							</div> 
						</div> 
					</header---> 
					<div class="list-group no-radius alt"> 
						
						<span class="list-group-item"> 
							<span class="badge bg-light">{{ Stdfn::dateFromDB($declaration->declaration_date) }}</span> 
							<i class="fa fa- icon-muted"></i> Date déclaration
						</span>
						<span class="list-group-item"> 
							<span class="badge bg-light">{{ Stdfn::dateFromDB($declaration->declaration_date_fin) }}</span> 
							<i class="fa fa- icon-muted"></i> Date fin
						</span>
						<span class="list-group-item"> 
							<span class="badge bg-light">{{ Stdfn::dateFromDB($declaration->declaration_date_prise_compte) }}</span> 
							<i class="fa fa- icon-muted"></i> Date prise en compte
						</span>
						<span class="list-group-item"> 
							<span class="badge bg-light">{{ Stdfn::dateTimeFromDB($declaration->declaration_date_creation) }}</span> 
							<i class="fa fa- icon-muted"></i> Date système
						</span>
						<span class="list-group-item"> 
							<span class="badge bg-light">{{ $declaration->user->nom }} {{ $declaration->user->prenoms }}</span> 
							<i class="fa fa- icon-muted"></i> Enregistré par
						</span>
						<span class="list-group-item"> 
							<span class="badge bg-light">{{ $declaration->declaration_statut }}</span> 
							<i class="fa fa- icon-muted"></i> Statut
						</span>
						
					</div> 
					
				</section>
			</div> 
		
		<br style="clear:both;"/>	
		</div>


	</div>

	<div class="panel panel-default wizard0"> 
	
		@if($declaration->declaration_statut == "BROUILLON")
		<div class="wizard-steps clearfix"> 
			<ul class="steps"> 
				<li data-target="#step2" class="active"><span class="badge"></span>Déclaration des marchandises soumises à la RCP et/ou à la RRR <!--Ajout des matériels et supports de stockage importés--> </li>
			</ul> 
		</div> 
		@endif
		
		<div class="step-content clearfix"> 
		<br style="clear:both;"/>
				
				<div class="line line-lg pull-in"></div>
			<div class="">
				
				@if($declaration->declaration_statut == "valide")
				<div class="col-md-12 row" style="padding:0px;margin:0px;">
				
					<form enctype="multipart/form-data" method="post" class="form-horizontal" action="{{route('SaveDeclarationMarchandise', $declaration->declaration_id)}}">
						
						{!! csrf_field() !!}
						
						<input type="hidden" name="declaration_id" value="{{$declaration->declaration_id}}"/>
						
						<div class="col-md-4 form-group{{ $errors->has('marchandise_id') ? ' has-error' : '' }}">
							<label for="marchandise_id" class="col-md-12">Marchandises <span class="text text-danger">*</span></label>

							<div class="col-md-12">
								<select id="marchandise_id" class="form-control" name="marchandise_id" required>
									<option>Saisir le code pour filtrer</option>
									@foreach($marchandises as $marchandise)
									<option value="{{ $marchandise->marchandise_id }}">{{ $marchandise->marchandise_code_valorisation }} - {{ $marchandise->marchandise_libelle }}</option>
									@endforeach
								</select>

								@if ($errors->has('marchandise_id'))
									<span class="help-block">
										<strong>{{ $errors->first('marchandise_id') }}</strong>
									</span>
								@endif
							</div>
						</div>

						<div class="col-md-3 form-group{{ $errors->has('conteneur') ? ' has-error' : '' }}">
							<label for="conteneur_id" class="col-md-12">Conteneur <span class="text text-danger">*</span></label>

							<div class="col-md-12">
								<select id="conteneur_id" class="form-control" name="conteneur_id" required>
									<option>Saisir le code pour filtrer</option>
									@foreach($conteneurs as $conteneur)
									<option value="{{ $conteneur->conteneur_id }}">{{ $conteneur->conteneur_numero }}</option>
									@endforeach
								</select>

								@if ($errors->has('conteneur_id'))
									<span class="help-block">
										<strong>{{ $errors->first('conteneur_id') }}</strong>
									</span>
								@endif
							</div>
						</div>

						<div class="col-md-2 form-group{{ $errors->has('poids_net') ? ' has-error' : '' }}">
							<label for="poids_net" class="col-md-12" title="Poids">Poids net<span class="text text-danger"></span></label>

							<div class="col-md-12">
								<input type="number" id="poids_net" name="poids_net" class="form-control" placeholder="" >
								@if($errors->has('poids_net'))
								<span class="help-block">
									<strong>{{ $errors->first('poids_net') }}</strong>
								</span>
								@endif
							</div>
						</div>
						
						<div class="col-md-2 form-group{{ $errors->has('quantite') ? ' has-error' : '' }}">
							<label for="quantite" class="col-md-12">Quantité <span class="text text-danger">*</span></label>

							<div class="col-md-12">
								<input type="number" id="quantite" name="quantite" class="form-control" placeholder="" required />
								@if($errors->has('quantite'))
								<span class="help-block">
									<strong>{{ $errors->first('quantite') }}</strong>
								</span>
								@endif
							</div>
						</div>
						
						<div class="col-md-2 form-group{{ $errors->has('valeur_douane') ? ' has-error' : '' }}">
							<label for="valeur_douane" class="col-md-12">Valeur CAF <span class="text text-danger">*</span></label>

							<div class="col-md-12">
								<input autocomplete="off" type="text" id="valeur_douane" name="valeur_douane" class="form-control wari" placeholder="" required>
								@if($errors->has('valeur_douane'))
								<span class="help-block">
									<strong>{{ $errors->first('valeur_douane') }}</strong>
								</span>
								@endif
							</div>
						</div>

						
						<div class="col-md-1" style="margin-left:-10px;">
							<label class="col-md-12">&nbsp;</label>
							<div class="col-md-12 ">
								<button type="submit" class="btn btn-warning btn-sm rounded">Ajouter</button> 
							</div>
						</div>
						
					</form>
					
				</div>
				@endif
				
				
				<br style="clear:both;"/>
				
				<div class="line line-lg pull-in"></div>
				
				<div class="col-md-12 row" style="padding:0px;margin:0px;">
					
					<section class="panel panel-default"> 
						<header class="panel-heading">Liste des marchandises</header> 
						
						<div class="table-responsive"> 
							<table id="table_actionsd" class="table table-striped m-b-none datatable someClass0"> 
								<thead> 
									<tr>
										<th width="">Code SH</th>
										<th width="35%">Libellé</th>
										<th width="">Qté</th>
										<th width="">Poids</th>
										<th width="">V. CAF</th>
										@if($declaration->declaration_statut == "BROUILLON")
										<th width=""></th>
										@endif
									</tr> 
								</thead> 
								<tbody>
								@foreach($marchandises_declares as $declaration_marchandise)
									<tr>
										<td>{{ $declaration_marchandise->marchandise->marchandise_code_valorisation }}</td>
										<td>{{ $declaration_marchandise->marchandise->marchandise_libelle }}</td>
										<td>{{ number_format($declaration_marchandise->detail_declaration_quantite, 0, '', ' ') }}</td>
										<td>{{ number_format($declaration_marchandise->detail_declaration_poids_net, 0, '', ' ') }}</t>
										<td>{{ number_format($declaration_marchandise->detail_declaration_valeur, 0, '', ' ') }}</td>
										@if($declaration->detail_declaration_statut == "BROUILLON")
										<td><span class="btnSupprimerAction" data-detail_declaration_id="{{$declaration_marchandise->detail_declaration_id}}" style="cursor: pointer;"><i class="fa fa-times text-danger" title="Supprimer"></i></span></td> 
										@endif
									</tr>	
								@endforeach
								</tbody> 
							</table> 
						</div> 
					</section>
					
					<!--div class="col-md-12" style="margin-bottom:50px;padding:15px;background:rgb(192,227,245);border-bottom:1px solid #272727;border-top:1px solid #272727;">
						<div class="col-md-4 pull-right" style="text-align:right;">
							<strong>Montant Total : {{ number_format($declaration->declaration_montant_redevance_rcp, 0, '', ' ') }} FCFA</strong> 
						</div>
					</div-->
					
				</div>
			
				<br style="clear:both;"/>
			</div>
			
			@if($declaration->declaration_statut_paiement == "NON PAYE")
			<div class="line line-lg pull-in"></div>
			
			<div class="col-md-12"> 
				<div class="col-md-4 text-center" style="margin-top:12px;"> 
					<b>MONTANT A PAYER</b> <span class="label label-light" style="background: orange;color:white;font-size: 15px;margin-left:30px;">{{ number_format($declaration->declaration_facture_solde, 0, '', ' ')}} FCFA</span>
				</div> 
				<div class="col-md-4 text-center" style="margin-top:10px;"> 
					@if($declaration->declaration_facture_solde > 0 && Auth::user()->profil_id != 1)
					<a class="btn btn-success btn-sm" href="{{route('paiement_enligne', $declaration->declaration_id)}}">PAYER EN LIGNE</a>
					@endif
				</div>
				<div class="col-md-4 text-center" style="margin-top:10px;"> 			
					@if($declaration->declaration_facture_solde > 0 && Auth::user()->profil_id == 1)
						<a class="btn btn-info btn-sm" href="{{route('paiement_classique', $declaration->declaration_id)}}">PAYER EN ESPECE, CHEQUE OU VIREMENT</a>
					@else
						<a class="btn btn-info btn-sm" href="{{route('paiement_info_burida', $declaration->declaration_id)}}">PAYER EN ESPECE, CHEQUE OU VIREMENT AU BURIDA</a>
					@endif
				</div>
			</div>
			
			@endif
				
		</div>
		
		
		
		
		
	</div>
	
</div>
@else

<ul class="breadcrumb no-border no-radius b-b b-light pull-in"> 
	<li><a href="{{ route('home') }}"><i class="fa fa-home"></i> Accueil</a></li> 
	<li><a href="{{ route('declarations') }}">Declarations</a></li> 
</ul> 

<div class="m-b-md"> 
	<h3 class="m-b-none">Declaration introuvable</h3> 
</div>

<div class="panel"> 

	<div class="col-lg-12" style="padding:15px;"> 
		La declaration que vous recherchez n'a pas été trouvé!
	</div> 
	
	<br style="clear:both;"/>
	
</div>	

@endif

@endsection