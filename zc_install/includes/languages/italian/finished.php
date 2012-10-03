<?php
/**
 * @package Installer
 * @access private
 * @copyright Copyright 2003-2011 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: finished.php 17622 2011-09-25 22:04:29Z LaVale $
 */
/**
 * defining language components for the page
 */
  define('TEXT_MAIN',"<h2>Congratulazioni!</h2><h3>Hai installato con successo Zen Cart&reg; nel tuo sistema!</h3><p>
<h2>PROSSIMI PASSI</h2> Per SICUREZZA, DEVI RINOMINARE la cartella /admin/ cos&igrave; che sia difficilmente individuabile da accessi esterni non autorizzati.  Consulta la FAQ <a href=\"http://www.zen-cart.it/faq/gestione-sicurezza/134-rinominare-la-cartella-admin\" target=\"_blank\">Come faccio a rinominare la mia cartella Admin per impedirne la violazione?</a> per una spiegazione dettagliata.<br /><br /> Sempre per sicurezza devi cambiare i permessi di scrittura, in sola lettura dei files <strong>configure.php</strong> posti in <strong>/admin/includes/</strong> ed <strong>/includes/</strong> prima di aprire il negozio al pubblico!<br /><br />
Inoltre devi cancellare la cartella <strong>/zc_install</strong> per evitare tentativi di re-installazione non autorizzati! Dei messaggi di AVVISO saranno mostrati fino a quando non saranno stati effettuati questi interventi.

<h2>DONAZIONE</h2>Per supportare questo software libero, e futuri sviluppi fai una donazione al progetto Zen Cart: <a href=\"http://www.zen-cart.com/index.php?main_page=infopages&pages_id=14\">Fai una donazione cliccando qui. Grazie in anticipo!</a>

<h2>CONFIGURAZIONE</h2>Con questa versione (<a href=\"http://150.zen-cart.it\">150.Zen-Cart.it</a>) sono inserite nel negozio delle pagine di spiegazione passo passo, in ogni modo ti invitiamo a leggere le <a href=\"http://www.zen-cart.it\" target=\"_blank\"><strong>FAQ - Domande Frequenti</strong> i <strong>Manuali</strong> e seguire il Forum di supporto</a> al fine di configurare prima e predisporre dopo il tuo negozio nella maniera migliore e pi&ugrave; veloce.<br />Per domande, chiarimenti e supporto questo &egrave; il posto giusto, abbiamo un potente motore di ricerca per termini chiave, utilizzalo!<br /><br />
E' molto <strong>importante</strong> che tu prenda visione della <strong>Documentazione </strong>posta nella cartella <strong><a href=\"../docs\">/docs</a> </strong>presente nel tuo Sito. <a href=\"../docs\">Click qui per un'elenco.</a>
<h2>LETTURA IMPORTANTE</h2>Lo strumento pi&ugrave; interessante per la completa gestione e personalizzazione del TUO Sito &egrave; il <strong>Developers Tool Kit</strong>, posto nel <strong>Pannello di Amministrazione, in Strumenti</strong>. Sar&agrave; possibile usarlo per cercare quasi qualche cosa che potr&agrave; essere adattata o sostituita, in particolare il testo visualizzato sul Sito. Per diventare esperti nella modifica o creazione di <em><strong>template</strong></em>, prendi visione di FAQ, articoli e manualistica presente in <a href=\"http://www.zen-cart.it\" target=\"_blank\"><strong>ZenCart-Italia.it</strong></a>.<br />
<h2>ULTERIORE LETTURA</h2>In <a href=\"http://www.zen-cart.com\">zen-cart.com</a>, oltre a trovare informazioni e supporto nel forum, vi &egrave; una sezione denominata '<strong>Downloads</strong>'.  Al cui interno &egrave; posta una sezione '<strong>Documentation</strong>', che contiene le ultime versioni di manuali e documentazione <i>in Inglese</i> per conoscere a fondo vari aspetti riguardanti funzionalit&agrave; ed aspetti gestionali del tuo negozio.<br /><br /></p>
<p align=\"center\">
<b>Siamo felici che TU abbia scelto il Sistema di E-commerce Zen Cart&reg; !</b><br />Ricorda che questo Progetto vive anche grazie ad una <b>TUA DONAZIONE</b><br />" . 
'Visitaci online a <a href="http://www.zen-cart.it">Zen-Cart.it</a> o <a href="http://150.zen-cart.it">150.Zen-Cart.it</a> il sito dedicato alla versione 1.5<br /><br />' . '</p>');

  define('TEXT_PAGE_HEADING', 'Zen Cart&reg; Setup - TERMINATO');
  define('Store', 'Vai al NEGOZIO');
  define('Admin', 'Vai al PANNELLO AMMINISTRAZIONE');
