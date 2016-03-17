<?php echo $header; ?>
<div class="home-slider">
	<div class="container">
		<div class="row">
			<div class="col-md-9 col-sm-12 col-xs-12">
				<div class="banner-top">
					<div class="row">
						<div class="col-md-4 col-sm-4"></div>
						<div class="slider-home col-md-8 col-sm-12 col-xs-12"><?php echo $content_banner; ?></div>
					</div>
				</div>
				<div> <?php echo $content_block6; ?></div>
			</div>
			<div class="col-md-3 col-sm-12 col-xs-12">
				<?php echo $content_right; ?>
			</div>
		</div>
	</div>
</div>
<div class="container">
	<div class="row"><?php echo $column_left; ?>
		<?php if ($column_left && $column_right) { ?>
		<?php $class = 'col-sm-6'; ?>
		<?php } elseif ($column_left || $column_right) { ?>
		<?php $class = 'col-sm-9'; ?>
		<?php } else { ?>
		<?php $class = 'col-sm-12'; ?>
		<?php } ?>
		<div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
		</div>
		<?php echo $content_bottom; ?>
		<?php echo $column_right; ?>
	</div>
</div>
<?php echo $footer; ?>