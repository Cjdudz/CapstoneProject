<?php

namespace App\Controllers;
use CodeIgniter\API\ResponseTrait;
use App\Models\EducationalBackgroundModel;
use CodeIgniter\RESTful\ResourceController;
use App\Controllers\BaseController;

class EducationController extends ResourceController
{  
     use ResponseTrait;

    
     public function submitForm()
     {
         $educationModel = new EducationalBackgroundModel();
 
         $data = $this->request->getJSON();
 
         // Assuming your model is named EducationModel, adjust this accordingly
         if ($educationModel->insert($data)) {
             return $this->respondCreated(['message' => 'Form submitted successfully']);
         } else {
             return $this->fail('Failed to submit form', 400);
         }
     }
}
