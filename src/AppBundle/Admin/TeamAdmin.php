<?php
namespace AppBundle\Admin;

use Sonata\AdminBundle\Admin\AbstractAdmin;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;

/**
 * Class TeamAdmin
 * @package AppBundle\Admin
 */
class TeamAdmin extends AbstractAdmin {

  // Fields to be shown on create/edit forms
  protected function configureFormFields(FormMapper $formMapper) {
    $formMapper
      ->add('title', 'text')
      ->add('description', 'textarea')
      ->add('project', 'entity', array(
        'class' => 'AppBundle\Entity\Project',
        'choice_label' => 'title'
      ));
  }

  // Fields to be shown on filter forms
  protected function configureDatagridFilters(DatagridMapper $dataGridMapper) {
    $dataGridMapper
      ->add('title')
      ->add('description');
  }

  // Fields to be shown on lists
  protected function configureListFields(ListMapper $listMapper) {
    $listMapper
      ->addIdentifier('title')
      ->add('description');
  }
}