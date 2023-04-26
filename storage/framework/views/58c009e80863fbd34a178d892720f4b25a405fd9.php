<?php $__env->startSection('content'); ?>

<ul class="breadcrumb no-border no-radius b-b b-light pull-in"> 
	<li><a href="<?php echo e(route('home')); ?>"><i class="fa fa-home"></i> Accueil</a></li>
	<li class="active">Vehicules</li> 
</ul> 


<?php if(Session::has('warning')): ?>
	<div class="alert alert-warning">
	  <?php echo e(Session::get('warning')); ?>

	</div>
<?php endif; ?>

<?php if(Session::has('message')): ?>
	<div class="alert alert-success">
	  <?php echo e(Session::get('message')); ?>

	</div>
<?php endif; ?>

<?php if(count($errors) > 0): ?>
    <div class="alert alert-danger">
        <ul style="padding-left: 5px;">
            <?php $__currentLoopData = $errors->all(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $error): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <li><?php echo e($error); ?></li>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </ul>
    </div>
<?php endif; ?>

<div class="m-b-md"> 
	<h3 class="m-b-none">Gestion des véhicules</h3> 
</div>


<div class="panel panel-default"> 

	<div class="wizard-steps clearfix" id="form-wizard"> 
		<ul class="steps"> 
			<li data-target="#step3" class="active"><span class="badge"><i class="fa fa-plus" ></i></span>Nouveau vehicule</li>
		</ul> 
	</div> 

	<div class="step-content clearfix"> 
		<form method="post" action="<?php echo e(route('SaveVehicule')); ?>" enctype="multipart/form-data" class="form-horizontal">
			
			<?php echo csrf_field(); ?>

			
			<div class="step-pane active" id="step1"> 
			
				<div class="form-group<?php echo e($errors->has('vehicule_numero_chassis') ? ' has-error' : ''); ?>">
					
					<div class="col-md-12 row">
						
						<div class="col-md-4">
							<span> Marque <span class="text text-danger"></span></span>
							<input placeholder="" type="text" class="form-control" name="vehicule_marque"  value="<?php echo e(old('vehicule_marque')); ?>" required>
						</div>
						
						<div class="col-md-4">
							<span> Numéro chassis<span class="text text-danger">*</span></span>
							<input style="padding-top:0px;" placeholder="" type="text" class="form-control" name="vehicule_numero_chassis" value="<?php echo e(old('vehicule_numero_chassis')); ?>">
						</div>
						
						<div class="col-md-4">
							<span> NImmatriculation 1<span class="text text-danger">*</span></span>
							<input style="padding-top:0px;" placeholder="" type="text" class="form-control" name="vehicule_immatriculation1" value="<?php echo e(old('vehicule_immatriculation1')); ?>">
						</div>

					</div>
					
					<div class="col-md-12 row" style="margin-top:10px;">	
						
						<div class="col-md-4">
							<span> Immatriculation 2<span class="text text-danger">*</span></span>
							<input style="padding-top:0px;" placeholder="" type="text" class="form-control" name="vehicule_immatriculation2" value="<?php echo e(old('vehicule_immatriculation2')); ?>">
						</div>
						
						<div class="col-md-4">
							<span> Numéro LDC<span class="text text-danger"></span></span>
							<input style="padding-top:0px;" placeholder="" type="text" class="form-control" name="vehicule_numero_ldc" value="<?php echo e(old('vehicule_numero_ldc')); ?>">
						</div>

						<div class="col-md-4">
							<span> Numéro déclaration<span class="text text-danger">*</span></span>
							<input style="padding-top:0px;" placeholder="" type="text" class="form-control" name="vehicule_numero_declaration" value="<?php echo e(old('vehicule_numero_declaration')); ?>">
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


<section class="panel panel-default"> 
	<header class="panel-heading"> Liste des vehicules
		<!--div class="actions pull-right" style="padding:0px;"> 
			<a class="btn btn-sm btn-info" href="<?php echo e(route('vehicules')); ?>" style="padding:2px 10px;"><i class="fa fa-plus"></i> Nouveau</a>
		</div-->
	</header> 
	
	<div class="table-responsive"> 
		<table id="table_courriers" class="table table-striped m-b-none datatable "> 
			<thead> 
				<tr>
					<th width="">Marque</th>
					<th width="">N° chassis</th>
					<th width="">Immat 1</th>
					<th width="">Immat 2</th>
					<th width="">N° déclaration</th>
					<th colspan="" width="">Action</th>
				</tr> 
			</thead> 
			<tbody>
			<?php $__currentLoopData = $vehicules; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $vehicule): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
				<tr>
					<td><?php echo e($vehicule->vehicule_marque); ?></td>
					<td><?php echo e($vehicule->vehicule_numero_chassis); ?></td>
					<td><?php echo e($vehicule->vehicule_immatriculation1); ?></td>
					<td><?php echo e($vehicule->vehicule_immatriculation2); ?></td>
					<td><?php echo e($vehicule->vehicule_numero_declaration); ?></td>
					<td><a href="<?php echo e(route('DetailsVehicule',$vehicule->vehicule_id)); ?>"><i class="fa fa-cogs text-info" title="Afficher les détails"></i></a>&nbsp;&nbsp;
					<span class="btnModifierVehicule" data-vehicule_id="<?php echo e($vehicule->vehicule_id); ?>" style="cursor: pointer;"><i class="fa fa-edit text-warning" title="Modifier"></i></span>&nbsp;&nbsp;
					<span class="btnSupprimerVehicule" data-vehicule_id="<?php echo e($vehicule->vehicule_id); ?>" style="cursor: pointer;"><i class="fa fa-times text-danger" title="Supprimer ce vehicule"></i></a></td> 
				</tr>	
			<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
			</tbody> 
		</table> 
	</div> 
</section>

<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.app', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>