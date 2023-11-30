<?php

use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */
$routes->get('/', 'Home::index');
$routes->match(['post','get'],'/api/register', 'UserController::register');
$routes->match(['post','get'],'/api/login', 'UserController::login');
$routes->get( '/api/appointment', 'AppointmentController::index');
$routes->get('/api/users', 'UserController::users');
$routes->get('/api/overview', 'OverviewController::index');
$routes->post('/api/create', 'UserController::create_user'); // Route to create a new user
$routes->put('/api/update_user/(:num)', 'UserController::update_user/$1'); // Route to update a user by ID
$routes->delete('/api/delete/(:num)', 'UserController::delete_user/$1'); // Route to delete a user by ID

