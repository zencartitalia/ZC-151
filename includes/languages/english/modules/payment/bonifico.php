<?php
//
// +----------------------------------------------------------------------+
// |zen-cart Open Source E-commerce                                       |
// +----------------------------------------------------------------------+
// | Copyright (c) 2003 The zen-cart developers                           |
// |                                                                      |
// | http://www.zen-cart.com/index.php                                    |
// |                                                                      |
// | Portions Copyright (c) 2003 osCommerce                               |
// |									|
// | Developed by Paolo De Dionigi - @friends srl - 		|
// | <paolo.dedionigi@atfriends.net> 				|
//| based on similar (anonymous) module for osCommerce		|
// +----------------------------------------------------------------------+
// | This source file is subject to version 2.0 of the GPL license,       |
// | that is bundled with this package in the file LICENSE, and is        |
// | available through the world-wide-web at the following url:           |
// | http://www.zen-cart.com/license/2_0.txt.                             |
// | If you did not receive a copy of the zen-cart license and are unable |
// | to obtain it through the world-wide-web, please send a note to       |
// | license@zen-cart.com so we can mail you a copy immediately.          |
// +----------------------------------------------------------------------+
// $Id: bonifico.php  2005-12-13 12:19:10Z @f $
//
  
  define('MODULE_PAYMENT_BONIFICO_TEXT_TITLE', 'Bank Wire Transfer');
  define('MODULE_PAYMENT_BONIFICO_TEXT_ESTREMI', 'Information for bank wire transfer<br /><br />');
  define('MODULE_PAYMENT_BONIFICO_TEXT_INTESTATARIO', 'Send Payment to: <br />');
  define('MODULE_PAYMENT_BONIFICO_TEXT_BANCA', '<br />Bank: ');
  define('MODULE_PAYMENT_BONIFICO_TEXT_CAB', '<br />CAB: ');
  define('MODULE_PAYMENT_BONIFICO_TEXT_ABI', '<br />ABI: ');
  define('MODULE_PAYMENT_BONIFICO_TEXT_CIN', '<br />CIN: ');
  define('MODULE_PAYMENT_BONIFICO_TEXT_CC', '<br />Checking Account: ');
  define('MODULE_PAYMENT_BONIFICO_TEXT_IBAN', '<br />IBAN: ');
  define('MODULE_PAYMENT_BONIFICO_TEXT_SWIFT', '<br />SWIFT: ');

  define('MODULE_PAYMENT_BONIFICO_TEXT_DESCRIPTION', 'Payment method with bank wire transfer.');

  define('MODULE_PAYMENT_BONIFICO_TEXT_DELIVERY', '<br /><br />Orders will be processed after receiving the receipt of the payment.');
  
  define('MODULE_PAYMENT_BONIFICO_TEXT_EMAIL_FOOTER', "Info for bank wire transfer\n\nSend Payment to: ".MODULE_PAYMENT_BONIFICO_INTESTATARIO."\nBank: ".MODULE_PAYMENT_BONIFICO_BANCA."\nCAB: ".MODULE_PAYMENT_BONIFICO_CAB."\nABI: ".MODULE_PAYMENT_BONIFICO_ABI."\nCIN: ".MODULE_PAYMENT_BONIFICO_CIN."\nC/C: ".MODULE_PAYMENT_BONIFICO_CC."\nIBAN: ".MODULE_PAYMENT_BONIFICO_IBAN."\nSWIFT: ".MODULE_PAYMENT_BONIFICO_SWIFT."\n\nOrders will be processed after receiving the receipt of the payment.");
?>
