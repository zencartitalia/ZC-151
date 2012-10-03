<?php
/**
 * Common Template - tpl_footer.php
 *
 * @package templateSystem
 * @copyright Copyright 2003-2010 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: tpl_footer.php 15511 2010-02-18 07:19:44Z drbyte $
 */
require(DIR_WS_MODULES . zen_get_module_directory('footer.php')); ?>
<?php if (!isset($flag_disable_footer) || !$flag_disable_footer) { ?>
<div id="navSuppWrapper"><div id="navSupp">
<ul>
<li><?php echo '<a href="' . HTTP_SERVER . DIR_WS_CATALOG . '">'; ?><?php echo STORE_NAME; ?></a></li>
<?php if (EZPAGES_STATUS_FOOTER == '1' or (EZPAGES_STATUS_FOOTER == '2' and (strstr(EXCLUDE_ADMIN_IP_FOR_MAINTENANCE, $_SERVER['REMOTE_ADDR'])))) { ?>
<li><?php require($template->get_template_dir('tpl_ezpages_bar_footer.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_ezpages_bar_footer.php'); ?></li><?php } ?></ul>
</div></div>
<div id="siteinfoLegal" class="legalCopyright">
<div class="forward">
	<!--bof-social navigation  display - vedi per altre immagini in images/x-social-->
<a href="https://www.facebook.com/zencartitalia" target="_blank"><img width="24" height="24" alt="facebook" src="images/x-social/facebook.png" hspace="4" /></a>	
<a href="http://twitter.com/#!/zencartitalia" target="_blank"><img width="24" height="24" alt="twitter" src="images/x-social/twitter.png" hspace="4" /></a>	
<a href="https://plus.google.com/115239847124335172426" target="_blank"><img width="24" height="24" alt="google+" src="images/x-social/googleplus.png" hspace="4" /></a>
<a href="http://www.youtube.com/zencartitalia" target="_blank"><img width="24" height="24" alt="youtube" src="images/x-social/youtube.png" hspace="4" /></a>
<a href="http://it.groups.yahoo.com/group/zencartitalia" target="_blank"><img width="24" height="24" alt="yahoo" src="images/x-social/yahoo.png" hspace="4" /></a>
<a href="./" target="_blank"><img width="24" height="24" alt="orkut" src="images/x-social/orkut.png" hspace="4" /></a>
</div>
<div class="back"><img src="images/icons/cc-pagamenti.png" width="300" height="29" alt="cc pagamenti" /></div>
<div class="clearBoth"></div>
<?php if (SHOW_BANNERS_GROUP_SET5 != '' && $banner = zen_banner_exists('dynamic', SHOW_BANNERS_GROUP_SET5)) { if ($banner->RecordCount() > 0) { ?>
<div id="bannerFive" class="banners"><?php echo zen_display_banner('static', $banner); ?></div><?php } } ?><br />
<?php echo FOOTER_TEXT_BODY; ?> - <?php if (SHOW_FOOTER_IP == '1') { ?>
<?php echo TEXT_YOUR_IP_ADDRESS . '  ' . $_SERVER['REMOTE_ADDR']; ?>
<?php } ?></div><?php } ?>
