<?php

declare(strict_types=1);

/**
 * @copyright Sharapov A. <alexander@sharapov.biz>
 * @link      http://www.sharapov.biz/
 * @license   https://www.gnu.org/licenses/gpl-3.0.en.html GNU General Public License
 * Date: 28.04.2022
 * Time: 13:06
 */

ini_set('display_errors', '1');
error_reporting(E_ALL);
date_default_timezone_set('UTC');

require 'vendor/autoload.php';

try {
    /**
     * Put your code here ....
     */
    print sprintf("[%s] %s\n", date(DATE_RFC3339), $_ENV['ENV_TEST']);
} catch (\Exception $e) {
    var_dump($e);
}
