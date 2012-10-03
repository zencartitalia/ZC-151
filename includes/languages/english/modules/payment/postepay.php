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
// $Id: postepay.php  2005-11-19 18:43:10Z wilt $
//
  
  define('MODULE_PAYMENT_POSTEPAY_TEXT_TITLE', 'Ricarica PostePay');
  define('MODULE_PAYMENT_POSTEPAY_TEXT_INTESTATARIO_CARTA', 'Make your Ricarica PostePay payable to: ');
  define('MODULE_PAYMENT_POSTEPAY_TEXT_NUMERO_CARTA', 'PostePay Card Number: ');
  define('MODULE_PAYMENT_POSTEPAY_TEXT_DESCRIPTION', 'Payment with Ricarica PostePay');
  define('MODULE_PAYMENT_POSTEPAY_TEXT_CONFIRMATION', 'You will receive an e-mail with the data required for Ricarica PostePay, together with order details, as soon as you click on the order confirmation.');
  define('MODULE_PAYMENT_POSTEPAY_TEXT_DELIVERY', 'We will ship your orders as soon as we receive the payment.');
  define('MODULE_PAYMENT_POSTEPAY_TEXT_EMAIL_FOOTER', MODULE_PAYMENT_POSTEPAY_TEXT_INTESTATARIO_CARTA . MODULE_PAYMENT_POSTEPAY_INTESTATARIO."\n".MODULE_PAYMENT_POSTEPAY_TEXT_NUMERO_CARTA . MODULE_PAYMENT_POSTEPAY_NUMERO_CARTA."\n\n".MODULE_PAYMENT_POSTEPAY_TEXT_DELIVERY);
?>
