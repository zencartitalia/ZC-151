<?php
/**
 * @package Installer
 * @access private
 * @copyright Copyright 2003-2011 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: system_setup.php 7411 2011-11-11 05:47:10Z LaVale $
 */
/**
 * defining language components for the page
 */
  define('SAVE_SYSTEM_SETTINGS', 'Salva Settaggi Sistema'); //this comes before TEXT_MAIN
  define('TEXT_MAIN', "Ecco i settaggi di sistema di Zen Cart&reg;.  Verifica attentamente ogni settaggio, e modificali, se necessario, per fare corrispondere le cartelle. Poi premi <em>".SAVE_SYSTEM_SETTINGS.'</em> per continuare.');
  define('TEXT_PAGE_HEADING', 'Zen Cart&reg; Setup - System Setup');
  define('SERVER_SETTINGS', 'Settaggi Server/Sito');
  define('PHYSICAL_PATH', 'Physical Path di Zen Cart&reg;');
  define('PHYSICAL_PATH_INSTRUCTION', 'Physical Path della tua <br />cartella di Zen Cart&reg;.<br />Non lasciare slash finali (/).');
  define('VIRTUAL_HTTP_PATH', 'URL del negozio Zen Cart&reg;');
  define('VIRTUAL_HTTP_PATH_INSTRUCTION', 'Virtual Path/URL della tua<br />cartella di Zen Cart&reg;.<br />Non lasciare slash finali (/).');
  define('VIRTUAL_HTTPS_PATH', 'Server URL HTTPS');
  define('VIRTUAL_HTTPS_PATH_INSTRUCTION', 'Virtual Path Completo della tua<br />cartella sicura di Zen Cart&reg;.<br />Non lasciare slash finali (/).');
  define('VIRTUAL_HTTPS_SERVER', 'Dominio HTTPS');
  define('VIRTUAL_HTTPS_SERVER_INSTRUCTION', 'Server Virtuale per la tua <br />cartella sicura di Zen Cart&reg;.<br />Non lasciare slash finali (/).');
  define('TEXT_SSL_INTRO', '<strong>Hai gi&agrave; un certificato SSL? Se si, inserisci qui i dettagli.</strong> Se si tratta della tua prima installazione, i valori forniti sono solo "suggeriti". Verifica i dati con il tuo fornitore di hosting se non conosci i dettagli corretti.');  
  define('TEXT_SSL_WARNING', 'Se il tuo certificato SSL &egrave; gi&agrave; in funzione, scegli qui i tuoi settaggi SSL. <br /><strong>NON abilitare qui SSL se non hai ancora abilitato SSL nel tuo hosting.</strong> Se abiliti SSL ma l\'indirizzo SSL fornito non funziona, non potrai accedere al pannello di amministrazione n&egrave; loggarti nel negozio. Puoi attivare SSL in un secondo momento modificando i settaggi nel file configure.php.');  
  define('SSL_OPTIONS', 'Dettagli SSL');
  define('ENABLE_SSL', 'Abilita SSL');
  define('ENABLE_SSL_INSTRUCTION', 'Vuoi abilitare Secure Sockets Layer nell\'area Clienti?<br />Lascia questo valore impostato a NO se non sei sicuro che SSL funziona correttamente.');
  define('ENABLE_SSL_ADMIN', 'Abilita SSL nell\'Area Admin');
  define('ENABLE_SSL_ADMIN_INSTRUCTION', 'Vuoi abilitare Secure Sockets Layer per le aree Admin?<br />
Lascia questo valore impostato a NO se non sei sicuro che SSL funziona correttamente.');
  define('REDISCOVER', 'Rileva dati default per questo host');
