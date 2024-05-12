<?php

use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */
$routes->get('/', 'Home::index');
$routes->match(['post','get'],'/api/registerAdmin', 'UserController::registerAdmin');
$routes->match(['post','get'],'/api/loginAdmin', 'UserController::loginAdmin');
$routes->match(['post','get'],'/api/register', 'UserController::register');
$routes->match(['post','get'],'/api/login', 'UserController::login');
$routes->get('api/getAgeChartData', 'OverviewController::getAgeChartData');
$routes->get( '/api/appointment', 'AppointmentController::index');
$routes->get('/api/users', 'UserController::users');
$routes->get('/api/overview', 'OverviewController::index');
$routes->post('/api/create', 'UserController::create_user'); // Route to create a new user
$routes->put('/api/update_user/(:num)', 'UserController::update_user/$1'); // Route to update a user by ID
$routes->delete('/api/delete/(:num)', 'UserController::delete_user/$1'); // Route to delete a user by ID
$routes->post('/api/submitForm', 'RcgaApplicationController::submitForm');
$routes->post('/api/submit-form', 'RcgaApplicationController::submitForm');
$routes->post('/api/passForm', 'RcgaApplicationController::passForm');
$routes->post('/api/submitForm', 'RcgaApplicationController::submitForm');  
$routes->post('/api/submit_interview_form', 'InterviewController::submitInterviewForm');
$routes->post('/api/Forms', 'InterviewController::Forms');
$routes->post('api/Page1/submitForm', 'Page1::submitForm');
$routes->post('/api/accept', 'AppointmentController::accept');
$routes->post('/api/reject', 'AppointmentController::reject');
$routes->get('/api/UserStatus', 'AppointmentController::UserStatus');
$routes->delete('/api/news/(:num)', 'News::delete/$1');
$routes->put('/api/UpdateNews/(:num)', 'News::update_news/$1');
$routes->post('/api/news', 'News::create');
$routes->get('/api/ShowNews', 'News::news');
$routes->post('/api/AddNews', 'News::CreateNews');
$routes->post('/api/Updates', 'Updates::create');
$routes->get('/api/showupdate', 'Updates::show');
$routes->put('/api/UpdateNews/(:num)', 'Updates::makeupdate/$1');
$routes->delete('/api/deletenews/(:num)', 'Updates::delete/$1');



$routes->post('/api/CreateDistrict', 'Districts::create');
$routes->get('/api/ShowDistricts', 'Districts::show');
$routes->put('/api/UpdateDistrict/(:num)', 'Districts::update/$1');
$routes->delete('/api/DeleteDistrict/(:num)', 'Districts::delete/$1');
$routes->post('/api/SubmitPersonalHistory', 'PersonalHistory::submitForm');  
$routes->post('/api/SubmitForm', 'IdForm::passForm');

$routes->post('/api/submitAll', 'FormController::passForm');
$routes->post('/api/sub', 'FormController::EducpassForm');
$routes->post('/api/submit', 'EducationController::submitForm');

$routes->post('/api/pass', 'Additional::index');

$routes->post('/api/passF', 'Emergency::eme');
$routes->post('/api/passFormE', 'Employment::Employment');
$routes->post('/api/passFormR', 'ReadinessInput::index');