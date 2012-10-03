<?php
/**
 * This page is auto-displayed if an outdated version of PHP version is detected
 *
 * @package Installer
 * @access private
 * @copyright Copyright 2003-2012 Zen Cart Development Team
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version GIT: $Id: Author: DrByte  Sun Jul 15 20:50:58 2012 -0400 Modified in v1.5.1 $
 */
$relPath = (file_exists('includes/templates/template_default/images/zen_header_bg.jpg')) ? '' : '../';
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf8">
<title>Richiesto Upgrade Versione PHP</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta http-equiv="imagetoolbar" content="no">
<meta name="authors" content="The Zen Cart&reg; Team and others">
<meta name="generator" content="shopping cart program by Zen Cart&reg;, http://www.zen-cart.com">
<meta name="robots" content="noindex, nofollow">
<style type="text/css">
<!--
body {margin: 10px}
#container {width: 730px; background-color: #ffffff; margin: auto; padding: 10px; border: 1px solid #cacaca;}
div .headerimg {padding:0; width: 730px;}
.systemError {color: red}
-->
</style>
</head>

<body id="pagebody">
<div id="container">
<img src="<?php echo $relPath; ?>includes/templates/template_default/images/zen_header_bg.jpg" alt="Zen Cart&reg;" title=" Zen Cart&reg; " class="headerimg">

<h1>Buongiorno e grazie per aver scelto Zen Cart&reg;.</h1>
<h2 class="systemError">Purtroppo c'&egrave; un problema:</h2>
<p class="systemError">La versione PHP in uso: (<?php echo PHP_VERSION; ?>) &egrave; troppo vecchia e questa versione di Zen Cart&reg; non pu&ograve; essere installata.<br />
Si deve prendere in considerazione di aggiornare il server all'ultima versione di PHP.</p>

<p style="text-align: center;">
<a href="http://opzione.com/hosting-e-dominio-c-1.html" target="_blank">
<img src="includes/templates/template_default/images/opzione_zencart.gif" alt="Hosting professionale OPZIONE.com" title=" Hosting professionale OPZIONE.com " border="0" />
</a>
</p>

<p>Questa versione di Zen Cart&reg; richiede come minimo PHP versione 5.2.14<br />
E' comunque <strong>consigliato utilizzare l'ultima versione di PHP 5.3.xx.</strong></p>
<p><em>NOTA: Al rilascio di questa release il PHP 5.4 non &egrave; ancora stato ampiamente testato in questa versione di Zen Cart&reg;. Controlla il sito <a href="http://www.zen-cart.it">www.zen-cart.it</a> per l'ultima versione disponibile se sul tuo server &egrave; in uso il PHP 5.4 o successivi.</em></p>
<p>Nell'area <a href="http://www.zen-cart.it/faq" target="_blank">FAQ</a> e <a href="http://www.zen-cart.it/documentazione" target="_blank">Documentazione</a> puoi trovare risorse utili.</p>
</div>

<p style="text-align: center; font-size: small;">Copyright &copy; 2003-<?php echo date('Y'); ?> <a href="http://www.zen-cart.com" target="_blank">Zen Cart&reg;</a></p>
</body>
</html>
