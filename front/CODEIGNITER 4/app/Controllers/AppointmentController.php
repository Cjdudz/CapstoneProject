<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use CodeIgniter\Restful\ResourceController;
use CodeIgniter\API\ResponseTrait;
use App\Models\InterviewModel;

class AppointmentController extends ResourceController
{
    protected $modelName = 'App\Models\InterviewModel';
    protected $format    = 'json';

    public function index() // Use 'index' instead of 'appointment'
    {
        // Retrieve all appointments
        {
            $model = new InterviewModel();
            $appointments = $model->findAll();
         return $this->respond($appointments);
        }
    }

    // Other CRUD methods go here...
}
