<?php
/**
 * Kalicr HelloWorld Index Controller
 * 
 * @category  Kalicr
 * @package   Kalicr_HelloWorld
 * @author    David Gamboa <david@kalicr.com>
 * @copyright Copyright (c) 2024 Kalicr
 * @license   MIT License
 */

namespace Kalicr\HelloWorld\Controller\Index;

use Magento\Framework\App\Action\Action;
use Magento\Framework\App\Action\Context;
use Magento\Framework\App\Action\HttpGetActionInterface;
use Magento\Framework\View\Result\PageFactory;

/**
 * Class Index
 * 
 * Handles the HelloWorld index page
 */
class Index extends Action implements HttpGetActionInterface
{
    /**
     * @var PageFactory
     */
    protected $pageFactory;

    /**
     * @param Context $context
     * @param PageFactory $pageFactory
     */
    public function __construct(
        Context $context,
        PageFactory $pageFactory
    ) {
        $this->pageFactory = $pageFactory;
        parent::__construct($context);
    }

    /**
     * Execute action
     *
     * @return \Magento\Framework\View\Result\Page
     */
    public function execute()
    {
        $resultPage = $this->pageFactory->create();
        $resultPage->getConfig()->getTitle()->set(__('Hello World - Kalicr Module'));
        return $resultPage;
    }
}
