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
							<span> N° de la declaration <span class="text text-danger">*</span></span>
							<input placeholder="" type="text" class="form-control" name="declaration_numero"  value="{{ old('declaration_numero') }}" required>
						</div>
						
						<div class="col-md-3">
							<span> Description<span class="text text-danger"></span></span>
							<input style="padding-top:0px;" placeholder="" type="text" class="form-control" name="declaration_numero" value="{{ old('declaration_numero') }}">
						</div>
						
						<div class="col-md-3">
							<span> Regime<span class="text text-danger">*</span></span>
							<input style="padding-top:0px;" placeholder="" type="text" class="form-control" name="declaration_numero" value="{{ old('declaration_numero') }}">
						</div>

						<div class="col-md-3">
							<span> Description<span class="text text-danger"></span></span>
							<input style="padding-top:0px;" placeholder="" type="text" class="form-control" name="declaration_numero" value="{{ old('declaration_numero') }}">
						</div>

					</div>
					
					<div class="col-md-12 row" style="margin-top:10px;">	
						
						<!--div class="col-md-5">
							<span> Photo<span class="text text-danger">*</span></span>
							<input style="padding-top:0px;" placeholder="" type="file" class="form-control" name="produit_photo" required>
							
						</div-->
						
						<div class="col-md-3 form-group{{ $errors->has('regime') ? ' has-error' : '' }}">
							<label for="regime_id" class="col-md-12">Regime <span class="text text-danger">*</span></label>

							<div class="col-md-12">
								<select id="regime_id" class="form-control" name="regime_id" required>
									<option>Saisir le code pour filtrer</option>
									@foreach($regimes as $regime)
									<option value="{{ $regime->regime_id }}">{{ $regime->regime_numero }}</option>
									@endforeach
								</select>

								@if ($errors->has('regime_id'))
									<span class="help-block">
										<strong>{{ $errors->first('regime_id') }}</strong>
									</span>
								@endif
							</div>
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