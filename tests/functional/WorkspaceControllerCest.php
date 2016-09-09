<?php

// php vendor/bin/codecept run functional [WorkspaceControllerCest]

class WorkspaceControllerCest {
  public function _before(FunctionalTester $I) {
    $I->wantToLogin($I);
  }

  public function _after(FunctionalTester $I) {
  }

  // tests
  public function testShowAction(FunctionalTester $I) {
    //$I->wantTo('to see inside the \"Writing\" workspace');
    //$I->amOnPage('/workspace/writing');
    //$I->see('Symfony Book');

    $I->wantTo('to see inside the \"accusantium\" workspace');
    $I->amOnPage('/dashboard/workspace/1/show');
    $I->see('accusantium');
  }
}
