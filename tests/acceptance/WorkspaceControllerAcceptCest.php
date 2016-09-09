<?php


class WorkspaceControllerAcceptCest
{
    public function _before(AcceptanceTester $I)
    {
        $I->wantToLogin($I);
    }

    public function _after(AcceptanceTester $I)
    {
    }

    // tests
    public function testShowAction(AcceptanceTester $I)
    {
        $I->wantTo('to see inside the \"Writing\" workspace');
        //$I->amOnPage('/workspace/writing');
        $I->amOnPage('/dashboard/workspace/1/show');
        //$I->see('Symfony Book');
        $I->see('accusantium');
        $I->wait(3);
    }
}
