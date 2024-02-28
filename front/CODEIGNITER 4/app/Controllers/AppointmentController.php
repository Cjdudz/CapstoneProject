<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use CodeIgniter\Restful\ResourceController;
use CodeIgniter\API\ResponseTrait;
use App\Models\RcgaApplication;

class AppointmentController extends ResourceController
{
    protected $modelName = 'App\Models\RcgaApplication';
    protected $format    = 'json';

    public function index() // Use 'index' instead of 'appointment'
    {
        // Retrieve all appointments
        {
            $model = new RcgaApplication();
            $appointments = $model->findAll();
         return $this->respond($appointments);
        }
    }
    public function accept()
    {
        $data = $this->request->getJSON();
        $appointmentId = $data->id;
    
        $model = new RcgaApplication();
        $appointment = $model->find($appointmentId);
    
        if (!$appointment) {
            return $this->failNotFound('Appointment not found');
        }
    
        if (array_key_exists('status', $appointment) && $appointment['status'] !== 'accepted') {
            $model->update($appointmentId, ['status' => 'accepted']);
    
            // Notify or push the 'accepted' status to an external system
            $this->notificationService->sendNotification($appointmentId, 'accepted');
    
            // Send email notification
            $this->sendEmailNotification($appointment['email'], 'Appointment Accepted', 'Your appointment has been accepted.');
    
            return $this->respond(['message' => 'Appointment accepted successfully']);
        }
    
        return $this->respond(['message' => 'Appointment was already accepted']);
    }
    
    private function sendNotification($to, $subject, $message)
    {
        // Load PHP Mailer library
        $this->load->library('email');
    
        // Prepare email
        $this->email->isHTML(true);
        $this->email->Subject = $subject;
        $this->email->Body = $message;
        $this->email->addAddress($to);
    
        // Send email
        if ($this->email->send()) {
            return true;
        } else {
            return false;
        }
    }
    

public function reject()
{
    $data = $this->request->getJSON();
    $appointmentId = $data->id;

    $model = new RcgaApplication();
    $appointment = $model->find($appointmentId);

    if (!$appointment) {
        return $this->failNotFound('Appointment not found');
    }

    if (array_key_exists('status', $appointment) && $appointment['status'] !== 'rejected') {
        $model->update($appointmentId, ['status' => 'rejected']);

        // Notify or push the 'rejected' status to an external system
        $this->notificationService->sendNotification($appointmentId, 'rejected');
    }

    return $this->respond(['message' => 'Appointment rejected successfully']);
}

public function UserStatus()
{
    // Get all users and their statuses
    $model = new RcgaApplication();
    $users = $model->findAll();

    // Prepare the response data
    $responseData = [];
    foreach ($users as $user) {
        $responseData[] = [
            'id' => $user['id'],
            'name' => $user['name'],
            'status' => $user['status'],
        ];
    }

    // Return JSON response
    return $this->respond($responseData);
}
}
