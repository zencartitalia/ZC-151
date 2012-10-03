<?php
/**
 * Main English language file for installer *
 * @package Installer
 * @access private
 * @copyright Copyright 2003-2012 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version GIT: $Id: Author: DrByte  Thu Aug 16 01:57:33 2012 -0400 Modified in v1.5.1 $
 */
/**
 * defining language components for the page
 */
  define('YES', 'SI');
  define('NO', 'NO');
  define('REFRESH_BUTTON', 'Riprova');
  define('OKAY', 'Va Bene');

  // Global entries for the <html> tag
  define('HTML_PARAMS','dir="ltr" lang="it"');

  // charset for web pages and emails
  define('CHARSET', 'utf-8');

  // META TAG TITLE
  define('META_TAG_TITLE', (defined('TEXT_PAGE_HEADING') ? TEXT_PAGE_HEADING : 'Zen Cart&reg; Installer'));

  define('INSTALLATION_IN_PROGRESS','Installazione in corso, attendere ...');

  if (isset($_GET['main_page']) && ($_GET['main_page']== 'index' || $_GET['main_page']== 'license')) {
    define('TEXT_ERROR_WARNING', 'Alcune cose che debbono essere configurate prima di procedere.');
  } else {
    define('TEXT_ERROR_WARNING', '<span class="errors"><strong>ATTENTIONE:&nbsp; riscontrati dei Problemi</strong></span>');
  }

  define('DB_ERROR_NOT_CONNECTED', 'Errore: mancanza di connessione al Database');
	define('SHOULD_UPGRADE','Dovresti considerare un aggiornamento!');
  define('MUST_UPGRADE','Devi aggiornare prima di poter installare Zen Cart&reg;');

  define('UPLOAD_SETTINGS','The Maximum upload size supported will be whichever the LOWER of these values:.<br />
<em>upload_max_filesize</em> in php.ini %s <br />
<em>post_max_size</em> in php.ini: %s <br />' . 
//'<em>Zen Cart&reg;</em> Upload Setting: %s <br />' .
'You may find some Apache settings that prevent you from uploading files or limit your maximum file size.  
See the Apache documentation for more information.');

  define('TEXT_HELP_LINK', ' altre info...');
  define('TEXT_CLOSE_WINDOW', '[Chiudi finestra]');
  define('STORE_ADDRESS_DEFAULT_VALUE', 'Nome del negozio
  Indirizzo completo
  Paese
  Tel. Fax');

  define('ERROR_TEXT_ADMIN_CONFIGURE', '/admin/includes/configure.php NON esiste');
  define('ERROR_CODE_ADMIN_CONFIGURE', '2');

  define('ERROR_TEXT_STORE_CONFIGURE', '/includes/configure.php NON esiste');
  define('ERROR_CODE_STORE_CONFIGURE', '3');

  define('ERROR_TEXT_PHYSICAL_PATH_ISEMPTY', 'Physical path risulta vuoto');
  define('ERROR_CODE_PHYSICAL_PATH_ISEMPTY', '9');

  define('ERROR_TEXT_PHYSICAL_PATH_INCORRECT', 'Physical path non corretto');
  define('ERROR_CODE_PHYSICAL_PATH_INCORRECT', '10');

  define('ERROR_TEXT_VIRTUAL_HTTP_ISEMPTY', 'Virtual HTTP risulta vuoto');
  define('ERROR_CODE_VIRTUAL_HTTP_ISEMPTY', '11');

  define('ERROR_TEXT_VIRTUAL_HTTPS_ISEMPTY', 'Virtual HTTPS risulta vuoto');
  define('ERROR_CODE_VIRTUAL_HTTPS_ISEMPTY', '12');

  define('ERROR_TEXT_VIRTUAL_HTTPS_SERVER_ISEMPTY', 'Virtual HTTPS server risulta vuoto');
  define('ERROR_CODE_VIRTUAL_HTTPS_SERVER_ISEMPTY', '13');

  define('ERROR_TEXT_DB_USERNAME_ISEMPTY', 'Database UserName risulta vuoto');
  define('ERROR_CODE_DB_USERNAME_ISEMPTY', '16'); // re-using another one, since message is essentially the same.

  define('ERROR_TEXT_DB_HOST_ISEMPTY', 'Database Host risulta vuoto');
  define('ERROR_CODE_DB_HOST_ISEMPTY', '24');

  define('ERROR_TEXT_DB_NAME_ISEMPTY', 'Database Name risulta vuoto'); 
  define('ERROR_CODE_DB_NAME_ISEMPTY', '25');

  define('ERROR_TEXT_DB_SQL_NOTEXIST', 'File di installazione SQL NON esiste');
  define('ERROR_CODE_DB_SQL_NOTEXIST', '26');

  define('ERROR_TEXT_DB_NOTSUPPORTED', 'Database NON supportato');
  define('ERROR_CODE_DB_NOTSUPPORTED', '27');

  define('ERROR_TEXT_DB_CONNECTION_FAILED', 'Connessione al Database fallita');
  define('ERROR_CODE_DB_CONNECTION_FAILED', '28');

  define('ERROR_TEXT_STORE_ZONE_NEEDS_SELECTION', 'Deve essere specificata una Provincia.');
  define('ERROR_CODE_STORE_ZONE_NEEDS_SELECTION', '29');

  define('ERROR_TEXT_DB_NOTEXIST', 'Database NON esiste');
  define('ERROR_CODE_DB_NOTEXIST', '30');

  define('ERROR_TEXT_STORE_NAME_ISEMPTY', 'Nome Negozio risulta vuoto');
  define('ERROR_CODE_STORE_NAME_ISEMPTY', '31');

  define('ERROR_TEXT_STORE_OWNER_ISEMPTY', 'Titolare Negozio risulta vuoto');
  define('ERROR_CODE_STORE_OWNER_ISEMPTY', '32');

  define('ERROR_TEXT_STORE_OWNER_EMAIL_ISEMPTY', 'Indirizzo email Negozio risulta vuoto');
  define('ERROR_CODE_STORE_OWNER_EMAIL_ISEMPTY', '33');

  define('ERROR_TEXT_STORE_OWNER_EMAIL_NOTEMAIL', 'Indirizzo email Negozio NON corretto');
  define('ERROR_CODE_STORE_OWNER_EMAIL_NOTEMAIL', '34');

define('ERROR_TEXT_STORE_ADDRESS_ISEMPTY', 'Indirizzo negozio risulta vuoto');
define('ERROR_CODE_STORE_ADDRESS_ISEMPTY', '35');

define('ERROR_TEXT_DEMO_SQL_NOTEXIST', 'Demo file SQL NON esiste');
define('ERROR_CODE_DEMO_SQL_NOTEXIST', '36');

define('ERROR_TEXT_ADMIN_USERNAME_ISEMPTY', 'Admin username risulta vuoto');
define('ERROR_CODE_ADMIN_USERNAME_ISEMPTY', '46');

define('ERROR_TEXT_ADMIN_EMAIL_ISEMPTY', 'Indirizzo email Admin risulta vuoto');
define('ERROR_CODE_ADMIN_EMAIL_ISEMPTY', '47');

define('ERROR_TEXT_ADMIN_EMAIL_NOTEMAIL', 'Indirizzo email Admin NON corretto');
define('ERROR_CODE_ADMIN_EMAIL_NOTEMAIL', '48');

define('ERROR_TEXT_ADMIN_PASS_ISEMPTY', 'Admin password risulta vuoto');
define('ERROR_CODE_ADMIN_PASS_ISEMPTY', '49');

define('ERROR_TEXT_ADMIN_PASS_NOTEQUAL', 'Passwords NON coincidono');
define('ERROR_CODE_ADMIN_PASS_NOTEQUAL', '50');

define('ERROR_TEXT_4_1_2', 'PHP Versione 4.1.2');
define('ERROR_CODE_4_1_2', '1');
define('ERROR_TEXT_PHP_OLD_VERSION', 'PHP Versione NON supportata');
define('ERROR_CODE_PHP_OLD_VERSION', '55');
define('ERROR_TEXT_PHP_VERSION', 'PHP Versione NON supportata');
define('ERROR_CODE_PHP_VERSION', '91');

define('ERROR_TEXT_ADMIN_CONFIGURE_WRITE', 'admin configure.php NON &egrave; scrivibile');
define('ERROR_CODE_ADMIN_CONFIGURE_WRITE', '56');

define('ERROR_TEXT_STORE_CONFIGURE_WRITE', 'store configure.php NON &egrave; scrivibile');
define('ERROR_CODE_STORE_CONFIGURE_WRITE', '57');

define('ERROR_TEXT_CACHE_DIR_ISEMPTY', 'La selezione della cartella Session/SQL Cache selezionata risulta vuota');
define('ERROR_CODE_CACHE_DIR_ISEMPTY', '61');

define('ERROR_TEXT_CACHE_DIR_ISDIR', 'La selezione della cartella Session/SQL Cache selezionata NON esiste');
define('ERROR_CODE_CACHE_DIR_ISDIR', '62');

define('ERROR_TEXT_CACHE_DIR_ISWRITEABLE', 'La selezione della cartella Session/SQL Cache selezionata NON &egrave; scrivibile');
define('ERROR_CODE_CACHE_DIR_ISWRITEABLE', '63');

define('ERROR_TEXT_ADMIN_PASS_INSECURE', 'Password non abbastanza sicura. Deve contenere sia lettere che numeri, e avere almeno 7 caratteri.');
define('ERROR_CODE_ADMIN_PASS_INSECURE', '64');

define('ERROR_TEXT_REGISTER_GLOBALS_ON', 'Register Globals &egrave; ON');
define('ERROR_CODE_REGISTER_GLOBALS_ON', '69');

define('ERROR_TEXT_SAFE_MODE_ON', 'Safe Mode &egrave; ON');
define('ERROR_CODE_SAFE_MODE_ON', '70');

define('ERROR_TEXT_CACHE_CUSTOM_NEEDED','Cache folder richiede utilizzo del supporto di file caching');
define('ERROR_CODE_CACHE_CUSTOM_NEEDED', '71');

define('ERROR_TEXT_TABLE_RENAME_CONFIGUREPHP_FAILED','Impossibile aggiornare i file di configure.php con il nuovo prefisso');
define('ERROR_CODE_TABLE_RENAME_CONFIGUREPHP_FAILED', '72');

define('ERROR_TEXT_TABLE_RENAME_INCOMPLETE','Impossibile rinominare tutte le tabelle');
define('ERROR_CODE_TABLE_RENAME_INCOMPLETE', '73');

define('ERROR_TEXT_SESSION_SAVE_PATH','PHP "session.save_path" NON &egrave; scrivibile');
define('ERROR_CODE_SESSION_SAVE_PATH','74');

define('ERROR_TEXT_MAGIC_QUOTES_RUNTIME','PHP "magic_quotes_runtime" &egrave; attivo');
define('ERROR_CODE_MAGIC_QUOTES_RUNTIME','75');

define('ERROR_TEXT_DB_VER_UNKNOWN','Informazioni sul tipo di Database sconosciute');
define('ERROR_CODE_DB_VER_UNKNOWN','76');

define('ERROR_TEXT_UPLOADS_DISABLED','File Uploads NON abilitato');
define('ERROR_CODE_UPLOADS_DISABLED','77');

define('ERROR_TEXT_ADMIN_PWD_REQUIRED','Password di Admin richiesta per il processo di upgrade');
define('ERROR_CODE_ADMIN_PWD_REQUIRED','78');

define('ERROR_TEXT_PHP_SESSION_SUPPORT','Supporto Sessioni PHP richiesto');
define('ERROR_CODE_PHP_SESSION_SUPPORT','80');

define('ERROR_TEXT_PHP_AS_CGI','PHP in uso come cgi tranne che per server Windows');
define('ERROR_CODE_PHP_AS_CGI','81');

define('ERROR_TEXT_DISABLE_FUNCTIONS','Delle funzionalit&agrave; PHP richieste sono disabilitate nel tuo server');
define('ERROR_CODE_DISABLE_FUNCTIONS','82');

define('ERROR_TEXT_OPENSSL_WARN','OpenSSL is "one" way in which a server can be configured to offer SSL (https://) support for your site.<br /><br />If this is showing as unavailable, possible causes could be:<br />(a) your webhost doesn\'t support SSL<br />(b) your webserver doesn\'t have OpenSSL installed, but MIGHT have another form of SSL services available<br />(c) your web host may not yet be aware of your SSL certificate details so that they can enable SSL support for your domain<br />(d) PHP may not be configured to know about OpenSSL yet.<br /><br />In any case, if you DO require encryption support on your web pages (SSL), you should be contacting your web hosting provider for assistance.');
define('ERROR_CODE_OPENSSL_WARN','79');

define('ERROR_TEXT_DB_PREFIX_NODOTS','Prefisso-tavole Database deve contenere lettere-o-numeri ma senza_spazi.');
define('ERROR_CODE_DB_PREFIX_NODOTS','83');

define('ERROR_TEXT_PHP_SESSION_AUTOSTART','PHP Session.autostart deve essere disabilitato.');
define('ERROR_CODE_PHP_SESSION_AUTOSTART','84');
define('ERROR_TEXT_PHP_SESSION_TRANS_SID','PHP Session.use_trans_sid pu&ograve; essere disabilitato.');
define('ERROR_CODE_PHP_SESSION_TRANS_SID','86');
define('ERROR_TEXT_DB_PRIVS','Richiesti permessi per Database Utemte');
define('ERROR_CODE_DB_PRIVS','87');
define('ERROR_TEXT_COULD_NOT_WRITE_CONFIGURE_FILES','Errore durante la scrittura di /includes/configure.php');
define('ERROR_CODE_COULD_NOT_WRITE_CONFIGURE_FILES','88');
define('ERROR_TEXT_GD_SUPPORT','GD Dettagli del supporto');
define('ERROR_CODE_GD_SUPPORT','89');

define('ERROR_TEXT_DB_MYSQL5','Supporto di MySQL 5.7 (o superiore) non completamente testato');
define('ERROR_CODE_DB_MYSQL5','90');

define('ERROR_TEXT_OPEN_BASEDIR','Potresti avere problemi nel caricamento o per i backups');
define('ERROR_CODE_OPEN_BASEDIR','92');
define('ERROR_TEXT_CURL_SUPPORT','Supporto cURL non rilevato o risulta disabilitato');
define('ERROR_CODE_CURL_SUPPORT','93');
define('ERROR_TEXT_CURL_NOT_COMPILED', 'CURL non compilato nel PHP - avvisa amministratore server');
define('ERROR_TEXT_CURL_PROBLEM_GENERAL', 'CURL problemi rilevati: ');
define('ERROR_TEXT_CURL_SSL_PROBLEM', 'CURL richiesto supporto SSL. Avvisa amministratore o hosting provider.');
define('ERROR_CODE_CURL_SSL_PROBLEM','95');

define('ERROR_TEXT_MAGIC_QUOTES_SYBASE','PHP "magic_quotes_sybase" &egrave; attivo');
define('ERROR_CODE_MAGIC_QUOTES_SYBASE','94');

$error_code ='';
if (isset($_GET['error_code'])) {
  $error_code = $_GET['error_code'];
  }

switch ($error_code) {
  case ('1'):
    define('POPUP_ERROR_HEADING', 'Trovato PHP Versione 4.1.2');
    define('POPUP_ERROR_TEXT', 'Some releases of PHP Version 4.1.2 have a bug which affects super global arrays. This may result in the admin section of Zen Cart&reg; not being accessible. You are advised to upgrade your PHP version if possible.<br /><br />PHP 4.3.2 or greater is the minimum requirement for Zen Cart&reg;.<br />We STRONGLY recommend using PHP 4.3.11 or greater (in the v4.x series).');
    
  break;
  case ('2'):
    define('POPUP_ERROR_HEADING', '/admin/includes/configure.php NON esiste');
    define('POPUP_ERROR_TEXT', 'Il file /admin/includes/configure.php NON esiste. Puoi creare un file vuoto con questo nome o rinomiare il presente  /admin/includes/dist-configure.php in configure.php. Dopo la creazione bisogna assegnare i permessi di lettura-scrittura o CHMOD 666 o 755 o 777 a seconda della configurazione del tuo server (chiedi al tuo hosting provider).');
    
  break;
  case ('3'):
    define('POPUP_ERROR_HEADING', '/includes/configure.php NON esiste');
    define('POPUP_ERROR_TEXT', 'Il file /includes/configure.php NON esiste. Puoi reare un file vuoto con questo nome o rinomiare il presente /includes/dist-configure.php in configure.php. Dopo la creazione bisogna assegnare i permessi di lettura-scrittura o CHMOD 666 o 755 o 777 a seconda della configurazione del tuo server (chiedi al tuo hosting provider).');
    
  break;
  case ('4'):
    define('POPUP_ERROR_HEADING', 'Physical Path');
    define('POPUP_ERROR_TEXT', 'Il physiscal path &egrave; il path della directory in cui sono installati i file di Zen Cart&reg;. Ad esempio in alcuni sistemi linux i file HTML si trovano in /var/www/html. Se poi metti i file di Zen Cart&reg; in una cartella chiamata \'store\', il physical path sar&agrave; /var/www/html/store. L\'installer solitamente individua correttamente questa cartella.');
    
  break;
  case ('5'):
    define('POPUP_ERROR_HEADING', 'Virtual HTTP Path');
    define('POPUP_ERROR_TEXT', '&Egrave; l\'indirizzo da scrivere nel web browser per visualizzare il tuo sito Zen Cart&reg;. Se il sito si trova nella \'root\' del dominio, sar&agrave; \'http://www.tuodominio.com\'. Se i file si trovano in una cartella chiamata \'store\' allora il path sar&agrave; \'http://www.tuodominio.com/store\'.');
    
  break;
  case ('6'):
    define('POPUP_ERROR_HEADING', 'Virtual HTTPS Server');
    define('POPUP_ERROR_TEXT', '&Egrave; l\'indirizzo del web server per il server sicuro/SSL. Questo indirizzo varia a seconda che la modalit&agrave; SSL/Secure sia implementata o meno nel tuo server. Leggi questa <a href="http://tutorials.zen-cart.com/index.php?article=14" target="_blank">FAQ</a> relativa a SSL per assicurarti che sia corretto.');
    
  break;
  case ('7'):
    define('POPUP_ERROR_HEADING', 'Virtual HTTPS Path');
    define('POPUP_ERROR_TEXT', '&Egrave; l\'indirizzo da scrivere nel web browser per visualizzare il tuo sito Zen Cart&reg; in modalit&agrave; sicura/SSL. Leggi questa <a href="http://tutorials.zen-cart.com/index.php?article=14" target="_blank">FAQ</a> relativa a SSL per assicurarti che sia corretto.');
    
  break;
  case ('8'):
    define('POPUP_ERROR_HEADING', 'Abilita SSL');
    define('POPUP_ERROR_TEXT', 'Questo settaggio determina se utilizzare la modalit&agrave; SSL/Secure (HTTPS:) nelle pagine pi&ugrave; vulnerabili di Zen Cart&reg;.<br /><br />Con la modalit&agrave; SSL/Secure si possono proteggere tutte le pagine che contengono informazioni personali, come login, checkout, dettagli account.  Pu&ograve; anche essere attivato per il pannello di amministrazione.<br /><br />Devi avere accesso ad un server SSL (denotato usando HTTPS anzich&egrave; HTTP). <br /><br />SE NON SEI SICURO di avere un server SSL lascia per il momento questo valore impostato a NO, e verificane la disponibilit&agrave; con il tuo fornitore di hosting. Nota: Come tutti gli altri settaggi, puoi modificare quest\'impostazione in un secondo momento modificando il file configure.php.');
    
  break;
  case ('9'):
    define('POPUP_ERROR_HEADING', 'Physical Path risulta vuoto');
    define('POPUP_ERROR_TEXT', 'Non hai inserito alcun valore per il Physical path. Devi scrivere un percorso valido.');
    
  break;
  case ('10'):
    define('POPUP_ERROR_HEADING', 'Physical Path non corretto');
    define('POPUP_ERROR_TEXT', 'Quanto inserito come Physical Path non sembra essere corretto. Correggilo e riprova.<br />Zen Cart&reg; sta cercando un file in questo path e sta verificando che vi sia presente un file index.php. Se manca, allora probabilmente vi sono stati uno o pi&ugrave; errori durante il caricamento FTP e devi controllare tutto per sistemare quanto manca.');
   
  break;
  case ('11'):
    define('POPUP_ERROR_HEADING', 'Virtual HTTP risulta vuoto');
    define('POPUP_ERROR_TEXT', 'Non hai inserito alcun valore per il Virtual HTTP path. Devi scrivere un percorso valido.');
    
  break;
  case ('12'):
    define('POPUP_ERROR_HEADING', 'Virtual HTTPS risulta vuoto');
    define('POPUP_ERROR_TEXT', 'You have left the entry for the Virtual HTTPS path empty as well as enabling SSL mode. You must make a valid entry here or disable SSL mode.');
    
  break;
  case ('13'):
    define('POPUP_ERROR_HEADING', 'Virtual HTTPS server risulta vuoto');
    define('POPUP_ERROR_TEXT', 'You have left the entry for the Virtual HTTPS server empty as well as enabling SSL mode. You must make a valid entry here or disable SSL mode');
    
  break;
  case ('14'):
    define('POPUP_ERROR_HEADING', 'Set Caratteri / Collation Database');
    define('POPUP_ERROR_TEXT', 'Di default, Zen Cart&reg; usa il set di caratteri / collation Latin1 per il database e i file. Se hai bisogno di usare UTF-8 al posto di Latin1, puoi scegliere qui UTF-8. <br /><strong>TUTTAVIA, PRENDI NOTA</strong> che dovrai modificare manualmente TUTTI i file di lingua nella codifica "UTF8-without-BOM" se stai usando caratteri multibyte nei file di lingua.');
    
  break;
  case ('15'):
    define('POPUP_ERROR_HEADING', 'Host Database');
    define('POPUP_ERROR_TEXT', 'Si tratta del nome del webserver sul quale funziona il programma del database del tuo host. Nella maggior parte dei casi puoi lasciare questo campo settato a \'localhost\'. In casi eccezionali sar&agrave; necessario chiedere al tuo fornitore di hosting il nome del server dei suoi database server.<br /><br />La maggior parte degli host usano "localhost"<br />Hosting Yahoo usa sempre "mysql"<br />Altri host ti forniranno il proprio host-name attraverso il pannello di controllo.');
    
  break;
  case ('16'):
    define('POPUP_ERROR_HEADING', 'Database User Name');
    define('POPUP_ERROR_TEXT', 'Tutti i database hanno bisogno di username e password per potervi accedere. L\'username pu&ograve; esserti stato assegnato dal tuo fornitore di hosting e dovresti contattarlo per i dettagli.<br /><br />A volte il nome ha un prefisso davanti all\'account name del tuo webhosting, seguito dal database-user-name che hai scelto. Ad esempio: mioaccount_zencartuser');
    
  break;
  case ('17'):
    define('POPUP_ERROR_HEADING', 'Password Database');
    define('POPUP_ERROR_TEXT', 'Tutti i database hanno bisogno di username e password per potervi accedere. La password pu&ograve; esserti stata assegnata dal tuo fornitore di hosting e dovresti contattarlo per i dettagli.<br /><br />Ricordati che la password è case-sensitive.');
    
  break;
  case ('18'):
    define('POPUP_ERROR_HEADING', 'Nome Database');
    define('POPUP_ERROR_TEXT', 'Questo &egrave; il nome del database che verr&agrave; usato per Zen Cart&reg;. Se non sei sicuro nella scelta, devi contattare il tuo fornitore di hosting per maggiori informazioni.<br /><br />A volte il nome ha un prefisso davanti all\'account name del tuo webhosting, seguito dal database-name che hai scelto. Ad esempio: mioaccount_zencartdb');
    
  break;
  case ('19'):
    define('POPUP_ERROR_HEADING', 'Prefisso Tabelle Database');
    define('POPUP_ERROR_TEXT', 'Zen Cart&reg; ti consente di aggiungere un prefisso ai nomi delle tabelle usate per salvare le informazioni. &Egrave; particolarmente utile se il tuo host permette solo un database, e desideri installare altri script nel sistema che utilizzano lo stesso database. In questo modo, grazie al prefisso, le tabelle di Zen Cart&reg; possono essere facilmente identificate. <br /><br /><strong>Normalmente dovresti lasciare il settaggio di default (ossia: vuoto).</strong><br /><br />Caratteri validi accettati: numeri e lettere e underscore (_).');
    
  break;
  case ('20'):
    define('POPUP_ERROR_HEADING', 'Crea Database');
    define('POPUP_ERROR_TEXT', 'Questo settaggio stabilisce se l\'installer dovr&agrave; cercare di creare il database principale per Zen Cart&reg;. Nota \'creare\' in questo contesto non ha nulla a che vedere con l\'aggiungere le tabelle necessarie a Zen Cart&reg;, che verranno invece aggiunte automaticamente in qualsiasi caso. Molti host non consentono ai propri utenti i permessi per \'creare\', ma forniscono un altro metodo per creare database vuoti, ad esempio cPanel o phpMyAdmin.');
    
  break;
//  case ('21'):
//    define('POPUP_ERROR_HEADING', 'Connessione al Database');
//    define('POPUP_ERROR_TEXT', 'Le connessioni persistenti sono un metodo per ridurre il caricamento del database. Devi consultare il tuo server host prima di settare questa opzione.  Abilitare le "connessioni persistenti" pu&ograve; portare a problemi di database per il tuo host se non &egrave; stato configurato per gestirle.<br /><br />Assicurati di consultare il tuo host prima di usare connessioni persistenti.');
    
//  break;
//  case ('22'):
//    define('POPUP_ERROR_HEADING', 'Sessioni Database');
//    define('POPUP_ERROR_TEXT', 'Questo settaggio determina se le informazioni delle sessioni devono essere salvate in un file o nel database.<br />Anche se le sessioni file-based sono leggermente pi&ugrave; veloci, <strong>sono raccomandate le sessioni nel database</strong> per tutti i negozi che usano connessioni SSL, per maggiore sicurezza.<br />Per hosting condivisi, senza SSL, la scelta NO aumenter&agrave; la performance globale.');
    
//  break;
  case ('23'):
    define('POPUP_ERROR_HEADING', 'Abilita SSL');
    define('POPUP_ERROR_TEXT', 'Settando il valore a "true" si cercher&agrave; di visualizzare alcune pagine in modalit&agrave; SSL.  Il suo funzionamento dipende dall\'inserimento del HTTPS servername e delle informazioni del path corrette. Il tuo fornitore di hosting dovrebbe fornirti queste informazioni.<br />Se non hai ancora un supporto SSL, devi acquistarne uno. Ci&ograve; implica una spesa mensile per un indirizzo IP dedicato e un rinnovo annuale per il certificato SSL.');
    
  break;
  case ('24'):
    define('POPUP_ERROR_HEADING', 'Database Host risulta vuoto');
    define('POPUP_ERROR_TEXT', 'Il campo Host Database risulta vuoto. Inserisci un Database Server Hostname valido. <br />Questo &egrave; il nome del webserver sul quale funziona il programma del database del tuo host. Nella maggior parte dei casi puoi lasciare come valore \'localhost\'. In casi eccezionali dovrai chiedere al tuo fornitore di hosting il nome del server dei loro database server.');
  break;
  
  case ('25'):
    define('POPUP_ERROR_HEADING', 'Database Name risulta vuoto');
    define('POPUP_ERROR_TEXT', 'Il campo Nome Database risulta vuoto. Inserisci il nome del database da usare per Zen Cart&reg;.<br />Questo &egrave; il nome del database usato per Zen Cart&reg;. Se non ne sei sicuro, contatta il tuo fornitore di hosting per maggiori informazioni.');
    
  break;
  case ('26'):
    define('POPUP_ERROR_HEADING', 'SQL Install file NON esiste');
    define('POPUP_ERROR_TEXT', 'L\'installer non riesce a trovare il file install .SQL necessario. Si dovrebbe trovare nella cartella \'zc_install/sql\' e chiamarsi \'mysql_zencart.sql\'.');
    
  break;
  case ('27'):
    define('POPUP_ERROR_HEADING', 'Database non supportato');
    define('POPUP_ERROR_TEXT', 'Il tipo di database selezionato non sembra sia supportato dalla versione PHP installata. Verifica con il tuo fornitore di hosting se supportano il database selezionato. Se si tratta di un server personale, assicurati che il supporto per il tipo di database scelto sia stato implementato nel PHP, e che siano state caricate le estensioni/moduli/file dll necessarie (verifica php.ini per extension=mysql.so, etc).');
    
  break;
  case ('28'):
    define('POPUP_ERROR_HEADING', 'Fallita connessione al Database');
    define('POPUP_ERROR_TEXT', 'Impossibile stabilire una connessione al database. Pu&ograve; dipendere da molte ragioni. <br /><br />
Puoi aver fornito il DB host name sbagliato, o l\'user name o <em>password </em>non corrette. <br /><br />
Puoi anche aver scritto il nome del database sbagliato (<strong>Esiste?</strong> <strong>L\'hai creato?</strong> -- NOTA: Zen Cart&reg; non ha creato un database.).<br /><br />Verifica tutte le informazioni inserite e assicurati che siano corrette.');
    
  break;
  case ('29'):
    define('POPUP_ERROR_HEADING', 'Deve essere selezionata una Provincia');
    define('POPUP_ERROR_TEXT', 'Selezionare una provincia dall\'elenco. Questo dato viene usato nel calcolo delle tasse e delle spese di spedizione. Sar&agrave; possibile modificarlo in un secondo momento andando in Pannello di Amministrazione->Configurazione->Info Negozio.');

    
  break;
  case ('30'):
    define('POPUP_ERROR_HEADING', 'Database NON esiste');
    define('POPUP_ERROR_TEXT', 'The database name you have specified does not appear to exist.<br />(<strong>Did you create it?</strong> -- NOTE: Zen Cart&reg; does not create a database for you.).<br /><br />Please check your database details, then verify this entry and make corrections where necessary.<br /><br />You may need to use your webhosting control panel to create the database. While creating it, make note of the username and password, as well as the database-name used, as you will need this information to fill in the details on this installer screen.');
    
  break;
  case ('31'):
    define('POPUP_ERROR_HEADING', 'Store name risulta vuoto');
    define('POPUP_ERROR_TEXT', 'Please specify the name by which you will refer to your store.');
    
  break;
  case ('32'):
    define('POPUP_ERROR_HEADING', 'Store owner risulta vuoto');
    define('POPUP_ERROR_TEXT', 'Please supply the name of the store owner.  This information will appear in the \'Contact Us\' page, the \'Welcome\' email messages, and other places throughout the store.');
    
  break;
  case ('33'):
    define('POPUP_ERROR_HEADING', 'Store email address risulta vuoto');
    define('POPUP_ERROR_TEXT', 'Please supply the store\'s primary email address. This is the address which will be supplied for contact information in emails that are sent out from the store. It will not be displayed on any pages in the store unless you manually do such configuration.');
    
  break;
  case ('34'):
    define('POPUP_ERROR_HEADING', 'Store email address is not valid');
    define('POPUP_ERROR_TEXT', 'You must supply a valid email address.');
    
  break;
  case ('35'):
    define('POPUP_ERROR_HEADING', 'Store address risulta vuoto');
    define('POPUP_ERROR_TEXT', 'Please supply the street address of your store.  This will be displayed on the Contact-Us page (this can be disabled if required), and on invoice/packing-slip materials. It will also be displayed if a customer elects to purchase by check/money-order, upon checkout.');
    
  break;
  case ('36'):
    define('POPUP_ERROR_HEADING', 'Demo product SQL file NON esiste');
    define('POPUP_ERROR_TEXT', 'We were unable to locate the SQL file containing the Zen Cart&reg; demo products to load them into your store.  Please check that the /zc_install/demo/xxxxxxx_demo.sql file exists. (xxxxxxx = your database-type).');
    
  break;
  case ('37'):
    define('POPUP_ERROR_HEADING', 'Nome del Negozio');
    define('POPUP_ERROR_TEXT', 'Il nome del negozio. Verr&agrave; usato nelle email inviate dal sistema e in alcuni casi come titolo nel browser.');
    
  break;
  case ('38'):
    define('POPUP_ERROR_HEADING', 'Titolare del Negozio');
    define('POPUP_ERROR_TEXT', 'I dettagli del titolare del negozio possono essere usati nelle email inviate dal sistema.');
    
  break;
  case ('39'):
    define('POPUP_ERROR_HEADING', 'Indirizzo Email del titolare');
    define('POPUP_ERROR_TEXT', 'L\'indirizzo email principale per contattare il negozio. Viene usato in gran parte delle email inviate dal sistema, cos&igrave; come nella pagina Info & Contatti.');
    
  break;
  case ('40'):
    define('POPUP_ERROR_HEADING', 'Nazione di residenza');
    define('POPUP_ERROR_TEXT', 'La nazione in cui si trova il negozio. &Egrave; importante settare correttamente questo valore poich&egrave; da questo dipende il corretto funzionamento di tasse e opzioni di spedizione.  Determina anche il formato dell\'indirizzo nelle fatture, ecc.');
    
  break;
  case ('41'):
    define('POPUP_ERROR_HEADING', 'Provincia di residenza');
    define('POPUP_ERROR_TEXT', 'Rappresenta una sotto-divisione geografica della nazione in cui si trova il tuo negozio. Ad esempio una provincia in Italia o uno stato negli U.S.A.');
    
  break;
  case ('42'):
    define('POPUP_ERROR_HEADING', 'Indirizzo Negozio');
    define('POPUP_ERROR_TEXT', 'L\'Indirizzo del tuo Negozio, usato nelle fatture e nelle conferme ordine');
    
  break;
  case ('43'):
    define('POPUP_ERROR_HEADING', 'Idioma di Default');
    define('POPUP_ERROR_TEXT', 'L\'idioma di default usata nel negozio. Zen Cart&reg; &egrave; multi-lingua, per altri idiomi scarica i pacchetti lingua nell\'area download del sito www.zen-cart.com.');
    
  break;
  case ('44'):
    define('POPUP_ERROR_HEADING', 'Valuta di Default');
    define('POPUP_ERROR_TEXT', 'Scegli una valuta di default da usare nel negozio.  Se la valuta che desideri non si trova nell\'elenco, puoi modificarla nell\'area Admin terminata l\'installazione.');
    
  break;
  case ('45'):
    define('POPUP_ERROR_HEADING', 'Installa Prodotti Demo');
    define('POPUP_ERROR_TEXT', 'Scegli se installare o meno i prodotti demo nel database in modo da testare le funzionalit&agrave; di Zen Cart&reg;.');
    
  break;
  case ('46'):
    define('POPUP_ERROR_HEADING', 'Admin user name risulta vuoto');
    define('POPUP_ERROR_TEXT', 'Per poterti loggare nel pannello di amministrazione una volta terminata l\'installazione, devi fornire qui un Admin username.');
    
  break;
  case ('47'):
    define('POPUP_ERROR_HEADING', 'Admin email risulta vuoto');
    define('POPUP_ERROR_TEXT', 'L\'indirizzo email dell\'Admin &egrave; necessario per poterti rispedire la password, in caso di smarrimento.');
    
  break;
  case ('48'):
    define('POPUP_ERROR_HEADING', 'Admin email non &egrave; valida');
    define('POPUP_ERROR_TEXT', 'Inserisci un indirizzo email corretto.');
    
  break;
  case ('49'):
    define('POPUP_ERROR_HEADING', 'Admin password risulta vuoto');
    define('POPUP_ERROR_TEXT', 'Per sicurezza, non puoi lasciare vuoto il campo password Amministratore.');
    
  break;
  case ('50'):
    define('POPUP_ERROR_HEADING', 'Le Password non corrispondono');
    define('POPUP_ERROR_TEXT', 'Inserisci nuovamente la password dell\'amministratore e la conferma.');
    
  break;
  case ('51'):
    define('POPUP_ERROR_HEADING', 'Admin User Name');
    define('POPUP_ERROR_TEXT', 'Per poterti loggare nel pannello di amministrazione una volta terminata l\'installazione, devi fornire qui un username per l\'Admin.');
    
  break;
  case ('52'):
    define('POPUP_ERROR_HEADING', 'Admin Email Address');
    define('POPUP_ERROR_TEXT', 'L\'indirizzo email dell\'Admin &egrave; necessario per poterti rispedire la password, in caso di smarrimento.');
    
  break;
  case ('53'):
    define('POPUP_ERROR_HEADING', 'Admin Password');
    define('POPUP_ERROR_TEXT', 'La password dell\'amministratore &egrave; la password sicura che ti consente l\'accesso al pannello di amministrazione. Deve contenere sia lettere che numeri e avere almeno 7 caratteri.');
  break;
  case ('54'):
    define('POPUP_ERROR_HEADING', 'Conferma Admin Password');
    define('POPUP_ERROR_TEXT', 'Le due password devono corrispondere per poter essere salvate.');
    
  break;
  case ('55'):
    define('POPUP_ERROR_HEADING', 'PHP Version not supported');
    define('POPUP_ERROR_TEXT', 'The PHP Version running on your webserver is not supported by Zen Cart&reg;. <br /><br />PHP 5.3.14 is the minimum requirement. <br />However, we recommend that you use at least PHP v5.3.3 or higher if possible.<br /><br />If you are trying to use older PHP versions, note that using older releases of PHP may result in the admin section of Zen Cart&reg; not being accessible, might leave your site vulnerable to hacking, and may not support some of the PHP Session code that handles keeping individual customer logins unique and separate from other customers. You are advised to upgrade your PHP version.');
    
  break;
  case ('56'):
    define('POPUP_ERROR_HEADING', 'Admin configure.php is not writeable');
    define('POPUP_ERROR_TEXT', '<em><strong>Related FAQs:</strong></em><br /><a href="http://tutorials.zen-cart.com/index.php?article=9" target="_blank">How do I set permissions on files?</a><br /><a href="http://tutorials.zen-cart.com/index.php?article=148" target="_blank">What is CHMOD and what do the numbers mean?</a><br /><a href="http://tutorials.zen-cart.com/index.php?article=107#configurephp" target="_blank">How do I set permissions for configure.php files for installation?</a><br /><br />The file <strong>admin/includes/configure.php</strong> is not writeable.<br /><br />If you are using a Unix or Linux system then please CHMOD the file to 777 or 666 until the Zen Cart&reg; install is completed.  This can usually be done by way of your FTP program (right-click or edit file properties, etc).<br /><br />On a Windows desktop system it may be simply enough that the file is set to read/write.<br /><br />On a Windows Server, especially if running under IIS, you will have to right-click on the file, click on Security, and ensure that the "Internet Guest Account" or IUSR_xxxxxxx user has read and write access.<br /><br /><strong>Once installation is complete,</strong> you should set the file back to read-only again (CHMOD 644 or 444, or in Windows, uncheck the "write" options, or "check" the read-only box).');
    
  break;
  case ('57'):
    define('POPUP_ERROR_HEADING', 'Store configure.php is not writeable');
    define('POPUP_ERROR_TEXT', '<em><strong>Related FAQs:</strong></em><br /><a href="http://tutorials.zen-cart.com/index.php?article=9" target="_blank">How do I set permissions on files?</a><br /><a href="http://tutorials.zen-cart.com/index.php?article=148" target="_blank">What is CHMOD and what do the numbers mean?</a><br /><a href="http://tutorials.zen-cart.com/index.php?article=107#configurephp" target="_blank">How do I set permissions for configure.php files for installation?</a><br /><br />The file <strong>includes/configure.php</strong> is not writeable. If you are using a Unix or Linux system then please CHMOD the file to 777 or 666 until the Zen Cart&reg; install is completed.  This can usually be done by way of your FTP program (right-click or edit file properties, etc).<br /><br />On a Windows desktop system it may be simply enough that the file is set to read/write.<br /><br />On a Windows Server, especially if running under IIS, you will have to right-click on the file, click on Security, and ensure that the "Internet Guest Account" or IUSR_xxxxxxx user has read and write access.<br /><br /><strong>Once installation is complete,</strong> you should set the file back to read-only again (CHMOD 644 or 444, or in Windows, uncheck the "write" options, or "check" the read-only box).');
    
  break;
  case ('58'):
    define('POPUP_ERROR_HEADING', 'DB Table Prefix');
    define('POPUP_ERROR_TEXT', 'Zen Cart&reg; allows you to add a prefix to the table names it uses to store its information. This is especially useful if your host only allows you one database, and you want to install other scripts on your system that use that database. <strong>Normally you should just leave the setting blank.</strong>');
    
  break;
  case ('59'):
    define('POPUP_ERROR_HEADING', 'Cartella SQL Cache');
    define('POPUP_ERROR_TEXT', 'Le query SQL possono essere salvate nel database, in un file nell\'hard disk del tuo server, oppure non salvate. Se scegli di salvare le query SQL in un file nell\'hard disk del tuo server, allora devi inserire la cartella in cui verranno salvate queste informazioni. <br /><br />L\'installazione standard di Zen Cart&reg; include una cartella \'cache\'.  Per avere accesso a questa cartella devi settare i permessi per il tuo webserver (ad esempio: apache) a lettura-scrittura.<br /><br />Assicurati che la cartella selezionata esista e sia scrivibile dal web server (CHMOD 777 o almeno 666 raccomandato).');
    
  break;
  case ('60'):
    define('POPUP_ERROR_HEADING', 'Metodo SQL Cache');
    define('POPUP_ERROR_TEXT', 'Alcune query SQL sono marcate come cacheable. Ci&ograve; significa che se vengono salvate funzioneranno pi&ugrave; velocemente, specie per installazione su hosting condivisi. Puoi decidere quale metodo usare per salvare le Query SQL.<br /><br /><strong>None</strong>. Le query SQL non vengono salvate. Se hai pochi prodotti/categorie scegliendo questo valore puoi ottenere maggior velocit&agrave; per il tuo sito.<br /><br /><strong>Database</strong>. Le query SQL vengono salvate in una tabella del database. Sembra strano ma questo pu&ograve; portare ad un aumento di velocit&agrave; per i siti con un numero medio di prodotti/categorie.<br /><br /><strong>File</strong>. Le query SQL vengono salvate nell\'hard disk del tuo server. Affinch&egrave; funzioni correttamente devi assicurarti che la cartella in cui vengono salvate le query sia scrivibile dal web server. Questo metodo &egrave; adatto per siti con un gran numero di prodotti/categorie.');
    
  break;
  case ('61'):
    define('POPUP_ERROR_HEADING', 'The Session/SQL Cache Directory entry risulta vuoto');
    define('POPUP_ERROR_TEXT', 'If you wish to use file caching for Session/SQL queries, you must supply a valid directory on your webserver, and ensure that the webserver has rights to write into that folder/directory.');
    
  break;
  case ('62'):
    define('POPUP_ERROR_HEADING', 'The Session/SQL Cache Directory entry NON esiste');
    define('POPUP_ERROR_TEXT', 'If you wish to use file caching for Session/SQL queries, you must supply a valid directory on your webserver, and ensure that the webserver has rights to write into that folder/directory.');
    
  break;
  case ('63'):
    define('POPUP_ERROR_HEADING', 'The Session/SQL Cache Directory entry is not writeable');
    define('POPUP_ERROR_TEXT', 'If you wish to use file caching for Session/SQL queries, you must supply a valid directory on your webserver, and ensure that the webserver has rights to write into that folder/directory.  CHMOD 666 or 777 is advisable under Linux/Unix.  Read/Write is suitable under Windows servers (in IIS, must set this for the Internet Guest Account).');
    
  break;
  case ('64'):
    define('POPUP_ERROR_HEADING', 'Requisiti di Sicurezza Password Amministratore');
    define('POPUP_ERROR_TEXT', 'La password dell\'amministratore deve avere almeno 7 caratteri, e contenere sia lettere che numeri.<br /><br />Nota: Le Password scadranno ogni 90 giorni.');

  break;
//  case ('65'):
//    define('POPUP_ERROR_HEADING', 'Prefisso Tabelle Database phpBB');
//    define('POPUP_ERROR_TEXT', 'Inserisci il prefisso tabelle per il database di phpBB, solitamente \'phpBB_\'');
    
//  break;
//  case ('66'):
//    define('POPUP_ERROR_HEADING', 'phpBB Nome Database');
//    define('POPUP_ERROR_TEXT', 'Inserisci il nome del database nel quale salvare le tabelle di phpBB.');
//  break;
//  case ('67'):
//    define('POPUP_ERROR_HEADING', 'phpBB Directory');
//    define('POPUP_ERROR_TEXT', 'Inserisci il path completo nel quale si trovano i file dello script phpBB. In questo modo Zen Cart&reg; sapr&agrave; dove indirizzare gli utenti quando cliccheranno sul link phpBB del negozio.<br /><br />Il path inserito qui &egrave; relativo alla "root" del server. Perci&ograve;, se l\'installazione di phpBB si trova in <strong>/home/users/username/public_html/phpbb </strong>, allora dovrai scrivere <strong>/home/users/username/public_html/phpbb/ </strong>here. Se si trova in altre sottocartelle, devi scriverle nel path.<br /><br />Cercher&agrave; il file "<em>config.php</em>" in quella cartella.');
//  break;
//  case ('68'):
//    define('POPUP_ERROR_HEADING', 'phpBB Directory');
//    define('POPUP_ERROR_TEXT', 'Impossibile trovare file di configurazione phpBB nella cartella specificata. Devi aver gi&agrave; installato phpBB se vuoi usare questa configurazione automatica. Altrimenti salta la configurazione automatica di phpBB e settala poi manualmente.<br /><br />Il path inserito qui &egrave; relativo alla "root" del server. Perci&ograve;, se l\'installazione di phpBB si trova in <strong>/home/users/username/public_html/phpbb </strong>, allora dovrai scrivere <strong>/home/users/username/public_html/phpbb/ </strong>qui. Se si trova in altre sottocartelle, devi scriverle nel path.<br /><br />Cercher&agrave; il file "<em>config.php</em>" in quella cartella.');
//  break;
  case ('69'):
    define('POPUP_ERROR_HEADING', 'Register Globals');
    define('POPUP_ERROR_TEXT', 'Zen Cart&reg; pu&ograve; funzionare sia con il settaggio "Register Globals" a on che a off.  Tuttavia, lasciando il valore a "off" il sistema risulter&agrave; pi&ugrave; sicuro.<br /><br />Se vuoi disabilitarlo, nel caso in cui il tuo fornitore di hosting non lo faccia per te, potresti provare ad aggiungerlo in un file .htaccess nella root del tuo negozio (crea il file se non ne hai gi&agrave; uno):<br /><br /><code>php_value session.use_trans_sid off<BR />php_value register_globals off<br />#php_value register_globals off<BR />&lt;Files ".ht*"&gt;<BR />deny from all<BR />&lt;/Files&gt;</code><br /><br />oppure chiedi assistenza al tuo fornitore di hosting.');
  break;
  case ('70'):
    define('POPUP_ERROR_HEADING', 'Safe Mode is On');
    define('POPUP_ERROR_TEXT', 'Zen Cart&reg;, being a full-service e-Commerce application, does not work well on servers running in Safe Mode.<br /><br />To run an e-Commerce system requires many advanced services often restricted on lower-cost "shared" hosting services. To run your online store in optimum fashion will require setting up a webhosting service that does not place you or your webspace in "Safe Mode".  You need your hosting company to set "SAFE_MODE=OFF" in your php.ini file.');
  break;
  case ('71'):
    define('POPUP_ERROR_HEADING', 'Cache folder required to use file-based caching support');
    define('POPUP_ERROR_TEXT', 'If you wish to use the "file-based SQL cache support" in Zen Cart&reg;, you\'ll need to set the proper permissions on the cache folder in your webspace.<br /><br />Optionally, you can choose "Database Caching" or "No Caching" if you prefer not to use the cache folder. In this case, you MAY need to disable "store sessions" as well, as the session tracker uses the file cache as well.<br /><br />To set up the cache folder properly, use your FTP program or shell access to your server to CHMOD the folder to 666 or 777 read-write permissions level.<br /><br />Most specifically, the userID of your webserver (ie: \'apache\' or \'www-user\' or maybe \'IUSR_something\' under Windows) must have all \'read-write-delete\' etc privileges to the cache folder.');
  break;
  case ('72'):
    define('POPUP_ERROR_HEADING', 'ERROR: Could not update all your configure.php files with new prefix');
    define('POPUP_ERROR_TEXT', 'While attempting to update your configure.php files after renaming tables, we encountered an error.  You will need to manually edit your /includes/configure.php and /admin/includes/configure.php files and ensure that the "define" for "DB_PREFIX" is set properly for your Zen Cart&reg; tables in your database.');
  break;
  case ('73'):
    define('POPUP_ERROR_HEADING', 'ERROR: Could not apply new table-prefix to all tables');
    define('POPUP_ERROR_TEXT', 'While attempting to rename your database tables with the new table prefix, we encountered an error.  You will need to manually review your database tablenames for accuracy. Worst-case, you may need to recover from your backup.');
  break;
  case ('74'):
    define('POPUP_ERROR_HEADING', 'NOTE: PHP "session.save_path" NON &egrave; scrivibile');
    define('POPUP_ERROR_TEXT', '<strong>This is JUST a note </strong>to inform you that you do not have permission to write to the path specified in the PHP session.save_path setting.<br /><br />This simply means that you cannot use this path setting for temporary file storage.  Instead, use the "suggested cache path" shown below it.<br /><br /><br />Alternatively, if the path is unknown, then it\'s possible that this setting is not set in your server\'s php.ini settings. This is not a problem. It is primarily just a status alert. Talk to your webhost for further clarification if you so desire.');
  break;
  case ('75'):
    define('POPUP_ERROR_HEADING', 'NOTE: PHP "magic_quotes_runtime" is active');
    define('POPUP_ERROR_TEXT', 'It is required to have "magic_quotes_runtime" disabled. When enabled, it can cause unexpected 1064 SQL errors, and other code-execution problems.<br /><br />If you cannot disable it for the whole server, it may be possible to disable via .htaccess or your own php.ini file in your private webspace.  Talk to your hosting company for assistance.');
  break;
  case ('76'):
    define('POPUP_ERROR_HEADING', 'Database Engine version information unknown');
    define('POPUP_ERROR_TEXT', 'The version number of your database engine could not be obtained.<br /><br />This is NOT NECESSARILY a serious issue. In fact, it can be quite common on a production server, as at the stage of this inspection, we may not yet know the required security credentials in order to log in to your server, since those are obtained later in the installation process.<br /><br />It is generally safe to proceed even if this information is listed as Unknown.');
  break;
  case ('77'):
    define('POPUP_ERROR_HEADING', 'File Uploads are DISABLED');
    define('POPUP_ERROR_TEXT', 'File uploads are DISABLED. To enable them, make sure <em><strong>file_uploads = on</strong></em> is in your server\'s php.ini file.');
  break;
  case ('78'):
    define('POPUP_ERROR_HEADING', 'ADMIN PASSWORD REQUIRED TO UPGRADE');
    define('POPUP_ERROR_TEXT', 'The Store Administrator username and password are required in order to make changes to the database.<br /><br />Please enter a valid admin user ID and password for your Zen Cart&reg; site.');
  break;
  case ('79'):
    define('POPUP_ERROR_TEXT','OpenSSL is "one" way in which a server can be configured to offer SSL (https://) support for your site.<br /><br />If this is showing as unavailable, possible causes could be:<br />(a) your webhost doesn\'t support SSL<br />(b) your webserver doesn\'t have OpenSSL installed, but MIGHT have another form of SSL services available<br />(c) your web host may not yet be aware of your SSL certificate details so that they can enable SSL support for your domain<br />(d) PHP may not be configured to know about OpenSSL yet.<br /><br />In any case, if you DO require encryption support on your web pages (SSL), you should be contacting your web hosting provider for assistance.');
    define('POPUP_ERROR_HEADING','OpenSSL Information');
  break;
  case ('80'):
    define('POPUP_ERROR_HEADING', 'PHP Session Support is Required');
    define('POPUP_ERROR_TEXT', 'You need to enable PHP Session support on your webserver.  You might try installing this module: php4-session<br /><br /><br />PHP Session Support is required in order to support user-login and payment/checkout procedures. Please talk to your host to reconfigure PHP to enable session support.');
  break;
  case ('81'):
    define('POPUP_ERROR_HEADING', 'PHP running as cgi not recommended unless server is Windows');
    define('POPUP_ERROR_TEXT', 'Running PHP as CGI can be problematic on some Linux/Unix servers.<br /><br />Windows servers, however, "always" run PHP as a cgi module, in which case this warning can be ignored.');
  break;
  case ('82'):
    define('POPUP_ERROR_HEADING', ERROR_TEXT_DISABLE_FUNCTIONS);
    define('POPUP_ERROR_TEXT', 'Your PHP configuration has one or more of the following functions marked as "disabled" in your server\'s PHP.INI file:<br /><ul><li>set_time_limit</li><li>exec</li></ul>Your server may suffer from decreased performance due to the use of these security measures which are usually implemented on highly-used public servers... which are not always ideal for running an e-Commerce system.<br /><br />It is recommended that you speak with your hosting provider to determine whether they have another server where you may run your site with these restrictions removed.');
  break;
  case ('83'):
    define('POPUP_ERROR_HEADING','Invalid characters in database table-prefix');
    define('POPUP_ERROR_TEXT','The database Table-Prefix must consist only of letters, numbers, and underscores (_). <br /><br />Please select a different prefix. <strong>We recommend leaving it blank</strong> or using something simple like "zen_" .');
  break;
  case ('84'):
    define('POPUP_ERROR_HEADING','PHP Session.autostart should be disabled.');
    define('POPUP_ERROR_TEXT','The session.auto_start setting in your server\'s PHP.INI file is set to ON. <br /><br />This could potentially cause you some problems with session handling, as Zen Cart&reg; is designed to start sessions when it\'s ready to activate session features. Having sessions start automatically can be a problem in some server configurations.<br /><br />If you wish to attempt disabling this yourself, you could try putting the following into a .htaccess file located in the root of your shop (same folder as index.php):<br /><br /><code>php_value session.auto_start 0</code><br /><br /> (You may have to create the file if you don\'t already have one.)');
  break;
  case ('85'):
    define('POPUP_ERROR_HEADING','Some database-upgrade SQL statements not installed.');
    define('POPUP_ERROR_TEXT','During the database-upgrade process, some SQL statements could not be executed because they would have created duplicate entries in the database, or the prerequisites (such as column must exist to change or drop) were not met.<br /><br />THE MOST COMMON CAUSE of these failures/exceptions is that you have installed a contribution/add-on that has made alterations to the core database structure. The upgrader is trying to be friendly and not create a problem for you. <br /><br />YOUR STORE MAY WORK JUST FINE without investigating these errors, however, we recommend that you check them out to be sure. <br /><br />If you wish to investigate, you may look at your "upgrade_exceptions" table in the database for details on which statements failed to execute and why.');
  break;
  case ('86'):
    define('POPUP_ERROR_HEADING','PHP Session.use_trans_sid should be disabled.');
    define('POPUP_ERROR_TEXT','The session.use_trans_sid setting in your server\'s PHP.INI file is set to ON. <br /><br />That is BAD, and your hosting company should turn it off. <br><br>This could potentially cause you some problems with session handling and possibly even security concerns.<br /><br />If your hosting company staff are not capable of turning this off to protect everyone on the server, you can try to work around this by setting an .htaccess parameter such as this:<code>php_value session.use_trans_sid off</code>, or you could disable it in your PHP.INI if you have access to it.<br /><br />For more information on the security risks it imposes, see: <a href="http://shh.thathost.com/secadv/2003-05-11-php.txt">http://shh.thathost.com/secadv/2003-05-11-php.txt</a>.<br /><br />(You may have to create the .htaccess file if you don\'t already have one.)');
    
  break;
  case ('87'):
    define('POPUP_ERROR_HEADING','Permissions Required for Database User');
    define('POPUP_ERROR_TEXT','Zen Cart&reg; operations require the following database-level privileges:<ul><li>ALL PRIVILEGES<br /><em>or</em></li><li>SELECT</li><li>INSERT</li><li>UPDATE</li><li>DELETE</li><li>CREATE</li><li>ALTER</li><li>INDEX</li><li>DROP</li></ul>Day-to-day activities do not normally require the "CREATE" and "DROP" privileges, but these ARE required for Installation, Upgrade, and SQLPatch activities.');
  break;
  case ('88'):
    define('POPUP_ERROR_HEADING','Error encountered while writing /includes/configure.php');
    define('POPUP_ERROR_TEXT','While attempting to save your settings, Zen Cart&reg; Installer was unable to verify successful writing of your configure.php file settings. Please check to be sure that your webserver has full write permissions to the configure.php files shown below.<br /><br />- /includes/configure.php<br />- /admin/includes/configure.php<br /><br />You may want to also check that there is sufficient disk space (or disk quota available to you) in order to write updates to these files. <br /><br />If the files are 0-bytes in size when you encounter this error, then disk space or "available" disk space is likely the cause.<br /><br />Ideal permissions in Unix/Linux hosting is CHMOD 777 until installation is complete. Then they can be set back to 644 or 444 for security after installation is done.<br /><br />If you are running on a Windows host, you may also find it necessary to right-click on each of these files, choose "Properties", then the "Security" tab. Then click on "Add" and select "Everyone", and grant "Everyone" full read/write access until installation is complete. Then reset to read-only after installation.');
  break;
  case ('89'):
    define('POPUP_ERROR_HEADING','GD Support Details');
    define('POPUP_ERROR_TEXT','Zen Cart&reg; uses GD support in PHP, if available, to do image management activities.  It is preferred to have at least version 2.0 available.<br /><br />If GD support is not compiled into your PHP install, you may want to ask your hosting company to do this for you.');
  break;
  case ('90'):
    define('POPUP_ERROR_HEADING','MySQL 5.7 (e successivi) non completamente testato in v1.5.x');
    define('POPUP_ERROR_TEXT','NOTE: Zen Cart&reg; v2.0 and newer support MySQL 5 and PHP 5 properly.<br />But, you are presently installing v1.5.x.<br /><br />While many efforts have been spent on ensuring that database queries in Zen Cart&reg; v1.5.x are compatible with MySQL 5 releases, the newer v2.x versions are more thoroughly tested.<br /><br />You are welcome to proceed with installation; however, please note that for full compatibility you should use the newer version of Zen Cart.');
    
  break;
  case ('91'):
    define('POPUP_ERROR_HEADING','PHP Version Alert');
    define('POPUP_ERROR_TEXT','Zen Cart&reg; v1.x is designed to run on PHP versions 5.3.14 and greater.<br /><br />There are several PHP functions used in Zen Cart&reg; which are not available in older PHP versions.<br /><br />You will need to upgrade your PHP version if you intend to use Zen Cart&reg; on this server.');
    
  break;
  case ('92'):
    define('POPUP_ERROR_HEADING','open_basedir restriction may cause problems');
    define('POPUP_ERROR_TEXT','Your PHP is configured in such a way that prevents you from running scripts outside a specified "basedir" folder. Yet, your website files appear to be kept in a folder outside of the allowed "basedir" area.<br /><br />Among other things, you could have problems uploading files or doing backups.<br /><br />You should talk to your web host to change or remove this restriction.');
  break;
  case ('93'):
    define('POPUP_ERROR_HEADING','cURL support not detected');
    define('POPUP_ERROR_TEXT','Some payment and shipping modules require cURL in order to talk to an external server to request real-time quotes or payment authorizations. <br /><br />If you intend to use the PayPal Express Checkout or Paypal Payments Pro modules, or Authorize.net AIM, you *need* CURL support.<br /><br />It appears that your server may not have cURL support configured or activated for your account. If you need a 3rd-party tool that uses cURL, you will need to talk to your web host to have them install cURL support on your server.<br /><br />More information on CURL can be found at the <a href="http://curl.haxx.se" target="_blank">CURL website</a>');
  break;
  case ('94'):
    define('POPUP_ERROR_HEADING', 'NOTE: PHP "magic_quotes_sybase" is active');
    define('POPUP_ERROR_TEXT', 'It is best to have "magic_quotes_sybase" disabled. When enabled, it can cause unexpected 1064 SQL errors, and other code-execution problems.<br /><br />If you cannot disable it for the whole server, it may be possible to disable via .htaccess or your own php.ini file in your private webspace.  Talk to your hosting company for assistance.');
  break;
  case ('95'):
    define('POPUP_ERROR_HEADING','CURL requires SSL support. Please notify webmaster or hosting company.');
    define('POPUP_ERROR_TEXT','Zen Cart&reg; uses CURL and SSL to communicate with some payment and shipping service providers.<br />The installer has just tested your CURL SSL support and found that it failed.<br /><br />You will not be able to use PayPal or Authorize.net or FirstData/Linkpoint payment modules, and possibly other third-party contributed payment/shipping modules until you enable SSL support in CURL and PHP.<br /><br />More information on CURL can be found at the <a href="http://curl.haxx.se" target="_blank">CURL website</a>');
  break;

}
