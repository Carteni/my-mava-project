<?php
namespace AppBundle\Admin;

use Sonata\AdminBundle\Admin\AbstractAdmin;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Form\FormMapper;

/**
 * Class WorkspaceAdmin
 * @package AppBundle\Admin
 */
class WorkspaceAdmin extends AbstractAdmin {

  // Fields to be shown on create/edit forms
  protected function configureFormFields(FormMapper $formMapper) {
    $formMapper
      ->add('name', 'text')
      ->add('description', 'textarea');
  }

  // Fields to be shown on filter forms
  protected function configureDatagridFilters(DatagridMapper $dataGridMapper) {
    $dataGridMapper
      ->add('name')
      ->add('description');
  }

  // Fields to be shown on lists
  protected function configureListFields(ListMapper $listMapper) {
    $listMapper
      ->addIdentifier('name')
      ->add('description');
  }
}