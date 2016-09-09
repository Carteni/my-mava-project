<?php

// php vendor/bin/codecept run unit [WorkspaceControllerTest]

use Codeception\Util\Stub;

class WorkspaceControllerTest extends \Codeception\Test\Unit {
  /**
   * @var \UnitTester
   */
  protected $tester;

  protected function _before() {
    $this->tester->logIn($this->tester);
  }

  protected function _after() {
  }

  // tests
  public function testShowAction() {
    /*$workspaceId = $this->tester->grabFromRepository(
      'AppBundle:Workspace', 'id',
      array('name'=>'Writing')
    );
    $projectTitle = $this->tester->grabFromRepository(
      'AppBundle:Project', 'title',
      array('workspace'=>$workspaceId)
    );
    $this->assertEquals('Symfony book', $projectTitle, 'no match found');*/

    $this->tester->amOnRoute('workspace_show', array("id" => 1));
    $this->tester->seeResponseContains('accusantium');

  }
}