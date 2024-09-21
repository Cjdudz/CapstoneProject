<?php

namespace App\Controllers;

use CodeIgniter\API\ResponseTrait;
use App\Models\AdditionalDataModel;
use CodeIgniter\RESTful\ResourceController;

class Additional extends ResourceController
{
    public function index()
    {
        $additional = new AdditionalDataModel();
        $data = $this->request->getJSON();
        if ($additional->insert($data)) {
            return $this->respondCreated(['message' => 'Form submitted successfully']);
        } else {
            return $this->fail('Failed to submit form', 400);
        }
    }
}
