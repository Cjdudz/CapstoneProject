<?php

namespace App\Controllers;
use App\Models\IdModel;
use App\Models\PersonalInformationModel;
use App\Models\EducationalBackgroundModel;
use App\Models\EmploymentOccupationalBackgroundModel;
use App\Models\AdditionalDataModel;
use App\Models\EmergencyContactInformationModel;
use App\Models\UploadModel;

use CodeIgniter\RESTful\ResourceController;
use App\Controllers\BaseController;
use CodeIgniter\API\ResponseTrait;

use CodeIgniter\HTTP\Files\UploadedFile;
class FormController extends ResourceController
{
    use ResponseTrait;
    public function __construct()
    {
        $this->idModel = new \App\Models\IdModel();
        $this->personalInformationModel = new \App\Models\PersonalInformationModel();
        $this->educationalBackgroundModel = new \App\Models\EducationalBackgroundModel();
        $this->employmentOccupationalBackgroundModel = new \App\Models\EmploymentOccupationalBackgroundModel();
        $this->additionalDataModel = new \App\Models\AdditionalDataModel();
        $this->emergencyContactInformationModel = new \App\Models\EmergencyContactInformationModel();
        $this->uploadModel = new \App\Models\UploadModel();
    }
    public function passForm()
    {
        $data = $this->request->getJSON(true);

        // Validate and process the data as needed
        // For example, save the interview data to the database
        $interviewModel = new PersonalInformationModel();
        $interviewModel->insert($data);

        return $this->respond(['message' => 'Interview form submitted successfully']);
    }
    public function fetchData()
    {
        $data = [];

        // Fetch data from IdModel
        $data['id'] = $this->idModel->findAll();

        // Fetch data from PersonalInformationModel
        $data['personalInformation'] = $this->personalInformationModel->findAll();

        // Fetch data from EducationalBackgroundModel
        $data['educationalBackground'] = $this->educationalBackgroundModel->findAll();

        // Fetch data from EmploymentOccupationalBackgroundModel
        $data['employmentOccupationalBackground'] = $this->employmentOccupationalBackgroundModel->findAll();

        // Fetch data from AdditionalDataModel
        $data['additionalData'] = $this->additionalDataModel->findAll();

        // Fetch data from EmergencyContactInformationModel
        $data['emergencyContactInformation'] = $this->emergencyContactInformationModel->findAll();

        // Fetch data from UploadModel
        $data['upload'] = $this->uploadModel->findAll();

        // Return the data as a response
        return $this->respond($data);
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
        $uploadModel = new UploadModel();

        $file = $this->request->getFile('userfile');
        if ($file->isValid() && ! $file->hasMoved()) {
            $newName = $file->getRandomName();
            $file->move(WRITEPATH . 'uploads', $newName);

            $data = [
                'filename' => $newName,
                'filepath' => WRITEPATH . 'uploads/' . $newName,
                'filesize' => $file->getSize(),
                'filetype' => $file->getClientMimeType(),
            ];

            $uploadModel->insert($data);

            return $this->response->setStatusCode(200)->setJSON(['message' => 'File uploaded successfully']);
        }

        return $this->response->setStatusCode(400)->setJSON(['errors' => 'Failed to upload file.']);
    }
    public function files()
    {
        $uploadModel = new UploadModel();
        $files = $uploadModel->findAll();
    
        $fileData = [];
        foreach ($files as $file) {
            $fileData[] = [
                'name' => $file['filename'],
                'url' => base_url('uploads/' . $file['filename']),
                'size' => $file['filesize'],
                'type' => $file['filetype']
            ];
        }
    
        return $this->response->setStatusCode(200)->setJSON($fileData);
    }
    public function download($filename)
{
    $uploadModel = new UploadModel();
    $file = $uploadModel->where('filename', $filename)->first();

    if ($file) {
        $filepath = $file['filepath'];

        // Check if the file exists
        if (file_exists($filepath)) {
            // Set appropriate headers for file download and send the file to the client
            header('Content-Type: application/octet-stream');
            header('Content-Disposition: attachment; filename="' . basename($filepath) . '"');
            header('Content-Length: ' . filesize($filepath));
            readfile($filepath);
            exit;
        } else {
            // If the file doesn't exist, return an error response
            return $this->response->setStatusCode(404)->setJSON(['error' => 'File not found']);
        }
    } else {
        // If the file information is not found in the database, return an error response
        return $this->response->setStatusCode(404)->setJSON(['error' => 'File information not found']);
    }
}
    
}

