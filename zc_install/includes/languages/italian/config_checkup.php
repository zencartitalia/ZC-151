<?php
/**
 * @package Installer
 * @access private
 * @copyright Copyright 2003-2011 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: config_checkup.php 7403 2011-11-11 04:09:16Z drbyte $
 */
/**
 * defining language components for the page
 */
  define('TEXT_MAIN', '<h2>Correggi i file di configurazione</h2><p>I file configure.php non possono essere validati. Questo perch&egrave; molto probabilmente non contengono informazioni valide.</p>');
  define('TEXT_EXPLANATION2', '<p>Dopo averci fornito le informazioni necessarie, cercheremo di scriverle nei file configure.php nel tuo server. Stai visualizzando questa schermata perch&egrave; tale processo non &egrave; andato a buon fine. Perci&ograve; dovrai inserire questi contenuti manualmente.</p>');
  define('TEXT_PAGE_HEADING', 'Zen Cart&reg; Setup - Ckeckup di Configurazione');
  define('TEXT_CONFIG_FILES', 'Settaggi Configurazione - file configure.php');
  define('TEXT_CONFIG_INSTRUCTIONS', 'Puoi usare i tuoi dati del computer per copiare e incollare i contenuti appropriati in questi box.  Clicca nella casella, copia dai tuoi appunti, apri il file configure.php corretto usando un editor du testo, copia i contenuti degli appunti nel file, salva, carica. Ripeti per l\'altro file.<br /><br />Una volta terminato, premi il bottone "Ricontrolla File" per iniziare nuovamente la validazione.');

  define('TEXT_CATALOG_CONFIGFILE', '/includes/configure.php');
  define('TEXT_ADMIN_CONFIGFILE', '/admin/includes/configure.php');

  define('CONTINUE_BUTTON', 'Ignora e Continua');
  define('RECHECK', 'Ricontrolla File');