<?php


class DashboardControllerTest extends \Codeception\Test\Unit
{
    /**
     * @var \UnitTester
     */
    protected $tester;

    protected function _before()
    {
    }

    protected function _after()
    {
    }

    // tests
    public function testIndexAction()
    {
        $this->tester->amOnRoute('dashboard_index');
        $this->tester->seeResponseContains('This is a placeholder for dashboard area.');
    }
}