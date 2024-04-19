<?php

namespace App\Models;

use CodeIgniter\Model;

class RcgaApplication extends Model
{
    protected $table            = 'MembershipApplication';
    protected $primaryKey       = 'id';
    protected $useAutoIncrement = true;
    protected $returnType       = 'array';
    protected $useSoftDeletes   = false;
    protected $protectFields    = true;
    protected $allowedFields    = [
        // Personal Information
        'name', 'nationality', 'dob', 'passport', 'address', 'telephone', 'email', 'occupation', 'club', 'applicationDate',
        
        // Membership Application Page 1
        'lastName', 'firstName', 'middleName', 'suffix', 'maritalStatus', 'numChildren', 'sex', 'height', 'weight',
        
        // Membership Application Page 2
        'page2LastName', 'page2FirstName', 'middleInitial', 'page2Suffix', 'telHome', 'telBusiness',
        
        // Membership Application Page 3
        'page3LastName', 'page3FirstName', 'page3MiddleInitial', 'page3Suffix', 'page3TelHome', 'page3TelBusiness',
        
        // Membership Application Page 4
        'page4LastName', 'page4FirstName', 'page4MiddleInitial', 'page4Suffix', 'page4TelHome', 'page4TelBusiness',
        
        // Personal History
        'personalHistoryName', 'personalHistoryAddress', 'personalHistoryAge', 'personalHistoryHeight', 'personalHistoryWeight', 'physicalCondition',
        
        // Marital History
        'spouseName', 'marriageDetails', 'children', 'residence', 'citizenship',
        
        // Father in Law
        'fatherInLawBirth', 'fatherInLawAddress', 'fatherInLawOccupation', 'fatherInLawEmployment', 'fatherInLawEducation', 'fatherInLawCourses', 'fatherInLawEligibility',
        
        // Military History
        'militaryHistoryDateEntered', 'militaryHistorySourceOfCommission',
        
        // Foreign Countries Visited
        'visit1Country', 'visit1Purpose', 'visit1Date', 'visit2Country', 'visit2Purpose', 'visit2Date', 'visit3Country', 'visit3Purpose', 'visit3Date',
        
        // Neighbors at Present Residence
        'neighborAddress',
        
        // Organization or Social Groups
        'organizationMembership',
        
        // Miscellaneous
        'miscellaneousAddress',
        
        // Languages and Dialects
        'languageWrite',
        
        // Certification
        'certificationSignedAt', 'certificationDate', 'certificationLeftThumbmark', 'certificationRightThumbmark', 'certificationWitness1', 'certificationWitness2',
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
