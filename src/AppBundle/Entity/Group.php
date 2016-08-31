<?php
namespace AppBundle\Entity;

/**
 * Class Group
 * @package AppBundle\Entity
 */
class Group extends \FOS\UserBundle\Model\Group {

  /**
   * Group constructor.
   * @param $name
   * @param array $roles
   */
  public function __construct($name, $roles = array()) {
    parent::__construct($name, $roles);
  }
}