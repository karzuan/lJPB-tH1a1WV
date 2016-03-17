<div class="new-products-container">
<div class="new-products-slider title-group">
	<h2>
		<span class="word1"><?php echo $heading_title1; ?></span>
		<span class="word2"><?php echo $heading_title2; ?></span>
	</h2>
</div>
 <?php 
	$count = 0; 
	$rows = $config_slide['f_rows']; 
	if(!$rows) {$rows=1;}
  ?>
		<div class="row">
		<div class="col-left col-md-3 col-sm-4 hidden-xs">
			<?php echo $content_block7; ?>
		</div>
		<div class="col-right col-md-9 col-sm-8 col-xs-12">
		<div class="row">
		<div class="owl-demo-newproduct">
		  <?php foreach ($products as $product) { ?>
			<?php if($count++ % $rows == 0 ) { echo '<div class="row_items">'; }  ?>
		  <div class="item_product">
			<div class="product-thumb transition item-inner">
				<div class="col-md-5 col-sm-5 col-xs-5">
					<div class="image">
						<a href="<?php echo $product['href']; ?>">
							<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" />
							
						</a>
					</div>
				</div>
				<div class="col-md-7 col-sm-7 col-xs-7">
				<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
				<?php if($config_slide['f_show_price']){ ?>
					<?php if ($product['price']) { ?>
						<div class="price">
						  <?php if (!$product['special']) { ?>
						  <?php echo $product['price']; ?>
						  <?php } else { ?>
						  <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
						  <?php } ?>
						  <?php if ($product['tax']) { ?>
						  <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
						  <?php } ?>
						</div>
					<?php } ?>
				<?php } ?>
				<?php if (isset($product['rating'])) { ?>
				<div class="rating"><img src="catalog/view/theme/tt_greentech_home1/image/stars-<?php echo $product['rating']; ?>.png" alt="" /></div>
				<?php } ?>
				<?php if($config_slide['f_show_des']){ ?>
				<p class="description"><?php echo $product['description']; ?></p>
				<?php } ?>
			</div>
			</div>
		  </div>
					<?php if($count % $rows == 0 ): ?>
						</div>
					<?php else: ?>
						<?php if($count == count($products)) :?>
							</div>
						<?php endif; ?>
					<?php endif; ?>
		  <?php } ?>
		</div>
		</div>
		</div>
</div>
</div>
<script type="text/javascript">
$(document).ready(function() { 
  $(".owl-demo-newproduct").owlCarousel({
	  autoPlay: <?php if($config_slide['f_speed_slide']> 0 ) { echo  'true' ;} else { echo 'false';} ?>, //Set AutoPlay to 3 seconds
      items : <?php if($config_slide['items']) { echo $config_slide['items'] ;} else { echo 3;} ?>,
	  slideSpeed : <?php if($config_slide['f_speed_slide']) { echo $config_slide['f_speed_slide'] ;} else { echo 200;} ?>,
	  navigation : <?php if($config_slide['f_show_nextback']) { echo 'true' ;} else { echo 'false';} ?>,
	  paginationNumbers : true,
	  pagination : <?php if($config_slide['f_show_ctr']) { echo 'true' ;} else { echo 'false';} ?>,
	  stopOnHover : false,
	  itemsDesktop : [1199,3], 
		itemsDesktopSmall : [991,2], 
		itemsTablet: [680,2],
		itemsMobile : [480,1]
 
  });
 
});
</script>