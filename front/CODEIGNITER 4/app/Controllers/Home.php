<?php

namespace App\Controllers;
use CodeIgniter\RESTful\ResourceController;


class Home extends ResourceController
{
    public function index(): string
    {
        return view('welcome_message');
    }
    public function upload()
    {
        $file = $this->request->getFile('file');

        if ($file->isValid() && !$file->hasMoved()) {
            $newName = $file->getRandomName();
            $file->move(WRITEPATH . 'uploads', $newName);

            $response = [
                'status' => 200,
                'error' => null,
                'messages' => [
                    'success' => 'File has been uploaded',
                    'file_name' => $newName
                ]
            ];

            return $this->respond($response);
        }

        $response = [
            'status' => 500,
            'error' => $file->getErrorString(),
            'messages' => [
                'error' => 'Failed to upload file'
            ]
        ];

        return $this->respond($response);
    }
}
