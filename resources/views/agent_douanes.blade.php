@extends('layouts.app')

@section('content')

<ul class="breadcrumb no-border no-radius b-b b-light pull-in"> 
	<li><a href="{{route('home')}}"><i class="fa fa-home"></i> Accueil</a></li>
	<li class="active">Agent_douanes</li> 
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
	<h3 class="m-b-none">Gestion des agents des douanes</h3> 
</div>


<div class="panel panel-default"> 

	<div class="wizard-steps clearfix" id="form-wizard"> 
		<ul class="steps"> 
			<li data-target="#step3" class="active"><span class="badge"><i class="fa fa-plus" ></i></span>Nouveau agent_douane</li>
		</ul> 
	</div> 

	<div class="step-content clearfix"> 
		<form method="post" action="{{route('SaveAgent_douane')}}" enctype="multipart/form-data" class="form-horizontal">
			
			{!! csrf_field() !!}
			
			<div class="step-pane active" id="step1"> 
			
				<div class="form-group{{ $errors->has('agent_douane_nom') ? ' has-error' : '' }}">
					
				<div class="col-md-12 row" style="margin-top:10px;">
						
						<div class="col-md-3">
							<span> Matricule <span class="text text-danger">*</span></span>
							<input placeholder="" type="text" class="form-control" name="agent_douane_nom"  value="{{ old('agent_douane_nom') }}" required>
						</div>
						
						<div class="col-md-6">
							<span> Nom et prénoms<span class="text text-danger"></span></span>
							<input style="padding-top:0px;" placeholder="" type="text" class="form-control" name="agent_douane_description" value="{{ old('agent_douane_description') }}">
						</div>
						
						<div class="col-md-3">
							<span> Date entrée en douane <span class="text text-danger">*</span></span>
							<input placeholder="" type="date" class="form-control" name="declaration_date_fin"  value="{{ old('declaration_date_fin') }}" required>
						</div>

					</div>
					
					<div class="col-md-12 row" style="margin-top:10px;">	
						
						<div class="col-md-4">
							<span> Grade <span class="text text-danger">*</span></span>
							<input placeholder="" type="text" class="form-control" name="agent_douane_nom"  value="{{ old('agent_douane_nom') }}" required>
						</div>
						
						<div class="col-md-4">
							<span> Téléphone<span class="text text-danger"></span></span>
							<input style="padding-top:0px;" placeholder="" type="text" class="form-control" name="agent_douane_description" value="{{ old('agent_douane_description') }}">
						</div>
						
						<div class="col-md-4">
							<span> Mail<span class="text text-danger"></span></span>
							<input style="padding-top:0px;" placeholder="" type="text" class="form-control" name="agent_douane_description" value="{{ old('agent_douane_description') }}">
						</div>
						
					</div>

					<div class="col-md-12 row" style="margin-top:10px;">	
						
						<div class="col-md-4">
						</div>
						
						<div class="col-md-4">
						</div>
						
						<div class="col-md-4">
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
	<header class="panel-heading"> Liste des agent_douanes
		<!--div class="actions pull-right" style="padding:0px;"> 
			<a class="btn btn-sm btn-info" href="{{route('agent_douanes')}}" style="padding:2px 10px;"><i class="fa fa-plus"></i> Nouveau</a>
		</div-->
	</header> 
	
	<div class="table-responsive"> 
		<table id="table_courriers" class="table table-striped m-b-none datatable "> 
			<thead> 
				<tr>
					<th width=""></th>
					<th width=""></th>
					<th width="">Image</th>
					<th width="">Nom</th>
					<th width="">Prix</th>
					<th width="">Date création</th>
					<th width="">Action</th>
				</tr> 
			</thead> 
			<tbody>
			@foreach($agent_douanes as $agent_douane)
				<tr>
					<td><a href="{{route('DetailsAgent_douane',$agent_douane->agent_douane_id)}}"><i class="fa fa-cogs text-info" title="Afficher les détails"></i></a></td> 
					<td><span class="btnModifierAgent_douane" data-agent_douane_id="{{$agent_douane->agent_douane_id}}" style="cursor: pointer;"><i class="fa fa-edit text-warning" title="Modifier"></i></span></td> 
					<td><img src="{{asset('images/agent_douanes/'.$agent_douane->agent_douane_photo) }}" style="width:50px;height:auto;"/></td> 
					<td>{{ $agent_douane->agent_douane_nom }}</td>
					<td style="text-align: right;">{{ number_format($agent_douane->agent_douane_prix, 0, '', ' ') }}</td>
					<td>{{ Stdfn::dateFromDB($agent_douane->agent_douane_date_creation) }}</td>
					<td><span class="btnSupprimerAgent_douane" data-agent_douane_id="{{$agent_douane->agent_douane_id}}" style="cursor: pointer;"><i class="fa fa-times text-danger" title="Supprimer ce agent_douane"></i></a></td> 
				</tr>	
			@endforeach
			</tbody> 
		</table> 
	</div> 
</section>

@endsection