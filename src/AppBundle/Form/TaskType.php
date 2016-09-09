<?php

namespace AppBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class TaskType extends AbstractType
{
    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('title')
            ->add('description')
            ->add('dueDate', 'datetime')
            # https://github.com/sonata-project/SonataMediaBundle/issues/707
            ->add('attachment', 'sonata_media_type', array(
                'provider' => 'sonata.media.provider.file',
                'context' => 'default'
            ))
            ->add('project', 'entity', array(
                'class' => 'AppBundle\Entity\Project',
                'choice_label' => 'title'
            ))
            ->add('user')
            ->add('status', ChoiceType::class, array(
                'choices' => array('new' => 'new', 'in progress' => 'in progress', 'completed' => 'completed')
            ))
        ;
    }
    
    /**
     * @param OptionsResolver $resolver
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'AppBundle\Entity\Task'
        ));
    }
}
