<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>

<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js"
type="text/javascript"></script>
<script src="catalog/view/javascript/jquery/jquery-ui.js" type="text/javascript"></script>
<link href="catalog/view/javascript/jquery/css/jquery-ui.css" rel="stylesheet" media="screen" />
<link href="catalog/view/theme/tt_greentech_home1/stylesheet/opentheme/oclayerednavigation/css/oclayerednavigation.css"
rel="stylesheet">
<link href="catalog/view/theme/tt_greentech_home1/stylesheet/opentheme/ocsearchcategory/css/ocsearchcategory.css"
rel="stylesheet">
<script src="catalog/view/javascript/opentheme/oclayerednavigation/oclayerednavigation.js"
type="text/javascript"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href='https://fonts.googleapis.com/css?family=Poppins:400,300,500,600,700' rel='stylesheet' type='text/css'><link href="catalog/view/theme/tt_greentech_home1/stylesheet/stylesheet.css" rel="stylesheet" type="text/css">
<link href="catalog/view/theme/tt_greentech_home1/stylesheet/animate.css" rel="stylesheet" type="text/css">
<link href="catalog/view/theme/tt_greentech_home1/stylesheet/opentheme/hozmegamenu/css/custommenu.css" rel="stylesheet" type="text/css">
<link href="catalog/view/theme/tt_greentech_home1/stylesheet/opentheme/vermegamenu/css/ocsvegamenu.css" rel="stylesheet" type="text/css">
<script src="catalog/view/javascript/opentheme/hozmegamenu/custommenu.js" type="text/javascript"></script>
<script src="catalog/view/javascript/opentheme/vermegamenu/custommenu.js" type="text/javascript"></script>
<script src="catalog/view/javascript/opentheme/hozmegamenu/mobile_menu.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/tt_greentech_home1/stylesheet/opentheme/ocquickview/css/ocquickview.css">
<script src="catalog/view/javascript/opentheme/ocquickview/ocquickview.js" type="text/javascript"></script>
<link href="catalog/view/theme/tt_greentech_home1/stylesheet/opentheme/css/owl.carousel.css" rel="stylesheet">
<script src="catalog/view/javascript/jquery/elevatezoom/jquery.elevatezoom.js" type="text/javascript"></script>
<script src="catalog/view/javascript/opentheme/ocslideshow/jquery.nivo.slider.js" type="text/javascript"></script>
<script src="catalog/view/javascript/opentheme/opcajaxlogin/opcajaxlogin.js" type="text/javascript"></script>
<link href="catalog/view/theme/tt_greentech_home1/stylesheet/opentheme/opcajaxlogin/css/opcajaxlogin.css" rel="stylesheet">
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<script type="text/javascript">
    $(document).ready(function() {
        $("*").find("a[href='"+window.location.href+"']").each(function(){
            $(this).addClass("current");
		}) ;
		
		
});
$(document).ready(function() {
	var current_page = window.location.href;
	if(current_page.match(/ocbestseller/)){
		$('a[href$="ocbestseller"]').addClass("current");
	};
	if(current_page.match(/ocnewproduct/)){
		$('a[href$="ocnewproduct"]').addClass("current");
	};
	if(current_page.match(/contact/)){
		$('a[href$="contact"]').addClass("current");
	};
	if(current_page.match(/blog/)){
		$('a[href$="blog"]').addClass("current");
	};
});
</script>
</head>
<body class="<?php echo $class; ?>">
<header>
<div class="top-header">
		<div class="container">
                        <table class="topmenu">
                            <tr>
                                <td style="width:21%;">
                                    <a href="http://igodno.ru/"><div id='logo-fixed'></div></a>
                                </td>
                                <td style="width:21%;">
                                    
                                        <div class="header-welcome" >
                                            <p id='trr'><?php echo $text_msg; ?></p>
                                        </div>
                                </td>
                                         
                                <td style="width:44%;">
                                    
                                    <strong><a href="tel:+79110012340" id='tel' style="color:white; font-size:16px; font-weight: bold;">&nbsp;&nbsp;&nbsp;&nbsp;8(812)244-49-80</a></strong>
                                 </td>
                                 <td>
                                        <div class="header-link"> 
				<div class="top-link">
                                        
					<div class="toplink-hover"><a href="<?php echo $account; ?>" id='akk'><?php echo $text_account; ?></a><i class="fa fa-angle-down"></i></div>
					<div class="top-link-inner">
                                            <ul>
                                                        
							<li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
							<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
							<li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
							<li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
							<?php if ($logged) { ?>
							<li><a id="a-logout-link" href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
							<?php } else { ?>
							<li><a id="a-login-link" href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
							<?php } ?>
						</ul>
					</div>
				</div>
				<div class="box-language-currency">
					<div class="currency"><?php //echo $currency; ?></div>
					<div class="language"><?php //echo $language; ?></div>
				</div>
                                    </div>
                      
                                </td>
                            </tr>
                        </table>

			
                        
                        
                       
		</div>
</div>
<div class="header">
  <div class="container">
	<div class="header-inner">
    <div class="row">
	<div class="col-md-3 col-sm-12 col-xs-12" id="logo">
			<div>
			<?php if ($logo) { ?>
			  <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
			  <?php } else { ?>
			  <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
			  <?php } ?>
			</div>
		</div>
	<div class="header-search-parent col-md-9 col-sm-12 col-xs-12">
			<div class="row">
				<div class="col-md-8 col-sm-12 col-xs-12"><div class="header-search"><?php echo $content_block4; ?></div></div>
				<div class="col-md-4 col-sm-12 col-xs-12">
					<div class="top-cart">
						<?php echo $cart; ?>
					</div>
                                    <a href="<?php echo $wishlist; ?>" class="top-wishlist" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><span><?php //echo $text_wishlist; ?></span></a>
					
				</div>
			</div>
		
    </div>
	</div>
	</div>
</div>
</div>
    
    <!-- Yandex.Metrika counter -->
<script type="text/javascript">
    (function (d, w, c) {
        (w[c] = w[c] || []).push(function() {
            try {
                w.yaCounter36962535 = new Ya.Metrika({
                    id:36962535,
                    clickmap:true,
                    trackLinks:true,
                    accurateTrackBounce:true,
                    webvisor:true,
                    ecommerce:"dataLayer"
                });
            } catch(e) { }
        });

        var n = d.getElementsByTagName("script")[0],
            s = d.createElement("script"),
            f = function () { n.parentNode.insertBefore(s, n); };
        s.type = "text/javascript";
        s.async = true;
        s.src = "https://mc.yandex.ru/metrika/watch.js";

        if (w.opera == "[object Opera]") {
            d.addEventListener("DOMContentLoaded", f, false);
        } else { f(); }
    })(document, window, "yandex_metrika_callbacks");
</script>
<noscript><div><img src="https://mc.yandex.ru/watch/36962535" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
<!-- /Yandex.Metrika counter -->
    
</header>
<div class="megamenu"><div class="container">
	<div class="row">
      <div class="vermenu col-md-3 col-sm-12 col-sms-12">
		<?php echo $content_block; ?>
      </div>
      <div class="homemenu col-md-9 col-sm-12 col-sms-12">
		<?php echo $content_block2; ?>
		</div>
	</div>
</div></div>
<?php if ($categories) { ?>
<?php } ?>