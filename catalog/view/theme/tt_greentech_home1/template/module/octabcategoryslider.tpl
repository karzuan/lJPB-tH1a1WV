<?php $tab_effect = 'wiggle'; ?>
<script type="text/javascript">

$(document).ready(function() {

	$(".<?php echo $cateogry_alias;?> .tab_content_category").hide();
	$(".<?php echo $cateogry_alias;?> .tab_content_category:first").show(); 
	$(".<?php echo $cateogry_alias;?> ul.tabs-category li:first").addClass("active");
	$(".<?php echo $cateogry_alias;?> ul.tabs-category li:first").addClass("active");
	$(".<?php echo $cateogry_alias;?> ul.tabs-category li").click(function() {
		$(".<?php echo $cateogry_alias;?> ul.tabs-category li").removeClass("active");
		$(this).addClass("active");
		$(".<?php echo $cateogry_alias;?> .tab_content_category").hide();
		$(".<?php echo $cateogry_alias;?> .tab_content_category").removeClass("animate1 <?php echo $tab_effect;?>");
		var activeTab = $(this).attr("rel"); 
		$("#"+activeTab) .addClass("animate1 <?php echo $tab_effect;?>");
		$("#"+activeTab).fadeIn(); 
	});
});

</script>
<div class="product-tabs-category-container-slider <?php echo $cateogry_alias;?> first-title">
	<div class="title-group">
	<h2>
		<span class="word1"><?php echo $config_slide['title1']; ?></span>
		<span class="word2"><?php echo $config_slide['title2']; ?></span>
	</h2>
	<ul class="tabs-category tab_small">
	<?php foreach($category_products as $cate_id => $products ){ ?>
		<li rel="tab_cate<?php echo $cate_id; ?>"  >
				<span><?php echo $array_cates[$cate_id]; ?></span>
		</li>
	<?php } ?>	
	</ul>
	</div>
	<div class="row">
		<div class="tab_container_category"> 
		<?php foreach($category_products as $cate_id => $products ){ ?>
			<div id="tab_cate<?php echo $cate_id; ?>" class="tab_content_category">
				
				<ul class="productTabContent owl-demo-tabcate">
				<?php 
					$count = 0; 
					$countproduct = count($products);
					$rows = $config_slide['f_rows']; 
					if(!$rows) {$rows=1;}
					
				?>
				<?php foreach ($products as $product){ ?>
							<?php if($count++ % $rows ==0){  echo  "<li class='row_item'><ul>"; } ?>
						<li class="item">
							<div class="item-inner">
								<div class="image">
									<div class="new-sale">
									<?php if ($product['special']) { ?>
									<span class="sale"> Sale </span>
									<?php } ?>
									<?php if ($product['is_new']){?>
										<div class="new"> New </div>
									<?php } ?>
									</div>
									<a href="<?php echo $product['href']; ?>" class="img-other">
										<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" />
									</a>
									<?php if (isset($product['rating'])) { ?>
											<div class="rating">
											<img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="" />
											</div>
										<?php } ?>
									<div class="actions">
										<div class="button-group">
											<div class="add-to-links">
													<div class="wishlist"><button type="button" title="<?php echo $button_wishlist; ?>"  onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><span><?php echo $button_wishlist; ?></span></button></div>
													<div class="compare"><button type="button" title="<?php echo $button_compare; ?>"  onclick="compare.add('<?php echo $product['product_id']; ?>');"><span><?php echo $button_compare; ?></span></button></div>
											</div>
										</div>
									</div>
								</div>
							
								<?php if($config_slide['tab_cate_show_des']) { ?>
								<div class="box-view-actions">
									<div class="box-view">
										<div class="name">
											<a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
										</div>
										<?php if($config_slide['tab_cate_show_price']) { ?>
										<?php if ($product['price']) { ?>
										<div class="price">
										  <?php if (!$product['special']) { ?>
										  <?php echo $product['price']; ?>
										  <?php } else { ?>
										  <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
										  <?php } ?>
										</div>
										<?php } ?>
										<?php } ?>
									</div>
									<?php if($config_slide['tab_cate_show_addtocart']) { ?>
													<div class="cart">
													<button type="button" title="<?php echo $button_cart; ?>" onclick="cart.add('<?php echo $product['product_id']; ?>');"><span><?php echo $button_cart; ?></span></button>
													</div>
											<?php } ?>
								</div>
								<?php } ?>
							</div>
						</li>
						  	<?php if(($count % $rows == 0) || ($count == $countproduct)){  echo  "</ul></li>"; } ?>
				<?php } ?>
				</ul>
			</div>

		<?php } ?>
	
	</div> <!-- .tab_container_category -->
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
	itemsDesktop : [1200,4], 
	itemsDesktopSmall : [992,3], 
	itemsTablet: [680,2], 
	itemsMobile : [480,1]
  });
 
});
</script>