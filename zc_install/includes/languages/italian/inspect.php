<?php
/**
 * @package Installer
 * @access private
 * @copyright Copyright 2003-2011 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: inspect.php 7411 2011-11-11 05:47:10Z LaVale $
 */
/**
 * defining language components for the page
 */
  define('TEXT_PAGE_HEADING', 'Zen Cart&reg; Setup - Ispezione del Sistema');
  define('INSTALL_BUTTON', ' Installa '); // this comes before TEXT_MAIN
  define('UPGRADE_BUTTON', 'Aggiorna Config File'); // this comes before TEXT_MAIN
  define('DB_UPGRADE_BUTTON', 'Database Upgrade'); // this comes before TEXT_MAIN
//Button meanings: (to be made into help-text for future version):
// "Install" = make new configure.php files, regardless of existing contents.  Load new database by dropping old tables.
// "Upgrade" = read old configure.php files, and write new ones using new structure. Upgrade database, instead of wiping and new install
// "Database Upgrade" = don't write the configure.php files -- simply jump to the database-upgrade page. Only displayed if detected database version is new enough to not require configure.php file updates.

  define('TITLE_DOCUMENTATION', 'Documentazione');
  define('TEXT_DOCUMENTATION', '<h3>Hai gi&agrave; letto le istruzioni per l\'installazione?</h3>Le <a href="%s" target="_blank">Istruzioni per l\'Installazione</a> ti possono essere di grande aiuto, se non le hai ancora lette.<br />Potrai trovare informazioni inerenti ai diversi livelli di permessi da attribuire alle varie cartelle/file e altri dettagli relativi ai prerequisiti per l\'installazione, cos&igrave; come le operazioni da svolgere una volta terminata l\'installazione. Vi sono anche i link alle <a href="http://tutorials.zen-cart.com/" target="_blank">FAQ online</a> e ad altre risorse utili.');

  define('TEXT_MAIN', 'Verifica se il tuo server ha le caratteristiche necessarie al corretto funzionamento di Zen Cart&reg;. &nbsp;Prima di continuare correggi i possibili errori o avvisi, se presenti. &nbsp;Poi premi <em>'.INSTALL_BUTTON.'&nbsp;</em> per continuare.');
  define('SYSTEM_INSPECTION_RESULTS', 'Risultati dell\'Ispezione del Sistema');
  define('OTHER_INFORMATION', 'Altre Informazioni del Sistema (solo per riferimento)');
  define('OTHER_INFORMATION_DESCRIPTION', 'Queste informazioni non indicano necessariamente errori o problemi di configurazione ma sono a puro scopo informativo.');

  define('NOT_EXIST','NON TROVATO');
  define('WRITABLE','Scrivibile');
  define('UNWRITABLE',"<span class='errors'>NON Scrivibile</span>");
  define('UNKNOWN','Sconosciuto');
  define('ON','ON');
  define('OFF','OFF');
  define('OK','OK');

  define('UPGRADE_DETECTION','Upgrade Mode Disponibile');
  define('LABEL_PREVIOUS_INSTALL_FOUND','Trovate Precedenti Installazioni di Zen Cart&reg;');
  define('LABEL_PREVIOUS_VERSION_NUMBER','Versione database di Zen Cart&reg; v%s');
  define('LABEL_PREVIOUS_VERSION_NUMBER_UNKNOWN','<em>Non &egrave; possibile determinare la versione del tuo database. Questo pu&ograve; dipendere da prefissi errati delle tabelle, o da altri errori nei settaggi del database. <br /><br />ATTENZIONE: Usa l\'opzione Upgrade solo se sei sicuro che i settaggi dei file configure.php siano corretti.</em>');
  define('LABEL_UPGRADE_VS_INSTALL', 'Installa o Aggiorna?');
  define('LABEL_INSTALL', 'Pronto a Installare?  (Cancellerai ogni dato esistente, questo NON &egrave; un aggiornamento !)');

  define('IMAGE_STOP_BEFORE_UPGRADING', '<div class="center"><img src="includes/templates/template_default/images/stop.gif" border="0" alt="WARNING: Be sure to choose the proper option below." /></div>');

  define('LABEL_ACTION_SELECTION_INSTRUCTIONS','<p class="errors extralarge"><span class="center">NOTA:</span><br />Se stai effettuando l\'upgrade, assicurati di scegliere "<span style="text-decoration: underline;">Database Upgrade</span>" sotto per conservare i tuoi dati.</p><p class="extralarge">Se scegli "Installa", cancellerai tutte le informazioni salvate nel database.</p>');

  define('DISPLAY_PHP_INFO','PHP Info link: ');
  define('VIEW_PHP_INFO_LINK_TEXT','Vedi PHPINFO del tuo server');
  define('LABEL_WEBSERVER','Webserver');
  define('LABEL_MYSQL_AVAILABLE','MySQL Support');
  define('LABEL_MYSQL_VER','MySQL Versione');
  define('LABEL_DB_PRIVS','Database Privilegi');
  define('LABEL_POSTGRES_AVAILABLE','PostgreSQL Supporto');
  define('LABEL_PHP_VER','PHP Versione');
  define('LABEL_PHP_OS','PHP O/S');
  define('LABEL_REGISTER_GLOBALS','Register Globals');
  define('LABEL_SET_TIME_LIMIT','PHP Max Execution Time per page');
  define('LABEL_DISABLED_FUNCTIONS','Disabled PHP Functions');
  define('LABEL_SAFE_MODE','PHP Safe Mode');
  define('LABEL_CURRENT_CACHE_PATH','Current SQL Cache Folder');
  define('LABEL_SUGGESTED_CACHE_PATH','Suggested SQL Cache Folder');
  define('LABEL_HTTP_HOST','HTTP Host');
  define('LABEL_PATH_TRANLSATED','Path_Translated');
  define('LABEL_REALPATH', 'Real Path');
  define('LABEL_PHP_API_MODE','PHP API Mode');
  define('LABEL_PHP_MODULES','PHP Modules Active');
  define('LABEL_PHP_EXT_SESSIONS','PHP Sessions Support');
  define('LABEL_PHP_SESSION_AUTOSTART','PHP Session.AutoStart');
  define('LABEL_PHP_EXT_SAVE_PATH','PHP Session.Save_Path');
  define('LABEL_PHP_EXT_FTP','PHP FTP Support');
  define('LABEL_PHP_EXT_CURL','PHP cURL Support');
  define('LABEL_CURL_NONSSL','CURL NON-SSL Capability');
  define('LABEL_CURL_SSL','CURL SSL Capability');
  define('LABEL_CURL_NONSSL_PROXY','CURL NON-SSL Capability via Proxy');
  define('LABEL_CURL_SSL_PROXY','CURL SSL Capability via Proxy');
  define('LABEL_PHP_MAG_QT_RUN','PHP magic_quotes_runtime setting');
  define('LABEL_PHP_MAG_QT_SYBASE','PHP magic_quotes_sybase setting');
  define('LABEL_PHP_EXT_GD','PHP GD Support');
  define('LABEL_GD_VER','GD Version');
  define('LABEL_PHP_EXT_OPENSSL','PHP OpenSSL Support');
  define('LABEL_PHP_UPLOAD_STATUS','PHP Upload Support');
  define('LABEL_PHP_EXT_PFPRO','PHP Payflow Pro Support');
  define('LABEL_PHP_EXT_ZLIB','PHP ZLIB Compression Support');
  define('LABEL_PHP_SESSION_TRANS_SID','PHP session.use_trans_sid');
  define('LABEL_DISK_FREE_SPACE','Server Free Disk Space');
  define('LABEL_XML_SUPPORT','PHP XML Support');
  define('LABEL_HTACCESS_SUPPORT','Apache .htaccess Support');
  define('LABEL_COULD_NOT_TEST_HTACCESS','Could not test - no CURL support');
  define('LABEL_OPEN_BASEDIR','PHP open_basedir restrictions');
  define('LABEL_UPLOAD_TMP_DIR','PHP Upload TMP dir');
  define('LABEL_SENDMAIL_FROM','PHP sendmail \'from\'');
  define('LABEL_SENDMAIL_PATH','PHP sendmail path');
  define('LABEL_SMTP_MAIL','PHP SMTP destination');
  define('LABEL_GZIP', 'PHP Output Buffering (gzip)');
  define('LABEL_INCLUDE_PATH','PHP include_path');

  define('LABEL_CRITICAL','Valori Critici');
  define('LABEL_RECOMMENDED','Valori Raccomandati');
  define('LABEL_OPTIONAL','Valori Opzionali');

  define('LABEL_EXPLAIN','&nbsp;altre info...');
  define('LABEL_FOLDER_PERMISSIONS','Permessi File e Cartelle');
  define('LABEL_WRITABLE_FILE_INFO', 'Affinch&egrave; l\'installer salvi le informazioni di setup inserite nelle pagine successive, i due file configure.php devono essere "scrivibili".');
  define('LABEL_WRITABLE_FOLDER_INFO','Affinch&egrave; gran parte delle funzioni amministrative e giornaliere di Zen Cart&reg; operino correttamente, &egrave necessario che alcuni file/cartelle siano "scrivibili". Ecco una lista di cartelle i cui permessi devono essere settati come "lettura-scrittura", con i settaggi CHMOD raccomandati. Correggi queste impostazioni prima di continuare l\'installazione.
Aggiorna questa pagina nel browser per controllare i settaggi.<br /><br />Alcuni host non consentono di settare CHMOD 777, ma solo 666. Inizia dal valore pi&ugrave; alto, per poi passare a quello pi&ugrave; basso, sino al corretto settaggio.');
