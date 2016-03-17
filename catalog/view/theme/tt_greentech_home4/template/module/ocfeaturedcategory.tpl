<?php $i = 0; $row = 2; ?>
<div class="featured-cat-thumb first-title">
	<div class="featured-cat-thumb-title title-group"> 
		<h2>
			<span class="word1"><?php echo $heading_title1; ?></span>
			<span class="word2"><?php echo $heading_title2; ?></span>
		</h2>
	</div>
<div class="featured-categories-container row">
		<div class="owl-featured-categories">
			<?php foreach ($categories as $category) { ?>
			<?php if($i++ % $row == 0) {  echo  "<div class='row_item'><div>"; } ?>
				<div class="fcategory-content">
					<div class="catlist_level_top col-md-6 col-sm-6 col-xs-6">
						<h2 class="name"><?php echo $category['name']; ?></h2>
						<!-- <p class="dec"><?php echo $category['description']; ?></p> -->
						<?php if($category['children']): ?>
						
						<?php $sub_count = 0; ?>
						<ul class="sub-featured-categories">
							<?php foreach($category['children'] as $subcate): ?>
								<?php if($sub_count >= 4) break; ?>
								<li><a href="<?php echo $subcate['href']; ?>"><?php echo $subcate['name']; ?></a></li>
								<?php $sub_count++; ?>
							<?php endforeach; ?>
						</ul>
						<?php endif; ?>
					</div>
					<div class="cat_image col-md-6 col-sm-6 col-xs-6"><img src="<?php echo $category['homethumb_image'] ?>" alt="" /></div>
				</div>
					<?php if($i % $row == 0 ): ?>
					</div></div>
					<?php else: ?>
					<?php if($i == count($categories)) :?>
					</div></div>
					<?php endif; ?>
					<?php endif; ?>
			<?php } ?>
				
</div>
</div>
</div>
<script type="text/javascript">
$(document).ready(function() { 
$(".owl-featured-categories").owlCarousel({
	  slideSpeed: <?php if($config_slide['f_ani_speed']) { echo $config_slide['f_ani_speed'] ;} else { echo 3000;} ?>,
      items : <?php if($config_slide['items']) { echo $config_slide['items'] ;} else { echo 3;} ?>,
	  autoPlay : false,
	  navigation : <?php if($config_slide['f_show_nextback']) { echo 'true' ;} else { echo 'false';} ?>,
	  paginationNumbers : true,
	  pagination : <?php if($config_slide['f_show_ctr']) { echo 'true' ;} else { echo 'false';} ?>,
	  stopOnHover : false,
	itemsDesktop : [1199,3], 
   itemsDesktopSmall : [900,3], // betweem 900px and 601px
  itemsTablet: [768,2], //2 items between 600 and 0
  itemsMobile : [480,1] // itemsMobile disabled - inherit from itemsTablet option
 });
 
});
</script>