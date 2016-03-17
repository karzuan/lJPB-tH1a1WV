<?php echo $header; ?>
<div class="home-slider">
	<div class="container">
		<div class="row">
			<div class="banner-top">
				<div class="slider-home col-md-9 col-sm-9 col-xs-12"><?php echo $content_banner; ?></div>
				<div class="banner-top-right col-md-3 col-sm-3 col-xs-12"> <?php echo $content_right; ?></div>
			</div>
		</div>
	</div>
</div>
<div class="container">
	<div class="row"><?php echo $column_left; ?>
		<?php if ($column_left && $column_right) { ?>
		<?php $class = 'col-md-6 col-sm-12'; ?>
		<?php } elseif ($column_left || $column_right) { ?>
		<?php $class = 'col-md-9 col-sm-12'; ?>
		<?php } else { ?>
		<?php $class = 'col-md-12'; ?>
		<?php } ?>
		<div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
		</div>
		<?php echo $column_right; ?>
		</div>
		<?php echo $content_bottom; ?>
		<div class="row">
		<?php echo $content_block6; ?>
		</div>
		
</div>
<?php echo $footer; ?>