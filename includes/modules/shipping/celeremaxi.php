<?php
//
// +----------------------------------------------------------------------+
// |zen-cart Open Source E-commerce                                       |
// +----------------------------------------------------------------------+
// | Copyright (c) 2004 The zen-cart developers                           |
// |                                                                      |
// | http://www.zen-cart.com/index.php                                    |
// |                                                                      |
// | Portions Copyright (c) 2003 osCommerce                               |
// +----------------------------------------------------------------------+
// | This source file is subject to version 2.0 of the GPL license,       |
// | that is bundled with this package in the file LICENSE, and is        |
// | available through the world-wide-web at the following url:           |
// | http://www.zen-cart.com/license/2_0.txt.                             |
// | If you did not receive a copy of the zen-cart license and are unable |
// | to obtain it through the world-wide-web, please send a note to       |
// | license@zen-cart.com so we can mail you a copy immediately.          |
// +----------------------------------------------------------------------+
// $Id: celeremaxi.php 1969 2005-09-13 06:57:21Z drbyte $
//

  class celeremaxi {
    var $code, $title, $description, $icon, $enabled;

// class constructor
    function celeremaxi() {
      global $order, $db;

      $this->code = 'celeremaxi';
      $this->title = MODULE_SHIPPING_CELEREMAXI_TEXT_TITLE;
      $this->description = MODULE_SHIPPING_CELEREMAXI_TEXT_DESCRIPTION;
      $this->sort_order = MODULE_SHIPPING_CELEREMAXI_SORT_ORDER;
      $this->icon = '';
      $this->tax_class = MODULE_SHIPPING_CELEREMAXI_TAX_CLASS;
      $this->tax_basis = MODULE_SHIPPING_CELEREMAXI_TAX_BASIS;

      // disable only when entire cart is free shipping
      if (zen_get_shipping_enabled($this->code)) {
        $this->enabled = ((MODULE_SHIPPING_CELEREMAXI_STATUS == 'True') ? true : false);
      }

      if ( ($this->enabled == true) && ((int)MODULE_SHIPPING_CELEREMAXI_ZONE > 0) ) {
        $check_flag = false;
        $check = $db->Execute("select zone_id from " . TABLE_ZONES_TO_GEO_ZONES . " where geo_zone_id = '" . MODULE_SHIPPING_CELEREMAXI_ZONE . "' and zone_country_id = '" . $order->delivery['country']['id'] . "' order by zone_id");
        while (!$check->EOF) {
          if ($check->fields['zone_id'] < 1) {
            $check_flag = true;
            break;
          } elseif ($check->fields['zone_id'] == $order->delivery['zone_id']) {
            $check_flag = true;
            break;
          }
          $check->MoveNext();
        }

        if ($check_flag == false) {
          $this->enabled = false;
        }
      }
//	if (($this->enabled == true) && (IS_ADMIN_FLAG === false && $_SESSION['cart']->weight > 50)) $this->enabled = false;
    }

// class methods
    function quote($method = '') {
      global $order;

      $this->quotes = array('id' => $this->code,
                            'module' => MODULE_SHIPPING_CELEREMAXI_TEXT_TITLE,
                            'methods' => array(array('id' => $this->code,
                                                     'title' => MODULE_SHIPPING_CELEREMAXI_TEXT_WAY,
                                                     'cost' => MODULE_SHIPPING_CELEREMAXI_COST)));
      if ($this->tax_class > 0) {
        $this->quotes['tax'] = zen_get_tax_rate($this->tax_class, $order->delivery['country']['id'], $order->delivery['zone_id']);
      }

      if (zen_not_null($this->icon)) $this->quotes['icon'] = zen_image($this->icon, $this->title);

      return $this->quotes;
    }

    function check() {
      global $db;
      if (!isset($this->_check)) {
        $check_query = $db->Execute("select configuration_value from " . TABLE_CONFIGURATION . " where configuration_key = 'MODULE_SHIPPING_CELEREMAXI_STATUS'");
        $this->_check = $check_query->RecordCount();
      }
      return $this->_check;
    }

    function install() {
      global $db;
      $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Abilita la spedizione via Paccocelere Maxi', 'MODULE_SHIPPING_CELEREMAXI_STATUS', 'True', 'Abilitare la spedizione via Paccocelere Maxi?', '6', '0', 'zen_cfg_select_option(array(\'True\', \'False\'), ', now())");
      $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Costo di Spedizione', 'MODULE_SHIPPING_CELEREMAXI_COST', '25', 'Spese di Spedizione per Paccocelere 1 Plus fino a 50 KG.', '6', '0', now())");
      $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) values ('Classe IVA', 'MODULE_SHIPPING_CELEREMAXI_TAX_CLASS', '0', 'Applica la seguente aliquota IVA ai costi di spedizione.', '6', '0', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes(', now())");
      $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Base di Tassa', 'MODULE_SHIPPING_CELEREMAXI_TAX_BASIS', 'Shipping', 'Su quali basi vengono calcolate le Tasse sulle Spese di Spedizione.  Le opzioni sono:<br />Shipping - Basata sull\'indirizzo di Spedizione del Cliente<br />Billing - Basata sull\'indirizzo di Fatturazione del Cliente<br />Store - Basata sull\'indirizzo del Negozio se la Zona di Fatturazione/Spedizione &egrave; uguale alla Zona del Negozio', '6', '0', 'zen_cfg_select_option(array(\'Shipping\', \'Billing\', \'Store\'), ', now())");
      $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) values ('Zona di Spedizione', 'MODULE_SHIPPING_CELEREMAXI_ZONE', '0', 'Se viene selezionata una Zona, il metodo di spedizione viene abilitato solo per la Zona indicata.', '6', '0', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes(', now())");
      $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Ordine di Visualizzazione', 'MODULE_SHIPPING_CELEREMAXI_SORT_ORDER', '0', 'Ordine di Visualizzazione.', '6', '0', now())");
    }

    function remove() {
      global $db;
      $db->Execute("delete from " . TABLE_CONFIGURATION . " where configuration_key like 'MODULE\_SHIPPING\_CELEREMAXI\_%'");
    }

    function keys() {
      return array('MODULE_SHIPPING_CELEREMAXI_STATUS', 'MODULE_SHIPPING_CELEREMAXI_COST', 'MODULE_SHIPPING_CELEREMAXI_TAX_CLASS', 'MODULE_SHIPPING_CELEREMAXI_TAX_BASIS', 'MODULE_SHIPPING_CELEREMAXI_ZONE', 'MODULE_SHIPPING_CELEREMAXI_SORT_ORDER');
    }
  }
?>
