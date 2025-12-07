<?php
/**
 * Kalicr HelloWorld Module Registration
 * 
 * @category  Kalicr
 * @package   Kalicr_HelloWorld
 * @author    David Gamboa <dgamboa@kalicr.com>
 * @copyright Copyright (c) 2025 Kalicr
 * @license   MIT License
 */

use Magento\Framework\Component\ComponentRegistrar;

ComponentRegistrar::register(
    ComponentRegistrar::MODULE,
    'Kalicr_HelloWorld',
    __DIR__
);
