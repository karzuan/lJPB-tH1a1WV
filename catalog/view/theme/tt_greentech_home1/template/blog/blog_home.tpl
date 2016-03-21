<div class="col-md-6 col-sm-6 col-xs-12">
<div id="blog_home" class="menu-recent first-title">
		
	  <div class="blog-title module-title2 title-group">
		<h2><?php $heading_title2='Новости'; $heading_title1='последние'; $button_read_more='Читать далее...'; ?>
			<span class="word1"><?php echo $heading_title1; ?></span>
			<span class="word2"><?php echo $heading_title2; ?></span>
		</h2>
	  </div>
	 <?php if ($articles) { ?>
      <div class="articles-container">
        <?php foreach ($articles as $article) { ?>
          <div class="articles-inner item-inner">
				<div class="articles-image col-lg-6 col-md-6 col-sm-6 col-xs-6"><img src="<?php echo $article['image']; ?>" alt=""/></div>
				<div class="articles-date col-lg-6 col-md-6 col-sm-6 col-xs-6">
						<div class="name_date">
							<div class="date-blog">
								<?php echo $article['date_added']; ?><?php if($article['author'] != null && $article['author'] != ""): ?>
								<?php endif; ?>
							</div>
							<div class="athor-blog"> <?php echo $article['author']; ?> </div>
						</div>
				   <a class="articles-name" href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a>
				   <div class="articles-intro"><?php echo $article['intro_text']; ?></div>
				   <div class="readmore"><a href="<?php echo $article['href']; ?>"><?php echo $button_read_more; ?></a></div>
					
				</div>
		  </div>
        <?php } ?>
      </div>
      <!--<div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>-->
      <?php } ?>
	  
      <?php if (!$articles) { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
	 <script>
	 $(document).ready(function() { 
		  $(".articles-container").owlCarousel({
				autoPlay : false,
				items : 1,
				itemsDesktop : [1199,1],
				itemsDesktopSmall : [991,1],
				itemsTablet: [767,1],
				itemsMobile : [400,1],
				slideSpeed : 1000,
				paginationSpeed : 1000,
				rewindSpeed : 1000,
				navigation : true,
				stopOnHover : true,
				pagination : false,
				scrollPerPage:true,
		  });
	 });
	 </script>
</div>
</div>
