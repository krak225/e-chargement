<?php $__env->startSection('content'); ?>

<ul class="breadcrumb no-border no-radius b-b b-light pull-in"> 
	<li><a href="<?php echo e(route('home')); ?>"><i class="fa fa-home"></i> Accueil</a></li>
	<li class="active">Declarations</li> 
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
	<h3 class="m-b-none">Gestion des declarations</h3> 
</div>


<div class="panel panel-default"> 

	<div class="wizard-steps clearfix" id="form-wizard"> 
		<ul class="steps"> 
			<li data-target="#step3" class="active"><span class="badge"><i class="fa fa-plus" ></i></span>Nouvelle declaration</li>
		</ul> 
	</div> 

	<div class="step-content clearfix"> 
		<form method="post" action="<?php echo e(route('SaveDeclaration')); ?>" enctype="multipart/form-data" class="form-horizontal">
			
			<?php echo csrf_field(); ?>

			
			<div class="step-pane active" id="step1"> 
			
				<div class="form-group<?php echo e($errors->has('declaration_numero') ? ' has-error' : ''); ?>">
					
					<div class="col-md-12 row">
						
						<div class="col-md-3">
							<span> N° déclaration <span class="text text-danger">*</span></span>
							<input placeholder="" type="text" class="form-control" name="declaration_numero"  value="<?php echo e(old('declaration_numero')); ?>" required>
						</div>
						
						<div class="col-md-3">
							<span> Date prise en compte douane <span class="text text-danger">*</span></span>
							<input placeholder="" type="date" class="form-control" name="declaration_date_prise_compte"  value="<?php echo e(old('declaration_date_prise_compte')); ?>" required>
						</div>
						
						<div class="col-md-3">
							<span> Date déclaration <span class="text text-danger">*</span></span>
							<input placeholder="" type="date" class="form-control" name="declaration_date"  value="<?php echo e(old('declaration_date')); ?>" required>
						</div>

						<div class="col-md-3">
							<span> Date fin <span class="text text-danger">*</span></span>
							<input placeholder="" type="date" class="form-control" name="declaration_date_fin"  value="<?php echo e(old('declaration_date_fin')); ?>" required>
						</div>
					</div>
					
					<div class="col-md-12 row" style="margin-top:10px;">	
						
						<div class="col-md-3 form-group<?php echo e($errors->has('regime') ? ' has-error' : ''); ?>">
							<label for="regime_id" class="col-md-12">Régime <span class="text text-danger">*</span></label>

							<div class="col-md-12">
								<select id="regime_id" class="form-control" name="regime_id" required>
									<option>Choisir</option>
									<?php $__currentLoopData = $regimes; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $regime): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
									<option value="<?php echo e($regime->regime_id); ?>"><?php echo e($regime->regime_libelle); ?></option>
									<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
								</select>

								<?php if($errors->has('regime_id')): ?>
									<span class="help-block">
										<strong><?php echo e($errors->first('regime_id')); ?></strong>
									</span>
								<?php endif; ?>
							</div>
						</div>
						
						<div class="col-md-3 form-group<?php echo e($errors->has('declarant') ? ' has-error' : ''); ?>">
							<label for="declarant_id" class="col-md-12">Déclarant <span class="text text-danger">*</span></label>

							<div class="col-md-12">
								<select id="declarant_id" class="form-control" name="declarant_id" required>
									<option>Choisir</option>
									<?php $__currentLoopData = $declarants; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $declarant): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
									<option value="<?php echo e($declarant->declarant_id); ?>"><?php echo e($declarant->declarant_nom); ?></option>
									<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
								</select>

								<?php if($errors->has('declarant_id')): ?>
									<span class="help-block">
										<strong><?php echo e($errors->first('declarant_id')); ?></strong>
									</span>
								<?php endif; ?>
							</div>
						</div>

						<div class="col-md-3 form-group<?php echo e($errors->has('expediteur') ? ' has-error' : ''); ?>">
							<label for="expediteur_id" class="col-md-12">Expéditeur <span class="text text-danger">*</span></label>

							<div class="col-md-12">
								<select id="expediteur_id" class="form-control" name="expediteur_id" required>
									<option>Choisir</option>
									<?php $__currentLoopData = $expediteurs; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $expediteur): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
									<option value="<?php echo e($expediteur->expediteur_id); ?>"><?php echo e($expediteur->expediteur_nom); ?></option>
									<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
								</select>

								<?php if($errors->has('expediteur_id')): ?>
									<span class="help-block">
										<strong><?php echo e($errors->first('expediteur_id')); ?></strong>
									</span>
								<?php endif; ?>
							</div>
						</div>
			
						<div class="col-md-3 form-group<?php echo e($errors->has('destinataire') ? ' has-error' : ''); ?>">
							<label for="destinataire_id" class="col-md-12">Destinataire <span class="text text-danger">*</span></label>

							<div class="col-md-12">
								<select id="destinataire_id" class="form-control" name="destinataire_id" required>
									<option>Choisir</option>
									<?php $__currentLoopData = $destinataires; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $destinataire): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
									<option value="<?php echo e($destinataire->destinataire_id); ?>"><?php echo e($destinataire->destinataire_nom); ?></option>
									<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
								</select>

								<?php if($errors->has('destinataire_id')): ?>
									<span class="help-block">
										<strong><?php echo e($errors->first('destinataire_id')); ?></strong>
									</span>
								<?php endif; ?>
							</div>
						</div>
						
					</div>
					
					<div class="col-md-12 row" style="margin-top:10px;">	
						
					<div class="col-md-3 form-group<?php echo e($errors->has('pays') ? ' has-error' : ''); ?>">
							<label for="pays_id" class="col-md-12">Pays <span class="text text-danger">*</span></label>

							<div class="col-md-12">
								<select id="pays_id" class="form-control" name="pays_id" required>
									<option>Choisir</option>
									<?php $__currentLoopData = $payss; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $pays): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
									<option value="<?php echo e($pays->pays_id); ?>"><?php echo e($pays->pays_nom); ?></option>
									<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
								</select>

								<?php if($errors->has('pays_id')): ?>
									<span class="help-block">
										<strong><?php echo e($errors->first('pays_id')); ?></strong>
									</span>
								<?php endif; ?>
							</div>
						</div>
						
						<div class="col-md-3 form-group<?php echo e($errors->has('bureau_sortie') ? ' has-error' : ''); ?>">
							<label for="bureau_sortie_id" class="col-md-12">Bureau_sortie <span class="text text-danger">*</span></label>

							<div class="col-md-12">
								<select id="bureau_sortie_id" class="form-control" name="bureau_sortie_id" required>
									<option>Choisir</option>
									<?php $__currentLoopData = $bureau_sorties; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $bureau_sortie): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
									<option value="<?php echo e($bureau_sortie->bureau_sortie_id); ?>"><?php echo e($bureau_sortie->bureau_sortie_libelle); ?></option>
									<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
								</select>

								<?php if($errors->has('bureau_sortie_id')): ?>
									<span class="help-block">
										<strong><?php echo e($errors->first('bureau_sortie_id')); ?></strong>
									</span>
								<?php endif; ?>
							</div>
						</div>
			
						<div class="col-md-3 form-group<?php echo e($errors->has('moyen_transport') ? ' has-error' : ''); ?>">
							<label for="moyen_transport_id" class="col-md-12">Moyen transport <span class="text text-danger">*</span></label>

							<div class="col-md-12">
								<select id="moyen_transport_id" class="form-control" name="moyen_transport_id" required>
									<option>Choisir</option>
									<?php $__currentLoopData = $moyen_transports; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $moyen_transport): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
									<option value="<?php echo e($moyen_transport->moyen_transport_id); ?>"><?php echo e($moyen_transport->moyen_transport_libelle); ?></option>
									<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
								</select>

								<?php if($errors->has('moyen_transport_id')): ?>
									<span class="help-block">
										<strong><?php echo e($errors->first('moyen_transport_id')); ?></strong>
									</span>
								<?php endif; ?>
							</div>
						</div>

						<div class="col-md-3">
						</div>
					</div>

					<div class="col-md-12 row" style="margin-top:10px;">	
						
						<div class="col-md-3">	
						</div>
						
						<div class="col-md-3">	
						</div>
						
						<div class="col-md-3">
						</div>
			
						<div class="col-md-3">
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
			<a class="btn btn-sm btn-info" href="<?php echo e(route('produits')); ?>" style="padding:2px 10px;"><i class="fa fa-plus"></i> Nouveau</a>
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
			<?php $__currentLoopData = $declarations; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $declaration): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
				<tr>
					<td><a href="<?php echo e(route('details_declaration',$declaration->declaration_id)); ?>"><i class="fa fa-cogs text-info" title="Afficher les détails"></i></a></td> 
					<td><span class="btnModifierDeclaration" data-declaration_id="<?php echo e($declaration->declaration_id); ?>" style="cursor: pointer;"><i class="fa fa-edit text-warning" title="Modifier"></i></span></td> 
					<td><?php echo e($declaration->declaration_numero); ?></td>
					<td><?php echo e($declaration->declaration_numero); ?></td>
					<td><?php echo e(Stdfn::dateFromDB($declaration->declaration_date_creation)); ?></td>
					<td><span class="btnSupprimerDeclaration" data-produit_id="<?php echo e($declaration->declaration_id); ?>" style="cursor: pointer;"><i class="fa fa-times text-danger" title="Supprimer cette declaration"></i></a></td> 
				</tr>	
			<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
			</tbody> 
		</table> 
	</div> 
</section>

<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.app', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>