<?php
namespace AppBundle\Admin;

use Sonata\AdminBundle\Admin\AbstractAdmin;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;

/**
 * Class TaskAdmin
 * @package AppBundle\Admin
 */
class TaskAdmin extends AbstractAdmin {

  // Fields to be shown on create/edit forms
  protected function configureFormFields(FormMapper $formMapper) {
    $formMapper
      ->add('title', 'text')
      ->add('description', 'textarea')
      ->add('dueDate', 'date',
        array(
          'input' => 'datetime',
          'widget' => 'single_text',
          'format' => 'yyyy-MM-dd',
        ))
      ->add('project', 'entity', array(
        'class' => 'AppBundle\Entity\Project',
        'choice_label' => 'title',
        'placeholder' => '',
        'empty_data'  => null
      ))
      ->add('user')
      ->add('status', ChoiceType::class, array(
        'choices' => array('new' => 'new', 'in progress' => 'in progress', 'completed' => 'completed')
      ))
      ->add('attachment', 'sonata_media_type', array(
        'provider' => 'sonata.media.provider.file',
        'context' => 'default'
      ));
  }

  // Fields to be shown on filter forms
  protected function configureDatagridFilters(DatagridMapper $dataGridMapper) {
    $dataGridMapper
      ->add('title')
      ->add('description')
      ->add('dueDate')
      ->add('status');
  }

  // Fields to be shown on lists
  protected function configureListFields(ListMapper $listMapper) {
    $listMapper
      ->addIdentifier('title')
      ->add('description')
      ->add('dueDate')
      ->add('status');
  }
}