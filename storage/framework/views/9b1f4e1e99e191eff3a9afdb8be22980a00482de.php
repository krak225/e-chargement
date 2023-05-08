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
	<h3 class="m-b-none">Véhicules sous pénalité au poste 2</h3> 
</div>

<section class="panel panel-default"> 
	<header class="panel-heading"> Liste des véhicules sous pénalité au poste 2
	</header> 
	
	<div class="table-responsive"> 
		<table id="table_courriers" class="table table-striped m-b-none datatable "> 
			<thead> 
				<tr>
					<th colspan="" width="">Action</th>
					<th width="">Marque</th>
					<th width="">N° chassis</th>
					<th width="">Immat 1</th>
					<th width="">N° déclaration</th>
					<th width="">Date entrée</th>
					<th width="">Date sortie</th>
					<th width="">Retard</th>
				</tr> 
			</thead> 
			<tbody>
			<?php $__currentLoopData = $vehicules; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $vehicule): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
				<tr>
					<td><a href="<?php echo e(route('DetailsVehicule',$vehicule->vehicule_id)); ?>"><i class="fa fa-cogs text-info" title="Afficher les détails"></i></a>&nbsp;&nbsp;
					</td>
					<td><?php echo e($vehicule->vehicule_marque); ?></td>
					<td><?php echo e($vehicule->vehicule_numero_chassis); ?></td>
					<td><?php echo e($vehicule->vehicule_immatriculation1); ?></td>
					<td><?php echo e($vehicule->vehicule_numero_declaration); ?></td>
					<td><?php echo e(Stdfn::dateFromDB($vehicule->vehicule_date_entree2)); ?></td>
					<td><?php echo e(Stdfn::dateFromDB($vehicule->vehicule_date_sortie2)); ?></td>
					<td><?php echo e($vehicule->RETARD); ?> jours</td>
				</tr>	
			<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
			</tbody> 
		</table> 
	</div> 
</section>

<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.app', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>