<?php if(count($products) == 0): ?>
    <p class="ajax-result-msg"><?php echo $text_empty ?></p>
<?php else: ?>
    <ul class="ajax-result-list">
        <?php foreach($products as $product): ?>
            <li class="ajax-result-item">
                <a href="<?php echo $product['href'] ?>">
                    <div class="product-info">
                        <?php if($product_img_enabled == '1'): ?>
                            <img class="product-img col-lg-3 col-md-3 col-xs-3 col-sm-3" src="<?php echo $product['thumb']; ?>" alt=""/>
                        <?php endif; ?>
                        <div class="detail col-lg-9 col-md-9 col-xs-9 col-sm-9">
                            <p class="product-name"><?php echo $product['name'] ?></p>
                            <?php if($product_price_enabled == '1'): ?>
                            <div class="product-price">
                                <p class="price">
                                    <?php if (!$product['special']) { ?>
                                    <?php echo $product['price']; ?>
                                    <?php } else { ?>
                                    <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                                    <?php } ?>
                                    <?php if ($product['tax']) { ?>
                                    <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                                    <?php } ?>
                                </p>
                            </div>
                            <?php endif; ?>
                        </div>
                    </div>
                </a>
            </li>
        <?php endforeach; ?>
    </ul>
<?php endif; ?>