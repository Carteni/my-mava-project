<?php
namespace AppBundle\Admin;

use AppBundle\Entity\Workspace;
use Sonata\AdminBundle\Admin\AbstractAdmin;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Form\FormMapper;

/**
 * Class ProjectAdmin
 * @package AppBundle\Admin
 */
class ProjectAdmin extends AbstractAdmin {

  // Fields to be shown on create/edit forms
  protected function configureFormFields(FormMapper $formMapper) {
    $formMapper
      ->add('title' , 'text')
      ->add('description', 'textarea')
      /*->add('workspace','sonata_type_model_autocomplete',
        array(
          'class' => 'AppBundle\Entity\Workspace',
          'property' => 'name',
          'to_string_callback' => function(Workspace $entity, $property) {
            return $entity->getName();
          },
        ))*/
      ->add('workspace','entity',
        array(
          'class' => 'AppBundle\Entity\Workspace',
          'choice_label' => 'name',
        ))
      ->add('dueDate', 'date',
        array(
          'input' => 'datetime',
          'widget' => 'single_text',
          'format' => 'yyyy-MM-dd',
        ));
  }

  // Fields to be shown on filter forms
  protected function configureDatagridFilters(DatagridMapper $dataGridMapper) {
    $dataGridMapper
      ->add('title')
      ->add('description')
      ->add('dueDate');
  }

  // Fields to be shown on lists
  protected function configureListFields(ListMapper $listMapper) {
    $listMapper
      ->addIdentifier('title')
      ->add('description')
      ->add('dueDate');
  }
}