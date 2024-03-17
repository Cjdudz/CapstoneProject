<?php

namespace App\Controllers;

use App\Models\UpdateModel;
use CodeIgniter\RESTful\ResourceController;
use App\Controllers\BaseController;
use CodeIgniter\API\ResponseTrait;

class Updates extends ResourceController
{
    protected $modelName = 'App\Models\UpdateModel';
    protected $format = 'json';

    // Retrieve all updates
    public function index()
    {
        $updateModel = new UpdateModel();
        $updates = $updateModel->findAll();

        return $this->respond($updates);
    }

    // Retrieve a single update
    public function show($id = null)
    {
        $updateModel = new UpdateModel();
        $update = $updateModel->find($id);

        if (!$update) {
            return $this->failNotFound('Update not found.');
        }

        return $this->respond($update);
    }

    // Create a new update
    public function create()
    {
        // Assuming you receive JSON data from the request
        $data = $this->request->getJSON(true);

        // Validate and process the data as needed

        $updateModel = new UpdateModel();
        $updateModel->insert($data);

        return $this->respondCreated(['message' => 'Update submitted successfully']);
    }

    // Update an existing update
    public function makeupdate($id = null)
    {
        $updateModel = new UpdateModel();

        // Retrieve JSON data from the request
        $data = $this->request->getJSON(true);

        // Validate and process the data as needed

        // Update the record in the database
        $updateModel->update($id, $data);

        return $this->respond(['message' => 'Update updated successfully']);
    }

    // Delete an update
    public function delete($id = null)
    {
        $updateModel = new UpdateModel();

        // Attempt to delete the record
        if ($updateModel->delete($id)) {
            return $this->respondDeleted(['id' => $id]);
        } else {
            return $this->failServerError('Failed to delete update.');
        }
    }
}
