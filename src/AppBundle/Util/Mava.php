<?php
namespace AppBundle\Util;

use AppBundle\Entity\Project;
use AppBundle\Entity\TaskRepository;
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

  public function __construct(EntityManagerInterface $em) {
    $this->em = $em;
  }

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

  public function wsAllProjects($wsID){
    return $this->em
      ->getRepository('AppBundle:Project')
      ->getAllProjects($wsID);
  }
}