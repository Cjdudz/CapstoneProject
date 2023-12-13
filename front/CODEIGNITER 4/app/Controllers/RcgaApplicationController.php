<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use CodeIgniter\Restful\ResourceController;
use CodeIgniter\API\ResponseTrait;
use App\Models\RcgaApplication;

class RcgaApplicationController extends ResourceController
{
    use ResponseTrait;

    public function index()
    {
        // Implement if needed
    }

    public function submitForm()
    {
        try {
            // Get JSON data from the request
            $data = $this->request->getJSON();

            // Perform necessary validation (adjust this based on your validation rules)
            $validation = service('validation');
            $validation->setRules([
                'name' => 'required|max_length[255]',
                'nationality' => 'required|max_length[255]',
                // Add validation rules for other fields
            ]);

            if (!$validation->run($data)) {
                return $this->failValidationErrors($validation->getErrors());
            }

            // Save data to the database
            $rcgaApplicationModel = new RcgaApplication();
            $rcgaApplicationModel->insert($data);

            // Respond with success message
            return $this->respond(['message' => 'Form submitted successfully']);
        } catch (\Exception $e) {
            // Handle exceptions (e.g., database errors)
            return $this->failServerError('Error submitting form: ' . $e->getMessage());
        }
    }
}
