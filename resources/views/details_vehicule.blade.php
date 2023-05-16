@extends('layouts.app')


@section('content')
@if(!empty($vehicule))
<ul class="breadcrumb no-border no-radius b-b b-light pull-in"> 
	<li><a href="{{ route('home') }}"><i class="fa fa-home"></i> Accueil</a></li> 
	<!--li><a href="{{ route('vehicules') }}">Véhicules</a></li--> 
	<li class="active">Véhicule {{ $vehicule->vehicule_code }}</li> 
</ul> 

<div class="m-b-md"> 
	<h3 class="m-b-none">Véhicule {{ $vehicule->vehicule_code }}</h3>
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
							<small style="color:white;">Informations sur le vehicule</small>
							<i class="fa fa-circle text-white pull-right text-xs m-t-sm"></i> 
							</div>  
							</div> 
						</div> 
					</header---> 
					<div class="list-group no-radius alt"> 
						<div class="list-group-item"> 
							<span class="badge bg-light" style="background: none;">{{ $vehicule->vehicule_numero_immatriculation1 }}</span> 
							<i class="fa fa- icon-muted"></i> Numéro immatriculation
						</div> 
						<div class="list-group-item"> 
							<span class="badge bg-light" style="background: none;">{{ $vehicule->vehicule_numero_immatriculation2 }}</span> 
							<i class="fa fa- icon-muted"></i> Numéro immatriculation 2
						</div> 
						<span class="list-group-item"> 
							<span class="badge bg-light">{{ $vehicule->vehicule_code }}</span> 
							<i class="fa fa- icon-muted"></i> Code 
						</span>		
						<span class="list-group-item"> 
							<span class="badge bg-light">{{ $vehicule->vehicule_marque }}</span> 
							<i class="fa fa- icon-muted"></i> Marque
						</span>
						<span class="list-group-item"> 
							<span class="badge bg-light">{{ $vehicule->vehicule_nom_conducteur }}</span> 
							<i class="fa fa- icon-muted"></i> Nom du conducteur 
						</span>
						<div class="list-group-item"> 
							<span class="badge bg-light" style="background: none;">{{ $vehicule->vehicule_numero_chassis }}</span> 
							<i class="fa fa- icon-muted"></i> Numéro chassis
						</div> 
								
					</div> 
					
				</section>
			</div>
			
			<div class="col-sm-6"> 
				<section class="panel panel-default"> 
					<!--header class="panel-heading bg-info lt no-border title"> 
						<div class="clearfix"> 
							<div class="clear"> 
							<div class="h3 m-t-xs m-b-xs text-white">
							<small style="color:white;">Informations sur le vehicule</small>
							<i class="fa fa-circle text-white pull-right text-xs m-t-sm"></i> 
							</div>  
							</div> 
						</div> 
					</header---> 
					<div class="list-group no-radius alt"> 
						
						<span class="list-group-item"> 
							<span class="badge bg-light">{{ Stdfn::dateTimeFromDB($vehicule->vehicule_date_entree1) }}</span> 
							<i class="fa fa- icon-muted"></i> Date d'entrée au port
						</span>
						<span class="list-group-item"> 
							<span class="badge bg-light">{{ Stdfn::dateTimeFromDB($vehicule->vehicule_date_sortie1) }}</span> 
							<i class="fa fa- icon-muted"></i> Date sortie du port
						</span>
						<span class="list-group-item"> 
							<span class="badge bg-light">{{ Stdfn::dateTimeFromDB($vehicule->vehicule_date_entree2) }}</span> 
							<i class="fa fa- icon-muted"></i> Date d'entrée à l'OIC
						</span>
						<span class="list-group-item"> 
							<span class="badge bg-light">{{ Stdfn::dateTimeFromDB($vehicule->vehicule_date_sortie2) }}</span> 
							<i class="fa fa- icon-muted"></i> Date sortie de l'OIC
						</span>
						<span class="list-group-item"> 
							<span class="badge bg-light label-{{$vehicule->vehicule_statuts}}">{{ str_replace('1',' Port', str_replace('2',' OIC', $vehicule->vehicule_statuts))}}</span> 
							<i class="fa fa- icon-muted"></i> Status
						</span>
						
						@if($vehicule->vehicule_statuts == "entree1" && $vehicule->user_entree1)
						<span class="list-group-item">
							<span class="badge bg-light">{{ $vehicule->user_entree1->nom }} {{ $vehicule->user_entree1->prenoms }}</span> 
							<i class="fa fa- icon-muted"></i> Enregistré par
						</span>
						@endif
						@if($vehicule->vehicule_statuts == "sortie1" && $vehicule->user_sortie1)
						<span class="list-group-item"> 
							<span class="badge bg-light">{{ $vehicule->user_sortie1->nom }} {{ $vehicule->user_sortie1->prenoms }}</span> 
							<i class="fa fa- icon-muted"></i> Enregistré par
						</span>
						@endif
						@if($vehicule->vehicule_statuts == "entree2" && $vehicule->user_entree2)
						<span class="list-group-item"> 
							<span class="badge bg-light">{{ $vehicule->user_entree2->nom }} {{ $vehicule->user_entree2->prenoms }}</span> 
							<i class="fa fa- icon-muted"></i> Enregistré par
						</span>
						@endif
						@if($vehicule->vehicule_statuts == "sortie2" && $vehicule->user_sortie2)
						<span class="list-group-item"> 
							<span class="badge bg-light">{{ $vehicule->user_sortie2->nom }} {{ $vehicule->user_sortie2->prenoms }}</span> 
							<i class="fa fa- icon-muted"></i> Enregistré par
						</span>
						@endif
						
						<span class="list-group-item">
							@if(Auth::user()->profil_id == 3)
								<span class="bg-light"><span class="label btn-warning btnEntreeSortieVehicule" data-situation="sp1" data-vehicule_id="{{$vehicule->vehicule_id}}" style="cursor:pointer;" data-title="Véhicule sorti du poste 1" title="Indiquer que le véhicule est sorti du poste 1"><i class="fa fa-edit"></i> Véhicule sorti du port</span></span> 
							@endif
							@if(Auth::user()->profil_id == 4)
								<span class="bg-light"><span class="label btn-success btnEntreeSortieVehicule" data-situation="ep2" data-vehicule_id="{{$vehicule->vehicule_id}}" style="cursor:pointer;" data-title="Véhicule est entré au poste 2" title="Indiquer que le véhicule est entré au poste 2"><i class="fa fa-edit"></i> Véhicule entré à l'OIC</span></span> 
							@endif
							@if(Auth::user()->profil_id == 5)
								<span class="bg-light"><span class="label btn-danger btnEntreeSortieVehicule" data-situation="sp2" data-vehicule_id="{{$vehicule->vehicule_id}}" style="cursor:pointer;" data-title="Véhicule sorti du poste 2" title="Indiquer que le véhicule est sorti du poste 2"><i class="fa fa-edit"></i> Véhicule sorti de l'OIC</span></span> 
							@endif
						</span>
						
					</div> 
					
				</section>
			</div>
			
			
		</div> 
		</div> 
		
		<br style="clear:both;"/>	
</div>

		</div>
		
	</div>

		</div>

	</div>


@else

<ul class="breadcrumb no-border no-radius b-b b-light pull-in"> 
	<li><a href="{{ route('home') }}"><i class="fa fa-home"></i> Accueil</a></li> 
	<li><a href="{{ route('vehicules') }}">Vehicules</a></li> 
</ul> 

<div class="m-b-md"> 
	<h3 class="m-b-none">Vehicule introuvable</h3> 
</div>

<div class="panel"> 

	<div class="col-lg-12" style="padding:15px;"> 
		La vehicule que vous recherchez n'a pas été trouvé!
	</div> 
	
	<br style="clear:both;"/>
	
</div>	

@endif

@endsection