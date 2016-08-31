<?php
namespace MyBundle;


class DefaultControllerTest extends \Codeception\Test\Unit
{
    /**
     * @var \MyBundle\UnitTester
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
        $this->tester->amOnRoute('mypage');
        $this->tester->seeResponseContains('Hello World!');
    }
}