<?php echo $header; ?>
<div class="container category-row">
    <div id="content"><?php echo $content_top; ?>
        <div class="breadcrumb">
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
			<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
			<?php } ?>
        </div>
        <div>
            <?php if ($testimonials) { ?>
            <div class="testimonial-container">
                <?php foreach ($testimonials as $testimonial) { ?>
				<div class="row-testimonials">
					<div class="col-md-3 col-sm-3 col-xs-12 testimonial-images"><img src="<?php echo $testimonial['image']; ?>"></div>
					<div class="col-md-9 col-sm-9 col-xs-12 box-testimonial">
						<div class="testimonial-name"><h2><?php echo $testimonial['customer_name']; ?></h2></div>
						<div class="testimonial-std"><?php echo $testimonial['content']; ?></div>
					</div>
				</div>
                <?php } ?>
            </div>
            <div class="pagination"><?php echo $pagination; ?></div>
            <?php } else { ?>
            <div class="content"><?php echo $text_no_testimonials; ?> <?php echo $pagination; ?></div>
            <?php } ?>
        </div>
    </div>
    <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>