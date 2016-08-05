<?php
namespace AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;

class WorkspaceController extends Controller {

  /**
   * @Route("/workspace/{name}", name="workspace_show")
   * @param $name
   * @return Response
   */
  public function showAction($name) {

    $repo = $this->getDoctrine()->getRepository('AppBundle:Workspace');
    $workspace = $repo->findOneBy(array('name' => $name));
    $workspaceId = $workspace->getId();

    $repo = $this->getDoctrine()->getRepository('AppBundle:Project');
    $projects = $repo->findBy(array('workspace' => $workspaceId));

    if(null === $projects) {
      throw $this->createNotFoundException('Not found!');
    }

    return $this->render(':workspace:show.html.twig', array(
      'projects' => $projects
    ));
  }
}