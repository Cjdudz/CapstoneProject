<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use CodeIgniter\Restful\ResourceController;
use CodeIgniter\API\ResponseTrait;
use App\Models\RcgaApplication;

class RcgaApplicationController extends ResourceController
{
    protected $modelName = 'App\Models\RcgaApplication';
    protected $format    = 'json';

    public function passForm()
    {
        $data = $this->request->getJSON(true);

        // Validate and process the data as needed
        // For example, save the interview data to the database
        $interviewModel = new RcgaApplication();
        $interviewModel->insert($data);

        return $this->respond(['message' => 'Interview form submitted successfully']);
    }

}

