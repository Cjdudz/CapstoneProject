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

class RcgaApplicationController extends ResourceController
{
    public function submitForm()
    {
        // Process personal information form data
        $personalInfoModel = new PersonalInformationModel();
        $personalInfoModel->insert($this->request->getPost('personalInfo'));

        // Process educational background form data
        $educationModel = new EducationalBackgroundModel();
        $educationModel->insert($this->request->getPost('educationInfo'));

        // Process employment occupational background form data
        $employmentModel = new EmploymentOccupationalBackgroundModel();
        $employmentModel->insert($this->request->getPost('employmentInfo'));

        // Process additional data form data
        $additionalModel = new AdditionalDataModel();
        $additionalModel->insert($this->request->getPost('additionalData'));

        // Process emergency contact information form data
        $emergencyContactModel = new EmergencyContactInformationModel();
        $emergencyContactModel->insert($this->request->getPost('emergencyContact'));

        // Redirect or send response as needed
    }
}