<?php

namespace Tests\AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;
use Symfony\Component\BrowserKit\Client;
use Symfony\Component\DomCrawler\Crawler;

class DefaultControllerTest extends WebTestCase
{
    /**
     * @var Client
     */
    private $client;

    protected function setUp()
    {
        $this->client = static::createClient();
    }


    public function testIndex()
    {
        /**
         * @var $crawler Crawler
         */
        $crawler = $this->client->request('GET', '/');

        $this->assertEquals(200, $this->client->getResponse()->getStatusCode());
        $this->assertContains('Welcome to Symfony',
          $crawler->filter('#container h1')->text());
    }

    /*public function testAboutPage()
    {
        $crawler = $this->client->request('GET', '/about/jack/');

        $this->assertEquals(200, $this->client->getResponse()->getStatusCode());
        $this->assertContains('Jack', $this->client->getResponse()->getContent());
    }*/
}
