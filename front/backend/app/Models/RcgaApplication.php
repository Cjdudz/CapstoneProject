<?php

namespace App\Models;

use CodeIgniter\Model;

class RcgaApplication extends Model
{
    protected $table            = 'applicationForm';
    protected $primaryKey       = 'id';
    protected $useAutoIncrement = true;
    protected $returnType       = 'array';
    protected $useSoftDeletes   = false;
    protected $protectFields    = true;
    protected $allowedFields = [
        'field1',
        'field2',
        'type_of_application',
        'last_name',
        'first_name',
        'middle_name',
        'suffix',
        'gender',
        'other_names_used',
        'home_address',
        'marital_status',
        'college',
        'school_name',
        'degrees_obtained',
        'inclusive_dates',
        'year_graduated',
        'employment_status',
        'company',
        'nature_of_office',
        'past_or_current_government_position',
        'highest_appointment_or_elected_office',
        'professional_licenses',
        'special_training',
        'special_interests_or_skills',
        'height',
        'weight',
        'color_of_eyes',
        'color_of_hair',
        'scars_or_marks',
        'sss_gsis_no',
        'date_of_birth',
        'citizenship',
        'religion',
        'blood_type',
        'tel_no_home',
        'tel_no_business',
        'mobile_phone',
        'email1',
        'email2',
        'fax_no',
        'acr_no',
        'passport_no',
        'type_of_visa',
        'tin_no',
        'emergency_last_name',
        'emergency_first_name',
        'emergency_middle_initial',
        'emergency_suffix',
        'emergency_relationship',
        'emergency_address',
        'emergency_tel_no_home',
        'emergency_tel_no_business',
        'emergency_mobile_phone',
        'functions_involved',
        'purpose',
        'willing_to_be_trained',
        'willing_to_travel',
        'available_24_hrs',
        'days_advance_notice',
        'organization',
        'place_date_of_membership',
        'position_held',
        'nbi_clearance',
        'police_clearance',
        'barangay_clearance',
        'orientation_seminar_certificate',
        'conviction_status',
        'conviction_details',
        'sponsor_name',
        'date1',
        'applicant_name',
        'thumbprints',
        'photo',
        'applicant_status',
        'reason_for_not_accepted',
        'date2'
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