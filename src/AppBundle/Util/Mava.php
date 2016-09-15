<?php
namespace AppBundle\Util;

use AppBundle\Entity\Project;
use AppBundle\Entity\Task;
use Doctrine\ORM\EntityManagerInterface;

/**
 * Class Mava
 * @package AppBundle\Util
 */
class Mava {

  /**
   * @var EntityManagerInterface $em
   */
  private $em;

  /**
   * Mava constructor.
   * @param \Doctrine\ORM\EntityManagerInterface $em
   */
  public function __construct(EntityManagerInterface $em) {
    $this->em = $em;
  }

  /**
   * @param $wsId
   * @return int
   */
  public function finishedTasks($wsId) {
    $projects = $this->wsAllProjects($wsId);
    $taskRepo = $this->em->getRepository('AppBundle:Task');
    $total = 0;
    /**
     * @var Project $project
     */
    foreach ($projects as $project) {
      $total += count($taskRepo->getFinishedTasks($project->getId()));
    }
    return $total;
  }

  /**
   * @param $wsID
   * @return array
   */
  public function wsAllProjects($wsID) {
    return $this->em
      ->getRepository('AppBundle:Project')
      ->getAllProjects($wsID);
  }

  public function createTask(
    $taskName,
    $taskDesc,
    $taskDueDate,
    $taskStatus,
    $userId=null,
    $projectId=null) {

    $task = new Task();
    $task->setTitle($taskName);
    $task->setDescription($taskDesc);
    $task->setDueDate(new \DateTime($taskDueDate));
    $task->setStatus($taskStatus);

    if($projectId) {
      $project = $this->em->getRepository('AppBundle:Project');
      $task->setProject($project->find($projectId));
    }

    if($userId) {
      $user = $this->em->getRepository('AppBundle:User');
      $task->setUser($user->find($userId));
    }

    try {
      $this->em->persist($task);
      $this->em->flush();
      return true;
    } catch (\Exception $e) {
      throw $e;
    }
  }
}