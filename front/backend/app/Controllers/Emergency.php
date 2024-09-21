<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use CodeIgniter\API\ResponseTrait;
use App\Models\EmergencyContactInformationModel;
use CodeIgniter\RESTful\ResourceController;

class Emergency extends ResourceController
{
  
    use ResponseTrait;
    
    public function Eme()
    {
        $Emergency = new EmergencyContactInformationModel();
        $data = $this->request->getJSON();
        if ($Emergency->insert($data)) {
            return $this->respondCreated(['message' => 'Form submitted successfully']);
        } else {
            return $this->fail('Failed to submit form', 400);
        }
    }
}
