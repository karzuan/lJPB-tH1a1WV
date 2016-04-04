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
<div class="ttcountdown_module">
<div class="featured-slider-title title-group">
	<h2>
		<span class="word1"><?php echo $heading_title1; ?></span>
		<span class="word2"><?php echo $heading_title2; ?></span>
	</h2>
</div>
<div class="product-layout countdown-products">
		<div class="countdown-tab-content">
		<div class="row">
	<div class="countdown-product-inner">
    <?php foreach ($products as $product) : ?>
    <div class="timer-item">
		<div class="box-item">
			<div class="product-image col-lg-5 col-md-5 col-sm-5 col-xs-12">
				<div class="images-container">
					<div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a></div>
				</div><!-- images-container -->
			</div>
			
			<div class="box-price col-lg-7 col-md-7 col-sm-7 col-xs-12">
				<div class="des-container">
					<div class="name">
							<a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
					</div>
					<?php if (isset($product['rating'])) { ?>
							<div class="rating">
							<img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="" />
							</div>
						<?php } ?>
						<?php if ($product['orgprice']) { ?>
						<?php if (!$product['special']) { ?>
							<div class="price-box">
								<span class="regular-price">
									<span class="price"><?php echo $product['orgprice']; ?></span>
								</span>
							</div>
						<?php } else { ?>
							<div class="price-box">
								<p class="special-price"><?php echo $product['special']; ?></p>
								<p class="price-old"><?php echo $product['orgprice']; ?></p>
							</div>
						<?php } ?>
					<?php } ?>
					<div class="description"><?php echo $product['description']; ?></div>
					
					<?php if(strtotime($product['date_end'])) { ?>
					<div id="Countdown<?php echo $product['product_id']?>" class="box-timer"></div>
					<?php } ?>
					
				</div><!--des-container-->
			</div>
		</div>
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
<script type="text/javascript">
	$('.countdown-product-inner').owlCarousel({
		autoPlay : <?php if($config_slide['f_speed_slide']) { echo $config_slide['f_speed_slide'] ;} else { echo 'false';} ?>,
		items : <?php if($config_slide['items']) { echo $config_slide['items'] ;} else { echo 3;} ?>,
		itemsDesktop : [1199,1],
		itemsDesktopSmall : [991,1],
		itemsTablet: [700,1],
		itemsMobile : [400,1],
		slideSpeed : <?php if($config_slide['f_ani_speed']) { echo $config_slide['f_ani_speed'] ;} else { echo 2000;} ?>,
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