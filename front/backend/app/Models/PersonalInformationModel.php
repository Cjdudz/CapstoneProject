<?php

namespace App\Models;

use CodeIgniter\Model;

class PersonalInformationModel extends Model
{
    protected $table = 'PersonalInformation';
    protected $primaryKey = 'ID';
    protected $allowedFields = [
        'TypeOfApplication', 'LastName', 'FirstName', 'MiddleName', 'Suffix',
        'Gender', 'OtherNamesUsed', 'HomeAddress', 'MaritalStatus', 'SpouseName',
        'NumberOfChildren', 'Height', 'Weight', 'ColorOfEyes', 'ColorOfHair',
        'ScarsOrMarks', 'SSSorGSISNo', 'DateOfBirth', 'PlaceOfBirth', 'Citizenship',
        'Religion', 'BloodType', 'TelNoHome', 'TelNoBusiness', 'MobilePhone',
        'Email1', 'Email2', 'FaxNo', 'ACRNo', 'PassportNo', 'ExpiryDate',
        'TypeOfVisa', 'TINNo'
    ];

    // Dates
    protected $useTimestamps = false;
    protected $dateFormat    = 'datetime';
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';

    // Validation
    protected $validationRules      = [];
    protected $validationMessages   = [];
    protected $skipValidation       = false;
    protected $cleanValidationRules = true;

    // Callbacks
    protected $allowCallbacks = true;
    protected $beforeInsert   = [];
    protected $afterInsert    = [];
    protected $beforeUpdate   = [];
    protected $afterUpdate    = [];
    protected $beforeFind     = [];
    protected $afterFind      = [];
    protected $beforeDelete   = [];
    protected $afterDelete    = [];
}
