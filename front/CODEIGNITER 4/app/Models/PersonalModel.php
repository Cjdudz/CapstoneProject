<?php

namespace App\Models;

use CodeIgniter\Model;

class PersonalModel extends Model
{
    protected $table            = 'personal';
    protected $primaryKey       = 'id';
    protected $useAutoIncrement = true;
    protected $returnType       = 'array';
    protected $useSoftDeletes   = false;
    protected $protectFields    = true;
    protected $allowedFields    = [ 'last_name',
    'first_name',
    'middle_name',
    'rank',
    'pcgsn',
    'branch_of_service',
    'job_assignment',
    'business_address',
    'home_address',
    'birth_date',
    'place_of_birth',
    'change_in_name',
    'nicknames',
    'nationality',
    'tin',
    'national_registration_card',
    'religion',
    'blood_type',
    'sex',
    'age',
    'height',
    'weight',
    'build',
    'complexion',
    'eye_color',
    'hair_color',
    'scars',
    'marital_status',
    'spouse_name',
    'date_of_marriage',
    'spouse_occupation',
    'father_name',
    'father_dob',
    'father_address',
    'father_occupation',
    'father_citizenship',
    'mother_name',
    'mother_dob',
    'mother_address',
    'mother_occupation',
    'mother_citizenship',
    'siblings',
    'step_parent',
    'step_parent_address',
    'step_parent_occupation',
    'step_parent_citizenship',
    'elementary',
    'college',
    'post_graduate',
    'other_schools',
    'civil_service_eligibility',
    'enlistment_date',
    'commission_date',
    'source_of_commission',
    'important_unit_assignment',
    'military_schools',
    'decorations_and_awards',
    'residence_history',
    'employment_history',
    'dismissal_or_resignation',
    'foreign_countries_visited',
    'salary_dependency',
    'bank_accounts',
    'assets_and_liabilities_statement',
    'income_tax_return_filed',
    'credit_references',
    'arrest_record',
    'family_arrest_record',
    'administrative_case',
    'pd1081_detention',
    'intoxicants_usage',
    'character_references',
    'neighbors',
    'organizations',
    'hobbies',
    'language_dialect',
    'lie_detection_test'];

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
