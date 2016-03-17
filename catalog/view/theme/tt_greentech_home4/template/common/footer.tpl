<?php echo $content_block3; ?>
<div class="footer">
	<div class="container">
		<div class="row">
			<div class="column col1 col-md-2 col-sm-2 col-xs-6">
				<div class="footer-title"><h3><?php echo $text_account; ?></h3></div>
				<div class="footer-content">
				   <ul class="toggle-footer">
					 <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
					 <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
					 <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
					 <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
					 <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
				   </ul>
				</div>
			</div>
			<div class="column col2 col-md-2 col-sm-2 col-xs-6">
			  <div class="footer-title"><h3><?php echo $text_extra; ?></h3></div>
			  <div class="footer-content">
			   <ul class="toggle-footer">
				 <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
				 <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
				 <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
				 <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
				 <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
			   </ul>
			  </div>
			</div>
			<div class="column col3 col-md-2 col-sm-2 col-xs-6">
			   <div class="footer-title"><h3><?php echo $text_information; ?></h3>
				</div>
				<div class="footer-content">
					<ul class="toggle-footer">
					 <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
					 <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
					 <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
					 <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
					 <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
				   </ul>
				</div>
			</div>
			
			<div class="column col-md-2 col-sm-2 col-xs-6">
				<div class="footer-title"><h3><?php echo $text_service; ?></h3>
				</div>
				<div class="footer-content">
					<ul class="toggle-footer">
					<li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
					 <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
					 <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
					 <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
					 <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
				   </ul>
				</div>
			</div>
			
			<div class="column col4 col-md-4 col-sm-4 col-xs-6">
				<div class="footer-title"><h3><?php echo $text_contact; ?></h3></div>
				<ul class="toggle-footer footer-content">
					<li><span><?php echo $text_address; ?></span><?php echo $address; ?></li>
					<li><span><?php echo $text_telephone; ?></span><?php echo $telephone; ?></li>
					<li><span><?php echo $text_fax; ?></span><?php echo $fax; ?></li>
					<li><span><?php echo $text_email; ?></span><?php echo $email; ?></li>
			   </ul>
			   <a class="banner-footer" href="#"><img alt="" src="image/catalog/banner-footer.jpg"></a>
			</div>
		</div>
	</div>
</div>
<div class="ma-footer-link-follow">
<div class="container">
<div class="block-link-follow">
	<div class="row">
		<div class="f-col f-col-2 col-md-4 col-sm-4 col-xs-12">
			<?php echo $content_block5; ?>
		</div>
		<div class="f-col f-col-1 col-md-4 col-sm-4 col-xs-12">
			<div class="box-follow">
				<h3><?php echo $text_follow_title; ?></h3>
				<ul class="link-follow">
					<li class="first"><a class="twitter fa fa-twitter" href="#"><span>twitter</span></a></li>
					<li><a class="google fa fa-google-plus" href="#"><span>google</span></a></li>
					<li><a class="facebook fa fa-facebook" href="#"><span>facebook</span></a></li>
					<li><a class="linkedin fa fa-linkedin" href="#"><span>linkedin</span></a></li>
					<li class="last"><a class="youtube fa fa-youtube" href="#"><span>youtube</span></a></li>
				</ul>
			</div>
		</div>
		<div class="f-col f-col-3 col-md-4 col-sm-4 col-sms-12">
				<a href="#" class="payment"><img alt="" src="image/catalog/payment.png"></a>
		</div>
	</div>
</div>
</div>
</div>
<div class="powered">
	<div class="container">
		<div class="row">
			<div class="right-powered">
				<div> <?php echo $powered; ?></div>
			</div>
		</div>
	</div>
</div>
<div id="back-top" class="hidden-phone" style="display: block;"> </div>
<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//--> 

<!-- Theme created by Welford Media for OpenCart 2.0 www.welfordmedia.co.uk -->
<script type="text/javascript">
	$(document).ready(function(){

	 // hide #back-top first
	 $("#back-top").hide();
	 
	 // fade in #back-top
	 $(function () {
	  $(window).scroll(function () {
	   if ($(this).scrollTop() > 100) {
		$('#back-top').fadeIn();
	   } else {
		$('#back-top').fadeOut();
	   }
	  });
	  // scroll body to 0px on click
	  $('#back-top').click(function () {
	   $('body,html').animate({
		scrollTop: 0
	   }, 800);
	   return false;
	  });
	 });

	});
</script>
</body></html>