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
	<h3 class="m-b-none">Véhicules sous pénalité au poste 1</h3> 
</div>

<section class="panel panel-default"> 
	<header class="panel-heading"> Liste des véhicules sous pénalité au poste 1
	</header> 
	
	<div class="table-responsive"> 
		<table id="table_courriers" class="table table-striped m-b-none datatable "> 
			<thead> 
				<tr>
					<th style="display:none;"></th>
					<th colspan="" width="">Action</th>
					<th width="">Marque</th>
					<th width="">N° chassis</th>
					<th width="">Immat 1</th>
					<th width="">N° déclaration</th>
					<th width="">Date entrée</th>
					<th width="">Date sortie</th>
					<th width="">Durée</th>
				</tr> 
			</thead> 
			<tbody>
			@foreach($vehicules as $vehicule)
				<tr>
					<td style="display:none;">{{$vehicule->vehicule_id}}</a>
					<td><a href="{{route('DetailsVehicule',$vehicule->vehicule_id)}}"><i class="fa fa-cogs text-info" title="Afficher les détails"></i></a>&nbsp;&nbsp;
					</td>
					<td>{{$vehicule->vehicule_marque}}</td>
					<td>{{$vehicule->vehicule_numero_chassis}}</td>
					<td>{{$vehicule->vehicule_immatriculation1}}</td>
					<td>{{$vehicule->vehicule_numero_declaration}}</td>
					<td>{{Stdfn::dateFromDB($vehicule->vehicule_date_entree1)}}</td>
					<td>{{Stdfn::dateFromDB($vehicule->vehicule_date_sortie1)}}</td>
					<td>{{$vehicule->RETARD}} jours</td>
				</tr>	
			@endforeach
			</tbody> 
		</table> 
	</div> 
</section>

@endsection