<?php

namespace AppBundle\Controller;

use AppBundle\Entity\User;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\BrowserKit\Response;
use Symfony\Component\HttpFoundation\Request;

class DefaultController extends Controller
{
    /**
     * @Route("/", name="homepage")
     */
    public function indexAction(Request $request)
    {
        // replace this example code with whatever you need
        return $this->render('default/index.html.twig', [
            'base_dir' => realpath($this->getParameter('kernel.root_dir').'/..'),
        ]);
    }

    /**
     * @Route("/about/{name}", name="aboutpage", defaults={"name":null})
     * @param $name
     * @return Response
     */
    public  function aboutAction($name)
    {
        if($name) {
            $user = $this->getDoctrine()->getRepository('AppBundle:User')
              ->findOneBy(array('name'=>$name));
            if(false === $user instanceof User) {
                throw $this->createNotFoundException(sprintf('No user named %s found', $name));
            }
        }

        return $this->render(':default:about.html.twig',[
            'user' => $user ?? null
        ]);
    }

    /**
     * @Route("/about/{name}/details", name="aboutdetailspage")
     * @param $name
     * @return Response
     */
    public  function aboutDetailtsAction($name)
    {
        $user = $this->getDoctrine()->getRepository('AppBundle:User')
          ->findOneBy(array('name'=>$name));
        if(false === $user instanceof User) {
            throw $this->createNotFoundException(sprintf('No user named %s found', $name));
        }

        return $this->render(':default:more.html.twig',[
          'user' => $user
        ]);
    }
}
