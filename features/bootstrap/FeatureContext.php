<?php

/**
 * Defines application features from the specific context.
 */
class FeatureContext extends \Behat\MinkExtension\Context\MinkContext
  implements \Behat\Behat\Context\SnippetAcceptingContext {
  /**
   * Initializes context.
   *
   * Every scenario gets its own context instance.
   * You can also pass arbitrary arguments to the
   * context constructor through behat.yml.
   */
  public function __construct() {
  }

  /**
   * @When /^I press more$/
   */
  public function iPressMore() {

    $this
      ->getSession()        // the browser
      ->getPage()           // the Document Element
      ->findButton('more')  // the NodeElement
      ->press();            // Action taken on Button

    //throw new \Behat\Behat\Tester\Exception\PendingException();
  }

  /**
   * @Given I am logged in as admin
   */
  public function iAmLoggedInAsAdmin()
  {
    throw new \Behat\Behat\Tester\Exception\PendingException();
  }

  /**
   * @Given There are :arg1 workspaces
   */
  public function thereAreWorkspaces($arg1)
  {
    throw new \Behat\Behat\Tester\Exception\PendingException();
  }

  /**
   * @When I click on :arg1
   */
  public function iClickOn($arg1)
  {
    throw new \Behat\Behat\Tester\Exception\PendingException();
  }

  /**
   * @Then I should see :arg1 items in the table
   */
  public function iShouldSeeItemsInTheTable($arg1)
  {
    throw new \Behat\Behat\Tester\Exception\PendingException();
  }

  /**
   * @When I fill the :arg1 with :arg2
   */
  public function iFillTheWith($arg1, $arg2)
  {
    throw new \Behat\Behat\Tester\Exception\PendingException();
  }

    /**
     * @Given I log in as Jack
     */
    public function iLogInAsJack()
    {
        //throw new \Behat\Behat\Tester\Exception\PendingException();
      $this->visit('/login');
      $this->fillField('username', 'Jack');
      $this->fillField('password', 'jackpass');
      $this->pressButton('_submit');
    }

    /**
     * @Given I visit :arg1
     */
    public function iVisit($arg1)
    {
      $this->visit('/dashboard');
        //throw new \Behat\Behat\Tester\Exception\PendingException();
    }
}
