<?php

// app/Controllers/InterviewController.php

namespace App\Controllers;

use CodeIgniter\Restful\ResourceController;
use App\Models\InterviewModel; // Add this line
use CodeIgniter\API\ResponseTrait;
use App\Controllers\BaseController;

class InterviewController extends ResourceController
{
    use ResponseTrait;

    protected $modelName = 'App\Models\InterviewModel';
    protected $format    = 'json';

    public function submitInterviewForm()
    {
        $data = $this->request->getJSON(true);

        // Validate and process the data as needed
        // For example, save the interview data to the database
        $interviewModel = new InterviewModel();
        $interviewModel->insert($data);

        return $this->respond(['message' => 'Interview form submitted successfully']);
    }
    public function Forms()
{
    $data = $this->request->getJSON(true);

    // Debugging
    var_dump($data);

    // Validate and process the data as needed
    // For example, save the interview data to the database
    $interviewModel = new InterviewModel();
    $interviewModel->insert($data);

    return $this->respond(['message' => 'Interview form submitted successfully']);
}
  

}
