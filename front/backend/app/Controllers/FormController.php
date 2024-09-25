<?php

namespace App\Controllers;

use App\Models\IdModel;
use App\Models\PersonalInformationModel;
use App\Models\EducationalBackgroundModel;
use App\Models\EmploymentOccupationalBackgroundModel;
use App\Models\AdditionalDataModel;
use App\Models\EmergencyContactInformationModel;
use App\Models\UploadModel;
use App\Models\UserModel;

use CodeIgniter\RESTful\ResourceController;
use CodeIgniter\API\ResponseTrait;

class FormController extends ResourceController
{
    use ResponseTrait;

    protected $idModel;
    protected $personalInformationModel;
    protected $educationalBackgroundModel;
    protected $employmentOccupationalBackgroundModel;
    protected $additionalDataModel;
    protected $emergencyContactInformationModel;
    protected $uploadModel;

    public function __construct()
    {
        $this->idModel = new IdModel();
        $this->personalInformationModel = new PersonalInformationModel();
        $this->educationalBackgroundModel = new EducationalBackgroundModel();
        $this->employmentOccupationalBackgroundModel = new EmploymentOccupationalBackgroundModel();
        $this->additionalDataModel = new AdditionalDataModel();
        $this->emergencyContactInformationModel = new EmergencyContactInformationModel();
        $this->uploadModel = new UploadModel();
    }

    public function passForm()
    {
        $data = $this->request->getJSON(true);

        // Validate and process the data as needed
        $this->personalInformationModel->insert($data);

        return $this->respond(['message' => 'Interview form submitted successfully']);
    }

    public function fetchData()
    {
        $data = [];

        // Fetch data from various models
        $data['id'] = $this->idModel->findAll();
        $data['personalInformation'] = $this->personalInformationModel->findAll();
        $data['educationalBackground'] = $this->educationalBackgroundModel->findAll();
        $data['employmentOccupationalBackground'] = $this->employmentOccupationalBackgroundModel->findAll();
        $data['additionalData'] = $this->additionalDataModel->findAll();
        $data['emergencyContactInformation'] = $this->emergencyContactInformationModel->findAll();
        $data['upload'] = $this->uploadModel->findAll();

        return $this->respond($data);
    }

    public function EducpassForm()
    {
        $data = $this->request->getJSON(true);

        // Validate and process the data as needed
        $this->educationalBackgroundModel->insert($data);

        return $this->respond(['message' => 'Interview form submitted successfully']);
    }

    public function upload()
    {
        $files = $this->request->getFiles();
        $fileData = [];
        $token = $this->request->getHeaderLine('Authorization');
        $userModel = new UserModel();
        $user = $userModel->where('token',$token)->first();

        foreach ($files as $key => $file) {
            if ($file->isValid() && !$file->hasMoved()) {
                $newName = $file->getRandomName();
                $file->move(WRITEPATH . 'uploads', $newName);

                $data = [
                    'filename' => $newName,
                    'filepath' => WRITEPATH . 'uploads/' . $newName,
                    'filesize' => $file->getSize(),
                    'filetype' => $file->getClientMimeType(),
                    'type' => $key, // Storing the type of document (birthCertificate, validId, nso)
                ];

                $this->uploadModel->insert($data);
                $fileData[] = $data;

            } else {
                return $this->response->setStatusCode(400)->setJSON(['errors' => 'Failed to upload file: ' . $file->getErrorString()]);
            }
        }
        
        // $body =  view('emails/application', ['userName' => $user['username']]);
        // send_email([$user['email']], "Application Form - Completed", $body);
        // send_sms($user['mobile_number'], "Hi");
        return $this->response->setStatusCode(200)->setJSON(['message' => 'Files uploaded successfully', 'files' => $fileData]);
    }

    public function files()
    {
        $files = $this->uploadModel->findAll();

        $fileData = [];
        foreach ($files as $file) {
            $fileData[] = [
                'name' => $file['filename'],
                'url' => base_url('uploads/' . $file['filename']),
                'size' => $file['filesize'],
                'type' => $file['filetype'],
            ];
        }

        return $this->response->setStatusCode(200)->setJSON($fileData);
    }

    public function download($filename)
    {
        $file = $this->uploadModel->where('filename', $filename)->first();

        if ($file) {
            $filepath = $file['filepath'];

            if (file_exists($filepath)) {
                return $this->response->download($filepath, null)->setFileName(basename($filepath));
            } else {
                return $this->response->setStatusCode(404)->setJSON(['error' => 'File not found']);
            }
        } else {
            return $this->response->setStatusCode(404)->setJSON(['error' => 'File information not found']);
        }
    }
}
