<div class="panel panel-default"> 

	<div class="step-content clearfix"> 
	
		<form id="formSortieVehicule" method="post" action="<?php echo e(route('SaveSortieVehicule', $vehicule->vehicule_id)); ?>" enctype="multipart/form-data" class="form-horizontal">
		
			<?php echo csrf_field(); ?>

			<input type="hidden" name="situation" value="<?php echo e($situation); ?>" />	

			<div class="step-pane active" id="step1"> 
			
				<div class="form-group">
					
					<div class="col-md-12 row">
						
						<div class="col-md-12">
							<span> Date <span class="text text-danger">*</span></span>
							<input placeholder="" type="date" class="form-control" name="date_entree_sortie" value="<?php echo e($date_du_jour); ?>" readonly0 required>
						</div>
						
					</div>
					
				</div>

				
			</div> 
			
		</form>
		
		 
	
	</div>
	
	
</div>
