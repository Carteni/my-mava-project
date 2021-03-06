<?php

use Symfony\Component\Config\Loader\LoaderInterface;
use Symfony\Component\HttpKernel\Kernel;

class AppKernel extends Kernel {
  public function registerBundles() {
    $bundles = [
      new Symfony\Bundle\FrameworkBundle\FrameworkBundle(),
      new Symfony\Bundle\SecurityBundle\SecurityBundle(),
      new Symfony\Bundle\TwigBundle\TwigBundle(),
      new Symfony\Bundle\MonologBundle\MonologBundle(),
      new Symfony\Bundle\SwiftmailerBundle\SwiftmailerBundle(),
      new Doctrine\Bundle\DoctrineBundle\DoctrineBundle(),
      new Sensio\Bundle\FrameworkExtraBundle\SensioFrameworkExtraBundle(),
      //new Doctrine\Bundle\FixturesBundle\DoctrineFixturesBundle(),
      new AppBundle\AppBundle(),
      new MyBundle\MyBundle(),

      new \FOS\UserBundle\FOSUserBundle(),

      new \Sonata\CoreBundle\SonataCoreBundle(),
      new \Sonata\BlockBundle\SonataBlockBundle(),

      new \Knp\Bundle\MenuBundle\KnpMenuBundle(),
      new \Sonata\DoctrineORMAdminBundle\SonataDoctrineORMAdminBundle(),
      new \Sonata\AdminBundle\SonataAdminBundle(),

      new \Symfony\Bundle\AsseticBundle\AsseticBundle(),

      new \Mopa\Bundle\BootstrapBundle\MopaBootstrapBundle(),
      new \Knp\Bundle\PaginatorBundle\KnpPaginatorBundle(),

      new Sonata\IntlBundle\SonataIntlBundle(),
      new Sonata\MediaBundle\SonataMediaBundle(),
      new Sonata\EasyExtendsBundle\SonataEasyExtendsBundle(),
      new \Application\Sonata\MediaBundle\ApplicationSonataMediaBundle(),

      // https://github.com/sonata-project/SonataMediaBundle/issues/783
      // https://github.com/sonata-project/SonataClassificationBundle/blob/3.x/Resources/doc/reference/installation.rst
      new \Sonata\ClassificationBundle\SonataClassificationBundle(),
      new Application\Sonata\ClassificationBundle\ApplicationSonataClassificationBundle()
    ];

    if (in_array($this->getEnvironment(), ['dev', 'test'], TRUE)) {
      $bundles[] = new Symfony\Bundle\DebugBundle\DebugBundle();
      $bundles[] = new Symfony\Bundle\WebProfilerBundle\WebProfilerBundle();
      $bundles[] = new Sensio\Bundle\DistributionBundle\SensioDistributionBundle();
      $bundles[] = new Sensio\Bundle\GeneratorBundle\SensioGeneratorBundle();

      $bundles[] = new Doctrine\Bundle\FixturesBundle\DoctrineFixturesBundle();
      $bundles[] = new \Hautelook\AliceBundle\HautelookAliceBundle();
    }

    return $bundles;
  }

  public function getCacheDir() {
    return dirname(__DIR__) . '/var/cache/' . $this->getEnvironment();
  }

  public function getLogDir() {
    return dirname(__DIR__) . '/var/logs';
  }

  public function registerContainerConfiguration(LoaderInterface $loader) {
    $envParameters = $this->getEnvParameters();

    if (@$envParameters['rds.hostname'] == 'region2_host') {
      $loader->load(__DIR__ . '/config/config_region2.yml');
    }
    else {
      $loader->load($this->getRootDir() . '/config/config_' . $this->getEnvironment() . '.yml');
    }
  }

  public function getRootDir() {
    return __DIR__;
  }
}
