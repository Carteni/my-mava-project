<?php
namespace AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Response;

/**
 * Class DashboardController
 * @package AppBundle\Controller
 * @Route("/dashboard")
 */
class DashboardController extends Controller {

  /**
   * @Route("/", name="dashboard_index")
   * @return Response
   */
  public function indexAction($ws=null) {

    $util = $this->get('mava_util');
    $finishedTasks = $util->finishedTasks(1);

    return $this->render(':dashboard:index.html.twig', array(
      'finishedTasks' => $finishedTasks
    ));
  }

}