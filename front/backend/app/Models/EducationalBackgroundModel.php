<?php
namespace App\Models;

use CodeIgniter\Model;

class EducationalBackgroundModel extends Model
{
    protected $table = 'EducationalBackground';
    protected $primaryKey = 'ID';
    protected $allowedFields = ['ApplicantID', 'college', 'schoolName', 'degreesObtained', 'inclusiveDates', 'yearGraduated'];


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
