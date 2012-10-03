<?php
/**
 * @package Installer
 * @access private
 * @copyright Copyright 2003-2010 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: navigation.php 17018 2010-07-27 07:25:41Z drbyte $
 */

?>
<ul>
  <li id="welcome">Benvenuto</li>
  <li id="licenseaccept">Licenza</li>
  <li id="inspection">Prerequisiti</li>
  <li id="database">Setup Database</li>
<?php if ((isset($is_upgradable) && $is_upgradable) || (isset($is_upgrade) && $is_upgrade)) { ?>
  <li id="databaseupg">Upgrade Database</li>
<?php } ?>
  <li id="system">Setup Sistema</li>
<?php if (isset($flag_check_config_keys) && $flag_check_config_keys) { ?>
  <li id="cfgcheck">Verifica File Config</li>
<?php } ?>
  <li id="store">Setup Negozio</li>
  <li id="admin">Setup Admin</li>
  <li id="finish">Completato</li>
</ul>