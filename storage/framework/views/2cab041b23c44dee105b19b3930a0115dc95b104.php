<?php $__env->startSection('content'); ?>

<ul class="breadcrumb no-border no-radius b-b b-light pull-in"> 
	<li><a href="<?php echo e(route('home')); ?>"><i class="fa fa-home"></i> Accueil</a></li>
	<li class="active">Expediteurs</li> 
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
	<h3 class="m-b-none">Gestion des expediteurs</h3> 
</div>


<div class="panel panel-default"> 

	<div class="wizard-steps clearfix" id="form-wizard"> 
		<ul class="steps"> 
			<li data-target="#step3" class="active"><span class="badge"><i class="fa fa-plus" ></i></span>Nouveau expediteur</li>
		</ul> 
	</div> 

	<div class="step-content clearfix"> 
		<form method="post" action="<?php echo e(route('SaveExpediteur')); ?>" enctype="multipart/form-data" class="form-horizontal">
			
			<?php echo csrf_field(); ?>

			
			<div class="step-pane active" id="step1"> 
			
				<div class="form-group<?php echo e($errors->has('expediteur_nom') ? ' has-error' : ''); ?>">
					
					<div class="col-md-12 row">
						
						<div class="col-md-3">
							<span> Nom expéditeur <span class="text text-danger">*</span></span>
							<input placeholder="" type="text" class="form-control" name="declarant_nom"  value="<?php echo e(old('declarant_nom')); ?>" required>
						</div>
						
						<div class="col-md-3">
							<span> Adresse<span class="text text-danger"></span></span>
							<input style="padding-top:0px;" placeholder="" type="text" class="form-control" name="declarant_description" value="<?php echo e(old('declarant_description')); ?>">
						</div>
						
						<div class="col-md-3">
							<span> Mail<span class="text text-danger"></span></span>
							<input style="padding-top:0px;" placeholder="" type="text" class="form-control" name="declarant_description" value="<?php echo e(old('declarant_description')); ?>">
						</div>

						<div class="col-md-3">
							<span> Téléphone<span class="text text-danger"></span></span>
							<input style="padding-top:0px;" placeholder="" type="text" class="form-control" name="declarant_description" value="<?php echo e(old('declarant_description')); ?>">
						</div>

					</div>
					
					<div class="col-md-12 row" style="margin-top:10px;">	
						
					<div class="col-md-3">
						</div>
						
						<div class="col-md-3">
						</div>
						
						<div class="col-md-3">
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
	<header class="panel-heading"> Liste des expediteurs
		<!--div class="actions pull-right" style="padding:0px;"> 
			<a class="btn btn-sm btn-info" href="<?php echo e(route('expediteurs')); ?>" style="padding:2px 10px;"><i class="fa fa-plus"></i> Nouveau</a>
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
			<?php $__currentLoopData = $expediteurs; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $expediteur): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
				<tr>
					<td><a href="<?php echo e(route('DetailsExpediteur',$expediteur->expediteur_id)); ?>"><i class="fa fa-cogs text-info" title="Afficher les détails"></i></a></td> 
					<td><span class="btnModifierExpediteur" data-expediteur_id="<?php echo e($expediteur->expediteur_id); ?>" style="cursor: pointer;"><i class="fa fa-edit text-warning" title="Modifier"></i></span></td> 
					<td><img src="<?php echo e(asset('images/expediteurs/'.$expediteur->expediteur_photo)); ?>" style="width:50px;height:auto;"/></td> 
					<td><?php echo e($expediteur->expediteur_nom); ?></td>
					<td style="text-align: right;"><?php echo e(number_format($expediteur->expediteur_prix, 0, '', ' ')); ?></td>
					<td><?php echo e(Stdfn::dateFromDB($expediteur->expediteur_date_creation)); ?></td>
					<td><span class="btnSupprimerExpediteur" data-expediteur_id="<?php echo e($expediteur->expediteur_id); ?>" style="cursor: pointer;"><i class="fa fa-times text-danger" title="Supprimer ce expediteur"></i></a></td> 
				</tr>	
			<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
			</tbody> 
		</table> 
	</div> 
</section>

<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.app', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>