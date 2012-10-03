<?php
/**
 * @package Installer
 * @access private
 * @copyright Copyright 2003-2011 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: database_upgrade.php 7411 2007-11-11 05:47:10Z drbyte $
 */
/**
 * defining language components for the page
 */
  define('TEXT_PAGE_HEADING', 'Zen Cart&reg; Setup - Aggiornamento Database');
  define('UPDATE_DATABASE_NOW','Aggiorna Database Ora');//this comes before TEXT_MAIN
  define('TEXT_MAIN', '<em>Avviso: </em> Usa questo script SOLO per aggiornare lo schema del database di Zen Cart&reg; attraverso le versioni elencate qui di seguito.  ' .
                      '<span class="emphasis"><strong>Ti RACCOMANDIAMO CALDAMENTE di effettuare un backup completo del tuo databse, prima di aggiornarlo a questo!</strong></span>');
  define('TEXT_MAIN_2','<span class="emphasis">Verifica attentamente questi dettagli dettagli.</span>. Queste informazioni si trovano nei settaggi configure.php.<br />' .
                      'Non procedere se non sei sicuro che questi dati sono corretti, altrimenti rischi di danneggiare il database.');

  define('DATABASE_INFORMATION', 'Informazioni Database');
  define('DATABASE_TYPE', 'Tipo Database');
  define('DATABASE_HOST', 'Host Database');
  define('DATABASE_USERNAME', 'Username Database');
  define('DATABASE_PASSWORD', 'Password Database');
  define('DATABASE_NAME', 'Nome Database');
  define('DATABASE_PREFIX', 'Prefisso Tabelle Database');
  define('DATABASE_PRIVILEGES', 'Privilegi Database');

  define('SNIFFER_PREDICTS','<em>Upgrade Sniffer</em> predice: ');
  define('CHOOSE_UPGRADES','Conferma le fasi per l\'upgrade');
  define('TITLE_DATABASE_PREFIX_CHANGE','Cambia il Prefisso Tabelle del Database');
  
  define('ERROR_PREFIX_CHANGE_NEEDED','<span class="errors">Non &egrave; stato possibile localizzare le tabelle di Zen Cart&reg; nel database.<br />Forse hai specificato il prefisso tabelle del database sbagliato?</span><br />Se modificando i prefissi tabelle il problema persiste, dovrai confrontare manualmente i settaggi di configure.php con il database effettivo, attaverso phpMyAdmin o il pannello di controllo del tuo webserver.');  
  define('TEXT_DATABASE_PREFIX_CHANGE','Se vuoi modificare i prefissi delle tabelle del database, inserisci qui sotto il nuovo prefisso. <span class="emphasis">NOTA: verifica che il nome del prefisso non sia gi&agrave; usato nel database</span>, poich&egrave; non verr&agrave; effettuato alcun controllo per tale duplicazione. Usare un prefisso tabelle gi&agrave; esistente dannegger&agrave; il database.');
  
  define('TEXT_DATABASE_PREFIX_CHANGE_WARNING','<span class="errors"><strong>AVVISO: NON CERCARE DI MODIFICARE I PREFISSI DELLE TABELLE SE NON HAI ANCORA EFFETTUATO UN BACKUP DEI CONTENUTI DEL DATABASE. Se si dovessero verificare dei problemi durante il processo, potrai recuperare i dati dal tuo backup. Se non sei sicuro, NON cercare di rinominare le tabelle.</strong></span>');
  define('DATABASE_OLD_PREFIX','Vecchio Prefisso Tabelle');  
  define('DATABASE_OLD_PREFIX_INSTRUCTION','Inserisci il VECCHIO Prefisso Tabelle');
  define('ENTRY_NEW_PREFIX','Nuovo Prefisso Tabelle');
  define('DATABASE_NEW_PREFIX_INSTRUCTION','Inserisci il NUOVO Prefisso Tabelle');
  define('ENTRY_ADMIN_ID','Username Admin (dall\'Admin area di Zen Cart&reg;)');
  define('ENTRY_ADMIN_PASSWORD','Password');
  define('ADMIN_PASSSWORD_INSTRUCTION','Username/password di amministratore (quella usata per accedere al pannello di admin) sono necessarie per effettuare modifiche nel database. <em>(Non &egrave; la password di MySQL)</em>');
  define('TITLE_SECURITY','Sicurezza Database');

  define('UPDATE_DATABASE_WARNING_DO_NOT_INTERRUPT','<span class="emphasis">Dopo aver cliccato qui sotto, NON INTERROMPERE. Attendi il termine dell\'upgrade.</span>');
  define('SKIP_UPDATES','Update terminato');


  define('REASON_TABLE_ALREADY_EXISTS','Impossibile creare la tabella %s perch&egrave; gi&agrave; presente.');
  define('REASON_TABLE_DOESNT_EXIST','Impossibile cancellare la tabella %s perch&egrave; non esiste.');
  define('REASON_TABLE_NOT_FOUND', 'Impossibile MODIFICARE o INSERIRE/SOSTITUIRE nella tabella %s perch&egrave; non esiste.');
  define('REASON_CONFIG_KEY_ALREADY_EXISTS','Impossibile inserire configuration_key "%s" perch&egrave; gi&agrave; presente.');
  define('REASON_COLUMN_ALREADY_EXISTS','Impossibile AGGIUNGERE la colonna %s perch&egrave; gi&agrave; presente.');
  define('REASON_COLUMN_DOESNT_EXIST_TO_DROP','Impossibile CANCELLARE la colonna %s perch&egrave; non esiste.');
  define('REASON_COLUMN_DOESNT_EXIST_TO_CHANGE','Impossibile CAMBIARE la colonna %s perch&egrave; non esiste.');
  define('REASON_PRODUCT_TYPE_LAYOUT_KEY_ALREADY_EXISTS','Impossibile inserire prod-type-layout configuration_key "%s" perch&egrave; gi&agrave; presente.');
  define('REASON_INDEX_DOESNT_EXIST_TO_DROP','Impossibile cancellare l\'indice %s nella tabella %s perch&egrave; non esiste.');
  define('REASON_PRIMARY_KEY_DOESNT_EXIST_TO_DROP','Impossibile cancellare la chiave primaria nella tabella %s perch&egrave; non esiste.');
  define('REASON_INDEX_ALREADY_EXISTS','Impossibile aggiungere l\'indice %s nella tabella %s perch&egrave; gi&agrave; presente.');
  define('REASON_PRIMARY_KEY_ALREADY_EXISTS','Impossibile aggiungere una chiave primaria nella tabella %s perch&egrave; &egrave; gi&agrave; presente una chiave primaria.');  
  define('REASON_NO_PRIVILEGES','L\'utente %s@%s non ha i privilegi %s per il database.');
  define('REASON_CONFIGURATION_GROUP_KEY_ALREADY_EXISTS','Impossibile inserire configuration_group_title "%s" perch&egrave; gi&agrave; presente.');
  define('REASON_CONFIGURATION_GROUP_ID_ALREADY_EXISTS','Impossibile inserire configuration_group_id "%s" perch&egrave; gi&agrave; presente.');
