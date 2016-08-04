<?php
namespace AppBundle\DataFixtures\ORM;

use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\DataFixtures\OrderedFixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;
use AppBundle\Entity\User;

class LoadUsers extends AbstractFixture implements OrderedFixtureInterface {

  /**
   * Load data fixtures with the passed EntityManager
   *
   * @param ObjectManager $manager
   */
  public function load(ObjectManager $manager) {

    $user1 = new User();
    $user1->setName('John');
    $user1->setBio('He is a cool guy');
    $user1->setEmail('john@mava.info');
    $this->addReference('user-john', $user1);
    $manager->persist($user1);

    $user2 = new User();
    $user2->setName('Jack');
    $user2->setBio('He is a cool guy too');
    $user2->setEmail('jack@mava.info');
    $this->addReference('user-jack', $user2);
    $manager->persist($user2);

    $manager->flush();
  }

  /**
   * Get the order of this fixture
   *
   * @return integer
   */
  public function getOrder() {
    return 30;
  }
}