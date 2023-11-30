<?php

namespace App\Controllers;
use App\Controllers\BaseController;
use CodeIgniter\Restful\ResourceController;
use CodeIgniter\API\ResponseTrait;

use App\Models\ChatModel;

class ChatController extends Resource_Controller {
    public function __construct() {
      parent::__construct();
      $this->load->model('ChatModel');
    }
  
    public function index() {
      $this->load->view('chat');
    }
  
    public function getMessages() {
      $messages = $this->ChatModel->getMessages();
      echo json_encode($messages);
    }
  
    public function saveMessage() {
      $data = $this->input->post();
      $this->ChatModel->saveMessage($data);
      echo json_encode(['status' => 'success']);
    }
  }