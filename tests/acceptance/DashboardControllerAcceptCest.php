<?php


class DashboardControllerAcceptCest
{
    public function _before(AcceptanceTester $I)
    {
    }

    public function _after(AcceptanceTester $I)
    {
    }

    // tests
    public function testIndexAction(AcceptanceTester $I)
    {
        $I->wantTo('too see inside the dashboard area');
        $I->amOnPage('/dashboard');
        $I->see('This is a placeholder for dashboard area.');
        $I->wait(3);
    }
}
