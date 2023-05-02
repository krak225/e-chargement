@extends('layouts.app')

@section('content')

	<ul class="breadcrumb no-border no-radius b-b b-light pull-in"> 
	<li class="active"><i class="fa fa-home"></i> Accueil</li>
	</ul> 
	<div class="m-b-md"> 
	<h3 class="m-b-none">TABLEAU DE BORD</h3>
	</div> 
	<section class="panel panel-default"> 
	
		<div class="row m-l-none m-r-none bg-light lter"> 
		
			<div class="col-sm-8 col-md-4 padder-v b-r b-light"> 
				<span class="fa-stack fa-2x pull-left m-r-sm"> 
					<i class="fa fa-circle fa-stack-2x text-info"></i> 
					<i class="fa fa-clock-o fa-stack-1x text-white"></i> 
				</span> 
				<a class="clear" href="{{ route('vehicules') }}"> 
					<span class="h3 block m-t-xs"><strong>VÉHICULES</strong></span> 
					<small class="text-muted text-uc">Gestion des véhicules</small> 
				</a> 
			</div>
			
			<div class="col-sm-8 col-md-4 padder-v b-r b-light"> 
				<span class="fa-stack fa-2x pull-left m-r-sm"> 
					<i class="fa fa-circle fa-stack-2x text-info"></i> 
					<i class="fa fa-clock-o fa-stack-1x text-white"></i> 
				</span> 
				<a class="clear" href="{{ route('declarations') }}"> 
					<span class="h3 block m-t-xs"><strong>DÉCLARATIONS</strong></span> 
					<small class="text-muted text-uc">Gestion des déclarations</small> 
				</a> 
			</div>
				
			<div class="col-sm-8 col-md-4 padder-v b-r b-light"> 
				<span class="fa-stack fa-2x pull-left m-r-sm"> 
					<i class="fa fa-circle fa-stack-2x text-info"></i> 
					<i class="fa fa-clock-o fa-stack-1x text-white"></i> 
				</span> 
				<a class="clear" href="{{ route('declarants') }}"> 
					<span class="h3 block m-t-xs"><strong>DÉCLARANTS</strong></span> 
					<small class="text-muted text-uc">Gestion des déclarants</small> 
				</a> 
			</div>
				
		</div> 
		
	</section> 
	<section class="panel panel-default"> 
			
		<div class="row m-l-none m-r-none bg-light lter"> 
			
			<div class="col-sm-8 col-md-4 padder-v b-r b-light"> 
				<span class="fa-stack fa-2x pull-left m-r-sm"> 
					<i class="fa fa-circle fa-stack-2x text-info"></i> 
					<i class="fa fa-clock-o fa-stack-1x text-white"></i> 
				</span> 
				<a class="clear" href="{{ route('chargements') }}"> 
					<span class="h3 block m-t-xs"><strong>CHARGEMENTS</strong></span> 
					<small class="text-muted text-uc">Suivi des chargements</small> 
				</a> 
			</div>
			
			<div class="col-sm-8 col-md-4 padder-v b-r b-light"> 
				<span class="fa-stack fa-2x pull-left m-r-sm"> 
					<i class="fa fa-circle fa-stack-2x text-warning"></i> 
					<i class="fa fa-product fa-stack-1x text-white"></i> 
				</span>
				<a class="clear" href="{{ route('empotages') }}"> 
					<span class="h3 block m-t-xs"><strong>EMPOTAGES</strong></span> 
					<small class="text-muted text-uc">Gestion de empotages</small> 
				</a> 
			</div>
			
			<div class="col-sm-8 col-md-4 padder-v b-r b-light"> 
				<span class="fa-stack fa-2x pull-left m-r-sm"> 
					<i class="fa fa-circle fa-stack-2x text-success"></i> 
					<i class="fa fa-money fa-stack-1x text-white"></i> 
				</span>
				<a class="clear" href="{{ route('categories') }}"> 
					<span class="h3 block m-t-xs"><strong>ENTRÉE/SORTIE</strong></span> 
					<small class="text-muted text-uc">Gestion des entrée/sortie</small> 
				</a> 
			</div> 
			
		</div> 
		
	</section> 
	
	<section style="min-height:300px;"> 
	</section> 
	

@endsection
