<?php
class ControllerModuleOctabcategoryslider extends Controller {
	public function index($setting) {
		// Get new product
			$this->load->model('catalog/product');

		// End
		$this->load->language('module/octabcategoryslider');

		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_reviews'] = $this->language->get('text_reviews');

		$data['text_tax'] = $this->language->get('text_tax');



		$this->load->model('catalog/product');
		$this->load->model('catalog/category');
		$this->load->model('tool/image');
		if (file_exists('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/opentheme/categorytabslider.css')) {
			$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/opentheme/categorytabslider.css');
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/opentheme/categorytabslider.css');
		}
		
		$data = array(
			'sort'  => 'p.date_added',
			'order' => 'DESC',
			'start' => 0,
			'limit' => $setting['limit']
		);
		$cateogry_ids = $setting['cate_id'];
		
		$arrayCates = explode(',',$cateogry_ids);
		
		$arrayCateName = array();
		$arrayExisted = array();
		foreach ($arrayCates as $cate_id) {
			$categories_info = $this->model_catalog_category->getCategory($cate_id);
			if(isset($categories_info['name'])) {
				$category_title = $categories_info['name'];
				$arrayCateName[$cate_id] = $category_title;
				$arrayExisted[] = $cate_id;
			}			
		}
		
		$productByCates = array();
		foreach($arrayCates as $cate_id) {
			if(in_array($cate_id,$arrayExisted)) {
				$data['filter_category_id'] = $cate_id;  
				$results = $this->getProductFromData($data,$setting);
				$productByCates[$cate_id] = $results ;
			}			
		}
		
		$slide_title = $setting['title'];
		$array_string_title = preg_split('/[\s,]+/', $slide_title, 2);
		$title1 = $array_string_title[0];
		$title2 = $array_string_title[1];
		
		$data['config_slide'] = array(
			'items' => $setting['item'],
			'title1' => $title1,
			'title2' => $title2,
			'tab_cate_ani_speed' => $setting['autoplay'],
			'tab_cate_show_nextback' => $setting['shownextback'], 
			'tab_cate_show_ctr' => $setting['shownav'], 
			'tab_cate_speed_slide' => $setting['speed'],
			'tab_cate_show_price' => $setting['showprice'],
			'tab_cate_show_des' => $setting['showdes'],
			'tab_cate_show_addtocart' => $setting['showaddtocart'],
			'f_rows' => $setting['rows']
		);
		$alias = str_replace(' ','_',$setting['name']);
		$data['cateogry_alias'] = $alias;
		$data['array_cates'] = $arrayCateName; 
		$data['tab_effect'] = 'wiggle';
		$data['category_products'] = $productByCates;
		

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');
		$data['heading_title'] = $this->language->get('heading_title');
		$data['heading_title1'] = $this->language->get('heading_title1');
		$data['heading_title2'] = $this->language->get('heading_title2');
		$data['heading_title3'] = $this->language->get('heading_title3');
		
		if ($data['category_products']) {
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/octabcategoryslider.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/octabcategoryslider.tpl', $data);
			} else {
				return $this->load->view('default/template/module/octabcategoryslider.tpl', $data);
			}
		}
		
		
	}
	public function getProductFromData($data= array(), $setting = array()) {
	 	  $data['new_products'] = array();

		  $filter_new_data = array(
		   'sort'  => 'p.date_added',
		   'order' => 'DESC',
		   'start' => 0,
		   'limit' => 10
		  );

		  $new_results = $this->model_catalog_product->getProducts($filter_new_data);
		$results = $this->model_catalog_product->getProducts($data);
		$product_list = array();
		foreach ($results as $result) {
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
			} else {
				$image = false;
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
			
			$product_list[] = array(
				'product_id' => $result['product_id'],
				'thumb'   	 => $image,
				'name'    	 => $result['name'],
				'price'   	 => $price,
				'special' 	 => $special,
				'is_new'      => $is_new,
				'rating'     => $rating,
				'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
				'href'    	 => $this->url->link('product/product', 'product_id=' . $result['product_id']),
			);
			

		}
		
		return $product_list; 
	
	
	}
		
	
}