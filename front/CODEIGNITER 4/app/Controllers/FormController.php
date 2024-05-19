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
    public function upload()
    {
        $file = $this->request->getFile('userfile');
        if ($file->isValid() && ! $file->hasMoved()) {
            $file->move(WRITEPATH . 'uploads');
            return $this->response->setStatusCode(200)->setJSON(['message' => 'File uploaded successfully']);
        }
        return $this->response->setStatusCode(400)->setJSON(['errors' => 'Failed to upload file.']);
    }
        
    public function files()
    {
        $path = WRITEPATH . 'uploads';
        $files = array_diff(scandir($path), array('.', '..'));
    
        $fileData = [];
        foreach ($files as $file) {
            if (!is_dir($path . '/' . $file)) { // Exclude directories from the list
                $fileData[] = [
                    'name' => $file,
                    'url' => base_url('uploads/' . $file)
                ];
            }
        }
    
        return $this->response->setStatusCode(200)->setJSON($fileData);
    } public function download($filename)
    {
        $file = WRITEPATH . 'uploads/' . $filename;
    
        // Check if the file exists
        if (file_exists($file)) {
            // Set appropriate headers for file download and send the file to the client
            header('Content-Type: application/octet-stream');
            header('Content-Disposition: attachment; filename="' . basename($file) . '"');
            header('Content-Length: ' . filesize($file));
            readfile($file);
            exit;
        } else {
            // If the file doesn't exist, return an error response
            return $this->response->setStatusCode(404)->setJSON(['error' => 'File not found']);
        }
    }
    
}

