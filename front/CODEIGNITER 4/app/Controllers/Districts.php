<?php

namespace App\Controllers;
use App\Models\DistrictsModel;
use CodeIgniter\RESTful\ResourceController;
use App\Controllers\BaseController;
use CodeIgniter\API\ResponseTrait;

class Districts extends ResourceController
{
    protected $modelName = 'App\Models\DistrictsModel';
    protected $format = 'json';

    // Retrieve all districts
    public function index()
    {
        return $this->respond($this->model->findAll());
    }

    // Retrieve a single district by ID
    public function show($id = null)
    {
        $district = $this->model->find($id);
        if ($district === null) {
            return $this->failNotFound('District not found');
        }
        return $this->respond($district);
    }

    // Create a new district
    public function create()
    {
        $data = $this->request->getJSON(true);

        // Validate data as needed

        $districtModel = new DistrictsModel();
        $districtModel->insert($data);

        return $this->respondCreated(['message' => 'District created successfully']);
    }

    // Update a district
    public function update($id = null)
    {
        $data = $this->request->getJSON(true);

        // Validate data as needed

        $districtModel = new DistrictsModel();
        $districtModel->update($id, $data);

        return $this->respond(['message' => 'District updated successfully']);
    }

    // Delete a district
    public function delete($id = null)
    {
        $districtModel = new DistrictsModel();

        if ($districtModel->delete($id)) {
            return $this->respondDeleted(['message' => 'District deleted successfully']);
        } else {
            return $this->failServerError('An error occurred while deleting district');
        }
    }
}