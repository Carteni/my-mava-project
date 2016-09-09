<?php
namespace Helper;

// here you can define custom actions
// all public methods declared in helper class will be available in $I

class Unit extends \Codeception\Module {
  public function seeResponseContains($text) {
    $this->assertContains(
      $text,
      $this->getModule('Symfony')->_getResponseContent(),
      "response contains"
    );
  }

  /**
   * @param \UnitTester $tester
   */
  public function logIn(\UnitTester $tester) {
    $tester->amOnRoute('fos_user_security_login');
    $tester->seeInCurrentUrl('/login');
    $tester->fillField('_username', 'mava');
    $tester->fillField('_password', 'pass');
    $tester->click('_submit');
  }

}
