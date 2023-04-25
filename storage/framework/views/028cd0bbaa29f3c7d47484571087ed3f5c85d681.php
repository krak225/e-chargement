<?php $__env->startSection('content'); ?>
<ul class="breadcrumb no-border no-radius b-b b-light pull-in"> 
	<li><a href="<?php echo e(route('home')); ?>"><i class="fa fa-home"></i> Accueil</a></li> 
	<li><a href="<?php echo e(route('utilisateurs')); ?>"><i class="fa fa-users"></i> Utilisateurs</a></li> 
	<li class="active">Modification de compte utilisateur</li> 
</ul> 

<div class="m-b-md"> 
	<h3 class="m-b-none">Modification d'un compte utilisateur</h3> 
</div>

<?php if(Session::has('message')): ?>
	<div class="alert alert-success">
	  <?php echo e(Session::get('message')); ?>

	</div>
<?php endif; ?>

<?php if(Session::has('warning')): ?>
	<div class="alert alert-warning">
	  <?php echo e(Session::get('warning')); ?>

	</div>
<?php endif; ?>


<div class="panel panel-default"> 

	<div class="wizard-steps clearfix" id="form-wizard"> 
		<ul class="steps"> 
			<li data-target="#step3"><span class="badge"></span>Informations</li>
		</ul> 
	</div> 

	<div class="step-content clearfix"> 
		<form enctype="multipart/form-data"  method="post" class="form-horizontal" action="<?php echo e(route('ModifierUtilisateur',$user->id)); ?>">
			
			<?php echo csrf_field(); ?>

			
			<div class="step-pane active" id="step1"> 
					
				<div class="form-group">
					<label for="login" class="col-md-4 control-label">Login</label>

					<div class="col-md-4">
						<input type="text" disabled class="form-control" value="<?php echo e($user->email); ?>">
						
					</div>
				</div>

				<div class="form-group<?php echo e($errors->has('nom') ? ' has-error' : ''); ?>">
					<label for="nom" class="col-md-4 control-label">Nom</label>

					<div class="col-md-4">
						<input id="nom" type="text" class="form-control" name="nom" value="<?php echo e($user->nom); ?>" required autofocus>

						<?php if($errors->has('nom')): ?>
							<span class="help-block">
								<strong><?php echo e($errors->first('nom')); ?></strong>
							</span>
						<?php endif; ?>
					</div>
				</div>

				<div class="form-group<?php echo e($errors->has('prenoms') ? ' has-error' : ''); ?>">
					<label for="prenoms" class="col-md-4 control-label">Prénoms</label>

					<div class="col-md-4">
						<input id="prenoms" type="text" class="form-control" name="prenoms" value="<?php echo e($user->prenoms); ?>" required>

						<?php if($errors->has('prenoms')): ?>
							<span class="help-block">
								<strong><?php echo e($errors->first('prenoms')); ?></strong>
							</span>
						<?php endif; ?>
					</div>
				</div>

				
				<div class="form-group<?php echo e($errors->has('profil_id') ? ' has-error' : ''); ?>">
					<label for="profil_id" class="col-md-4 control-label">Profil <span class="text text-danger">&nbsp;<span></label>

					<div class="col-md-4">
						
						<select disabled id="profil_id" class="form-control" name="profil_id"required>
							<option></option>
							<?php $__currentLoopData = $profils; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $profil): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
							<?php if($user->profil_id == $profil->profil_id): ?>{ 
								<?php $selected = ' selected '; ?>
							<?php else: ?>
								<?php $selected = '  '; ?>
							<?php endif; ?>
							<option <?php echo e($selected); ?> value="<?php echo e($profil->profil_id); ?>"><?php echo e($profil->profil_libelle); ?></option>
							<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
						</select>
						<?php if($errors->has('profil_id')): ?>
							<span class="help-block">
								<strong><?php echo e($errors->first('profil_id')); ?></strong>
							</span>
						<?php endif; ?>
					</div>
				</div>
				
				
				
				<div class="form-group<?php echo e($errors->has('telephone') ? ' has-error' : ''); ?>">
					<label for="telephone" class="col-md-4 control-label">Téléphone mobile</label>

					<div class="col-md-4">
						<input id="telephone" type="text" class="form-control" name="telephone" value="<?php echo e($user->telephone); ?>" >

						<?php if($errors->has('telephone')): ?>
							<span class="help-block">
								<strong><?php echo e($errors->first('telephone')); ?></strong>
							</span>
						<?php endif; ?>
					</div>
				</div>
				
				
				<div class="form-group">
					<label for="option_modifier_motdepasse" class="col-md-4 control-label">Modifier le mot de passe</label>

					<div class="col-md-4">
						<input type="checkbox" id="checkbox_option_modifier_motdepasse" name="option_modifier_motdepasse" value="1"> 
					</div>
				</div>
				
				<div id="box_motdepasse" style="display:none;">
					
					<div class="form-group<?php echo e($errors->has('password') ? ' has-error' : ''); ?>">
						<label for="password" class="col-md-4 control-label">Mot de passe</label>

						<div class="col-md-4">
							<input id="password" type="password" class="form-control" name="password">

							<?php if($errors->has('password')): ?>
								<span class="help-block">
									<strong><?php echo e($errors->first('password')); ?></strong>
								</span>
							<?php endif; ?>
						</div>
					</div>
					
					<div class="form-group">
						<label for="password-confirm" class="col-md-4 control-label">Confirmer mot de passe</label>

						<div class="col-md-4">
							<input id="password-confirm" type="password" class="form-control" name="password_confirmation" >
							<?php if($errors->has('password')): ?>
								<span class="help-block">
									<strong><?php echo e($errors->first('password')); ?></strong>
								</span>
							<?php endif; ?>
						</div>
						
					</div>
				</div>
				
				
			</div> 
			
			
			<div class="line line-lg pull-in"></div>
			
			<div class="actions pull-right"> 
				<button type="reset" class="btn btn-warning btn-sm">Annuler</button> 
				<button type="submit" class="btn btn-primary btn-sm">ENREGISTRER LES MODIFICATIONS</button> 
			</div>
			
		</form>
		
		 
	
	</div>
	
	
	
	
	
</div>
 
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.app', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>