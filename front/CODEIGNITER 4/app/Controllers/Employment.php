<?php

namespace App\Controllers;

use App\Controllers\BaseController;

use CodeIgniter\API\ResponseTrait;
use App\Models\EmploymentOccupationalBackgroundModel;
use CodeIgniter\RESTful\ResourceController;
class Employment extends ResourceController
{
    public function Employment()
    {
        $additional = new EmploymentOccupationalBackgroundModel();
        $data = $this->request->getJSON();
        if ($additional->insert($data)) {
            return $this->respondCreated(['message' => 'Form submitted successfully']);
        } else {
            return $this->fail('Failed to submit form', 400);
        }
    }
}
