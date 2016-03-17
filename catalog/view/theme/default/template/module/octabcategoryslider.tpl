
<?php $tab_effect = 'wiggle'; ?>
<script type="text/javascript">

$(document).ready(function() {

	$(".<?php echo $cateogry_alias;?> .tab_content_category").hide();
	$(".<?php echo $cateogry_alias;?> .tab_content_category:first").show(); 

	$(".<?php echo $cateogry_alias;?> ul.tabs-category li").click(function() {
		$("ul.tabs-category li").removeClass("active");
		$(this).addClass("active");
		$(".<?php echo $cateogry_alias;?> .tab_content_category").hide();
		$(".<?php echo $cateogry_alias;?> .tab_content_category").removeClass("animate1 <?php echo $tab_effect;?>");
		var activeTab = $(this).attr("rel"); 
		$("#"+activeTab) .addClass("animate1 <?php echo $tab_effect;?>");
		$("#"+activeTab).fadeIn(); 
	});
});

</script>
<?php 
	$row=1;
	$row = $config_slide['f_rows']; 
	if(!$row) {$row=1;}
?>
<div class="product-tabs-category-container-slider <?php echo $cateogry_alias;?>">
<div class="container">
	<ul class="tabs-category"> 
	<?php $count=0; ?>
	<?php foreach($category_products as $cate_id => $products ){ ?>
		<li rel="tab_cate<?php echo $cate_id; ?>"  >
				<?php echo $array_cates[$cate_id]; ?>
		</li>
			<?php $count= $count+1; ?>
	<?php } ?>	
	</ul>
	<div class="row">
		<div class="tab_container_category"> 
		<?php foreach($category_products as $cate_id => $products ){ ?>
			<div id="tab_cate<?php echo $cate_id; ?>" class="tab_content_category">
				
				<ul class="productTabContent owl-demo-tabcate">
				<?php $i=0; ?>
				<?php foreach ($products as $product){ ?>
							<?php if($i++ % $row ==0){  echo  "<li class='row_item'><ul>"; } ?>
						<li class="item">
							<div class="item-inner">
								<?php if ($product['thumb']) { ?>
									<div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
									<?php } else { ?>
									<div class="image"><a href="<?php echo $product['href']; ?>"><img src="image/cache/no_image-100x100.png" alt="<?php echo $product['name']; ?>" /></a></div>
									<?php } ?>
								<?php if($config_slide['tab_cate_show_des']) { ?>
								
								<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
								<?php } ?>
								<?php if($config_slide['tab_cate_show_price']) { ?>
								<?php if ($product['price']) { ?>
								<div class="price">
								  <?php if (!$product['special']) { ?>
								  <?php echo $product['price']; ?>
								  <?php } else { ?>
								  <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
								  <?php } ?>
								</div>
								<?php } ?>
								<?php } ?>
								<?php if ($product['rating']) { ?>
								<div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
								<?php } ?>
								<div class="actions">
									<div class="button-group">
										<?php if($config_slide['tab_cate_show_addtocart']) { ?>
											<div class="cart">
											<button type="button" data-toggle="tooltip" title="<?php echo $button_cart; ?>" onclick="cart.add('<?php echo $product['product_id']; ?>');"><span><?php echo $button_cart; ?></span></button>
											</div>
										<?php } ?>
									<div class="add-to-links">
											<div class="wishlist"><button class="fa fa-heart" type="button" title="<?php echo $button_wishlist; ?>"  onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><span><?php echo $button_wishlist; ?></span></button></div>
											<div class="compare"><button class="fa fa-retweet" type="button" title="<?php echo $button_compare; ?>"  onclick="compare.add('<?php echo $product['product_id']; ?>');"><span><?php echo $button_compare; ?></span></button></div>
									</div>
									
									</div>
								</div>
							</div>
						</li>
						  	<?php if($i % $row ==0){  echo  "</ul></li>"; } ?>
				<?php } ?>
				</ul>
			</div>

		<?php } ?>
	
	</div> <!-- .tab_container_category -->
	</div> <!-- .row -->
</div>
</div>


<script type="text/javascript">
$(document).ready(function() { 
  $(".<?php echo $cateogry_alias;?> .owl-demo-tabcate").owlCarousel({
      autoPlay: false, //Set AutoPlay to 3 seconds
      items : <?php if($config_slide['items']) { echo $config_slide['items'] ;} else { echo 3;} ?>,
	  slideSpeed : <?php if($config_slide['tab_cate_speed_slide']) { echo $config_slide['tab_cate_speed_slide'] ;} else { echo 200;} ?>,
	  navigation : <?php if($config_slide['tab_cate_show_nextback']) { echo 'true' ;} else { echo 'false';} ?>,
	  paginationNumbers : true,
	  pagination : <?php if($config_slide['tab_cate_show_ctr']) { echo 'true' ;} else { echo 'false';} ?>,
	  stopOnHover : false,
		items :4,
		itemsDesktop : [1000,3], 
		itemsDesktopSmall : [900,3], 
		itemsTablet: [680,2], 
		itemsMobile : [480,1]
  });
 
});
</script>




