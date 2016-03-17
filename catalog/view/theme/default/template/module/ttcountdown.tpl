<?php if($permission == true): ?>
<script type="text/javascript">
	if (typeof TT == 'undefined') TT = { };
	TT.Countdown = {
		TEXT_YEARS 		: '<?php echo $text_years ?>',
		TEXT_MONTHS 	: '<?php echo $text_months ?>',
		TEXT_WEEKS 		: '<?php echo $text_weeks ?>',
		TEXT_DAYS 		: '<?php echo $text_days ?>',
		TEXT_HOURS 		: '<?php echo $text_hours ?>',
		TEXT_MINUTES 	: '<?php echo $text_minutes ?>',
		TEXT_SECONDS 	: '<?php echo $text_seconds ?>'
	};
</script>
<script type="text/javascript" src="catalog/view/javascript/jquery.countdown.js"></script>
<div class="container">
<div class="countdown-container second-title">
<div class="product-layout countdown-products">
	
	<div class="col-sm-2 col-xs-12 list-thumb">
		<ul class="thumb">
			<?php $i=0; foreach ($products as $product) : ?>
				<li class="thumbinner<?php echo $i; echo ($i==0) ? ' active' : ''?>" onclick="timerslider(<?php echo $i; $i++;?>)">
					<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" />
				</li>
			<?php endforeach;  ?>
		</ul><!-- list-thumb -->
	</div>
	<div class="col-sm-10 col-xs-12 ">
		<div class="countdown-tab-content">
	<div class="countdown-product-inner">
    <?php foreach ($products as $product) : ?>
    <div class="timer-item">
        <div class="row">
			<div class="col-sm-6 col-xs-12">
				<div class="des-container">
					<h2 class="product-name">
							<a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
					</h2>
					
					<?php if (isset($product['rating'])) { ?>
						<div class="ratings">
							<div class="rating-box">
								<?php for ($i = 0; $i <= 5; $i++) { ?>
									<?php if ($product['rating'] == $i) {
										$class_r= "rating".$i;
										echo '<div class="'.$class_r.'"><!-- rating --></div>';
									} 
								}  ?>
							</div>
							<div class="review-count"><a href="<?php echo $product['href']; ?>"><?php echo $product['reviews']; ?></a></div>
						</div>
					<?php } ?>
					<div class="description"><?php echo $product['description']; ?></div>
					
					<?php if ($product['orgprice']) { ?>
						<?php if (!$product['special']) { ?>
							<div class="price-box">
								<span class="regular-price">
									<span class="price"><?php echo $product['orgprice']; ?></span>
								</span>
							</div>
						<?php } else { ?>
							<div class="price-box">
								<p class="old-price"><span class="price"><?php echo $product['orgprice']; ?></span></p>
								<p class="special-price"><span class="price"><?php echo $product['special']; ?></span></p>
							</div>
						<?php } ?>
					<?php } ?>
					
					<div class="actions">
						<button class="button btn-cart" type="button" data-toggle="tooltip" title="<?php echo $button_cart; ?>" onclick="cart.add('<?php echo $product['product_id']; ?>');">
							<span><span><?php echo $button_cart; ?></span></span>
						</button>
					</div>
				</div><!--des-container-->
			</div>
			<div class="col-sm-6 col-xs-12">
				<div class="images-container">
					<a class="product-image" href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
				</div><!-- images-container -->
			</div>
        </div><!-- row -->
        <?php if(strtotime($product['date_end'])) { ?>
        <div id="Countdown<?php echo $product['product_id']?>" class="box-timer"></div>
        <?php } ?>
		<?php if(strtotime($product['date_end'])) { ?>
			<script type="text/javascript">

				$(function () {
					var austDay = new Date();
					austDay = new Date(austDay.getFullYear() + 1, 1 - 1, 26);
					$('#Countdown<?php echo $product['product_id'];?>').countdown({
						until: new Date(
							<?php echo date("Y",strtotime($product['date_end']))?>,
							<?php echo date("m",strtotime($product['date_end']))?> -1, 
							<?php echo date("d",strtotime($product['date_end']))?>,
							<?php echo date("H",strtotime($product['date_end']))?>,
							<?php echo date("i",strtotime($product['date_end']))?>, 
							<?php echo date("s",strtotime($product['date_end']))?>
							)
					});
					//$('#Countdown<?php echo $product['product_id'];?>').countdown('pause');
				});
			</script>
		<?php } ?>
		
    </div><!-- timer-item -->
    

    <?php endforeach;  ?>
	</div><!-- countdown-product-inner -->
	</div><!-- countdown-tab-content -->
	</div>
	</div>
</div>
<?php echo $config_slide['f_speed_slide']; ?>
<?php echo $config_slide['f_ani_speed']; ?>
<script type="text/javascript">
	$('.countdown-product-inner').owlCarousel({
		autoPlay : <?php if($config_slide['f_speed_slide']) { echo $config_slide['f_speed_slide'] ;} else { echo 3000;} ?>,
		items : <?php if($config_slide['items']) { echo $config_slide['items'] ;} else { echo 3;} ?>,
		itemsDesktop : [1199,1],
		itemsDesktopSmall : [991,1],
		itemsTablet: [700,1],
		itemsMobile : [400,1],
		slideSpeed : <?php if($config_slide['f_ani_speed']) { echo $config_slide['f_ani_speed'] ;} else { echo 2000;} ?>,
		paginationSpeed : 3000,
		rewindSpeed : 3000,
		navigation : <?php if($config_slide['f_show_nextback']) { echo 'true' ;} else { echo 'false';} ?>,
		stopOnHover : true,
		pagination : <?php if($config_slide['f_show_ctr']) { echo 'true' ;} else { echo 'false';} ?>,
		scrollPerPage:true,
		afterMove: function(){
			x = $( ".countdown-tab-content .owl-pagination .owl-page" ).index( $( ".countdown-tab-content .owl-pagination .active" ));
			var thumbinner = ".thumbinner"+x;
			$(".list-thumb .thumb li").removeClass('active');
			$(thumbinner).addClass('active');
		}
	});
	
	var owltimerslider = $(".countdown-product-inner").data('owlCarousel');
	function timerslider(x){
		owltimerslider.goTo(x)
	}
</script>
<?php endif; ?>