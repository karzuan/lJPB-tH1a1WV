<?php
class ControllerModuleOpcajaxlogin extends Controller {
    private $error = array();

    public function install() {
        $config = array(
            'opcajaxlogin_status' => 1,
            'opcajaxlogin_loader_img' => 'catalog/AjaxLoader.gif'
        );
        $this->load->model('setting/setting');
        $this->model_setting_setting->editSetting('opcajaxlogin', $config);
    }

    public function index() {
        // Loading the language file of Ajax Login
        $this->load->language('module/opcajaxlogin');

        // Set the title of the page to the heading title in the Language file i.e.,
        $this->document->setTitle($this->language->get('heading_title'));

        // Load the Setting Model  (All of the OpenCart Module & General Settings are saved using this Model )
        $this->load->model('setting/setting');
        $this->load->model('tool/image');

        // Start If: Validates and check if data is coming by save (POST) method
        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $post_data = $this->request->post;

            // Parse all the coming data to Setting Model to save it in database.
            $this->model_setting_setting->editSetting('opcajaxlogin', $post_data);

            // To display the success text on data save
            $this->session->data['success'] = $this->language->get('text_success');

            // Redirect to the Module Listing
            $this->response->redirect($this->url->link('module/opcajaxlogin', 'token=' . $this->session->data['token'], 'SSL'));
        }

        // Assign the language data for parsing it to view
        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_edit'] = $this->language->get('text_edit');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['text_module'] = $this->language->get('text_module');
        $data['text_edit'] = $this->language->get('text_edit');
        $data['text_success'] = $this->language->get('text_success');

        $data['entry_image'] = $this->language->get('entry_image');
        $data['entry_status'] = $this->language->get('entry_status');
        $data['entry_redirect_status'] = $this->language->get('entry_redirect_status');
        $data['entry_loader_img'] = $this->language->get('entry_loader_img');


        $data['button_upload'] = $this->language->get('button_upload');
        $data['button_clear'] = $this->language->get('button_clear');
        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_module'),
            'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('module/opcajaxlogin', 'token=' . $this->session->data['token'], 'SSL')
        );

        $data['action'] = $this->url->link('module/opcajaxlogin', 'token=' . $this->session->data['token'], 'SSL');

        $data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

        if (isset($this->request->post['opcajaxlogin_status'])) {
            $data['opcajaxlogin_status'] = $this->request->post['opcajaxlogin_status'];
        } else {
            $data['opcajaxlogin_status'] = $this->config->get('opcajaxlogin_status');
        }

        if (isset($this->request->post['opcajaxlogin_redirect_status'])) {
            $data['opcajaxlogin_redirect_status'] = $this->request->post['opcajaxlogin_redirect_status'];
        } else {
            $data['opcajaxlogin_redirect_status'] = $this->config->get('opcajaxlogin_redirect_status');
        }

        if (isset($this->request->post['opcajaxlogin_loader_img'])) {
            $data['opcajaxlogin_loader_img'] = $this->request->post['opcajaxlogin_loader_img'];
        } else {
            $data['opcajaxlogin_loader_img'] = $this->config->get('opcajaxlogin_loader_img');
        }

        if (isset($this->request->post['opcajaxlogin_loader_img']) && is_file(DIR_IMAGE . $this->request->post['opcajaxlogin_loader_img'])) {
            $data['thumb'] = $this->model_tool_image->resize($this->request->post['opcajaxlogin_loader_img'], 50, 50);
        } elseif (is_file(DIR_IMAGE . $this->config->get('opcajaxlogin_loader_img'))) {
            $data['thumb'] = $this->model_tool_image->resize($this->config->get('opcajaxlogin_loader_img'), 50, 50);
        } else {
            $data['thumb'] = $this->model_tool_image->resize('no_image.png', 50, 50);
        }
        $data['placeholder'] = $this->model_tool_image->resize('no_image.png', 50, 50);

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('module/opcajaxlogin.tpl', $data));
    }

    protected function validate() {
        if (!$this->user->hasPermission('modify', 'module/opcajaxlogin')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        return !$this->error;
    }
}