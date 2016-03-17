
<div class="featured-container">
<div class="featured-slider-title title-group"><h2><?php echo $heading_title; ?></h2></div>
<?php 
    $count = 0; 
    $row=1;
    $rows = $config_slide['f_rows']; 
    if(!$rows) {$rows=1;}
  ?>
<div class="row">
<div class="owl-demo-feature">
  <?php foreach ($products as $product) { ?>
  <?php if($count++ % $rows == 0 ) { echo '<div class="row_items">'; }  ?>
  <div class="item_product">
    <div class="product-thumb transition item-inner">
		<div class="image col-md-5 col-sm-5 col-xs-5">
			<a href="<?php echo $product['href']; ?>">
				<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" />
			</a>
		</div>  
		<div class="box-info col-md-7 col-sm-7 col-xs-7">
			<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
			<?php if (isset($product['rating'])) { ?>
			<div class="rating"><img src="catalog/view/theme/tt_greentech_home1/image/stars-<?php echo $product['rating']; ?>.png" alt="" /></div>
			<?php } ?>
			<?php if($config_slide['f_show_price']){ ?>
			<?php if ($product['price']) { ?>
			<div class="price">
			  <?php if (!$product['special']) { ?>
			  <?php echo $product['price']; ?>
			  <?php } else { ?>
			  <span class="price-new"><?php echo $product['special']; ?></span><span class="price-old"><?php echo $product['price']; ?></span>
			  <?php } ?>
			  <?php if ($product['tax']) { ?>
			  <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
			  <?php } ?>
			</div> <?php } ?>
			<?php } ?>
			<?php if($config_slide['f_show_des']){ ?>
			<p><?php echo $product['description']; ?></p>
			<?php } ?>
			<div class="actions">
							<!-- <div class="add-to-links">
								<div class="wishlist">
									<button class="link-wishlist" type="button" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><span><?php echo $button_wishlist; ?></span></button>
								</div>
								<div class="compare">
									<button class="link-compare" type="button" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><span><?php echo $button_compare; ?></span></button>
								</div>
							</div> -->
							<div class="cart">
									<?php if($config_slide['f_show_addtocart']) { ?>
									<button class="button btn-cart" type="button" title="<?php echo $button_cart; ?>" onclick="cart.add('<?php echo $product['product_id']; ?>');"><span><?php echo $button_cart; ?></span></button>
									<?php } ?>
								</div>
			</div>
		</div>
    </div>
  </div>
  <?php if($count % $rows == 0 ) { echo '</div>'; }  ?>
  <?php } ?>
</div>
</div>
</div>
<script type="text/javascript">
$(document).ready(function() { 
  $(".owl-demo-feature").owlCarousel({
	  autoPlay: <?php if($config_slide['f_speed_slide']>0) { echo 'true';} else { echo 'false';} ?>, //Set AutoPlay to 3 seconds
      items : <?php if($config_slide['items']) { echo $config_slide['items'] ;} else { echo 4;} ?>,
	  slideSpeed : <?php if($config_slide['f_speed_slide']) { echo $config_slide['f_speed_slide'] ;} else { echo 1000;} ?>,
	  navigation : <?php if($config_slide['f_show_nextback']) { echo 'true' ;} else { echo 'false';} ?>,
	  paginationNumbers : true,
	  pagination : <?php if($config_slide['f_show_ctr']) { echo 'true' ;} else { echo 'false';} ?>,
	  stopOnHover : false,
	  itemsDesktop : [1199,1], 
		itemsDesktopSmall : [991,3], 
		itemsTablet: [680,2],
		itemsMobile : [480,1]
 
  });
 
});
</script>