<?php
class ModelInstalltempInstall extends Model {

	public function settup() {
		$this->setLayout(); 
		$this->createTableSlideshow();
		$this->createTableCms();
		$this->createTableBlog();
		$this->createCategoryThumbnail();
	}
	
	public function setLayout() {
		    $this->db->query("TRUNCATE  TABLE " . DB_PREFIX . "module");
			$this->load->model('extension/extension');
			$this->load->model('setting/setting');	
			$this->load->model('design/layout');
			$this->load->model('user/user_group');
		
			$exts = array(
				0 => 'ocslideshow',
				1 => 'cmsblock',
				2 => 'hozmegamenu',
				3 => 'easy_blog',
				4 => 'vermegamenu',
				5 => 'carousel',
				6 => 'newslettersubscribe',
				7 => 'ttcountdown',
				8 => 'octabcategoryslider',
				9 => 'ocsearchcategory'
				
				
			); 
			
			foreach($exts as $ext) {
				$this->model_extension_extension->install('module', $ext);
				$this->model_user_user_group->addPermission($this->user->getId(), 'access', 'module/' . $ext);
				$this->model_user_user_group->addPermission($this->user->getId(), 'modify', 'module/' . $ext);
			}
	}
	
	public function createProductRotator() {
		$this->load->model('catalog/ocproductrotator');
		$this->model_catalog_ocproductrotator->installProductRotator();
	}
	
	public function createCategoryThumbnail() {
		$this->load->model('catalog/occategorythumbnail');
		$this->model_catalog_occategorythumbnail->installCategoryThumbnail();
	}
	
	public function createTableCms(){
			$sql = " SHOW TABLES LIKE '".DB_PREFIX."cmsblock'";
			$query = $this->db->query( $sql );
			if( count($query->rows) >0 ){
				return true;
			}
			$sql = array();
			$sql[] = "
					CREATE TABLE IF NOT EXISTS `".DB_PREFIX."cmsblock` (
							  `cmsblock_id` int(11) NOT NULL AUTO_INCREMENT,
							  `status` tinyint(1) NOT NULL,
							  `sort_order` tinyint(1) DEFAULT NULL,
							  `identify` varchar(255) DEFAULT NULL,
							  `link` varchar(255) DEFAULT NULL,
							  `type` tinyint(1) DEFAULT NULL,
							  `banner_store` varchar(255) DEFAULT 0,
						  PRIMARY KEY (`cmsblock_id`)
						) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
			";

			$sql[] = "
					CREATE TABLE IF NOT EXISTS `".DB_PREFIX."cmsblock_description` (
					      `cmsblock_des_id` int(11) NOT NULL AUTO_INCREMENT,
						  `language_id` int(11) NOT NULL,
						  `cmsblock_id` int(11) NOT NULL,
						  `title` varchar(64) NOT NULL,
						  `sub_title` varchar(64) DEFAULT NULL,
						  `description` text,
					  PRIMARY KEY (`cmsblock_des_id`,`language_id`)
					) ENGINE=MyISAM DEFAULT CHARSET=utf8;
			";
			
			
			$sql[] = " 
				CREATE TABLE IF NOT EXISTS `".DB_PREFIX."cmsblock_to_store` (
				  `cmsblock_id` int(11) DEFAULT NULL,
				  `store_id` tinyint(4) DEFAULT NULL
				) ENGINE=MyISAM DEFAULT CHARSET=latin1;
			";
			
			foreach( $sql as $q ){
				$query = $this->db->query( $q );
			}
			return true;
			
	}
	
	public function createTableTestimonial(){
        $sql =  array();
        $res = $this->db->query("
            CREATE TABLE IF NOT EXISTS `".DB_PREFIX."testimonial` (
            `testimonial_id` int(11) NOT NULL AUTO_INCREMENT,
            `status` int(1) NOT NULL default 0,
            `sort_order` int(11) NOT NULL default 0,
            PRIMARY KEY (`testimonial_id`)
            )DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;");
        $res &= $this->db->query(
            "CREATE TABLE IF NOT EXISTS `".DB_PREFIX."testimonial_description`(
                `testimonial_id` int(10) unsigned NOT NULL,
                `language_id` int(10) unsigned NOT NULL,
                `image` varchar(255) collate utf8_bin ,
                `customer_name` varchar(255) collate utf8_bin NOT NULL,
                `content` text collate utf8_bin NOT NULL,
                PRIMARY KEY (`testimonial_id`,`language_id`)
                )
                DEFAULT CHARSET=utf8;");
        if($res){
            $sql[] = "INSERT INTO ".DB_PREFIX."testimonial VALUES ('2', '1', '2');";
            $sql[] = "INSERT INTO ".DB_PREFIX."testimonial VALUES ('3', '1', '1');";
            $sql[] = "INSERT INTO ".DB_PREFIX."testimonial VALUES ('4', '1', '4');";
            $sql[] = "INSERT INTO ".DB_PREFIX."testimonial VALUES ('5', '1', '5');";
            $sql[] = "INSERT INTO ".DB_PREFIX."testimonial_description VALUES ('1', '1', 'catalog/demo/testimonial/demo1.jpg',Mr Peter', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.');";
            $sql[] = "INSERT INTO ".DB_PREFIX."testimonial_description VALUES ('2', '1','catalog/demo/testimonial/demo1.jpg', 'Mr Test', 'Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. ');";
            $sql[] = "INSERT INTO ".DB_PREFIX."testimonial_description VALUES ('3', '1','catalog/demo/testimonial/demo2.jpg', 'Mrs Brown', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit');";
            $sql[] = "INSERT INTO ".DB_PREFIX."testimonial_description VALUES ('4', '1', 'catalog/demo/testimonial/demo1.jpg','Mr Test1', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit');";
            $sql[] = "INSERT INTO ".DB_PREFIX."testimonial_description VALUES ('5', '1', 'catalog/demo/testimonial/demo2.jpg','Mr Test2', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit');";
            foreach($sql as $q ){
                $query = $this->db->query( $q );
            }
            return $query;
        }
    }
	public function createTableBlog(){
		$sql =  array();
        $res = $this->db->query(
			"CREATE TABLE IF NOT EXISTS `".DB_PREFIX."article` (
				`article_id` int(11) NOT NULL AUTO_INCREMENT,
				`sort_order` int(11) NOT NULL DEFAULT '0',
				`status` tinyint(1) NOT NULL DEFAULT '0',
				`date_added` datetime NOT NULL,
				`date_modified` datetime NOT NULL,
				`image` varchar(255) DEFAULT NULL,
				`author` varchar(100) DEFAULT NULL,
				PRIMARY KEY (`article_id`)
			  )
			  DEFAULT CHARSET=utf8 ;");
        $res &= $this->db->query(
            "CREATE TABLE IF NOT EXISTS `".DB_PREFIX."article_description`(
                `article_id` int(11) NOT NULL,
				`language_id` int(11) NOT NULL,
				`name` varchar(255) NOT NULL,
				`description` text NOT NULL,
				`intro_text` text NOT NULL,
				`meta_title` varchar(255) NOT NULL,
				`meta_description` varchar(255) NOT NULL,
				`meta_keyword` varchar(255) NOT NULL,
				PRIMARY KEY (`article_id`,`language_id`),
				KEY `name` (`name`)
			  )
			  DEFAULT CHARSET=utf8;");
		if($res){
            $sql[] = "INSERT INTO oc_article VALUES (1, 1, 1, '2015-07-22 09:06:31', '2015-07-26 08:52:35', 'catalog/blog1.jpg', 'Plazathems');";
            $sql[] = "INSERT INTO oc_article VALUES (5, 1, 1, '2015-07-22 14:11:01', '2015-07-26 08:38:31', 'catalog/blog2.jpg', 'Plazathems');";
            $sql[] = "INSERT INTO oc_article VALUES (6, 1, 1, '2015-07-22 14:11:07', '2015-07-24 16:57:44', 'catalog/blog3.jpg', 'Plazathems');";
            $sql[] = "INSERT INTO oc_article VALUES (7, 1, 1, '2015-07-22 14:11:08', '2015-07-24 16:58:33', 'catalog/blog2.jpg', 'Plazathems');";
            $sql[] = "INSERT INTO oc_article VALUES (8, 1, 1, '2015-07-24 17:18:16', '2015-07-24 17:18:28', 'catalog/blog1.jpg', 'Plazathems');";
            $sql[] = "INSERT INTO oc_article VALUES (9, 1, 1, '2015-07-24 17:18:16', '2015-07-24 17:18:39', 'catalog/blog2.jpg', 'Plazathems');";
            $sql[] = "INSERT INTO oc_article VALUES (10, 1, 1, '2015-07-24 17:18:17', '2015-07-24 17:18:51', 'catalog/blog3.jpg', 'Plazathems');";
            $sql[] = "INSERT INTO oc_article VALUES (11, 1, 1, '2015-07-24 17:18:17', '2015-07-24 17:19:02', 'catalog/blog2.jpg', 'Plazathems');";
            $sql[] = "INSERT INTO oc_article_description VALUES (1, 1, 'Lorem ipsum dolor sit amet', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer...', 'Lorem ipsum dolor sit amet', '', '');";
			$sql[] = "INSERT INTO oc_article_description VALUES (5, 1, 'Lorem ipsum dolor sit amet', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer...', 'Lorem ipsum dolor sit amet', '', '');";
			$sql[] = "INSERT INTO oc_article_description VALUES (6, 1, 'Lorem ipsum dolor sit amet', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer...', 'Lorem ipsum dolor sit amet', '', '');";
			$sql[] = "INSERT INTO oc_article_description VALUES (7, 1, 'Lorem ipsum dolor sit amet', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer...', 'Lorem ipsum dolor sit amet', '', '');";
			$sql[] = "INSERT INTO oc_article_description VALUES (8, 1, 'Lorem ipsum dolor sit amet', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer...', 'Lorem ipsum dolor sit amet', '', '');";
			$sql[] = "INSERT INTO oc_article_description VALUES (9, 1, 'Lorem ipsum dolor sit amet', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer...', 'Lorem ipsum dolor sit amet', '', '');";
			$sql[] = "INSERT INTO oc_article_description VALUES (10, 1, 'Lorem ipsum dolor sit amet', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer...', 'Lorem ipsum dolor sit amet', '', '');";
			$sql[] = "INSERT INTO oc_article_description VALUES (11, 1, 'Lorem ipsum dolor sit amet', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt. Lorem ipsum dolor sit amet, consectetuer...', 'Lorem ipsum dolor sit amet', '', '');";
            foreach($sql as $q ){
                $query = $this->db->query( $q );
            }
            return $query;
        }
	}
	public function createTableSlideshow(){
			$sql = " SHOW TABLES LIKE '".DB_PREFIX."ocslideshow'";
			$query = $this->db->query( $sql );
			if( count($query->rows) >0 ){
				return true;
			}
			$sql = array();
			$sql[] = "
					CREATE TABLE IF NOT EXISTS `".DB_PREFIX."ocslideshow` (
						  `ocslideshow_id` int(11) NOT NULL AUTO_INCREMENT,
						  `name` varchar(64) NOT NULL,
						  `status` tinyint(1) NOT NULL,
						  `auto` tinyint(1) DEFAULT NULL,
						  `delay` int(11) DEFAULT NULL,
						  `hover` tinyint(1) DEFAULT NULL,
						  `nextback` tinyint(1) DEFAULT NULL,
						  `contrl` tinyint(1) DEFAULT NULL,
						  `effect` varchar(64) NOT NULL,
						  PRIMARY KEY (`ocslideshow_id`)
						) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
			";
			$sql[] = "
				CREATE TABLE IF NOT EXISTS `".DB_PREFIX."ocslideshow_image` (
				  `ocslideshow_image_id` int(11) NOT NULL AUTO_INCREMENT,
				  `ocslideshow_id` int(11) NOT NULL,
				  `link` varchar(255) NOT NULL,
				  `type` int(11) NOT NULL,
				  `banner_store` varchar(255) DEFAULT 0,
				  `image` varchar(255) NOT NULL,
				  `small_image` varchar(255) DEFAULT NULL,
				  PRIMARY KEY (`ocslideshow_image_id`)
				) ENGINE=MyISAM AUTO_INCREMENT=132 DEFAULT CHARSET=utf8;
				";
			$sql[] = "
					CREATE TABLE IF NOT EXISTS `".DB_PREFIX."ocslideshow_image_description` (
					  `ocslideshow_image_id` int(11) NOT NULL,
					  `language_id` int(11) NOT NULL,
					  `ocslideshow_id` int(11) NOT NULL,
					  `title` varchar(64) NOT NULL,
					  `sub_title` varchar(64) DEFAULT NULL,
					  `description` text,
					  PRIMARY KEY (`ocslideshow_image_id`,`language_id`)
					) ENGINE=MyISAM DEFAULT CHARSET=utf8;
			";
			
			foreach( $sql as $q ){
				$query = $this->db->query( $q );
			}
			return true;
			
	}
	
	
	public function reset() {
			//reset cms block 
			$this->db->query("TRUNCATE TABLE ". DB_PREFIX ."cmsblock");
			$this->db->query("TRUNCATE TABLE ". DB_PREFIX ."cmsblock_description");
			$this->db->query("TRUNCATE TABLE ". DB_PREFIX ."cmsblock_to_store");
			
			//uninstall module 
			$this->load->model('extension/extension');
			$this->load->model('extension/module');	
			$ex_modules = array(
				0 => 'ocslideshow',
				1 => 'cmsblock',
				2 => 'hozmegamenu',
				3 => 'easy_blog',
				4 => 'vermegamenu',
				5 => 'carousel',
				6 => 'newslettersubscribe',
				7 => 'ttcountdown',
				8 => 'octabcategoryslider',
				9 => 'ocsearchcategory'
			);
			
			foreach($ex_modules as $module) {
				$this->model_extension_extension->uninstall('module', $module);

				$this->model_extension_module->deleteModulesByCode($module);

				$this->load->model('setting/setting');

				$this->model_setting_setting->deleteSetting($module);
				// Call uninstall method if it exsits
				$this->load->controller('module/' . $module . '/uninstall');
				$this->load->model('blog/easy_blog');
				$this->model_blog_easy_blog->install();
			}
			
			$config_template = "config_template";
			$template = 'default'; 
			$this->db->query("UPDATE " . DB_PREFIX . "setting SET `value` = '" . $template . "' WHERE `key` = '" . $config_template . "' ");
			
		
			
	}
}
?>