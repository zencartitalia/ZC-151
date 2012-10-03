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
// $Id: bonifico.php  2005-12-13 11:50:12Z @f $
//

  class bonifico {
    var $code, $title, $description, $enabled;

// class constructor
    function bonifico() {
      global $order;

      $this->code = 'bonifico';
      $this->title = MODULE_PAYMENT_BONIFICO_TEXT_TITLE;
      $this->description = MODULE_PAYMENT_BONIFICO_TEXT_DESCRIPTION;
      $this->sort_order = MODULE_PAYMENT_BONIFICO_SORT_ORDER;
      $this->enabled = ((MODULE_PAYMENT_BONIFICO_STATUS == 'True') ? true : false);

      if ((int)MODULE_PAYMENT_BONIFICO_ORDER_STATUS_ID > 0) {
        $this->order_status = MODULE_PAYMENT_BONIFICO_ORDER_STATUS_ID;
      }

      if (is_object($order)) $this->update_status();
    
      $this->email_footer = MODULE_PAYMENT_BONIFICO_TEXT_EMAIL_FOOTER;
    }

// class methods
    function update_status() {
      global $order, $db;

      if ( ($this->enabled == true) && ((int)MODULE_PAYMENT_BONIFICO_ZONE > 0) ) {
        $check_flag = false;
        $check = $db->Execute("select zone_id from " . TABLE_ZONES_TO_GEO_ZONES . " where geo_zone_id = '" . MODULE_PAYMENT_BONIFICO_ZONE . "' and zone_country_id = '" . $order->billing['country']['id'] . "' order by zone_id");
        while (!$check->EOF) {
          if ($check->fields['zone_id'] < 1) {
            $check_flag = true;
            break;
          } elseif ($check->fields['zone_id'] == $order->billing['zone_id']) {
            $check_flag = true;
            break;
          }
	  $check->MoveNext();
        }

        if ($check_flag == false) {
          $this->enabled = false;
        }
      }
    }

    function javascript_validation() {
      return false;
    }

    function selection() {
      return array('id' => $this->code,
                   'module' => $this->title);
    }

    function pre_confirmation_check() {
      return false;
    }

    function confirmation() {
      return array('title' => MODULE_PAYMENT_BONIFICO_TEXT_ESTREMI .MODULE_PAYMENT_BONIFICO_TEXT_INTESTATARIO .
MODULE_PAYMENT_BONIFICO_INTESTATARIO .
MODULE_PAYMENT_BONIFICO_TEXT_BANCA .
MODULE_PAYMENT_BONIFICO_BANCA.
MODULE_PAYMENT_BONIFICO_TEXT_CAB .
MODULE_PAYMENT_BONIFICO_CAB.
MODULE_PAYMENT_BONIFICO_TEXT_ABI .
MODULE_PAYMENT_BONIFICO_ABI.
MODULE_PAYMENT_BONIFICO_TEXT_CIN .
MODULE_PAYMENT_BONIFICO_CIN.
MODULE_PAYMENT_BONIFICO_TEXT_CC .
MODULE_PAYMENT_BONIFICO_CC.
MODULE_PAYMENT_BONIFICO_TEXT_IBAN .
MODULE_PAYMENT_BONIFICO_IBAN.
MODULE_PAYMENT_BONIFICO_TEXT_SWIFT .
MODULE_PAYMENT_BONIFICO_SWIFT.
MODULE_PAYMENT_BONIFICO_TEXT_DELIVERY);
    }

    function process_button() {
      return false;
    }

    function before_process() {
      return false;
    }

    function after_process() {
      return false;
    }

    function get_error() {
      return false;
    }

    function check() {
      global $db;
      if (!isset($this->_check)) {
        $check_query = $db->Execute("select configuration_value from " . TABLE_CONFIGURATION . " where configuration_key = 'MODULE_PAYMENT_BONIFICO_STATUS'");
        $this->_check = $check_query->RecordCount();
      }
      return $this->_check;
    }

    function install() {
      global $db; 
      $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Abilita il pagamento tramite Bonifico Bancario', 'MODULE_PAYMENT_BONIFICO_STATUS', 'True', 'Accettare pagamenti tramite Bonifico Bancario?', '6', '1', 'zen_cfg_select_option(array(\'True\', \'False\'), ', now());");
      $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Intestatario Conto Corrente', 'MODULE_PAYMENT_BONIFICO_INTESTATARIO', '', 'Intestario del Conto Corrente', '6', '3', now())");
      $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Banca', 'MODULE_PAYMENT_BONIFICO_BANCA', '', 'Banca', '6', '4', now())");
      $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('CAB', 'MODULE_PAYMENT_BONIFICO_CAB', '', 'CAB', '6', '5', now())");
      $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('ABI', 'MODULE_PAYMENT_BONIFICO_ABI', '', 'ABI', '6', '6', now())");
      $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('CIN', 'MODULE_PAYMENT_BONIFICO_CIN', '', 'CIN', '6', '7', now())");
      $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Conto Corrente', 'MODULE_PAYMENT_BONIFICO_CC', '', 'Numero di Conto Corrente', '6', '8', now())");
      $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('IBAN', 'MODULE_PAYMENT_BONIFICO_IBAN', '', 'IBAN', '6', '9', now())");
      $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('SWIFT', 'MODULE_PAYMENT_BONIFICO_SWIFT', '', 'SWIFT', '6', '10', now())");
      $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) values ('Zona di Pagamento', 'MODULE_PAYMENT_BONIFICO_ZONE', '0', 'Se selezioni una zona, abiliti il pagamento con bonifico solo per quella zona.', '6', '2', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes(', now())");
      $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, use_function, date_added) values ('Stato Ordine', 'MODULE_PAYMENT_BONIFICO_ORDER_STATUS_ID', '0', 'Imposta lo stato di un ordine dopo aver utilizzato questo pagamento', '6', '0', 'zen_cfg_pull_down_order_statuses(', 'zen_get_order_status_name', now())");
      $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Ordine di visualizzazione.', 'MODULE_PAYMENT_BONIFICO_SORT_ORDER', '0', 'Ordine di visualizzazione. Pi&ugrave; il valore &egrave; basso, prima viene visualizzato.', '6', '0', now())");
	}

    function remove() {
      global $db;
      $db->Execute("delete from " . TABLE_CONFIGURATION . " where configuration_key in ('" . implode("', '", $this->keys()) . "')");
    }

    function keys() {
      return array('MODULE_PAYMENT_BONIFICO_STATUS', 'MODULE_PAYMENT_BONIFICO_INTESTATARIO', 'MODULE_PAYMENT_BONIFICO_BANCA', 'MODULE_PAYMENT_BONIFICO_CAB', 'MODULE_PAYMENT_BONIFICO_ABI', 'MODULE_PAYMENT_BONIFICO_CIN', 'MODULE_PAYMENT_BONIFICO_CC', 'MODULE_PAYMENT_BONIFICO_IBAN', 'MODULE_PAYMENT_BONIFICO_SWIFT', 'MODULE_PAYMENT_BONIFICO_ZONE', 'MODULE_PAYMENT_BONIFICO_ORDER_STATUS_ID', 'MODULE_PAYMENT_BONIFICO_SORT_ORDER');
    }
  }
?>
