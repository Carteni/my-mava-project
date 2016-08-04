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
}
