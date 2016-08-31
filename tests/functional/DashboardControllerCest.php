<?php


class DashboardControllerCest
{
    public function _before(FunctionalTester $I)
    {
    }

    public function _after(FunctionalTester $I)
    {
    }

    // tests
    public function testIndexAction(FunctionalTester $I)
    {
        $I->wantTo('too see inside the dashboard area');
        $I->amOnPage('/dashboard');
        $I->see('This is a placeholder for dashboard area.');
    }
}
