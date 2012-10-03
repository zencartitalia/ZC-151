<?php
/**
 * @package Installer
 * @access private
 * @copyright Copyright 2003-2011 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: database_setup.php 7411 2011-11-11 05:47:10Z LaVale $
 */
/**
 * defining language components for the page
 */
  define('SAVE_DATABASE_SETTINGS', 'Salva Settaggi Database');//this comes before TEXT_MAIN
  define('TEXT_MAIN', "Ora ti verranno chieste alcune informazioni relative ai settaggi del tuo database.  Inserisci attentamente i valori appropriati nel relativo box e premi <em>Salva i Settaggi del Database</em> per continuare.'");  
  define('TEXT_PAGE_HEADING', 'Zen Cart&reg; Setup - Setup Database');
  define('DATABASE_INFORMATION', 'Informazioni Database');
  define('DATABASE_OPTIONAL_INFORMATION', 'Database - Settaggi OPZIONALI');
  define('DATABASE_OPTIONAL_INSTRUCTION', '&Egrave; consigliato lasciare inalterati questi settaggi a meno che non vi sia una ragione specifica.');
  define('DATABASE_TYPE', 'Tipo Database');
  define('DATABASE_TYPE_INSTRUCTION', 'Scegli il tipo di database da usare.');
  define('DATABASE_CHARSET', 'Set Caratteri / Collation del Database');
  define('DATABASE_CHARSET_INSTRUCTION', 'Scegli il collation del database da usare.');
  define('DATABASE_HOST', 'Host Database');
  define('DATABASE_HOST_INSTRUCTION', 'Qual &egrave; l\'host del database?  L\'host del database pu&ograve; essere sotto forma di host name, come \'db1.myserver.com\', o di indirizzo IP, come \'192.168.0.1\'.');
  define('DATABASE_USERNAME', 'Username Database');
  define('DATABASE_USERNAME_INSTRUCTION', 'Qual &egrave; l\'username usato per connettersi al database?  Un esempio pu&ograve; essere \'root\'.');
  define('DATABASE_PASSWORD', 'Password Database');
  define('DATABASE_PASSWORD_INSTRUCTION', 'Qual &egrave; la password usata per connettersi al database?  La password viene usata con l\'username per determinare il tuo account utente del database.');
  define('DATABASE_NAME', 'Nome Database');
  define('DATABASE_NAME_INSTRUCTION', 'Qual &egrave; il nome del database usato per memorizzare i dati? Ad esempio \'zencart\' o \'mioaccount_zencart\'.');
  define('DATABASE_PREFIX', 'Identificatore Negozio (Prefisso Tabelle)');
  define('DATABASE_PREFIX_INSTRUCTION', 'Scegli il prefisso da usare per le tabelle del database.  Ad esempio: zen_ Lascia vuoto se non &egrave necessario inserire alcun prefisso.<br />Puoi usare i prefissi per consentire a pi&ugrave; negozi di utilizzare lo stesso database.');
  define('DATABASE_CREATE', 'Creare il Database?');
  define('DATABASE_CREATE_INSTRUCTION', 'Vuoi che Zen Cart&reg; crei il database?');
  define('DATABASE_CONNECTION', 'Connessione Persistente');
  define('DATABASE_CONNECTION_INSTRUCTION', 'Vuoi abilitare connessioni persistenti al database?  Premi \'no\' se non sei sicuro.');
  define('DATABASE_SESSION', 'Sessioni Database');
  define('DATABASE_SESSION_INSTRUCTION', 'Vuoi salvare le tue sessioni nel database?  Nel dubbio, leggi le ');
  define('CACHE_TYPE', 'Metodo SQL Cache');
  define('CACHE_TYPE_INSTRUCTION', 'Seleziona quale metodo usare per SQL caching.');
  define('SQL_CACHE', 'Cartella Sessione/SQL Cache');
  define('SQL_CACHE_INSTRUCTION', 'Inserisci la cartella da usare per la cache.');
  define('ONLY_UPDATE_CONFIG_FILES','File di Configurazione solo per l\'Update');


  define('REASON_TABLE_ALREADY_EXISTS','Impossibile creare la tabella %s perch&egrave; gi&agrave; presente');
  define('REASON_TABLE_DOESNT_EXIST','Impossibile cancellare la tabella %s perch&egrave; non esiste.');
  define('REASON_CONFIG_KEY_ALREADY_EXISTS','Impossibile inserire la configuration_key "%s" perch&egrave; gi&agrave; presente.');
  define('REASON_COLUMN_ALREADY_EXISTS','Impossibile AGGIUNGERE la colonna %s perch&egrave; gi&agrave; presente.');
  define('REASON_COLUMN_DOESNT_EXIST_TO_DROP','Impossibile CANCELLARE la colonna %s perch&egrave; non esiste.');
  define('REASON_COLUMN_DOESNT_EXIST_TO_CHANGE','Impossibile CAMBIARE la colonna %s perch&egrave; non esiste.');
  define('REASON_PRODUCT_TYPE_LAYOUT_KEY_ALREADY_EXISTS','Impossibile inserire prod-type-layout configuration_key "%s" perch&egrave; gi&agrave; presente.');
  define('REASON_INDEX_DOESNT_EXIST_TO_DROP','Impossibile cancellare l\'indice %s nella tabella %s perch&egrave; non esiste.');
  define('REASON_PRIMARY_KEY_DOESNT_EXIST_TO_DROP','Impossibile cancellare la chiave primaria nella tabella %s perch&egrave; non esiste.');
  define('REASON_INDEX_ALREADY_EXISTS','Impossibile aggiungere l\'indice %s nella tabella %s perch&egrave; gi&agrave; presente.');
  define('REASON_PRIMARY_KEY_ALREADY_EXISTS','Impossibile aggiungere la chiave primaria nella tabella %s perch&egrave; esiste gi&agrave; una chiave primaria.');
  define('REASON_NO_PRIVILEGES','L\'utente %s@%s non ha i privilegi %s per il database.');
