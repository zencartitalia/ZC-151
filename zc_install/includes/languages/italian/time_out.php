<?php
/**
 * @package Installer
 * @access private
 * @copyright Copyright 2003-2011 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: time_out.php 7419 2011-11-11 07:04:26Z LaVale $
 */
/**
 * defining language components for the page
 */
  define('TEXT_PAGE_HEADING', 'Zen Cart&reg; Setup - Time Out');
  define('TEXT_MAIN','<h2>Rilevato un Problema</h2><h3>Spiacenti, &egrave; stato rilevato un problema.</h3>
<p>Questo installer necessita di poter iniziare una sessione PHP per poter completare l\'installazione.</p>
<p><strong>Possibile cause che hanno portato alla visualizzazione di questa pagina possono essere:</strong>
<ul>
<li><h3>Si &egrave; verificato un timeout</h3>Se lasci l\'installazione inattiva per pi&ugrave; di 20 minuti, allora le informazioni inserite nelle pagine precedenti non saranno pi&ugrave; disponibili.  In questo caso, dovrai iniziare nuovamente il processo di installazione. <br />
<br />
Non lasciare il processo di installazione inattivo per troppo tempo. L\'installazione richiede solo 5 minuti, in circostanze normali.<br /><br /></li>
<li><h3>Il server non ha spazio per scrivere i propri file di sessione.</h3>Se la cartella "cache" non &egrave; ancora scrivibile, fallo ora, in modo da consentire all\'installer di continuare. Puoi trovare i dettagli su come settare i permessi dei file a scrivibile nelle <a href="../docs/index.html" target="_blank">Istruzioni per l\'Installazione</a> o nelle <a href="http://tutorials.zen-cart.com/index.php?article=9" target="_blank">FAQ online</a>.<br /><br /></li>
<li><h3>Le sessioni PHP potrebbero non funzionare sul tuo server</h3>Per poter utilizzare Zen Cart&reg;, devi poter usare la funzionalit&agrave; "session" del PHP. Pu&ograve; dipendere dal fatto che la configurazione del tuo server non permette al momento di iniziare sessioni PHP e di interagirvi correttamente.  In aggiunta, se hai disabilitato i session cookies nel tuo browser, non sarai in grado di usare il supporto delle sessioni PHP. Come precauzione disattiva il tool che blocca i cookie nel tuo browser ed il firewall. <br /><br />Puoi contattare l\'amministratore del webserver per assicurarti di poter configurare e usare le sessioni PHP nel tuo sito.<br /><br /></li>
</ul>
</p>');
  define('START_INSTALL', 'Inizia l\'Installazione');