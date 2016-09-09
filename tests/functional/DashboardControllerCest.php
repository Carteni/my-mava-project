<?php

// php vendor/bin/codecept run functional [DashboardControllerCest]

class DashboardControllerCest
{
    public function _before(FunctionalTester $I)
    {
        $I->wantToLogin($I);
    }

    public function _after(FunctionalTester $I)
    {
    }

    // tests
    public function testIndexAction(FunctionalTester $I)
    {
        $I->wantTo('to see inside the dashboard area');
        $I->amOnPage('/dashboard');
        $I->see('This is a placeholder for dashboard area.');

    }
}
