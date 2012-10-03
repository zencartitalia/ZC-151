<?php
/**
 * Page Template
 *
 * This page is auto-displayed if the configure.php file cannot be read properly. It is intended simply to recommend clicking on the zc_install link to begin installation.
 *
 * @package templateSystem
 * @copyright Copyright 2003-2012 Zen Cart Development Team
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version GIT: $Id: Author: DrByte  Sun Jul 15 20:50:58 2012 -0400 Modified in v1.5.1 $
 */
$relPath = (file_exists('includes/templates/template_default/images/logo.gif')) ? '' : '../';
$instPath = (file_exists('zc_install/index.php')) ? 'zc_install/index.php' : (file_exists('../zc_install/index.php') ? '../zc_install/index.php' : '');
$docsPath = (file_exists('docs/index.html')) ? 'docs/index.html' : (file_exists('../docs/index.html') ? '../docs/index.html' : '');
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en">
<head>
<title>System Setup Required</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="imagetoolbar" content="no" />
<meta name="authors" content="The Zen Cart&reg; Team and others" />
<meta name="generator" content="shopping cart program by Zen Cart&reg;, http://www.zen-cart.com" />
<meta name="robots" content="noindex, nofollow" />
<style type="text/css">
<!--
.systemError {color: #FFFFFF}
-->
</style>


</head>

<body style="margin: 20px">
<div style="width: 730px; background-color: #ffffff; margin: auto; padding: 10px; border: 1px solid #cacaca;">
<div>
<img src="<?php echo $relPath; ?>includes/templates/template_default/images/logo.gif" alt="Zen Cart&reg;" title=" Zen Cart&reg; " width="192" height="64" border="0" />
</div>

<h1>Siamo felici che tu abbia scelto Zen Cart&reg;.</h1>
<h2>Stai vedendo questa pagina per una o pi&ugrave; ragioni:</h2>
<ol>
<li>Questa &egrave; la <strong>prima volta che usi Zen Cart&reg;</strong> e non hai ancora completato la procedura di installazione.<br />
Se questo &egrave; il tuo caso, 
<?php if ($instPath) { ?>
<a href="<?php echo $instPath; ?>">clicca qui</a> per procedere con l'installazione.
<?php } else { ?>
dovrai caricare nel tuo spazio web la cartella "zc_install" con un programma FTP, e poi lanciare <a href="<?php echo $instPath; ?>">zc_install/index.php</a> dal browser (o ricaricare questa pagina per vedere il collegamento).
<?php } ?>
<br /><br /></li>
<li>I tuoi file <tt><strong>/includes/configure.php</strong></tt> e/o <tt><strong>/admin/includes/configure.php</strong></tt> contengono dei <em>percorsi</em> errati e/o la <em>connessione al database</em> non &egrave; corretta.<br />
Se hai di recente modificato i file di configurazione o spostato il tuo sito di cartella o fra server diversi, dovrai necessariamente rivedere ed aggiornare il settaggio con i valori corretti per questo locazione e/o server.<br />
Inoltre, se sono stati modificati i permessi ai file configure.php questi potrebbero essere insufficienti per leggere i file. <br />
Oppure i file configure.php potrebbero mancare del tutto.<br />
Or your hosting company has recently changed the server's PHP configuration (or upgraded its version) then they may have broken things as well.
Oppure potrebbe dipendere dal tuo fornitore di hosting che ha recentemente cambiato la configurazione PHP del server (o aggiornato la versione).<br />
Vedi <a href="http://www.zen-cart.it/faq" target="_blank">FAQ</a> e <a href="http://www.zen-cart.it/documentazione" target="_blank">Documentazione</a> per maggiori informazioni.</li>
<?php if (isset($problemString) && $problemString != '') { ?>
<li class="errorDetails">Altri Dettagli *IMPORTANTI*: <?php echo $problemString; ?></li>
<?php } ?>
</ol>
<br />
<h2>Per iniziare l'installazione ...</h2> 
<ol>
<?php if ($docsPath) { ?>
<li>La <a href="<?php echo $docsPath; ?>">Installation Documentation</a> (in inglese) pu&ograve; essere letta da qui: <a href="<?php echo $docsPath; ?>">Documentation</a></li>
<?php } else { ?>
<li>La documentazione di installazione &egrave; usualmente posta nella cartella /docs della distribuzione di Zen Cart&trade; nel file zip. Ulteriore documentazione &egrave; disponibile nelle nostre <a href="http://www.zen-cart.it/faq" target="_blank">FAQ</a>.</li>
<?php } ?>
<?php if ($instPath) { ?>
<li>Inizia il processo <a href="<?php echo $instPath; ?>">zc_install/index.php</a> dal tuo browser.</li>
<?php } else { ?>
<li>Dovrai caricare nel tuo spazio web la cartella "zc_install" con un programma FTP, e poi lanciare <a href="<?php echo $instPath; ?>">zc_install/index.php</a> dal browser (o ricaricare questa pagina per vedere il collegamento).</li>
<?php } ?>
<li>Vi sono a disposizione ulteriori <a href="http://tutorials.zen-cart.com" target="_blank">Online FAQ and Tutorials</a> nel sito Zen Cart&trade; USA.</li>
</ol>
</div>
<p style="text-align: center; font-size: small;">Copyright &copy; 2003-<?php echo date('Y'); ?> <a href="http://www.zen-cart.com" target="_blank">Zen Cart&reg;</a></p>
</body></html>