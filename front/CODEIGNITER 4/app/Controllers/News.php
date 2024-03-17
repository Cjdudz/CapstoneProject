<?php

namespace App\Controllers;

use App\Models\NewsModel;
use CodeIgniter\RESTful\ResourceController;
use App\Controllers\BaseController;
use CodeIgniter\API\ResponseTrait;

class News extends ResourceController
{
    protected $modelName = 'App\Models\NewsModel';
    protected $format    = 'json';

    // Retrieve all news articles
    public function index()
    {
        return $this->respond($this->model->findAll());
    }



    public function news($id = null)
    {
        $model = new NewsModel();
        $news = $model->findAll();

        return $this->respond($news);
    }


    public function CreateNews()
    {
        // Get JSON data from the request
        $data = $this->request->getJSON(true);

        // Validate and process the data as needed
        // For example, save the news article to the database
        $newsModel = new NewsModel(); // Instantiate the model
        $newsModel->insert($data); // Insert JSON data into the database using the model

        return $this->respond(['message' => 'News article submitted successfully']);
    }


    // Update a news article
    public function update_news($id)
    {
        $newsModel = new NewsModel();
    
        $data = [
            'title' => $this->request->getVar('title'), // Updated to 'title'
            'content' => $this->request->getVar('content'),
            // Add other fields as needed
        ];
    
        $newsModel->update($id, $data);
    
        return $this->respond(['msg' => 'News updated successfully']);
    }
    

    // Delete a news article
    public function delete($id = null)
    {
        if ($this->model->delete($id)) {
            return $this->respondDeleted(['id' => $id]);
        } else {
            return $this->fail($this->model->errors());
        }
    }
}
