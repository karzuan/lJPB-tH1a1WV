<?php
class ControllerModuleOcfeaturedcategory extends Controller {
	public function index($setting) {
		$this->load->language('module/ocfeaturedcategory');

		$this->load->model('module/ocfeaturedcategory');

		$this->load->model('tool/image');
		
		$this->load->model('catalog/category');

		$_featured_categories = $this->model_module_ocfeaturedcategory->getFeaturedCategories();
		$data['categories'] = array();
		$data['heading_title'] = $this->language->get('heading_title');
		$data['heading_title1'] = $this->language->get('heading_title1');
		$data['heading_title2'] = $this->language->get('heading_title2');
		$data['heading_title3'] = $this->language->get('heading_title3');
		
		if ($_featured_categories) {
			foreach ($_featured_categories as $_category) {
				$sub_categories = array();
				
				$sub_data_categories = $this->model_catalog_category->getCategories($_category['category_id']);
				//echo '<pre>'; print_r($sub_categories); die;
				foreach($sub_data_categories as $sub_category) {
					$filter_data = array('filter_category_id' => $sub_category['category_id'], 'filter_sub_category' => true);

					$sub_categories[] = array(
						'category_id' => $sub_category['category_id'],
						'name' => $sub_category['name'],
						'href' => $this->url->link('product/category', 'path='. $sub_category['category_id'])
					);
				}
				
				if ($_category['homethumb_image']) {
					$homethumb_image = $this->model_tool_image->resize($_category['homethumb_image'], $setting['width'], $setting['height']);
				} else {
					$homethumb_image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
				}

				$data['categories'][] = array(
					'children'			=> $sub_categories,
					'category_id'  		=> $_category['category_id'],
					'homethumb_image'   => $homethumb_image,
					'name'        		=> $_category['name'],
					'description' 		=> utf8_substr(strip_tags(html_entity_decode($_category['description'], ENT_QUOTES, 'UTF-8')), 0, 80) . 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod',
					'href'        		=> $this->url->link('product/category', 'path=' . $_category['category_id']),
				);
			}

			$data['config_slide'] = array(
				'items' => $setting['item'],
				'f_speed_slide' => $setting['autoplay'],
				'f_show_nextback' => $setting['shownextback'], 
				'f_show_ctr' => $setting['shownav'], 
				'f_ani_speed' => $setting['speed'],
			);

		}
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/ocfeaturedcategory.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/ocfeaturedcategory.tpl', $data);
		} else {
			return $this->load->view('default/template/module/ocfeaturedcategory.tpl', $data);
		}
	}
}