<?php $__env->startSection('content'); ?>
<?php if(!empty($vehicule)): ?>
<ul class="breadcrumb no-border no-radius b-b b-light pull-in"> 
	<li><a href="<?php echo e(route('home')); ?>"><i class="fa fa-home"></i> Accueil</a></li> 
	<li><a href="<?php echo e(route('vehicules')); ?>">Véhicules</a></li> 
	<li class="active">Véhicule <?php echo e($vehicule->vehicule_code); ?></li> 
</ul> 

<div class="m-b-md"> 
	<h3 class="m-b-none">Véhicule <?php echo e($vehicule->vehicule_code); ?></h3>
</div>

<?php if(Session::has('warning')): ?>
	<div class="alert alert-warning">
	  <?php echo e(Session::get('warning')); ?>

	</div>
<?php endif; ?>

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
						<span class="list-group-item"> 
							<span class="badge bg-light"><?php echo e($vehicule->vehicule_code); ?></span> 
							<i class="fa fa- icon-muted"></i> Code 
						</span>		
						<span class="list-group-item"> 
							<span class="badge bg-light"><?php echo e($vehicule->vehicule_marque); ?></span> 
							<i class="fa fa- icon-muted"></i> Marque
						</span>
						<span class="list-group-item"> 
							<span class="badge bg-light"><?php echo e($vehicule->vehicule_nom_conducteur); ?></span> 
							<i class="fa fa- icon-muted"></i> Nom du conducteur 
						</span>
						<div class="list-group-item"> 
							<span class="badge bg-light" style="background: none;"><?php echo e($vehicule->vehicule_numero_chassis); ?></span> 
							<i class="fa fa- icon-muted"></i> Numéro chassis
						</div> 
						<div class="list-group-item"> 
							<span class="badge bg-light" style="background: none;"><?php echo e($vehicule->vehicule_numero_immatriculation1); ?></span> 
							<i class="fa fa- icon-muted"></i> Numéro immatriculation
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
							<span class="badge bg-light"><?php echo e(Stdfn::dateTimeFromDB($vehicule->vehicule_date_creation_entree1)); ?></span> 
							<i class="fa fa- icon-muted"></i> Date d'entrée 1
						</span>
						<span class="list-group-item"> 
							<span class="badge bg-light"><?php echo e(Stdfn::dateTimeFromDB($vehicule->vehicule_date_creation_sortie1)); ?></span> 
							<i class="fa fa- icon-muted"></i> Date sortie 1
						</span>
						<span class="list-group-item"> 
							<span class="badge bg-light"><?php echo e(Stdfn::dateTimeFromDB($vehicule->vehicule_date_creation_entree2)); ?></span> 
							<i class="fa fa- icon-muted"></i> Date d'entrée 2
						</span>
						<span class="list-group-item"> 
							<span class="badge bg-light"><?php echo e(Stdfn::dateTimeFromDB($vehicule->vehicule_date_creation_sortie2)); ?></span> 
							<i class="fa fa- icon-muted"></i> Date sortie 2
						</span>
						<span class="list-group-item"> 
							<span class="badge bg-light"><?php echo e($vehicule->vehicule_statuts); ?></span> 
							<i class="fa fa- icon-muted"></i> Status
						</span>
						
						<span class="list-group-item"> 
							<span class="badge bg-light"><?php echo e($vehicule->vehicule_user_entree1); ?></span> 
							<i class="fa fa- icon-muted"></i> Enregistré par
						</span>
						
						<span class="list-group-item"> 
							<?php if(Auth::user()->profil_id == 3): ?>	
								<span class="bg-light"><span class="label btn-warning btnEntreeSortieVehicule" data-situation="SortiePoste1" style="cursor:pointer;" title="Indiquer que le véhicule est sorti du poste 1"><i class="fa fa-edit"></i> Véhicule sorti</span></span> 
							<?php endif; ?>
							<?php if(Auth::user()->profil_id == 4): ?>	
								<span class="bg-light"><span class="label btn-success btnEntreeSortieVehicule" data-situation="btnEntrePoste2" style="cursor:pointer;" title="Indiquer que le véhicule est sorti du poste 2"><i class="fa fa-edit"></i> Véhicule entré</span></span> 
							<?php endif; ?>	
							<?php if(Auth::user()->profil_id == 5): ?>
								<span class="bg-light"><span class="label btn-danger btnEntreeSortieVehicule" data-situation="SortiePoste2" style="cursor:pointer;" title="Indiquer que le véhicule est sorti du poste 2"><i class="fa fa-edit"></i> Véhicule sorti</span></span> 
							<?php endif; ?>
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


<?php else: ?>

<ul class="breadcrumb no-border no-radius b-b b-light pull-in"> 
	<li><a href="<?php echo e(route('home')); ?>"><i class="fa fa-home"></i> Accueil</a></li> 
	<li><a href="<?php echo e(route('vehicules')); ?>">Vehicules</a></li> 
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

<?php endif; ?>

<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.app', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>