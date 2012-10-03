<?php
/**
 * @package Installer
 * @access private
 * @copyright Copyright 2003-2011 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: admin_setup.php 7411 2011-11-11 05:47:10Z LaVale $
 */
/**
 * defining language components for the page
 */
  define('TEXT_PAGE_HEADING', 'Zen Cart&reg; Setup - Setup Account Amministratore');
  define('SAVE_ADMIN_SETTINGS', 'Salva Settaggi Admin');//this comes before TEXT_MAIN
  define('TEXT_MAIN', "Per gestire i settaggi nel tuo negozio Zen Cart&reg;, &egrave; necessario avere un account da amministratore.  Scegli nome e password per l'amministratore e un indirizzo email a cui inviare la password, se dimenticata.  Inserisci e verifica attentamente le informazioni, poi premi <em>".SAVE_ADMIN_SETTINGS.'</em> per continuare.');
  define('ADMIN_INFORMATION', 'Informazioni Amministratore');
  define('ADMIN_USERNAME', 'Username Amministratore');
  define('ADMIN_USERNAME_INSTRUCTION', 'Inserisci l\'username da usare per l\'account amministratore di Zen Cart&reg;.');
  define('ADMIN_PASS', 'Password Amministratore TEMPORANEA');
  define('ADMIN_PASS_INSTRUCTION', 'Inserisci una password <strong>TEMPORANEA</strong> da usare per l\'account amministratore di Zen Cart&reg;. Ti verr&agrave; chiesto di cambiare questa password al primo login.<br />La password <strong>deve contenere sia NUMERI che LETTERE e deve avere almeno 7 caratteri.</strong>');
  define('ADMIN_PASS_CONFIRM', 'Conferma Password Amministratore Temporanea');
  define('ADMIN_PASS_CONFIRM_INSTRUCTION', 'Conferma la password Temporanea da usare per l\'account amministratore di Zen Cart&reg;.');
  define('ADMIN_EMAIL', 'Email Amministratore');
  define('ADMIN_EMAIL_INSTRUCTION', 'Inserisci l\'indirizzo email da usare per l\'account amministratore di Zen Cart&reg;. Verr&agrave; usato per testare le email delle newsletter e per inviare una nuova password, se dimenticata, ecc.');
  define('UPGRADE_DETECTION','Avviso Aggiornamenti');
  define('UPGRADE_INSTRUCTION_TITLE','Verifica la disponibilit&agrave; di aggiornamenti di Zen Cart&reg; dal pannello di amministrazione');
  define('UPGRADE_INSTRUCTION_TEXT','Cercher&agrave; di connettersi al server di Zen Cart&reg; per determinare la disponibilit&agrave; di aggiornamenti. Se presenti, comparir&agrave; un messaggio nell\'amministrazione.  NON installer&agrave; automaticamente alcun aggiornamento.<br />Puoi modificare questo settaggio in Admin > Configurazione > Info Negozio > Visualizza se ci sono aggiornamenti disponibili.');




