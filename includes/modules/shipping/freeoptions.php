<?php
/**
 * @package shippingMethod
 * @copyright Copyright 2003-2009 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: freeoptions.php 14498 2009-10-01 20:16:16Z ajeh $
 */

  class freeoptions extends base {
    var $code, $title, $description, $icon, $enabled;
    var $ck_freeoptions_total, $ck_freeoptions_weight, $ck_freeoptions_items;

// class constructor
    function freeoptions() {
      global $order, $db;

      $this->code = 'freeoptions';
      $this->title = MODULE_SHIPPING_FREEOPTIONS_TEXT_TITLE;
      $this->description = MODULE_SHIPPING_FREEOPTIONS_TEXT_DESCRIPTION;
      $this->sort_order = MODULE_SHIPPING_FREEOPTIONS_SORT_ORDER;
      $this->icon = '';
      $this->tax_class = MODULE_SHIPPING_FREEOPTIONS_TAX_CLASS;
      $this->tax_basis = MODULE_SHIPPING_FREEOPTIONS_TAX_BASIS;

      // disable only when entire cart is free shipping
      if (zen_get_shipping_enabled($this->code)) {
          $this->enabled = ((MODULE_SHIPPING_FREEOPTIONS_STATUS == 'True') ? true : false);
      }

      if ( ($this->enabled == true) && ((int)MODULE_SHIPPING_FREEOPTIONS_ZONE > 0) ) {
        $check_flag = false;
        $check = $db->Execute("select zone_id from " . TABLE_ZONES_TO_GEO_ZONES . " where geo_zone_id = '" . MODULE_SHIPPING_FREEOPTIONS_ZONE . "' and zone_country_id = '" . $order->delivery['country']['id'] . "' order by zone_id");
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
    }

// class methods
    function quote($method = '') {
      global $order;
      $order_weight = round($_SESSION['cart']->show_weight(),9);

      // check if anything is configured for total, weight or item
      if ((MODULE_SHIPPING_FREEOPTIONS_TOTAL_MIN !='' or MODULE_SHIPPING_FREEOPTIONS_TOTAL_MAX !='')) {
        $this->ck_freeoptions_total = true;
      } else {
        $this->ck_freeoptions_total = false;
      }
      if ((MODULE_SHIPPING_FREEOPTIONS_WEIGHT_MIN !='' or MODULE_SHIPPING_FREEOPTIONS_WEIGHT_MAX !='')) {
        $this->ck_freeoptions_weight = true;
      } else {
        $this->ck_freeoptions_weight = false;
      }
      if ((MODULE_SHIPPING_FREEOPTIONS_ITEMS_MIN !='' or MODULE_SHIPPING_FREEOPTIONS_ITEMS_MAX !='')) {
        $this->ck_freeoptions_items = true;
      } else {
        $this->ck_freeoptions_items = false;
      }
      if ($this->ck_freeoptions_total or $this->ck_freeoptions_weight or $this->ck_freeoptions_items) {
        $this->enabled = true;
      } else {
        $this->enabled = false;
      }

      // disabled if nothing validates for total, weight or item
      if ($this->enabled) {
        if ($this->ck_freeoptions_total) {
          switch (true) {
          case ((MODULE_SHIPPING_FREEOPTIONS_TOTAL_MIN !='' and MODULE_SHIPPING_FREEOPTIONS_TOTAL_MAX !='')):
// free shipping total should not need adjusting
//            if (($_SESSION['cart']->show_total() - $_SESSION['cart']->free_shipping_prices()) >= MODULE_SHIPPING_FREEOPTIONS_TOTAL_MIN and ($_SESSION['cart']->show_total() - $_SESSION['cart']->free_shipping_prices()) <= MODULE_SHIPPING_FREEOPTIONS_TOTAL_MAX) {
            if (($_SESSION['cart']->show_total()) >= MODULE_SHIPPING_FREEOPTIONS_TOTAL_MIN and ($_SESSION['cart']->show_total()) <= MODULE_SHIPPING_FREEOPTIONS_TOTAL_MAX) {
              $this->ck_freeoptions_total = true;
            } else {
              $this->ck_freeoptions_total = false;
            }
            break;
          case ((MODULE_SHIPPING_FREEOPTIONS_TOTAL_MIN !='')):
//            if (($_SESSION['cart']->show_total() - $_SESSION['cart']->free_shipping_prices()) >= MODULE_SHIPPING_FREEOPTIONS_TOTAL_MIN) {
            if (($_SESSION['cart']->show_total()) >= MODULE_SHIPPING_FREEOPTIONS_TOTAL_MIN) {
              $this->ck_freeoptions_total = true;
            } else {
              $this->ck_freeoptions_total = false;
            }
            break;
          case ((MODULE_SHIPPING_FREEOPTIONS_TOTAL_MAX !='')):
//            if (($_SESSION['cart']->show_total() - $_SESSION['cart']->free_shipping_prices()) <= MODULE_SHIPPING_FREEOPTIONS_TOTAL_MAX) {
            if (($_SESSION['cart']->show_total()) <= MODULE_SHIPPING_FREEOPTIONS_TOTAL_MAX) {
              $this->ck_freeoptions_total = true;
            } else {
              $this->ck_freeoptions_total = false;
            }
            break;
          }
        }

        if ($this->ck_freeoptions_weight) {
          switch (true) {
          case ((MODULE_SHIPPING_FREEOPTIONS_WEIGHT_MIN !='' and MODULE_SHIPPING_FREEOPTIONS_WEIGHT_MAX !='')):
            if ($order_weight >= MODULE_SHIPPING_FREEOPTIONS_WEIGHT_MIN and $order_weight <= MODULE_SHIPPING_FREEOPTIONS_WEIGHT_MAX) {
              $this->ck_freeoptions_weight = true;
            } else {
              $this->ck_freeoptions_weight = false;
            }
            break;
          case ((MODULE_SHIPPING_FREEOPTIONS_WEIGHT_MIN !='')):
            if ($order_weight >= MODULE_SHIPPING_FREEOPTIONS_WEIGHT_MIN) {
              $this->ck_freeoptions_weight = true;
            } else {
              $this->ck_freeoptions_weight = false;
            }
            break;
          case ((MODULE_SHIPPING_FREEOPTIONS_WEIGHT_MAX !='')):
            if ($order_weight <= MODULE_SHIPPING_FREEOPTIONS_WEIGHT_MAX) {
              $this->ck_freeoptions_weight = true;
            } else {
              $this->ck_freeoptions_weight = false;
            }
            break;
          }
        }

        if ($this->ck_freeoptions_items) {
          switch (true) {
          case ((MODULE_SHIPPING_FREEOPTIONS_ITEMS_MIN !='' and MODULE_SHIPPING_FREEOPTIONS_ITEMS_MAX !='')):
// free shipping items should not need adjusting
//            if (($_SESSION['cart']->count_contents() - $_SESSION['cart']->free_shipping_items()) >= MODULE_SHIPPING_FREEOPTIONS_ITEMS_MIN and ($_SESSION['cart']->count_contents() - $_SESSION['cart']->free_shipping_items()) <= MODULE_SHIPPING_FREEOPTIONS_ITEMS_MAX) {
            if (($_SESSION['cart']->count_contents()) >= MODULE_SHIPPING_FREEOPTIONS_ITEMS_MIN and ($_SESSION['cart']->count_contents()) <= MODULE_SHIPPING_FREEOPTIONS_ITEMS_MAX) {
              $this->ck_freeoptions_items = true;
            } else {
              $this->ck_freeoptions_items = false;
            }
            break;
          case ((MODULE_SHIPPING_FREEOPTIONS_ITEMS_MIN !='')):
//            if (($_SESSION['cart']->count_contents() - $_SESSION['cart']->free_shipping_items()) >= MODULE_SHIPPING_FREEOPTIONS_ITEMS_MIN) {
            if (($_SESSION['cart']->count_contents()) >= MODULE_SHIPPING_FREEOPTIONS_ITEMS_MIN) {
              $this->ck_freeoptions_items = true;
            } else {
              $this->ck_freeoptions_items = false;
            }
            break;
          case ((MODULE_SHIPPING_FREEOPTIONS_ITEMS_MAX !='')):
//            if (($_SESSION['cart']->count_contents() - $_SESSION['cart']->free_shipping_items())<= MODULE_SHIPPING_FREEOPTIONS_ITEMS_MAX) {
            if (($_SESSION['cart']->count_contents())<= MODULE_SHIPPING_FREEOPTIONS_ITEMS_MAX) {
              $this->ck_freeoptions_items = true;
            } else {
              $this->ck_freeoptions_items = false;
            }
            break;
          }
        }
      }

/*
echo 'I see count: ' . $_SESSION['cart']->count_contents() . ' free count: ' . $_SESSION['cart']->free_shipping_items() . '<br>' .
'I see weight: ' . $_SESSION['cart']->show_weight() . '<br>' .
'I see total: ' . $_SESSION['cart']->show_total() . ' free price: ' . $_SESSION['cart']->free_shipping_prices() . '<br>' .
'Final check ' . ($this->ck_freeoptions_total ? 'T: YES ' : 'T: NO ') . ($this->ck_freeoptions_weight ? 'W: YES ' : 'W: NO ') . ($this->ck_freeoptions_items ? 'I: YES ' : 'I: NO ') . '<br>';
*/

// final check for display of Free Options
      if ($this->ck_freeoptions_total or $this->ck_freeoptions_weight or $this->ck_freeoptions_items) {
        $this->enabled = true;
      } else {
        $this->enabled = false;
      }

      if ($this->enabled) {
        $this->quotes = array('id' => $this->code,
                              'module' => MODULE_SHIPPING_FREEOPTIONS_TEXT_TITLE,
                              'methods' => array(array('id' => $this->code,
                                                       'title' => MODULE_SHIPPING_FREEOPTIONS_TEXT_WAY,
                                                       'cost'  => MODULE_SHIPPING_FREEOPTIONS_COST + MODULE_SHIPPING_FREEOPTIONS_HANDLING)));

        if ($this->tax_class > 0) {
          $this->quotes['tax'] = zen_get_tax_rate($this->tax_class, $order->delivery['country']['id'], $order->delivery['zone_id']);
        }

        if (zen_not_null($this->icon)) $this->quotes['icon'] = zen_image($this->icon, $this->title);
      }

      return $this->quotes;
    }

    function check() {
      global $db;
      if (!isset($this->_check)) {
        $check_query = $db->Execute("select configuration_value from " . TABLE_CONFIGURATION . " where configuration_key = 'MODULE_SHIPPING_FREEOPTIONS_STATUS'");
        $this->_check = $check_query->RecordCount();
      }
      return $this->_check;
    }

    function install() {
      global $db;
      $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Abilita Opzioni per la SPEDIZIONE GRATUITA', 'MODULE_SHIPPING_FREEOPTIONS_STATUS', 'True', 'L\'opzione Free &egrave; utilizzata per mostrare l\'opzione di Spedizione Gratuita quando altri Moduli di Spedizione sono visualizzati. 
Pu&ograve; essere basata su: Mostra sempre, Totale Ordine, Peso Ordine o Conteggio Articoli Ordine. 
Il modulo Opzioni per la Spedizione Gratuita non viene mostrato quando Free Shipper &egrave; visualizzato.<br /><br />
Impostando Totale a >= 0.00 e <= nothing (campo lasciato vuoto) attiver&agrave; questo modulo per essere visualizzato con tutti gli altri moduli di spedizione, eccetto che per Spedizione Gratuita - freeshipper.<br /><br />
NOTA: Lasciando vuoti tutti i settaggi di Totale, Peso e Conteggio Articoli, questo modulo NON sar&agrave; attivo.<br /><br />
NOTA: Le opzione di Spedizione Gratuita NON sono visualizzate se Spedizione Gratuita &egrave; utilizzata come Peso = 0 significa Spedizione Gratuita. Vedi: freeshipper<br /><br />Abilitare la modalit&agrave; di Opzioni per la SPEDIZIONE GRATUITA?', '6', '0', 'zen_cfg_select_option(array(\'True\', \'False\'), ', now())");
      $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Costo di Spedizione', 'MODULE_SHIPPING_FREEOPTIONS_COST', '0.00', 'Il Costo di Spedizione sar&agrave pari a 0.00', '6', '0', now())");
      $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Costo di Packaging', 'MODULE_SHIPPING_FREEOPTIONS_HANDLING', '0', 'Costo di Packaging per questo metodo di spedizione.', '6', '0', now())");


      $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Totale >=', 'MODULE_SHIPPING_FREEOPTIONS_TOTAL_MIN', '0.00', 'Spedizione Gratuita quando Totale >=', '6', '0', now())");
      $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Totale <=', 'MODULE_SHIPPING_FREEOPTIONS_TOTAL_MAX', '', 'Spedizione Gratuita quando Totale <=', '6', '0', now())");

      $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Peso >=', 'MODULE_SHIPPING_FREEOPTIONS_WEIGHT_MIN', '', 'Spedizione Gratuita quando Peso >=', '6', '0', now())");
      $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Peso <=', 'MODULE_SHIPPING_FREEOPTIONS_WEIGHT_MAX', '', 'Spedizione Gratuita quando Peso <=', '6', '0', now())");

      $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Conteggio Articoli >=', 'MODULE_SHIPPING_FREEOPTIONS_ITEMS_MIN', '', 'Spedizione Gratuita quando Conteggio Articoli >=', '6', '0', now())");
      $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Conteggio Articoli <=', 'MODULE_SHIPPING_FREEOPTIONS_ITEMS_MAX', '', 'Spedizione Gratuita quando Conteggio Articoli <=', '6', '0', now())");

      $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) values ('Classe IVA', 'MODULE_SHIPPING_FREEOPTIONS_TAX_CLASS', '0', 'Applica la seguente aliquota IVA ai costi di spedizione.', '6', '0', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes(', now())");
      $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Base di Tassa', 'MODULE_SHIPPING_FREEOPTIONS_TAX_BASIS', 'Shipping', 'Su quali basi vengono calcolate le Tasse sulle Spese di Spedizione.  Le opzioni sono:<br />Shipping - Basata sull\'indirizzo di Spedizione del Cliente<br />Billing - Basata sull\'indirizzo di Fatturazione del Cliente<br />Store - Basata sull\'indirizzo del Negozio se la Zona di Fatturazione/Spedizione &egrave; uguale alla Zona del Negozio', '6', '0', 'zen_cfg_select_option(array(\'Shipping\', \'Billing\', \'Store\'), ', now())");
      $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) values ('Zona di Spedizione', 'MODULE_SHIPPING_FREEOPTIONS_ZONE', '0', 'Se viene selezionata una Zona, attiva questo metodo di spedizione soltanto per questa Zona.', '6', '0', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes(', now())");
      $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Ordine di Visualizzazione', 'MODULE_SHIPPING_FREEOPTIONS_SORT_ORDER', '0', 'Ordine di Visualizzazione.', '6', '0', now())");
    }

   function remove() {
     global $db;
     $db->Execute("delete from " . TABLE_CONFIGURATION . " where configuration_key LIKE  'MODULE\_SHIPPING\_FREEOPTIONS\_%'");
   }

    function keys() {
      return array('MODULE_SHIPPING_FREEOPTIONS_STATUS', 'MODULE_SHIPPING_FREEOPTIONS_COST', 'MODULE_SHIPPING_FREEOPTIONS_HANDLING', 'MODULE_SHIPPING_FREEOPTIONS_TOTAL_MIN', 'MODULE_SHIPPING_FREEOPTIONS_TOTAL_MAX', 'MODULE_SHIPPING_FREEOPTIONS_WEIGHT_MIN', 'MODULE_SHIPPING_FREEOPTIONS_WEIGHT_MAX', 'MODULE_SHIPPING_FREEOPTIONS_ITEMS_MIN', 'MODULE_SHIPPING_FREEOPTIONS_ITEMS_MAX', 'MODULE_SHIPPING_FREEOPTIONS_TAX_CLASS', 'MODULE_SHIPPING_FREEOPTIONS_TAX_BASIS', 'MODULE_SHIPPING_FREEOPTIONS_ZONE', 'MODULE_SHIPPING_FREEOPTIONS_SORT_ORDER');
    }
  }
?>