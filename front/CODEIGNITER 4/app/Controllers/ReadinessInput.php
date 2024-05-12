<?php

namespace App\Controllers;

use CodeIgniter\API\ResponseTrait;
use App\Models\ReadinessInputM;
use CodeIgniter\RESTful\ResourceController;
use App\Controllers\BaseController;

class ReadinessInput extends ResourceController
{
    public function index()
    {
        $additional = new ReadinessInputM();
        $data = $this->request->getJSON();
        if ($additional->insert($data)) {
            return $this->respondCreated(['message' => 'Form submitted successfully']);
        } else {
            return $this->fail('Failed to submit form', 400);
        }
    }
}
