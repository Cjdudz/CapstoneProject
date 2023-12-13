<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use CodeIgniter\Restful\ResourceController;
use App\Models\Page1P; // Add this line
use CodeIgniter\API\ResponseTrait;

class Page1 extends ResourceController
{
    protected $modelName = 'App\Models\Page1P';
    protected $format    = 'json';

    public function submitForm(){
        // Get JSON data from the request
        $data = $this->request->getJSON(true);

        // Validate and process the data as needed
        // For example, save the interview data to the database
        $page1PModel = new Page1P(); // Correct the variable name to match the model instance
        $page1PModel->insert($data); // Correct the method name to insert()

        return $this->respond(['message' => 'Interview form submitted successfully']);
    }
}
