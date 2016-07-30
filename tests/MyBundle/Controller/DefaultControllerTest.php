<?php

namespace MyBundle\Tests\Controller;

use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

class DefaultControllerTest extends WebTestCase
{
    public function testHelloWorldPage()
    {
        $client = static::createClient();

        $crawler = $client->request('GET', '/my');

        $this->assertContains('Hello World', $client->getResponse()->getContent());
    }
}
