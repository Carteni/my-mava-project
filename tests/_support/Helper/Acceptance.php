<?php
namespace Helper;

// here you can define custom actions
// all public methods declared in helper class will be available in $I

class Acceptance extends \Codeception\Module {
  public function wantToLogin(\FunctionalTester $I) {
    $I->wantTo('to login in Mava app');
    $I->amOnPage('/login');
    $I->fillField('_username', 'mava');
    $I->fillField('_password', 'pass');
    $I->click('_submit');
  }
}
