<?php

namespace App\Models;

use CodeIgniter\Model;

class IdModel extends Model
{
    protected $table            = 'formData';
    protected $primaryKey       = 'id';
    protected $useAutoIncrement = true;
    protected $returnType       = 'array';
    protected $useSoftDeletes   = false;
    protected $protectFields    = true;
    protected $allowedFields    = [
        'idNo', 'auxiliaryDistrict', 'squadronNo', 'firstName', 'middleName',
        'lastName', 'maidenLastName', 'rankDesignationAuthority', 'homeAddress',
        'maritalStatus', 'weight', 'eyes', 'height', 'hair', 'bloodType',
        'sex', 'religion', 'dateOfBirth', 'identifyingData', 'emergencyContact',
        'emergencyContactAddress', 'emergencyContactNumber'
    ];

    // Dates
    protected $useTimestamps = true; // Enable timestamps
    protected $dateFormat    = 'datetime'; // Set datetime format
    protected $createdField  = 'created_at'; // Set created_at field name
    protected $updatedField  = 'updated_at'; // Set updated_at field name

    // Validation rules
    protected $validationRules = [
        'idNo' => 'required',
        'firstName' => 'required',
        'lastName' => 'required',
        // Add validation rules for other fields as needed
    ];

    // Validation messages
    protected $validationMessages = [
        'idNo' => [
            'required' => 'ID No. is required.'
        ],
        'firstName' => [
            'required' => 'First Name is required.'
        ],
        'lastName' => [
            'required' => 'Last Name is required.'
        ],
        // Add custom error messages for other fields as needed
    ];

    // Callbacks
    protected $allowCallbacks = true;

    // Callbacks: before insert
    protected $beforeInsert = [];

    // Callbacks: after insert
    protected $afterInsert = [];

    // Callbacks: before update
    protected $beforeUpdate = [];

    // Callbacks: after update
    protected $afterUpdate = [];

    // Callbacks: before find
    protected $beforeFind = [];

    // Callbacks: after find
    protected $afterFind = [];

    // Callbacks: before delete
    protected $beforeDelete = [];

    // Callbacks: after delete
    protected $afterDelete = [];
}
