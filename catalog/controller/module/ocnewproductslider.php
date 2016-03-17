<?php
class ControllerModuleOcnewproductslider extends Controller {
	public function index($setting) {
		// Get new product
			$this->load->model('catalog/product');

		  $data['new_products'] = array();

		  $filter_data = array(
		   'sort'  => 'p.date_added',
		   'order' => 'DESC',
		   'start' => 0,
		   'limit' => 10
		  );

		  $new_results = $this->model_catalog_product->getProducts($filter_data);
		  
		// End
		$this->load->language('module/ocnewproductslider');

		$data['heading_title'] = $this->language->get('heading_title');
		$data['heading_title1'] = $this->language->get('heading_title1');
		$data['heading_title2'] = $this->language->get('heading_title2');
		$data['heading_title3'] = $this->language->get('heading_title3');
		$data['content_block7'] = $this->load->controller('common/content_block7');

		$data['text_tax'] = $this->language->get('text_tax');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		$data['products'] = array();

		$filter_data = array(
			'sort'  => 'p.date_added',
			'order' => 'DESC',
			'start' => 0,
			'limit' => $setting['limit']
		);

		$results = $this->model_catalog_product->getProducts($filter_data);

		if ($results) {
			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}

				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = $result['rating'];
				} else {
					$rating = false;
				}
				$is_new = false;
				if ($new_results) { 
					foreach($new_results as $new_r) {
						if($result['product_id'] == $new_r['product_id']) {
							$is_new = true;
						}
					}
				}
				
					$data['products'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'is_new'      => $is_new,
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id']),
				);
			}

		
		
		    $data['config_slide'] = array(
					'items' => $setting['item'],
					'f_speed_slide' => $setting['autoplay'],
					'f_show_nextback' => $setting['shownextback'], 
					'f_show_ctr' => $setting['shownav'], 
					'f_ani_speed' => $setting['speed'],
					'f_show_price' => $setting['showprice'],
					'f_show_des' => $setting['showdes'],
					'f_show_addtocart' => $setting['showaddtocart'],
					'f_rows' => $setting['rows']
				);

		if ($data['products']) {
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/ocnewproductslider.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/ocnewproductslider.tpl', $data);
			} else {
				return $this->load->view('default/template/module/ocnewproductslider.tpl', $data);
			}
		}
		}
	}
}