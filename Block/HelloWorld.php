<?php
/**
 * Kalicr HelloWorld Block
 * 
 * @category  Kalicr
 * @package   Kalicr_HelloWorld
 * @author    David Gamboa <david@kalicr.com>
 * @copyright Copyright (c) 2024 Kalicr
 * @license   MIT License
 */

namespace Kalicr\HelloWorld\Block;

use Magento\Framework\View\Element\Template;
use Magento\Framework\View\Element\Template\Context;

/**
 * Class HelloWorld
 * 
 * Block for HelloWorld display
 */
class HelloWorld extends Template
{
    /**
     * @param Context $context
     * @param array $data
     */
    public function __construct(
        Context $context,
        array $data = []
    ) {
        parent::__construct($context, $data);
    }

    /**
     * Get welcome message
     *
     * @return string
     */
    public function getWelcomeMessage()
    {
        return __('Welcome to Kalicr HelloWorld Module!');
    }

    /**
     * Get module version
     *
     * @return string
     */
    public function getModuleVersion()
    {
        return '1.0.0';
    }

    /**
     * Get current date and time
     *
     * @return string
     */
    public function getCurrentDateTime()
    {
        return date('Y-m-d H:i:s');
    }
}
