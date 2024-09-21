<?php

namespace App\Controllers;


use CodeIgniter\RESTful\ResourceController;
use App\Controllers\BaseController;
use CodeIgniter\API\ResponseTrait;
use App\Models\IdModel;

class IdForm extends ResourceController
{
    public function passForm()
    {
        $data = $this->request->getJSON(true);

        // Validate and process the data as needed
        // For example, save the interview data to the database
        $interviewModel = new IdModel();
        $interviewModel->insert($data);

        return $this->respond(['message' => 'Interview form submitted successfully']);
    }
}
