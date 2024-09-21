<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use CodeIgniter\Restful\ResourceController;
use CodeIgniter\API\ResponseTrait;
use App\Models\MembersModel;
use App\Models\AlertsModel;
use App\Models\RevenueModel;
use App\Models\ProjectsModel;
use App\Models\AgeDistributionModel;

class OverviewController extends ResourceController
{
    use ResponseTrait;

    public function index()
    {
        $data = [
            'memberCount' => $this->getMemberCount(),
            'activeAlertsCount' => $this->getActiveAlertsCount(),
            'totalRevenue' => $this->getTotalRevenue(),
            'totalProjects' => $this->getTotalProjects(),
            'ageChartData' => $this->getAgeChartData(),
        ];

        return $this->respond($data);
    }

    private function getMemberCount()
    {
        $membersModel = new MembersModel();
        return $membersModel->countAll();
    }

    private function getActiveAlertsCount()
    {
        $alertsModel = new AlertsModel();
        return $alertsModel->where('is_active', 1)->countAll();
    }

    private function getTotalRevenue()
    {
        $revenueModel = new RevenueModel();
        $totalRevenue = $revenueModel->selectSum('amount')->get()->getRow()->amount;
        return $totalRevenue ? number_format($totalRevenue, 2) : 0;
    }

    private function getTotalProjects()
    {
        $projectsModel = new ProjectsModel();
        return $projectsModel->countAll();
    }

    private function getAgeChartData()
    {
        $ageDistributionModel = new AgeDistributionModel();
        $data = $ageDistributionModel->findAll();

        $ages = [];
        $labels = [];

        foreach ($data as $item) {
            $labels[] = $item['age_group'];
            $ages[] = $item['count'];
        }

        return [
            'ages' => $ages,
            'labels' => $labels,
        ];
    }
}
