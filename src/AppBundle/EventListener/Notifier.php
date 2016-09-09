<?php
namespace AppBundle\EventListener;

use AppBundle\Entity\Notification;
use AppBundle\Entity\Task;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\ORM\Event\LifecycleEventArgs;
use Symfony\Component\HttpFoundation\Response;

/**
 * Class Notifier
 * @package AppBundle\EventListener
 */
class Notifier {

  private $subject;
  private $body;
  private $user;
  private $em;

  /**
   * @param \Doctrine\ORM\Event\LifecycleEventArgs $args
   */
  public function postUpdate(LifecycleEventArgs $args) {
    $entity = $args->getEntity();
    $this->em = $args->getEntityManager();
    $this->notifyRelatedUsers($entity, $this->em);
  }

  /**
   * @param \Doctrine\ORM\Event\LifecycleEventArgs $args
   */
  public function postPersist(LifecycleEventArgs $args) {
    $entity = $args->getEntity();
    $this->em = $args->getEntityManager();
    $this->notifyRelatedUsers($entity, $this->em);
  }

  /**
   * @param $entity
   * @param \Doctrine\ORM\EntityManagerInterface $em
   */
  public function notifyRelatedUsers($entity, EntityManagerInterface $em) {

    // Avoid infinite loop
    if($entity instanceof Notification) {
      return;
    }

    if ($entity instanceof Task) {
      $this->subject = $entity->getTitle();
      $this->body = "updates for task: " . $entity->getTitle();
      $this->user = $entity->getUser();
      $this->addNewNotification();
    }
  }

  /**
   * @return \Symfony\Component\HttpFoundation\Response
   */
  public function addNewNotification() {

    /**
     * @var EntityManagerInterface $manager
     */
    $manager = $this->em;

    $notification = new Notification();
    $notification->setSubject($this->subject);
    $notification->setBody($this->body);
    $notification->setUser($this->user);
    $notification->setCreatedAt(new \DateTime());
    $notification->setUpdatedAt(new \DateTime());

    $manager->persist($notification);
    $manager->flush();

    return new Response('Notification id ' . $notification->getId() . ' successfully created');
  }
}