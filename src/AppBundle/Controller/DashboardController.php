<?php
namespace AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Response;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Cache;

/**
 * Class DashboardController
 * @package AppBundle\Controller
 * @Route("/dashboard")
 *
 * @Cache(expires="+1 days", smaxage="1800", public=true)
 *
 */
class DashboardController extends Controller {

  private $tasks = 1;

  /**
   *
   * https://it.functions-online.com/strtotime.html
   * Expiration has a higher priority over validation.
   * @Cache(expires="+2 minutes", ETag="ws ~ 'Foo'", public=false)
   *
   * @Route("/", name="dashboard_index")
   * @return Response
   */
  public function indexAction($ws=1) {

    $util = $this->get('mava_util');
    $finishedTasks = $util->finishedTasks(1);

    /*$response = new Response();
    $date = new \DateTime('+2 days');
    $response->setExpires($date);*/

    return $this->render(':dashboard:index.html.twig',
      array('finishedTasks' => $finishedTasks)/*,
      $response*/
    );
  }
}