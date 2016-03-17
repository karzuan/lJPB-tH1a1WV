<?php

class ControllerModuleOpcajaxlogin extends Controller {

    public function index() {

        $this->load->language('module/opcajaxlogin'); // loads the language file of Ajax Login

        $enable_status = $this->config->get('opcajaxlogin_status');
        if($enable_status == '1') {
            $data['enable_status'] = true;
        } else {
            $data['enable_status'] = false;
        }

        $enable_redirect = $this->config->get('opcajaxlogin_redirect_status');
        if($enable_redirect == '1') {
            $data['enable_redirect'] = true;
        } else {
            $data['enable_redirect'] = false;
        }

        $loader_img = $this->config->get('opcajaxlogin_loader_img');
        if($loader_img) {
            $data['loader_img'] = $this->config->get('config_url') . 'image/' . $loader_img;
        }

        $data['heading_title'] = $this->language->get('heading_title'); // set the heading_title of the module
        $data['ajax_login_content'] = $this->load->controller('module/ajaxlogin');
        $data['ajax_register_content'] = $this->load->controller('module/ajaxregister');
        $data['ajax_success_content'] = $this->load->controller('module/ajaxregister/success');
        $data['ajax_logoutsuccess_content'] = $this->load->controller('module/ajaxlogin/logoutsuccess');

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/opcajaxlogin/opcajaxlogin.tpl')) {
            return $this->load->view($this->config->get('config_template') . '/template/module/opcajaxlogin/opcajaxlogin.tpl', $data);
        } else {
            return $this->load->view('default/template/module/opcajaxlogin/opcajaxlogin.tpl', $data);
        }
    }
}