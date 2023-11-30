<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use CodeIgniter\Restful\ResourceController;
use CodeIgniter\API\ResponseTrait;
use App\Models\AppointmentModel;

class AppointmentController extends ResourceController
{
    protected $modelName = 'App\Models\AppointmentModel';
    protected $format    = 'json';

    public function index() // Use 'index' instead of 'appointment'
    {
        // Retrieve all appointments
        {
            $model = new AppointmentModel();
            $appointments = $model->findAll();
         return $this->respond($appointments);
        }
    }

    // Other CRUD methods go here...
}
