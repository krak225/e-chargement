@extends('layouts.app')

@section('content')

<ul class="breadcrumb no-border no-radius b-b b-light pull-in"> 
	<li><a href="{{route('home')}}"><i class="fa fa-home"></i> Accueil</a></li>
	<li class="active">Vehicules</li> 
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
	<h3 class="m-b-none">Gestion des véhicules</h3> 
</div>

@if(Auth::user()->profil_id == 2 || $option_afficher_formulaire == 'new')
<div class="panel panel-default"> 

	<div class="wizard-steps clearfix" id="form-wizard"> 
		<ul class="steps"> 
			<li data-target="#step3" class="active"><span class="badge"><i class="fa fa-plus" ></i></span>Nouveau vehicule</li>
		</ul> 
	</div> 

	<div class="step-content clearfix"> 
		<form method="post" action="{{route('SaveVehicule')}}" enctype="multipart/form-data" class="form-horizontal">
			
			{!! csrf_field() !!}
			
			<div class="step-pane active" id="step1"> 
			
				<div class="form-group{{ $errors->has('vehicule_numero_chassis') ? ' has-error' : '' }}">
					
					<div class="col-md-12 row">
						
						<div class="col-md-4">
							<span> NImmatriculation 1<span class="text text-danger">*</span></span>
							<input style="padding-top:0px;" placeholder="" type="text" class="form-control" name="vehicule_immatriculation1" value="{{ old('vehicule_immatriculation1') }}" required>
						</div>

						<div class="col-md-4">
							<span> Marque <span class="text text-danger"></span></span>
							<input placeholder="" type="text" class="form-control" name="vehicule_marque"  value="{{ old('vehicule_marque') }}">
						</div>
						
						<div class="col-md-4">
							<span> Numéro déclaration<span class="text text-danger">*</span></span>
							<input style="padding-top:0px;" placeholder="" type="text" class="form-control" name="vehicule_numero_declaration" value="{{ old('vehicule_numero_declaration') }}" required>
						</div>
						
					</div>
					
					<div class="col-md-12 row" style="margin-top:10px;">	
						
						<div class="col-md-4">
							<span> Immatriculation 2<span class="text text-danger"></span></span>
							<input style="padding-top:0px;" placeholder="" type="text" class="form-control" name="vehicule_immatriculation2" value="{{ old('vehicule_immatriculation2') }}">
						</div>
						
						<div class="col-md-4">
							<span> Numéro chassis<span class="text text-danger"></span></span>
							<input style="padding-top:0px;" placeholder="" type="text" class="form-control" name="vehicule_numero_chassis" value="{{ old('vehicule_numero_chassis') }}">
						</div>
						
						<div class="col-md-4">
							<span> Numéro LDC<span class="text text-danger"></span></span>
							<input style="padding-top:0px;" placeholder="" type="text" class="form-control" name="vehicule_numero_ldc" value="{{ old('vehicule_numero_ldc') }}">
						</div>

						
					</div>
					
					<div class="col-md-12 row" style="margin-top:10px;">	
						
						<div class="col-md-5">	
						</div>
						
						<div class="col-md-5">
						</div>

						<div class="col-md-2">
							<span>&nbsp; <span class="text text-danger"></span></span>
							<button type="submit" class="btn btn-success btn-sm rounded">ENREGISTRER</button> 
						</div>
						
					</div>
				</div>

				
			</div> 
			
		</form>
		
		 
	
	</div>
	
	
</div>
@endif

<section class="panel panel-default"> 
	<header class="panel-heading"> Liste des véhicules
		<div class="actions pull-right" style="padding:0px;"> 
			<a class="btn btn-sm btn-info" href="{{route('vehicules','new')}}" style="padding:2px 10px;"><i class="fa fa-plus"></i> Nouveau véhicule</a>
		</div>
	</header> 
	
	<div class="table-responsive"> 
		<table id="table_courriers" class="table table-striped m-b-none datatable "> 
			<thead> 
				<tr>
					<th style="display:none;"></th>
					<th colspan="" width="">Action</th>
					<th width="">Marque</th>
					<th width="">Immat 1</th>
					<th width="">N° chassis</th>
					<th width="">N° déclaration</th>
					<th width="">Statut</th>
				</tr> 
			</thead> 
			<tbody>
			@foreach($vehicules as $vehicule)
				<tr>
					<td style="display:none;">{{$vehicule->vehicule_id}}</a>
					<td><a href="{{route('DetailsVehicule',$vehicule->vehicule_id)}}"><i class="fa fa-cogs text-info" title="Afficher les détails"></i></a>&nbsp;&nbsp;
					@if(Auth::user()->profil_id != 1)
					<span class="btnModifierVehicule" data-vehicule_id="{{$vehicule->vehicule_id}}" style="cursor: pointer;"><i class="fa fa-edit text-warning" title="Modifier"></i></span>&nbsp;&nbsp;
					<span class="btnSupprimerVehicule" data-vehicule_id="{{$vehicule->vehicule_id}}" style="cursor: pointer;"><i class="fa fa-times text-danger" title="Supprimer ce vehicule"></i></a> 
					@endif
					</td>
					<td>{{$vehicule->vehicule_marque}}</td>
					<td>{{$vehicule->vehicule_immatriculation1}}</td>
					<td>{{$vehicule->vehicule_numero_chassis}}</td>
					<td>{{$vehicule->vehicule_numero_declaration}}</td>
					<td style="text-transform: uppercase;"><span class="badge bg-light bg-warning">{{ str_replace('1',' Port', str_replace('2',' OIC', $vehicule->vehicule_statuts))}}</span></td>
				</tr>	
			@endforeach
			</tbody> 
		</table> 
	</div> 
</section>

@endsection