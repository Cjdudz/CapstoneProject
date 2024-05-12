<?php

namespace App\Controllers;

use App\Models\PersonalInformationModel;
use App\Models\EducationalBackgroundModel;
use App\Models\EmploymentOccupationalBackgroundModel;
use App\Models\AdditionalDataModel;
use App\Models\EmergencyContactInformationModel;
use CodeIgniter\RESTful\ResourceController;
use App\Controllers\BaseController;
use CodeIgniter\API\ResponseTrait;

class FormController extends ResourceController
{
    use ResponseTrait;

    public function passForm()
    {
        $data = $this->request->getJSON(true);

        // Validate and process the data as needed
        // For example, save the interview data to the database
        $interviewModel = new PersonalInformationModel();
        $interviewModel->insert($data);

        return $this->respond(['message' => 'Interview form submitted successfully']);
    }

   
    public function EducpassForm()
    {
        $data = $this->request->getJSON(true);

        // Validate and process the data as needed
        // For example, save the interview data to the database
        $interviewModel = new EducationalBackgroundModel();
        $interviewModel->insert($data);

        return $this->respond(['message' => 'Interview form submitted successfully']);
    }
    
}

