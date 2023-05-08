@extends('layouts.app')

@section('content')

<ul class="breadcrumb no-border no-radius b-b b-light pull-in"> 
	<li><a href="{{route('home')}}"><i class="fa fa-home"></i> Accueil</a></li>
	<li class="active">Declarations</li> 
</ul> 


@if(Session::has('warning'))
	<div class="alert alert-warning">
	  {{Session::get('warning')}}
	</div>
@endif

@if(Session::has('message'))
	<div class="alert alert-success">
	  {{Session::get('message')}}
	</div>
@endif

@if (count($errors) > 0)
    <div class="alert alert-danger">
        <ul style="padding-left: 5px;">
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif

<div class="m-b-md"> 
	<h3 class="m-b-none">Gestion des declarations</h3> 
</div>


<div class="panel panel-default"> 

	<div class="wizard-steps clearfix" id="form-wizard"> 
		<ul class="steps"> 
			<li data-target="#step3" class="active"><span class="badge"><i class="fa fa-plus" ></i></span>Nouvelle declaration</li>
		</ul> 
	</div> 

	<div class="step-content clearfix"> 
		<form method="post" action="{{route('SaveDeclaration')}}" enctype="multipart/form-data" class="form-horizontal">
			
			{!! csrf_field() !!}
			
			<div class="step-pane active" id="step1"> 
			
				<div class="form-group{{ $errors->has('declaration_numero') ? ' has-error' : '' }}">
					
					<div class="col-md-12 row">
						
						<div class="col-md-3">
							<span> N° déclaration <span class="text text-danger">*</span></span>
							<input placeholder="" type="text" class="form-control" name="declaration_numero"  value="{{ old('declaration_numero') }}" required>
						</div>
						
						<div class="col-md-3">
							<span> Date prise en compte douane <span class="text text-danger">*</span></span>
							<input placeholder="" type="date" class="form-control" name="declaration_date_prise_compte"  value="{{ old('declaration_date_prise_compte') }}" required>
						</div>
						
						<div class="col-md-3">
							<span> Date déclaration <span class="text text-danger">*</span></span>
							<input placeholder="" type="date" class="form-control" name="declaration_date"  value="{{ old('declaration_date') }}" required>
						</div>

						<div class="col-md-3">
							<span> Date fin <span class="text text-danger">*</span></span>
							<input placeholder="" type="date" class="form-control" name="declaration_date_fin"  value="{{ old('declaration_date_fin') }}" required>
						</div>
					</div>
					
					<div class="col-md-12 row" style="margin-top:10px;">	
						
						<div class="col-md-3 form-group{{ $errors->has('regime') ? ' has-error' : '' }}">
							<label for="regime_id" class="col-md-12">Régime <span class="text text-danger">*</span></label>

							<div class="col-md-12">
								<select id="regime_id" class="form-control" name="regime_id" required>
									<option>Choisir</option>
									@foreach($regimes as $regime)
									<option value="{{ $regime->regime_id }}">{{ $regime->regime_libelle }}</option>
									@endforeach
								</select>

								@if ($errors->has('regime_id'))
									<span class="help-block">
										<strong>{{ $errors->first('regime_id') }}</strong>
									</span>
								@endif
							</div>
						</div>
						
						<div class="col-md-3 form-group{{ $errors->has('declarant') ? ' has-error' : '' }}">
							<label for="declarant_id" class="col-md-12">Déclarant <span class="text text-danger">*</span></label>

							<div class="col-md-12">
								<select id="declarant_id" class="form-control" name="declarant_id" required>
									<option>Choisir</option>
									@foreach($declarants as $declarant)
									<option value="{{ $declarant->declarant_id }}">{{ $declarant->declarant_nom }}</option>
									@endforeach
								</select>

								@if ($errors->has('declarant_id'))
									<span class="help-block">
										<strong>{{ $errors->first('declarant_id') }}</strong>
									</span>
								@endif
							</div>
						</div>

						<div class="col-md-3 form-group{{ $errors->has('expediteur') ? ' has-error' : '' }}">
							<label for="expediteur_id" class="col-md-12">Expéditeur <span class="text text-danger">*</span></label>

							<div class="col-md-12">
								<select id="expediteur_id" class="form-control" name="expediteur_id" required>
									<option>Choisir</option>
									@foreach($expediteurs as $expediteur)
									<option value="{{ $expediteur->expediteur_id }}">{{ $expediteur->expediteur_nom }}</option>
									@endforeach
								</select>

								@if ($errors->has('expediteur_id'))
									<span class="help-block">
										<strong>{{ $errors->first('expediteur_id') }}</strong>
									</span>
								@endif
							</div>
						</div>
			
						<div class="col-md-3 form-group{{ $errors->has('destinataire') ? ' has-error' : '' }}">
							<label for="destinataire_id" class="col-md-12">Destinataire <span class="text text-danger">*</span></label>

							<div class="col-md-12">
								<select id="destinataire_id" class="form-control" name="destinataire_id" required>
									<option>Choisir</option>
									@foreach($destinataires as $destinataire)
									<option value="{{ $destinataire->destinataire_id }}">{{ $destinataire->destinataire_nom }}</option>
									@endforeach
								</select>

								@if ($errors->has('destinataire_id'))
									<span class="help-block">
										<strong>{{ $errors->first('destinataire_id') }}</strong>
									</span>
								@endif
							</div>
						</div>
						
					</div>
					
					<div class="col-md-12 row" style="margin-top:10px;">	
						
					<div class="col-md-3 form-group{{ $errors->has('pays') ? ' has-error' : '' }}">
							<label for="pays_id" class="col-md-12">Pays <span class="text text-danger">*</span></label>

							<div class="col-md-12">
								<select id="pays_id" class="form-control" name="pays_id" required>
									<option>Choisir</option>
									@foreach($payss as $pays)
									<option value="{{ $pays->pays_id }}">{{ $pays->pays_nom }}</option>
									@endforeach
								</select>

								@if ($errors->has('pays_id'))
									<span class="help-block">
										<strong>{{ $errors->first('pays_id') }}</strong>
									</span>
								@endif
							</div>
						</div>
						
						<div class="col-md-3 form-group{{ $errors->has('bureau_sortie') ? ' has-error' : '' }}">
							<label for="bureau_sortie_id" class="col-md-12">Bureau_sortie <span class="text text-danger">*</span></label>

							<div class="col-md-12">
								<select id="bureau_sortie_id" class="form-control" name="bureau_sortie_id" required>
									<option>Choisir</option>
									@foreach($bureau_sorties as $bureau_sortie)
									<option value="{{ $bureau_sortie->bureau_sortie_id }}">{{ $bureau_sortie->bureau_sortie_libelle }}</option>
									@endforeach
								</select>

								@if ($errors->has('bureau_sortie_id'))
									<span class="help-block">
										<strong>{{ $errors->first('bureau_sortie_id') }}</strong>
									</span>
								@endif
							</div>
						</div>
			
						<div class="col-md-3 form-group{{ $errors->has('moyen_transport') ? ' has-error' : '' }}">
							<label for="moyen_transport_id" class="col-md-12">Moyen transport <span class="text text-danger">*</span></label>

							<div class="col-md-12">
								<select id="moyen_transport_id" class="form-control" name="moyen_transport_id" required>
									<option>Choisir</option>
									@foreach($moyen_transports as $moyen_transport)
									<option value="{{ $moyen_transport->moyen_transport_id }}">{{ $moyen_transport->moyen_transport_libelle }}</option>
									@endforeach
								</select>

								@if ($errors->has('moyen_transport_id'))
									<span class="help-block">
										<strong>{{ $errors->first('moyen_transport_id') }}</strong>
									</span>
								@endif
							</div>
						</div>

						<div class="col-md-3">
						</div>
					</div>

					<div class="col-md-12 row" style="margin-top:10px;">	
						
						<div class="col-md-3">	
						</div>
						
						<div class="col-md-3">	
						</div>
						
						<div class="col-md-3">
						</div>
			
						<div class="col-md-3">
							<span>&nbsp; <span class="text text-danger"></span></span>
							<button type="submit" class="btn btn-success btn-sm rounded">ENREGISTRER</button> 
						</div>
						
					</div>

				</div>

				
			</div> 
			
		</form>
		
		 
	
	</div>
	
	
</div>


<section class="panel panel-default"> 
	<header class="panel-heading"> Liste des produits
		<!--div class="actions pull-right" style="padding:0px;"> 
			<a class="btn btn-sm btn-info" href="{{route('produits')}}" style="padding:2px 10px;"><i class="fa fa-plus"></i> Nouveau</a>
		</div-->
	</header> 
	
	<div class="table-responsive"> 
		<table id="table_courriers" class="table table-striped m-b-none datatable "> 
			<thead> 
				<tr>
					<th width=""></th>
					<th width=""></th>
					<th width="">Nom</th>
					<th width="">Catégorie</th>
					<th width="">Date création</th>
					<th width="">Action</th>
				</tr> 
			</thead> 
			<tbody>
			@foreach($declarations as $declaration)
				<tr>
					<td><a href="{{route('details_declaration',$declaration->declaration_id)}}"><i class="fa fa-cogs text-info" title="Afficher les détails"></i></a></td> 
					<td><span class="btnModifierDeclaration" data-declaration_id="{{$declaration->declaration_id}}" style="cursor: pointer;"><i class="fa fa-edit text-warning" title="Modifier"></i></span></td> 
					<td>{{ $declaration->declaration_numero }}</td>
					<td>{{ $declaration->declaration_numero }}</td>
					<td>{{ Stdfn::dateFromDB($declaration->declaration_date_creation) }}</td>
					<td><span class="btnSupprimerDeclaration" data-produit_id="{{$declaration->declaration_id}}" style="cursor: pointer;"><i class="fa fa-times text-danger" title="Supprimer cette declaration"></i></a></td> 
				</tr>	
			@endforeach
			</tbody> 
		</table> 
	</div> 
</section>

@endsection