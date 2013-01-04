#
# * Main Zen Cart SQL Load for MySQL databases
# * @package Installer
# * @access private
# * @copyright Copyright 2003-2012 Zen Cart Development Team
# * @copyright Portions Copyright 2003 osCommerce
# * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
# * @version GIT: $Id: Author: DrByte  Tue Aug 28 16:03:47 2012 -0400 Modified in v1.5.1 $
#

############ IMPORTANT INSTRUCTIONS ###############
#
# * Zen Cart uses the zc_install/index.php program to do installations
# * This SQL script is intended to be used by running zc_install
# * It is *not* recommended to simply run these statements manually via any other means
# * ie: not via phpMyAdmin or other SQL front-end tools
# * The zc_install program catches possible problems/exceptions
# * and also handles table-prefixes automatically, based on selections made during installation
#
#####################################################


# --------------------------------------------------------
#
# Table structure for table upgrade_exceptions
# (Placed at top so any exceptions during installation can be trapped as well)
#

DROP TABLE IF EXISTS upgrade_exceptions;
CREATE TABLE upgrade_exceptions (
  upgrade_exception_id smallint(5) NOT NULL auto_increment,
  sql_file varchar(50) default NULL,
  reason varchar(200) default NULL,
  errordate datetime default '0001-01-01 00:00:00',
  sqlstatement text,
  PRIMARY KEY  (upgrade_exception_id)
) ENGINE=MyISAM;


# --------------------------------------------------------
#
# Table structure for table address_book
#

DROP TABLE IF EXISTS address_book;
CREATE TABLE address_book (
  address_book_id int(11) NOT NULL auto_increment,
  customers_id int(11) NOT NULL default '0',
  entry_gender char(1) NOT NULL default '',
  entry_company varchar(64) default NULL,
  entry_firstname varchar(32) NOT NULL default '',
  entry_lastname varchar(32) NOT NULL default '',
  entry_street_address varchar(64) NOT NULL default '',
  entry_suburb varchar(32) default NULL,
  entry_postcode varchar(10) NOT NULL default '',
  entry_city varchar(32) NOT NULL default '',
  entry_state varchar(32) default NULL,
  entry_country_id int(11) NOT NULL default '0',
  entry_zone_id int(11) NOT NULL default '0',
  PRIMARY KEY  (address_book_id),
  KEY idx_address_book_customers_id_zen (customers_id)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'address_format'
#

DROP TABLE IF EXISTS address_format;
CREATE TABLE address_format (
  address_format_id int(11) NOT NULL auto_increment,
  address_format varchar(128) NOT NULL default '',
  address_summary varchar(48) NOT NULL default '',
  PRIMARY KEY  (address_format_id)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'admin'
#

DROP TABLE IF EXISTS admin;
CREATE TABLE admin (
  admin_id int(11) NOT NULL auto_increment,
  admin_name varchar(32) NOT NULL default '',
  admin_email varchar(96) NOT NULL default '',
  admin_profile int(11) NOT NULL default '0',
  admin_pass varchar(40) NOT NULL default '',
  prev_pass1 varchar(40) NOT NULL default '',
  prev_pass2 varchar(40) NOT NULL default '',
  prev_pass3 varchar(40) NOT NULL default '',
  pwd_last_change_date datetime NOT NULL default '0000-00-00 00:00:00',
  reset_token varchar(60) NOT NULL default '',
  last_modified datetime NOT NULL default '0000-00-00 00:00:00',
  last_login_date datetime NOT NULL default '0000-00-00 00:00:00',
  last_login_ip varchar(45) NOT NULL default '',
  failed_logins smallint(4) unsigned NOT NULL default '0',
  lockout_expires int(11) NOT NULL default '0',
  last_failed_attempt datetime NOT NULL default '0000-00-00 00:00:00',
  last_failed_ip varchar(45) NOT NULL default '',
  PRIMARY KEY  (admin_id),
  KEY idx_admin_name_zen (admin_name),
  KEY idx_admin_email_zen (admin_email),
  KEY idx_admin_profile_zen (admin_profile)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'admin_activity_log'
#

DROP TABLE IF EXISTS admin_activity_log;
CREATE TABLE admin_activity_log (
  log_id bigint(15) NOT NULL auto_increment,
  access_date datetime NOT NULL default '0001-01-01 00:00:00',
  admin_id int(11) NOT NULL default '0',
  page_accessed varchar(80) NOT NULL default '',
  page_parameters text,
  ip_address varchar(45) NOT NULL default '',
  flagged tinyint NOT NULL default '0',
  attention varchar(255) NOT NULL default '',
  gzpost mediumblob,
  PRIMARY KEY  (log_id),
  KEY idx_page_accessed_zen (page_accessed),
  KEY idx_access_date_zen (access_date),
  KEY idx_flagged_zen (flagged),
  KEY idx_ip_zen (ip_address)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'admin_menu'
#

DROP TABLE IF EXISTS admin_menus;
CREATE TABLE admin_menus (
  menu_key VARCHAR(32) NOT NULL DEFAULT '',
  language_key VARCHAR(255) NOT NULL DEFAULT '',
  sort_order INT(11) NOT NULL DEFAULT 0,
  UNIQUE KEY menu_key (menu_key)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'admin_pages'
#

DROP TABLE IF EXISTS admin_pages;
CREATE TABLE admin_pages (
  page_key VARCHAR(32) NOT NULL DEFAULT '',
  language_key VARCHAR(255) NOT NULL DEFAULT '',
  main_page varchar(64) NOT NULL default '',
  page_params varchar(64) NOT NULL default '',
  menu_key varchar(32) NOT NULL default '',
  display_on_menu char(1) NOT NULL default 'N',
  sort_order int(11) NOT NULL default 0,
  UNIQUE KEY page_key (page_key)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'admin_profiles'
#

DROP TABLE IF EXISTS admin_profiles;
CREATE TABLE admin_profiles (
  profile_id int(11) NOT NULL AUTO_INCREMENT,
  profile_name varchar(64) NOT NULL default '',
  PRIMARY KEY (profile_id)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'admin_pages_to_profiles'
#

DROP TABLE IF EXISTS admin_pages_to_profiles;
CREATE TABLE admin_pages_to_profiles (
  profile_id int(11) NOT NULL default '0',
  page_key varchar(32) NOT NULL default '',
  UNIQUE KEY profile_page (profile_id, page_key),
  UNIQUE KEY page_profile (page_key, profile_id)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'authorizenet'
#
DROP TABLE IF EXISTS authorizenet;
CREATE TABLE authorizenet (
  id int(11) unsigned NOT NULL auto_increment,
  customer_id int(11) NOT NULL default '0',
  order_id int(11) NOT NULL default '0',
  response_code int(1) NOT NULL default '0',
  response_text varchar(255) NOT NULL default '',
  authorization_type varchar(50) NOT NULL default '',
  transaction_id bigint(20) default NULL,
  sent longtext NOT NULL,
  received longtext NOT NULL,
  time varchar(50) NOT NULL default '',
  session_id varchar(255) NOT NULL default '',
  PRIMARY KEY  (id)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'banners'
#

DROP TABLE IF EXISTS banners;
CREATE TABLE banners (
  banners_id int(11) NOT NULL auto_increment,
  banners_title varchar(64) NOT NULL default '',
  banners_url varchar(255) NOT NULL default '',
  banners_image varchar(64) NOT NULL default '',
  banners_group varchar(15) NOT NULL default '',
  banners_html_text text,
  expires_impressions int(7) default '0',
  expires_date datetime default NULL,
  date_scheduled datetime default NULL,
  date_added datetime NOT NULL default '0001-01-01 00:00:00',
  date_status_change datetime default NULL,
  status int(1) NOT NULL default '1',
  banners_open_new_windows int(1) NOT NULL default '1',
  banners_on_ssl int(1) NOT NULL default '1',
  banners_sort_order int(11) NOT NULL default '0',
  PRIMARY KEY  (banners_id),
  KEY idx_status_group_zen (status,banners_group),
  KEY idx_expires_date_zen (expires_date),
  KEY idx_date_scheduled_zen (date_scheduled)
) ENGINE=MyISAM;


# --------------------------------------------------------

#
# Table structure for table 'banners_history'
#

DROP TABLE IF EXISTS banners_history;
CREATE TABLE banners_history (
  banners_history_id int(11) NOT NULL auto_increment,
  banners_id int(11) NOT NULL default '0',
  banners_shown int(5) NOT NULL default '0',
  banners_clicked int(5) NOT NULL default '0',
  banners_history_date datetime NOT NULL default '0001-01-01 00:00:00',
  PRIMARY KEY  (banners_history_id),
  KEY idx_banners_id_zen (banners_id)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'categories'
#

DROP TABLE IF EXISTS categories;
CREATE TABLE categories (
  categories_id int(11) NOT NULL auto_increment,
  categories_image varchar(64) default NULL,
  parent_id int(11) NOT NULL default '0',
  sort_order int(3) default NULL,
  date_added datetime default NULL,
  last_modified datetime default NULL,
  categories_status tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (categories_id),
  KEY idx_parent_id_cat_id_zen (parent_id,categories_id),
  KEY idx_status_zen (categories_status),
  KEY idx_sort_order_zen (sort_order)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'categories_description'
#

DROP TABLE IF EXISTS categories_description;
CREATE TABLE categories_description (
  categories_id int(11) NOT NULL default '0',
  language_id int(11) NOT NULL default '1',
  categories_name varchar(32) NOT NULL default '',
  categories_description text NOT NULL,
  PRIMARY KEY  (categories_id,language_id),
  KEY idx_categories_name_zen (categories_name)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'configuration'
#

DROP TABLE IF EXISTS configuration;
CREATE TABLE configuration (
  configuration_id int(11) NOT NULL auto_increment,
  configuration_title text NOT NULL,
  configuration_key varchar(255) NOT NULL default '',
  configuration_value text NOT NULL,
  configuration_description text NOT NULL,
  configuration_group_id int(11) NOT NULL default '0',
  sort_order int(5) default NULL,
  last_modified datetime default NULL,
  date_added datetime NOT NULL default '0001-01-01 00:00:00',
  use_function text default NULL,
  set_function text default NULL,
  PRIMARY KEY  (configuration_id),
  UNIQUE KEY unq_config_key_zen (configuration_key),
  KEY idx_key_value_zen (configuration_key,configuration_value(10)),
  KEY idx_cfg_grp_id_zen (configuration_group_id)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'configuration_group'
#

DROP TABLE IF EXISTS configuration_group;
CREATE TABLE configuration_group (
  configuration_group_id int(11) NOT NULL auto_increment,
  configuration_group_title varchar(64) NOT NULL default '',
  configuration_group_description varchar(255) NOT NULL default '',
  sort_order int(5) default NULL,
  visible int(1) default '1',
  PRIMARY KEY  (configuration_group_id),
  KEY idx_visible_zen (visible)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'counter'
#

DROP TABLE IF EXISTS counter;
CREATE TABLE counter (
  startdate char(8) default NULL,
  counter int(12) default NULL
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'counter_history'
#

DROP TABLE IF EXISTS counter_history;
CREATE TABLE counter_history (
  startdate char(8) default NULL,
  counter int(12) default NULL,
  session_counter int(12) default NULL,
  PRIMARY KEY  (startdate)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'countries'
#

DROP TABLE IF EXISTS countries;
CREATE TABLE countries (
  countries_id int(11) NOT NULL auto_increment,
  countries_name varchar(64) NOT NULL default '',
  countries_iso_code_2 char(2) NOT NULL default '',
  countries_iso_code_3 char(3) NOT NULL default '',
  address_format_id int(11) NOT NULL default '0',
  PRIMARY KEY  (countries_id),
  KEY idx_countries_name_zen (countries_name),
  KEY idx_address_format_id_zen (address_format_id),
  KEY idx_iso_2_zen (countries_iso_code_2),
  KEY idx_iso_3_zen (countries_iso_code_3)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'coupon_email_track'
#

DROP TABLE IF EXISTS coupon_email_track;
CREATE TABLE coupon_email_track (
  unique_id int(11) NOT NULL auto_increment,
  coupon_id int(11) NOT NULL default '0',
  customer_id_sent int(11) NOT NULL default '0',
  sent_firstname varchar(32) default NULL,
  sent_lastname varchar(32) default NULL,
  emailed_to varchar(32) default NULL,
  date_sent datetime NOT NULL default '0001-01-01 00:00:00',
  PRIMARY KEY  (unique_id),
  KEY idx_coupon_id_zen (coupon_id)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'coupon_gv_customer'
#

DROP TABLE IF EXISTS coupon_gv_customer;
CREATE TABLE coupon_gv_customer (
  customer_id int(5) NOT NULL default '0',
  amount decimal(15,4) NOT NULL default '0.0000',
  PRIMARY KEY  (customer_id)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'coupon_gv_queue'
#

DROP TABLE IF EXISTS coupon_gv_queue;
CREATE TABLE coupon_gv_queue (
  unique_id int(5) NOT NULL auto_increment,
  customer_id int(5) NOT NULL default '0',
  order_id int(5) NOT NULL default '0',
  amount decimal(15,4) NOT NULL default '0.0000',
  date_created datetime NOT NULL default '0001-01-01 00:00:00',
  ipaddr varchar(45) NOT NULL default '',
  release_flag char(1) NOT NULL default 'N',
  PRIMARY KEY  (unique_id),
  KEY idx_cust_id_order_id_zen (customer_id,order_id),
  KEY idx_release_flag_zen (release_flag)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'coupon_redeem_track'
#

DROP TABLE IF EXISTS coupon_redeem_track;
CREATE TABLE coupon_redeem_track (
  unique_id int(11) NOT NULL auto_increment,
  coupon_id int(11) NOT NULL default '0',
  customer_id int(11) NOT NULL default '0',
  redeem_date datetime NOT NULL default '0001-01-01 00:00:00',
  redeem_ip varchar(45) NOT NULL default '',
  order_id int(11) NOT NULL default '0',
  PRIMARY KEY  (unique_id),
  KEY idx_coupon_id_zen (coupon_id)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'coupon_restrict'
#

DROP TABLE IF EXISTS coupon_restrict;
CREATE TABLE coupon_restrict (
  restrict_id int(11) NOT NULL auto_increment,
  coupon_id int(11) NOT NULL default '0',
  product_id int(11) NOT NULL default '0',
  category_id int(11) NOT NULL default '0',
  coupon_restrict char(1) NOT NULL default 'N',
  PRIMARY KEY  (restrict_id),
  KEY idx_coup_id_prod_id_zen (coupon_id,product_id)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'coupons'
#

DROP TABLE IF EXISTS coupons;
CREATE TABLE coupons (
  coupon_id int(11) NOT NULL auto_increment,
  coupon_type char(1) NOT NULL default 'F',
  coupon_code varchar(32) NOT NULL default '',
  coupon_amount decimal(15,4) NOT NULL default '0.0000',
  coupon_minimum_order decimal(15,4) NOT NULL default '0.0000',
  coupon_start_date datetime NOT NULL default '0001-01-01 00:00:00',
  coupon_expire_date datetime NOT NULL default '0001-01-01 00:00:00',
  uses_per_coupon int(5) NOT NULL default '1',
  uses_per_user int(5) NOT NULL default '0',
  restrict_to_products varchar(255) default NULL,
  restrict_to_categories varchar(255) default NULL,
  restrict_to_customers text,
  coupon_active char(1) NOT NULL default 'Y',
  date_created datetime NOT NULL default '0001-01-01 00:00:00',
  date_modified datetime NOT NULL default '0001-01-01 00:00:00',
  coupon_zone_restriction int(11) NOT NULL default '0',
  PRIMARY KEY (coupon_id),
  KEY idx_active_type_zen (coupon_active,coupon_type),
  KEY idx_coupon_code_zen (coupon_code),
  KEY idx_coupon_type_zen (coupon_type)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'coupons_description'
#

DROP TABLE IF EXISTS coupons_description;
CREATE TABLE coupons_description (
  coupon_id int(11) NOT NULL default '0',
  language_id int(11) NOT NULL default '0',
  coupon_name varchar(32) NOT NULL default '',
  coupon_description text,
  PRIMARY KEY (coupon_id,language_id)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'currencies'
#

DROP TABLE IF EXISTS currencies;
CREATE TABLE currencies (
  currencies_id int(11) NOT NULL auto_increment,
  title varchar(32) NOT NULL default '',
  code char(3) NOT NULL default '',
  symbol_left varchar(24) default NULL,
  symbol_right varchar(24) default NULL,
  decimal_point char(1) default NULL,
  thousands_point char(1) default NULL,
  decimal_places char(1) default NULL,
  value float(13,8) default NULL,
  last_updated datetime default NULL,
  PRIMARY KEY  (currencies_id)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'customers'
#

DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
  customers_id int(11) NOT NULL auto_increment,
  customers_gender char(1) NOT NULL default '',
  customers_firstname varchar(32) NOT NULL default '',
  customers_lastname varchar(32) NOT NULL default '',
  customers_dob datetime NOT NULL default '0001-01-01 00:00:00',
  customers_email_address varchar(96) NOT NULL default '',
  customers_nick varchar(96) NOT NULL default '',
  customers_default_address_id int(11) NOT NULL default '0',
  customers_telephone varchar(32) NOT NULL default '',
  customers_fax varchar(32) default NULL,
  customers_password varchar(40) NOT NULL default '',
  customers_newsletter char(1) default NULL,
  customers_group_pricing int(11) NOT NULL default '0',
  customers_email_format varchar(4) NOT NULL default 'TEXT',
  customers_authorization int(1) NOT NULL default '0',
  customers_referral varchar(32) NOT NULL default '',
  customers_paypal_payerid VARCHAR(20) NOT NULL default '',
  customers_paypal_ec TINYINT(1) UNSIGNED DEFAULT 0 NOT NULL,
  PRIMARY KEY  (customers_id),
  KEY idx_email_address_zen (customers_email_address),
  KEY idx_referral_zen (customers_referral(10)),
  KEY idx_grp_pricing_zen (customers_group_pricing),
  KEY idx_nick_zen (customers_nick),
  KEY idx_newsletter_zen (customers_newsletter)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'customers_basket'
#

DROP TABLE IF EXISTS customers_basket;
CREATE TABLE customers_basket (
  customers_basket_id int(11) NOT NULL auto_increment,
  customers_id int(11) NOT NULL default '0',
  products_id tinytext NOT NULL,
  customers_basket_quantity float NOT NULL default '0',
  final_price decimal(15,4) NOT NULL default '0.0000',
  customers_basket_date_added varchar(8) default NULL,
  PRIMARY KEY  (customers_basket_id),
  KEY idx_customers_id_zen (customers_id)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'customers_basket_attributes'
#

DROP TABLE IF EXISTS customers_basket_attributes;
CREATE TABLE customers_basket_attributes (
  customers_basket_attributes_id int(11) NOT NULL auto_increment,
  customers_id int(11) NOT NULL default '0',
  products_id tinytext NOT NULL,
  products_options_id varchar(64) NOT NULL default '0',
  products_options_value_id int(11) NOT NULL default '0',
  products_options_value_text BLOB NULL,
  products_options_sort_order text NOT NULL,
  PRIMARY KEY  (customers_basket_attributes_id),
  KEY idx_cust_id_prod_id_zen (customers_id,products_id(36))
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'customers_info'
#

DROP TABLE IF EXISTS customers_info;
CREATE TABLE customers_info (
  customers_info_id int(11) NOT NULL default '0',
  customers_info_date_of_last_logon datetime default NULL,
  customers_info_number_of_logons int(5) default NULL,
  customers_info_date_account_created datetime default NULL,
  customers_info_date_account_last_modified datetime default NULL,
  global_product_notifications int(1) default '0',
  PRIMARY KEY  (customers_info_id)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table db_cache
#
DROP TABLE IF EXISTS db_cache;
CREATE TABLE db_cache (
  cache_entry_name varchar(64) NOT NULL default '',
  cache_data mediumblob,
  cache_entry_created int(15) default NULL,
  PRIMARY KEY  (cache_entry_name)
) ENGINE=MyISAM;



# --------------------------------------------------------

#
# Table structure for table 'email_archive'
#

DROP TABLE IF EXISTS email_archive;
CREATE TABLE email_archive (
  archive_id int(11) NOT NULL auto_increment,
  email_to_name varchar(96) NOT NULL default '',
  email_to_address varchar(96) NOT NULL default '',
  email_from_name varchar(96) NOT NULL default '',
  email_from_address varchar(96) NOT NULL default '',
  email_subject varchar(255) NOT NULL default '',
  email_html text NOT NULL,
  email_text text NOT NULL,
  date_sent datetime NOT NULL default '0001-01-01 00:00:00',
  module varchar(64) NOT NULL default '',
  PRIMARY KEY  (archive_id),
  KEY idx_email_to_address_zen (email_to_address),
  KEY idx_module_zen (module)
) ENGINE=MyISAM;


# --------------------------------------------------------

#
# Table structure for table 'ezpages'
#

DROP TABLE IF EXISTS ezpages;
CREATE TABLE ezpages (
  pages_id int(11) NOT NULL auto_increment,
  alt_url varchar(255) NOT NULL default '',
  alt_url_external varchar(255) NOT NULL default '',
  status_header int(1) NOT NULL default '1',
  status_sidebox int(1) NOT NULL default '1',
  status_footer int(1) NOT NULL default '1',
  status_toc int(1) NOT NULL default '1',
  header_sort_order int(3) NOT NULL default '0',
  sidebox_sort_order int(3) NOT NULL default '0',
  footer_sort_order int(3) NOT NULL default '0',
  toc_sort_order int(3) NOT NULL default '0',
  page_open_new_window int(1) NOT NULL default '0',
  page_is_ssl int(1) NOT NULL default '0',
  toc_chapter int(11) NOT NULL default '0',
  PRIMARY KEY  (pages_id),
  KEY idx_ezp_status_header_zen (status_header),
  KEY idx_ezp_status_sidebox_zen (status_sidebox),
  KEY idx_ezp_status_footer_zen (status_footer),
  KEY idx_ezp_status_toc_zen (status_toc)
) ENGINE=MyISAM;


DROP TABLE IF EXISTS ezpages_content;
CREATE TABLE IF NOT EXISTS ezpages_content (
  pages_id int(11) NOT NULL default '0',
  languages_id int(11) NOT NULL default '1',
  pages_title varchar(64) NOT NULL default '',
  pages_html_text mediumtext,
  KEY idx_ezpages_content (pages_id,languages_id)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'featured'
#

DROP TABLE IF EXISTS featured;
CREATE TABLE featured (
  featured_id int(11) NOT NULL auto_increment,
  products_id int(11) NOT NULL default '0',
  featured_date_added datetime default NULL,
  featured_last_modified datetime default NULL,
  expires_date date NOT NULL default '0001-01-01',
  date_status_change datetime default NULL,
  status int(1) NOT NULL default '1',
  featured_date_available date NOT NULL default '0001-01-01',
  PRIMARY KEY  (featured_id),
  KEY idx_status_zen (status),
  KEY idx_products_id_zen (products_id),
  KEY idx_date_avail_zen (featured_date_available),
  KEY idx_expires_date_zen (expires_date)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'files_uploaded'
#

DROP TABLE IF EXISTS files_uploaded;
CREATE TABLE files_uploaded (
  files_uploaded_id int(11) NOT NULL auto_increment,
  sesskey varchar(32) default NULL,
  customers_id int(11) default NULL,
  files_uploaded_name varchar(64) NOT NULL default '',
  PRIMARY KEY  (files_uploaded_id),
  KEY idx_customers_id_zen (customers_id)
) ENGINE=MyISAM COMMENT='Must always have either a sesskey or customers_id';

# --------------------------------------------------------

#
# Table structure for table 'geo_zones'
#

DROP TABLE IF EXISTS geo_zones;
CREATE TABLE geo_zones (
  geo_zone_id int(11) NOT NULL auto_increment,
  geo_zone_name varchar(32) NOT NULL default '',
  geo_zone_description varchar(255) NOT NULL default '',
  last_modified datetime default NULL,
  date_added datetime NOT NULL default '0001-01-01 00:00:00',
  PRIMARY KEY  (geo_zone_id)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'get_terms_to_filter'
#
DROP TABLE IF EXISTS get_terms_to_filter;
CREATE TABLE get_terms_to_filter (
  get_term_name varchar(255) NOT NULL default '',
  get_term_table varchar(64) NOT NULL,
  get_term_name_field varchar(64) NOT NULL,
  PRIMARY KEY  (get_term_name)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'group_pricing'
#

DROP TABLE IF EXISTS group_pricing;
CREATE TABLE group_pricing (
  group_id int(11) NOT NULL auto_increment,
  group_name varchar(32) NOT NULL default '',
  group_percentage decimal(5,2) NOT NULL default '0.00',
  last_modified datetime default NULL,
  date_added datetime NOT NULL default '0001-01-01 00:00:00',
  PRIMARY KEY  (group_id)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'languages'
#

DROP TABLE IF EXISTS languages;
CREATE TABLE languages (
  languages_id int(11) NOT NULL auto_increment,
  name varchar(32) NOT NULL default '',
  code char(2) NOT NULL default '',
  image varchar(64) default NULL,
  directory varchar(32) default NULL,
  sort_order int(3) default NULL,
  PRIMARY KEY  (languages_id),
  KEY idx_languages_name_zen (name)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'layout_boxes'
#

DROP TABLE IF EXISTS layout_boxes;
CREATE TABLE layout_boxes (
  layout_id int(11) NOT NULL auto_increment,
  layout_template varchar(64) NOT NULL default '',
  layout_box_name varchar(64) NOT NULL default '',
  layout_box_status tinyint(1) NOT NULL default '0',
  layout_box_location tinyint(1) NOT NULL default '0',
  layout_box_sort_order int(11) NOT NULL default '0',
  layout_box_sort_order_single int(11) NOT NULL default '0',
  layout_box_status_single tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (layout_id),
  KEY idx_name_template_zen (layout_template,layout_box_name),
  KEY idx_layout_box_status_zen (layout_box_status),
  KEY idx_layout_box_sort_order_zen (layout_box_sort_order)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'manufacturers'
#

DROP TABLE IF EXISTS manufacturers;
CREATE TABLE manufacturers (
  manufacturers_id int(11) NOT NULL auto_increment,
  manufacturers_name varchar(32) NOT NULL default '',
  manufacturers_image varchar(64) default NULL,
  date_added datetime default NULL,
  last_modified datetime default NULL,
  PRIMARY KEY  (manufacturers_id),
  KEY idx_mfg_name_zen (manufacturers_name)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'manufacturers_info'
#

DROP TABLE IF EXISTS manufacturers_info;
CREATE TABLE manufacturers_info (
  manufacturers_id int(11) NOT NULL default '0',
  languages_id int(11) NOT NULL default '0',
  manufacturers_url varchar(255) NOT NULL default '',
  url_clicked int(5) NOT NULL default '0',
  date_last_click datetime default NULL,
  PRIMARY KEY  (manufacturers_id,languages_id)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'media_clips'
#

DROP TABLE IF EXISTS media_clips;
CREATE TABLE media_clips (
  clip_id int(11) NOT NULL auto_increment,
  media_id int(11) NOT NULL default '0',
  clip_type smallint(6) NOT NULL default '0',
  clip_filename text NOT NULL,
  date_added datetime NOT NULL default '0001-01-01 00:00:00',
  last_modified datetime NOT NULL default '0001-01-01 00:00:00',
  PRIMARY KEY  (clip_id),
  KEY idx_media_id_zen (media_id),
  KEY idx_clip_type_zen (clip_type)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'media_manager'
#

DROP TABLE IF EXISTS media_manager;
CREATE TABLE media_manager (
  media_id int(11) NOT NULL auto_increment,
  media_name varchar(255) NOT NULL default '',
  last_modified datetime NOT NULL default '0001-01-01 00:00:00',
  date_added datetime NOT NULL default '0001-01-01 00:00:00',
  PRIMARY KEY  (media_id),
  KEY idx_media_name_zen (media_name)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'media_to_products'
#

DROP TABLE IF EXISTS media_to_products;
CREATE TABLE media_to_products (
  media_id int(11) NOT NULL default '0',
  product_id int(11) NOT NULL default '0',
  KEY idx_media_product_zen (media_id,product_id)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'media_types'
#

DROP TABLE IF EXISTS media_types;
CREATE TABLE media_types (
  type_id int(11) NOT NULL auto_increment,
  type_name varchar(64) NOT NULL default '',
  type_ext varchar(8) NOT NULL default '',
  PRIMARY KEY  (type_id),
  KEY idx_type_name_zen (type_name)
) ENGINE=MyISAM;

INSERT INTO media_types (type_name, type_ext) VALUES ('MP3','.mp3');

# -------------------------------------------------------

#
# Table structure for table 'meta_tags_categories_description'
#

DROP TABLE IF EXISTS meta_tags_categories_description;
CREATE TABLE meta_tags_categories_description (
  categories_id int(11) NOT NULL,
  language_id int(11) NOT NULL default '1',
  metatags_title varchar(255) NOT NULL default '',
  metatags_keywords text,
  metatags_description text,
  PRIMARY KEY  (categories_id,language_id)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'meta_tags_products_description'
#

DROP TABLE IF EXISTS meta_tags_products_description;
CREATE TABLE meta_tags_products_description (
  products_id int(11) NOT NULL,
  language_id int(11) NOT NULL default '1',
  metatags_title varchar(255) NOT NULL default '',
  metatags_keywords text,
  metatags_description text,
  PRIMARY KEY  (products_id,language_id)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'music_genre'
#

DROP TABLE IF EXISTS music_genre;
CREATE TABLE music_genre (
  music_genre_id int(11) NOT NULL auto_increment,
  music_genre_name varchar(32) NOT NULL default '',
  date_added datetime default NULL,
  last_modified datetime default NULL,
  PRIMARY KEY  (music_genre_id),
  KEY idx_music_genre_name_zen (music_genre_name)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'newsletters'
#

DROP TABLE IF EXISTS newsletters;
CREATE TABLE newsletters (
  newsletters_id int(11) NOT NULL auto_increment,
  title varchar(255) NOT NULL default '',
  content text NOT NULL,
  content_html text NOT NULL,
  module varchar(255) NOT NULL default '',
  date_added datetime NOT NULL default '0001-01-01 00:00:00',
  date_sent datetime default NULL,
  status int(1) default NULL,
  locked int(1) default '0',
  PRIMARY KEY  (newsletters_id)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'orders'
#

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
  orders_id int(11) NOT NULL auto_increment,
  customers_id int(11) NOT NULL default '0',
  customers_name varchar(64) NOT NULL default '',
  customers_company varchar(64) default NULL,
  customers_street_address varchar(64) NOT NULL default '',
  customers_suburb varchar(32) default NULL,
  customers_city varchar(32) NOT NULL default '',
  customers_postcode varchar(10) NOT NULL default '',
  customers_state varchar(32) default NULL,
  customers_country varchar(32) NOT NULL default '',
  customers_telephone varchar(32) NOT NULL default '',
  customers_email_address varchar(96) NOT NULL default '',
  customers_address_format_id int(5) NOT NULL default '0',
  delivery_name varchar(64) NOT NULL default '',
  delivery_company varchar(64) default NULL,
  delivery_street_address varchar(64) NOT NULL default '',
  delivery_suburb varchar(32) default NULL,
  delivery_city varchar(32) NOT NULL default '',
  delivery_postcode varchar(10) NOT NULL default '',
  delivery_state varchar(32) default NULL,
  delivery_country varchar(32) NOT NULL default '',
  delivery_address_format_id int(5) NOT NULL default '0',
  billing_name varchar(64) NOT NULL default '',
  billing_company varchar(64) default NULL,
  billing_street_address varchar(64) NOT NULL default '',
  billing_suburb varchar(32) default NULL,
  billing_city varchar(32) NOT NULL default '',
  billing_postcode varchar(10) NOT NULL default '',
  billing_state varchar(32) default NULL,
  billing_country varchar(32) NOT NULL default '',
  billing_address_format_id int(5) NOT NULL default '0',
  payment_method varchar(128) NOT NULL default '',
  payment_module_code varchar(32) NOT NULL default '',
  shipping_method varchar(128) NOT NULL default '',
  shipping_module_code varchar(32) NOT NULL default '',
  coupon_code varchar(32) NOT NULL default '',
  cc_type varchar(20) default NULL,
  cc_owner varchar(64) default NULL,
  cc_number varchar(32) default NULL,
  cc_expires varchar(4) default NULL,
  cc_cvv blob,
  last_modified datetime default NULL,
  date_purchased datetime default NULL,
  orders_status int(5) NOT NULL default '0',
  orders_date_finished datetime default NULL,
  currency char(3) default NULL,
  currency_value decimal(14,6) default NULL,
  order_total decimal(14,2) default NULL,
  order_tax decimal(14,2) default NULL,
  paypal_ipn_id int(11) NOT NULL default '0',
  ip_address varchar(96) NOT NULL default '',
  PRIMARY KEY  (orders_id),
  KEY idx_status_orders_cust_zen (orders_status,orders_id,customers_id),
  KEY idx_date_purchased_zen (date_purchased),
  KEY idx_cust_id_orders_id_zen (customers_id,orders_id)
) ENGINE=MyISAM;


# --------------------------------------------------------

#
# Table structure for table 'orders_products'
#

DROP TABLE IF EXISTS orders_products;
CREATE TABLE orders_products (
  orders_products_id int(11) NOT NULL auto_increment,
  orders_id int(11) NOT NULL default '0',
  products_id int(11) NOT NULL default '0',
  products_model varchar(32) default NULL,
  products_name varchar(64) NOT NULL default '',
  products_price decimal(15,4) NOT NULL default '0.0000',
  final_price decimal(15,4) NOT NULL default '0.0000',
  products_tax decimal(7,4) NOT NULL default '0.0000',
  products_quantity float NOT NULL default '0',
  onetime_charges decimal(15,4) NOT NULL default '0.0000',
  products_priced_by_attribute tinyint(1) NOT NULL default '0',
  product_is_free tinyint(1) NOT NULL default '0',
  products_discount_type tinyint(1) NOT NULL default '0',
  products_discount_type_from tinyint(1) NOT NULL default '0',
  products_prid tinytext NOT NULL,
  PRIMARY KEY  (orders_products_id),
  KEY idx_orders_id_prod_id_zen (orders_id,products_id),
  KEY idx_prod_id_orders_id_zen (products_id,orders_id)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'orders_products_attributes'
#

DROP TABLE IF EXISTS orders_products_attributes;
CREATE TABLE orders_products_attributes (
  orders_products_attributes_id int(11) NOT NULL auto_increment,
  orders_id int(11) NOT NULL default '0',
  orders_products_id int(11) NOT NULL default '0',
  products_options varchar(32) NOT NULL default '',
  products_options_values text NOT NULL,
  options_values_price decimal(15,4) NOT NULL default '0.0000',
  price_prefix char(1) NOT NULL default '',
  product_attribute_is_free tinyint(1) NOT NULL default '0',
  products_attributes_weight float NOT NULL default '0',
  products_attributes_weight_prefix char(1) NOT NULL default '',
  attributes_discounted tinyint(1) NOT NULL default '1',
  attributes_price_base_included tinyint(1) NOT NULL default '1',
  attributes_price_onetime decimal(15,4) NOT NULL default '0.0000',
  attributes_price_factor decimal(15,4) NOT NULL default '0.0000',
  attributes_price_factor_offset decimal(15,4) NOT NULL default '0.0000',
  attributes_price_factor_onetime decimal(15,4) NOT NULL default '0.0000',
  attributes_price_factor_onetime_offset decimal(15,4) NOT NULL default '0.0000',
  attributes_qty_prices text,
  attributes_qty_prices_onetime text,
  attributes_price_words decimal(15,4) NOT NULL default '0.0000',
  attributes_price_words_free int(4) NOT NULL default '0',
  attributes_price_letters decimal(15,4) NOT NULL default '0.0000',
  attributes_price_letters_free int(4) NOT NULL default '0',
  products_options_id int(11) NOT NULL default '0',
  products_options_values_id int(11) NOT NULL default '0',
  products_prid tinytext NOT NULL,
  PRIMARY KEY  (orders_products_attributes_id),
  KEY idx_orders_id_prod_id_zen (orders_id,orders_products_id)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'orders_products_download'
#

DROP TABLE IF EXISTS orders_products_download;
CREATE TABLE orders_products_download (
  orders_products_download_id int(11) NOT NULL auto_increment,
  orders_id int(11) NOT NULL default '0',
  orders_products_id int(11) NOT NULL default '0',
  orders_products_filename varchar(255) NOT NULL default '',
  download_maxdays int(2) NOT NULL default '0',
  download_count int(2) NOT NULL default '0',
  products_prid tinytext NOT NULL,
  PRIMARY KEY  (orders_products_download_id),
  KEY idx_orders_id_zen (orders_id),
  KEY idx_orders_products_id_zen (orders_products_id)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'orders_status'
#

DROP TABLE IF EXISTS orders_status;
CREATE TABLE orders_status (
  orders_status_id int(11) NOT NULL default '0',
  language_id int(11) NOT NULL default '1',
  orders_status_name varchar(32) NOT NULL default '',
  PRIMARY KEY  (orders_status_id,language_id),
  KEY idx_orders_status_name_zen (orders_status_name)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'orders_status_history'
#

DROP TABLE IF EXISTS orders_status_history;
CREATE TABLE orders_status_history (
  orders_status_history_id int(11) NOT NULL auto_increment,
  orders_id int(11) NOT NULL default '0',
  orders_status_id int(5) NOT NULL default '0',
  date_added datetime NOT NULL default '0001-01-01 00:00:00',
  customer_notified int(1) default '0',
  comments text,
  PRIMARY KEY  (orders_status_history_id),
  KEY idx_orders_id_status_id_zen (orders_id,orders_status_id)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'orders_total'
#

DROP TABLE IF EXISTS orders_total;
CREATE TABLE orders_total (
  orders_total_id int(10) unsigned NOT NULL auto_increment,
  orders_id int(11) NOT NULL default '0',
  title varchar(255) NOT NULL default '',
  text varchar(255) NOT NULL default '',
  value decimal(15,4) NOT NULL default '0.0000',
  class varchar(32) NOT NULL default '',
  sort_order int(11) NOT NULL default '0',
  PRIMARY KEY  (orders_total_id),
  KEY idx_ot_orders_id_zen (orders_id),
  KEY idx_ot_class_zen (class)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'paypal'
#

DROP TABLE IF EXISTS paypal;
CREATE TABLE paypal (
  paypal_ipn_id int(11) unsigned NOT NULL auto_increment,
  order_id int(11) unsigned NOT NULL default '0',
  txn_type varchar(40) NOT NULL default '',
  module_name varchar(40) NOT NULL default '',
  module_mode varchar(40) NOT NULL default '',
  reason_code varchar(40) default NULL,
  payment_type varchar(40) NOT NULL default '',
  payment_status varchar(32) NOT NULL default '',
  pending_reason varchar(32) default NULL,
  invoice varchar(128) default NULL,
  mc_currency char(3) NOT NULL default '',
  first_name varchar(32) NOT NULL default '',
  last_name varchar(32) NOT NULL default '',
  payer_business_name varchar(128) default NULL,
  address_name varchar(64) default NULL,
  address_street varchar(254) default NULL,
  address_city varchar(120) default NULL,
  address_state varchar(120) default NULL,
  address_zip varchar(10) default NULL,
  address_country varchar(64) default NULL,
  address_status varchar(11) default NULL,
  payer_email varchar(128) NOT NULL default '',
  payer_id varchar(32) NOT NULL default '',
  payer_status varchar(10) NOT NULL default '',
  payment_date datetime NOT NULL default '0001-01-01 00:00:00',
  business varchar(128) NOT NULL default '',
  receiver_email varchar(128) NOT NULL default '',
  receiver_id varchar(32) NOT NULL default '',
  txn_id varchar(20) NOT NULL default '',
  parent_txn_id varchar(20) default NULL,
  num_cart_items tinyint(4) unsigned NOT NULL default '1',
  mc_gross decimal(7,2) NOT NULL default '0.00',
  mc_fee decimal(7,2) NOT NULL default '0.00',
  payment_gross decimal(7,2) default NULL,
  payment_fee decimal(7,2) default NULL,
  settle_amount decimal(7,2) default NULL,
  settle_currency char(3) default NULL,
  exchange_rate decimal(4,2) default NULL,
  notify_version varchar(6) NOT NULL default '',
  verify_sign varchar(128) NOT NULL default '',
  last_modified datetime NOT NULL default '0001-01-01 00:00:00',
  date_added datetime NOT NULL default '0001-01-01 00:00:00',
  memo text,
  PRIMARY KEY (paypal_ipn_id,txn_id),
  KEY idx_order_id_zen (order_id)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'paypal_payment_status'
#

DROP TABLE IF EXISTS paypal_payment_status;
CREATE TABLE paypal_payment_status (
  payment_status_id int(11) NOT NULL auto_increment,
  payment_status_name varchar(64) NOT NULL default '',
  PRIMARY KEY (payment_status_id)
) ENGINE=MyISAM;

#
# Dumping data for table 'paypal_payment_status'
#

INSERT INTO paypal_payment_status VALUES (1, 'Completed');
INSERT INTO paypal_payment_status VALUES (2, 'Pending');
INSERT INTO paypal_payment_status VALUES (3, 'Failed');
INSERT INTO paypal_payment_status VALUES (4, 'Denied');
INSERT INTO paypal_payment_status VALUES (5, 'Refunded');
INSERT INTO paypal_payment_status VALUES (6, 'Canceled_Reversal');
INSERT INTO paypal_payment_status VALUES (7, 'Reversed');

# --------------------------------------------------------

#
# Table structure for table 'paypal_payment_status_history'
#

DROP TABLE IF EXISTS paypal_payment_status_history;
CREATE TABLE paypal_payment_status_history (
  payment_status_history_id int(11) NOT NULL auto_increment,
  paypal_ipn_id int(11) NOT NULL default '0',
  txn_id varchar(64) NOT NULL default '',
  parent_txn_id varchar(64) NOT NULL default '',
  payment_status varchar(17) NOT NULL default '',
  pending_reason varchar(14) default NULL,
  date_added datetime NOT NULL default '0001-01-01 00:00:00',
  PRIMARY KEY (payment_status_history_id),
  KEY idx_paypal_ipn_id_zen (paypal_ipn_id)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'paypal_session'
#

DROP TABLE IF EXISTS paypal_session;
CREATE TABLE paypal_session (
  unique_id int(11) NOT NULL auto_increment,
  session_id text NOT NULL,
  saved_session mediumblob NOT NULL,
  expiry int(17) NOT NULL default '0',
  PRIMARY KEY  (unique_id),
  KEY idx_session_id_zen (session_id(36))
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'paypal_testing'
#

DROP TABLE IF EXISTS paypal_testing;
CREATE TABLE paypal_testing (
  paypal_ipn_id int(11) unsigned NOT NULL auto_increment,
  order_id int(11) unsigned NOT NULL default '0',
  custom varchar(255) NOT NULL default '',
  txn_type varchar(40) NOT NULL default '',
  module_name varchar(40) NOT NULL default '',
  module_mode varchar(40) NOT NULL default '',
  reason_code varchar(40) default NULL,
  payment_type varchar(40) NOT NULL default '',
  payment_status varchar(32) NOT NULL default '',
  pending_reason varchar(32) default NULL,
  invoice varchar(128) default NULL,
  mc_currency char(3) NOT NULL default '',
  first_name varchar(32) NOT NULL default '',
  last_name varchar(32) NOT NULL default '',
  payer_business_name varchar(128) default NULL,
  address_name varchar(64) default NULL,
  address_street varchar(254) default NULL,
  address_city varchar(120) default NULL,
  address_state varchar(120) default NULL,
  address_zip varchar(10) default NULL,
  address_country varchar(64) default NULL,
  address_status varchar(11) default NULL,
  payer_email varchar(128) NOT NULL default '',
  payer_id varchar(32) NOT NULL default '',
  payer_status varchar(10) NOT NULL default '',
  payment_date datetime NOT NULL default '0001-01-01 00:00:00',
  business varchar(128) NOT NULL default '',
  receiver_email varchar(128) NOT NULL default '',
  receiver_id varchar(32) NOT NULL default '',
  txn_id varchar(20) NOT NULL default '',
  parent_txn_id varchar(20) default NULL,
  num_cart_items tinyint(4) unsigned NOT NULL default '1',
  mc_gross decimal(7,2) NOT NULL default '0.00',
  mc_fee decimal(7,2) NOT NULL default '0.00',
  payment_gross decimal(7,2) default NULL,
  payment_fee decimal(7,2) default NULL,
  settle_amount decimal(7,2) default NULL,
  settle_currency char(3) default NULL,
  exchange_rate decimal(4,2) default NULL,
  notify_version decimal(2,1) NOT NULL default '0.0',
  verify_sign varchar(128) NOT NULL default '',
  last_modified datetime NOT NULL default '0001-01-01 00:00:00',
  date_added datetime NOT NULL default '0001-01-01 00:00:00',
  memo text,
  PRIMARY KEY  (paypal_ipn_id,txn_id),
  KEY idx_order_id_zen (order_id)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'product_music_extra'
#

DROP TABLE IF EXISTS product_music_extra;
CREATE TABLE product_music_extra (
  products_id int(11) NOT NULL default '0',
  artists_id int(11) NOT NULL default '0',
  record_company_id int(11) NOT NULL default '0',
  music_genre_id int(11) NOT NULL default '0',
  PRIMARY KEY  (products_id),
  KEY idx_music_genre_id_zen (music_genre_id),
  KEY idx_artists_id_zen (artists_id),
  KEY idx_record_company_id_zen (record_company_id)
) ENGINE=MyISAM;


# --------------------------------------------------------

#
# Table structure for table 'product_type_layout'
#
DROP TABLE IF EXISTS product_type_layout;
CREATE TABLE product_type_layout (
  configuration_id int(11) NOT NULL auto_increment,
  configuration_title text NOT NULL,
  configuration_key varchar(255) NOT NULL default '',
  configuration_value text NOT NULL,
  configuration_description text NOT NULL,
  product_type_id int(11) NOT NULL default '0',
  sort_order int(5) default NULL,
  last_modified datetime default NULL,
  date_added datetime NOT NULL default '0001-01-01 00:00:00',
  use_function text default NULL,
  set_function text default NULL,
  PRIMARY KEY  (configuration_id),
  UNIQUE KEY unq_config_key_zen (configuration_key),
  KEY idx_key_value_zen (configuration_key,configuration_value(10)),
  KEY idx_type_id_sort_order_zen (product_type_id,sort_order)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'product_types'
#

DROP TABLE IF EXISTS product_types;
CREATE TABLE product_types (
  type_id int(11) NOT NULL auto_increment,
  type_name varchar(255) NOT NULL default '',
  type_handler varchar(255) NOT NULL default '',
  type_master_type int(11) NOT NULL default '1',
  allow_add_to_cart char(1) NOT NULL default 'Y',
  default_image varchar(255) NOT NULL default '',
  date_added datetime NOT NULL default '0001-01-01 00:00:00',
  last_modified datetime NOT NULL default '0001-01-01 00:00:00',
  PRIMARY KEY  (type_id),
  KEY idx_type_master_type_zen (type_master_type)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'product_types_to_category'
#

DROP TABLE IF EXISTS product_types_to_category;
CREATE TABLE product_types_to_category (
  product_type_id int(11) NOT NULL default '0',
  category_id int(11) NOT NULL default '0',
  KEY idx_category_id_zen (category_id),
  KEY idx_product_type_id_zen (product_type_id)
) ENGINE=MyISAM;


# --------------------------------------------------------

#
# Table structure for table 'products'
#

DROP TABLE IF EXISTS products;
CREATE TABLE products (
  products_id int(11) NOT NULL auto_increment,
  products_type int(11) NOT NULL default '1',
  products_quantity float NOT NULL default '0',
  products_model varchar(32) default NULL,
  products_image varchar(64) default NULL,
  products_price decimal(15,4) NOT NULL default '0.0000',
  products_virtual tinyint(1) NOT NULL default '0',
  products_date_added datetime NOT NULL default '0001-01-01 00:00:00',
  products_last_modified datetime default NULL,
  products_date_available datetime default NULL,
  products_weight float NOT NULL default '0',
  products_status tinyint(1) NOT NULL default '0',
  products_tax_class_id int(11) NOT NULL default '0',
  manufacturers_id int(11) default NULL,
  products_ordered float NOT NULL default '0',
  products_quantity_order_min float NOT NULL default '1',
  products_quantity_order_units float NOT NULL default '1',
  products_priced_by_attribute tinyint(1) NOT NULL default '0',
  product_is_free tinyint(1) NOT NULL default '0',
  product_is_call tinyint(1) NOT NULL default '0',
  products_quantity_mixed tinyint(1) NOT NULL default '0',
  product_is_always_free_shipping tinyint(1) NOT NULL default '0',
  products_qty_box_status tinyint(1) NOT NULL default '1',
  products_quantity_order_max float NOT NULL default '0',
  products_sort_order int(11) NOT NULL default '0',
  products_discount_type tinyint(1) NOT NULL default '0',
  products_discount_type_from tinyint(1) NOT NULL default '0',
  products_price_sorter decimal(15,4) NOT NULL default '0.0000',
  master_categories_id int(11) NOT NULL default '0',
  products_mixed_discount_quantity tinyint(1) NOT NULL default '1',
  metatags_title_status tinyint(1) NOT NULL default '0',
  metatags_products_name_status tinyint(1) NOT NULL default '0',
  metatags_model_status tinyint(1) NOT NULL default '0',
  metatags_price_status tinyint(1) NOT NULL default '0',
  metatags_title_tagline_status tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (products_id),
  KEY idx_products_date_added_zen (products_date_added),
  KEY idx_products_status_zen (products_status),
  KEY idx_products_date_available_zen (products_date_available),
  KEY idx_products_ordered_zen (products_ordered),
  KEY idx_products_model_zen (products_model),
  KEY idx_products_price_sorter_zen (products_price_sorter),
  KEY idx_master_categories_id_zen (master_categories_id),
  KEY idx_products_sort_order_zen (products_sort_order),
  KEY idx_manufacturers_id_zen (manufacturers_id)
) ENGINE=MyISAM;
# --------------------------------------------------------

#
# Table structure for table 'products_attributes'
#

DROP TABLE IF EXISTS products_attributes;
CREATE TABLE products_attributes (
  products_attributes_id int(11) NOT NULL auto_increment,
  products_id int(11) NOT NULL default '0',
  options_id int(11) NOT NULL default '0',
  options_values_id int(11) NOT NULL default '0',
  options_values_price decimal(15,4) NOT NULL default '0.0000',
  price_prefix char(1) NOT NULL default '',
  products_options_sort_order int(11) NOT NULL default '0',
  product_attribute_is_free tinyint(1) NOT NULL default '0',
  products_attributes_weight float NOT NULL default '0',
  products_attributes_weight_prefix char(1) NOT NULL default '',
  attributes_display_only tinyint(1) NOT NULL default '0',
  attributes_default tinyint(1) NOT NULL default '0',
  attributes_discounted tinyint(1) NOT NULL default '1',
  attributes_image varchar(64) default NULL,
  attributes_price_base_included tinyint(1) NOT NULL default '1',
  attributes_price_onetime decimal(15,4) NOT NULL default '0.0000',
  attributes_price_factor decimal(15,4) NOT NULL default '0.0000',
  attributes_price_factor_offset decimal(15,4) NOT NULL default '0.0000',
  attributes_price_factor_onetime decimal(15,4) NOT NULL default '0.0000',
  attributes_price_factor_onetime_offset decimal(15,4) NOT NULL default '0.0000',
  attributes_qty_prices text,
  attributes_qty_prices_onetime text,
  attributes_price_words decimal(15,4) NOT NULL default '0.0000',
  attributes_price_words_free int(4) NOT NULL default '0',
  attributes_price_letters decimal(15,4) NOT NULL default '0.0000',
  attributes_price_letters_free int(4) NOT NULL default '0',
  attributes_required tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (products_attributes_id),
  KEY idx_id_options_id_values_zen (products_id,options_id,options_values_id),
  KEY idx_opt_sort_order_zen (products_options_sort_order)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'products_attributes_download'
#

DROP TABLE IF EXISTS products_attributes_download;
CREATE TABLE products_attributes_download (
  products_attributes_id int(11) NOT NULL default '0',
  products_attributes_filename varchar(255) NOT NULL default '',
  products_attributes_maxdays int(2) default '0',
  products_attributes_maxcount int(2) default '0',
  PRIMARY KEY  (products_attributes_id)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'products_description'
#

DROP TABLE IF EXISTS products_description;
CREATE TABLE products_description (
  products_id int(11) NOT NULL auto_increment,
  language_id int(11) NOT NULL default '1',
  products_name varchar(64) NOT NULL default '',
  products_description text,
  products_url varchar(255) default NULL,
  products_viewed int(5) default '0',
  PRIMARY KEY  (products_id,language_id),
  KEY idx_products_name_zen (products_name)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'products_discount_quantity'
#
DROP TABLE IF EXISTS products_discount_quantity;
CREATE TABLE products_discount_quantity (
  discount_id int(4) NOT NULL default '0',
  products_id int(11) NOT NULL default '0',
  discount_qty float NOT NULL default '0',
  discount_price decimal(15,4) NOT NULL default '0.0000',
  KEY idx_id_qty_zen (products_id,discount_qty)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'products_notifications'
#

DROP TABLE IF EXISTS products_notifications;
CREATE TABLE products_notifications (
  products_id int(11) NOT NULL default '0',
  customers_id int(11) NOT NULL default '0',
  date_added datetime NOT NULL default '0001-01-01 00:00:00',
  PRIMARY KEY  (products_id,customers_id)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'products_options'
#

DROP TABLE IF EXISTS products_options;
CREATE TABLE products_options (
  products_options_id int(11) NOT NULL default '0',
  language_id int(11) NOT NULL default '1',
  products_options_name varchar(32) NOT NULL default '',
  products_options_sort_order int(11) NOT NULL default '0',
  products_options_type int(5) NOT NULL default '0',
  products_options_length smallint(2) NOT NULL default '32',
  products_options_comment varchar(64) default NULL,
  products_options_size smallint(2) NOT NULL default '32',
  products_options_images_per_row int(2) default '5',
  products_options_images_style int(1) default '0',
  products_options_rows smallint(2) NOT NULL default '1',
  PRIMARY KEY  (products_options_id,language_id),
  KEY idx_lang_id_zen (language_id),
  KEY idx_products_options_sort_order_zen (products_options_sort_order),
  KEY idx_products_options_name_zen (products_options_name)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'products_options_types'
#

DROP TABLE IF EXISTS products_options_types;
CREATE TABLE products_options_types (
  products_options_types_id int(11) NOT NULL default '0',
  products_options_types_name varchar(32) default NULL,
  PRIMARY KEY  (products_options_types_id)
) ENGINE=MyISAM COMMENT='Track products_options_types';

# --------------------------------------------------------

#
# Table structure for table 'products_options_values'
#

DROP TABLE IF EXISTS products_options_values;
CREATE TABLE products_options_values (
  products_options_values_id int(11) NOT NULL default '0',
  language_id int(11) NOT NULL default '1',
  products_options_values_name varchar(64) NOT NULL default '',
  products_options_values_sort_order int(11) NOT NULL default '0',
  PRIMARY KEY (products_options_values_id,language_id),
  KEY idx_products_options_values_name_zen (products_options_values_name),
  KEY idx_products_options_values_sort_order_zen (products_options_values_sort_order)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'products_options_values_to_products_options'
#

DROP TABLE IF EXISTS products_options_values_to_products_options;
CREATE TABLE products_options_values_to_products_options (
  products_options_values_to_products_options_id int(11) NOT NULL auto_increment,
  products_options_id int(11) NOT NULL default '0',
  products_options_values_id int(11) NOT NULL default '0',
  PRIMARY KEY  (products_options_values_to_products_options_id),
  KEY idx_products_options_id_zen (products_options_id),
  KEY idx_products_options_values_id_zen (products_options_values_id)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'products_to_categories'
#

DROP TABLE IF EXISTS products_to_categories;
CREATE TABLE products_to_categories (
  products_id int(11) NOT NULL default '0',
  categories_id int(11) NOT NULL default '0',
  PRIMARY KEY  (products_id,categories_id),
  KEY idx_cat_prod_id_zen (categories_id,products_id)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'project_version'
#

DROP TABLE IF EXISTS project_version;
CREATE TABLE project_version (
  project_version_id tinyint(3) NOT NULL auto_increment,
  project_version_key varchar(40) NOT NULL default '',
  project_version_major varchar(20) NOT NULL default '',
  project_version_minor varchar(20) NOT NULL default '',
  project_version_patch1 varchar(20) NOT NULL default '',
  project_version_patch2 varchar(20) NOT NULL default '',
  project_version_patch1_source varchar(20) NOT NULL default '',
  project_version_patch2_source varchar(20) NOT NULL default '',
  project_version_comment varchar(250) NOT NULL default '',
  project_version_date_applied datetime NOT NULL default '0001-01-01 01:01:01',
  PRIMARY KEY  (project_version_id),
  UNIQUE KEY idx_project_version_key_zen (project_version_key)
) ENGINE=MyISAM COMMENT='Database Version Tracking';


# --------------------------------------------------------

#
# Table structure for table 'project_version_history'
#
DROP TABLE IF EXISTS project_version_history;
CREATE TABLE project_version_history (
  project_version_id tinyint(3) NOT NULL auto_increment,
  project_version_key varchar(40) NOT NULL default '',
  project_version_major varchar(20) NOT NULL default '',
  project_version_minor varchar(20) NOT NULL default '',
  project_version_patch varchar(20) NOT NULL default '',
  project_version_comment varchar(250) NOT NULL default '',
  project_version_date_applied datetime NOT NULL default '0001-01-01 01:01:01',
  PRIMARY KEY  (project_version_id)
) ENGINE=MyISAM COMMENT='Database Version Tracking History';

# --------------------------------------------------------

#
# Table structure for table 'query_builder'
# This table is used by audiences.php for building data-extraction queries
#
DROP TABLE IF EXISTS query_builder;
CREATE TABLE query_builder (
  query_id int(11) NOT NULL auto_increment,
  query_category varchar(40) NOT NULL default '',
  query_name varchar(80) NOT NULL default '',
  query_description TEXT NOT NULL,
  query_string TEXT NOT NULL,
  query_keys_list TEXT NOT NULL,
  PRIMARY KEY  (query_id),
  UNIQUE KEY query_name (query_name)
) ENGINE=MyISAM COMMENT='Stores queries for re-use in Admin email and report modules';

# --------------------------------------------------------

#
# Table structure for table 'record_artists'
#

DROP TABLE IF EXISTS record_artists;
CREATE TABLE record_artists (
  artists_id int(11) NOT NULL auto_increment,
  artists_name varchar(32) NOT NULL default '',
  artists_image varchar(64) default NULL,
  date_added datetime default NULL,
  last_modified datetime default NULL,
  PRIMARY KEY  (artists_id),
  KEY idx_rec_artists_name_zen (artists_name)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'record_artists_info'
#

DROP TABLE IF EXISTS record_artists_info;
CREATE TABLE record_artists_info (
  artists_id int(11) NOT NULL default '0',
  languages_id int(11) NOT NULL default '0',
  artists_url varchar(255) NOT NULL default '',
  url_clicked int(5) NOT NULL default '0',
  date_last_click datetime default NULL,
  PRIMARY KEY  (artists_id,languages_id)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'record_company'
#

DROP TABLE IF EXISTS record_company;
CREATE TABLE record_company (
  record_company_id int(11) NOT NULL auto_increment,
  record_company_name varchar(32) NOT NULL default '',
  record_company_image varchar(64) default NULL,
  date_added datetime default NULL,
  last_modified datetime default NULL,
  PRIMARY KEY  (record_company_id),
  KEY idx_rec_company_name_zen (record_company_name)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'record_company_info'
#

DROP TABLE IF EXISTS record_company_info;
CREATE TABLE record_company_info (
  record_company_id int(11) NOT NULL default '0',
  languages_id int(11) NOT NULL default '0',
  record_company_url varchar(255) NOT NULL default '',
  url_clicked int(5) NOT NULL default '0',
  date_last_click datetime default NULL,
  PRIMARY KEY  (record_company_id,languages_id)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'reviews'
#

DROP TABLE IF EXISTS reviews;
CREATE TABLE reviews (
  reviews_id int(11) NOT NULL auto_increment,
  products_id int(11) NOT NULL default '0',
  customers_id int(11) default NULL,
  customers_name varchar(64) NOT NULL default '',
  reviews_rating int(1) default NULL,
  date_added datetime default NULL,
  last_modified datetime default NULL,
  reviews_read int(5) NOT NULL default '0',
  status int(1) NOT NULL default '1',
  PRIMARY KEY  (reviews_id),
  KEY idx_products_id_zen (products_id),
  KEY idx_customers_id_zen (customers_id),
  KEY idx_status_zen (status),
  KEY idx_date_added_zen (date_added)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'reviews_description'
#

DROP TABLE IF EXISTS reviews_description;
CREATE TABLE reviews_description (
  reviews_id int(11) NOT NULL default '0',
  languages_id int(11) NOT NULL default '0',
  reviews_text text NOT NULL,
  PRIMARY KEY  (reviews_id,languages_id)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'salemaker_sales'
#

DROP TABLE IF EXISTS salemaker_sales;
CREATE TABLE salemaker_sales (
  sale_id int(11) NOT NULL auto_increment,
  sale_status tinyint(4) NOT NULL default '0',
  sale_name varchar(30) NOT NULL default '',
  sale_deduction_value decimal(15,4) NOT NULL default '0.0000',
  sale_deduction_type tinyint(4) NOT NULL default '0',
  sale_pricerange_from decimal(15,4) NOT NULL default '0.0000',
  sale_pricerange_to decimal(15,4) NOT NULL default '0.0000',
  sale_specials_condition tinyint(4) NOT NULL default '0',
  sale_categories_selected text,
  sale_categories_all text,
  sale_date_start date NOT NULL default '0001-01-01',
  sale_date_end date NOT NULL default '0001-01-01',
  sale_date_added date NOT NULL default '0001-01-01',
  sale_date_last_modified date NOT NULL default '0001-01-01',
  sale_date_status_change date NOT NULL default '0001-01-01',
  PRIMARY KEY  (sale_id),
  KEY idx_sale_status_zen (sale_status),
  KEY idx_sale_date_start_zen (sale_date_start),
  KEY idx_sale_date_end_zen (sale_date_end)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'sessions'
#

DROP TABLE IF EXISTS sessions;
CREATE TABLE sessions (
  sesskey varchar(64) NOT NULL default '',
  expiry int(11) unsigned NOT NULL default '0',
  value mediumblob NOT NULL,
  PRIMARY KEY  (sesskey)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'specials'
#

DROP TABLE IF EXISTS specials;
CREATE TABLE specials (
  specials_id int(11) NOT NULL auto_increment,
  products_id int(11) NOT NULL default '0',
  specials_new_products_price decimal(15,4) NOT NULL default '0.0000',
  specials_date_added datetime default NULL,
  specials_last_modified datetime default NULL,
  expires_date date NOT NULL default '0001-01-01',
  date_status_change datetime default NULL,
  status int(1) NOT NULL default '1',
  specials_date_available date NOT NULL default '0001-01-01',
  PRIMARY KEY  (specials_id),
  KEY idx_status_zen (status),
  KEY idx_products_id_zen (products_id),
  KEY idx_date_avail_zen (specials_date_available),
  KEY idx_expires_date_zen (expires_date)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'tax_class'
#

DROP TABLE IF EXISTS tax_class;
CREATE TABLE tax_class (
  tax_class_id int(11) NOT NULL auto_increment,
  tax_class_title varchar(32) NOT NULL default '',
  tax_class_description varchar(255) NOT NULL default '',
  last_modified datetime default NULL,
  date_added datetime NOT NULL default '0001-01-01 00:00:00',
  PRIMARY KEY  (tax_class_id)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'tax_rates'
#

DROP TABLE IF EXISTS tax_rates;
CREATE TABLE tax_rates (
  tax_rates_id int(11) NOT NULL auto_increment,
  tax_zone_id int(11) NOT NULL default '0',
  tax_class_id int(11) NOT NULL default '0',
  tax_priority int(5) default '1',
  tax_rate decimal(7,4) NOT NULL default '0.0000',
  tax_description varchar(255) NOT NULL default '',
  last_modified datetime default NULL,
  date_added datetime NOT NULL default '0001-01-01 00:00:00',
  PRIMARY KEY  (tax_rates_id),
  KEY idx_tax_zone_id_zen (tax_zone_id),
  KEY idx_tax_class_id_zen (tax_class_id)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'template_select'
#

DROP TABLE IF EXISTS template_select;
CREATE TABLE template_select (
  template_id int(11) NOT NULL auto_increment,
  template_dir varchar(64) NOT NULL default '',
  template_language varchar(64) NOT NULL default '0',
  PRIMARY KEY  (template_id),
  KEY idx_tpl_lang_zen (template_language)
) ENGINE=MyISAM;

# --------------------------------------------------------


#
# Table structure for table 'whos_online'
#

DROP TABLE IF EXISTS whos_online;
CREATE TABLE whos_online (
  customer_id int(11) default NULL,
  full_name varchar(64) NOT NULL default '',
  session_id varchar(128) NOT NULL default '',
  ip_address varchar(45) NOT NULL default '',
  time_entry varchar(14) NOT NULL default '',
  time_last_click varchar(14) NOT NULL default '',
  last_page_url varchar(255) NOT NULL default '',
  host_address text NOT NULL,
  user_agent varchar(255) NOT NULL default '',
  KEY idx_ip_address_zen (ip_address),
  KEY idx_session_id_zen (session_id),
  KEY idx_customer_id_zen (customer_id),
  KEY idx_time_entry_zen (time_entry),
  KEY idx_time_last_click_zen (time_last_click),
  KEY idx_last_page_url_zen (last_page_url)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'zones'
#

DROP TABLE IF EXISTS zones;
CREATE TABLE zones (
  zone_id int(11) NOT NULL auto_increment,
  zone_country_id int(11) NOT NULL default '0',
  zone_code varchar(32) NOT NULL default '',
  zone_name varchar(32) NOT NULL default '',
  PRIMARY KEY  (zone_id),
  KEY idx_zone_country_id_zen (zone_country_id),
  KEY idx_zone_code_zen (zone_code)
) ENGINE=MyISAM;

# --------------------------------------------------------

#
# Table structure for table 'zones_to_geo_zones'
#

DROP TABLE IF EXISTS zones_to_geo_zones;
CREATE TABLE zones_to_geo_zones (
  association_id int(11) NOT NULL auto_increment,
  zone_country_id int(11) NOT NULL default '0',
  zone_id int(11) default NULL,
  geo_zone_id int(11) default NULL,
  last_modified datetime default NULL,
  date_added datetime NOT NULL default '0001-01-01 00:00:00',
  PRIMARY KEY  (association_id),
  KEY idx_zones_zen (geo_zone_id,zone_country_id,zone_id)
) ENGINE=MyISAM;















# default data

INSERT INTO template_select VALUES (1, 'classic', '0');

# 1 - Default, 2 - USA, 3 - Spain, 4 - Singapore, 5 - Germany, 6 - UK/GB
INSERT INTO address_format VALUES (1, '$firstname $lastname$cr$streets$cr$city, $postcode$cr$statecomma$country','$city / $country');
INSERT INTO address_format VALUES (2, '$firstname $lastname$cr$streets$cr$city, $state    $postcode$cr$country','$city, $state / $country');
INSERT INTO address_format VALUES (3, '$firstname $lastname$cr$streets$cr$city$cr$postcode - $statecomma$country','$state / $country');
INSERT INTO address_format VALUES (4, '$firstname $lastname$cr$streets$cr$city ($postcode)$cr$country', '$postcode / $country');
INSERT INTO address_format VALUES (5, '$firstname $lastname$cr$streets$cr$postcode $city ($state)$cr$country','$city / $country');
INSERT INTO address_format VALUES (6, '$firstname $lastname$cr$streets$cr$city$cr$state$cr$postcode$cr$country','$postcode / $country');

INSERT INTO admin (admin_id, admin_name, admin_email, admin_pass, admin_profile, last_modified) VALUES
 (1, 'Admin', 'admin@localhost', '351683ea4e19efe34874b501fdbf9792:9b', 1, now());

# Insert default data into admin profiles table
INSERT INTO admin_profiles (profile_id, profile_name) VALUES (1, 'Superuser');

# Insert default data into admin_menus table
INSERT INTO admin_menus (menu_key, language_key, sort_order)
VALUES ('configuration', 'BOX_HEADING_CONFIGURATION', 1),
       ('catalog', 'BOX_HEADING_CATALOG', 2),
       ('modules', 'BOX_HEADING_MODULES', 3),
       ('customers', 'BOX_HEADING_CUSTOMERS', 4),
       ('taxes', 'BOX_HEADING_LOCATION_AND_TAXES', 5),
       ('localization', 'BOX_HEADING_LOCALIZATION', 6),
       ('reports', 'BOX_HEADING_REPORTS', 7),
       ('tools', 'BOX_HEADING_TOOLS', 8),
       ('gv', 'BOX_HEADING_GV_ADMIN', 9),
       ('access', 'BOX_HEADING_ADMIN_ACCESS', 10),
       ('extras', 'BOX_HEADING_EXTRAS', 11);

# Insert data into admin_pages table
INSERT INTO admin_pages (page_key, language_key, main_page, page_params, menu_key, display_on_menu, sort_order)
VALUES ('configMyStore', 'BOX_CONFIGURATION_MY_STORE', 'FILENAME_CONFIGURATION', 'gID=1', 'configuration', 'Y', 1),
       ('configMinimumValues', 'BOX_CONFIGURATION_MINIMUM_VALUES', 'FILENAME_CONFIGURATION', 'gID=2', 'configuration', 'Y', 2),
       ('configMaximumValues', 'BOX_CONFIGURATION_MAXIMUM_VALUES', 'FILENAME_CONFIGURATION', 'gID=3', 'configuration', 'Y', 3),
       ('configImages', 'BOX_CONFIGURATION_IMAGES', 'FILENAME_CONFIGURATION', 'gID=4', 'configuration', 'Y', 4),
       ('configCustomerDetails', 'BOX_CONFIGURATION_CUSTOMER_DETAILS', 'FILENAME_CONFIGURATION', 'gID=5', 'configuration', 'Y', 5),
       ('configShipping', 'BOX_CONFIGURATION_SHIPPING_PACKAGING', 'FILENAME_CONFIGURATION', 'gID=7', 'configuration', 'Y', 6),
       ('configProductListing', 'BOX_CONFIGURATION_PRODUCT_LISTING', 'FILENAME_CONFIGURATION', 'gID=8', 'configuration', 'Y', 7),
       ('configStock', 'BOX_CONFIGURATION_STOCK', 'FILENAME_CONFIGURATION', 'gID=9', 'configuration', 'Y', 8),
       ('configLogging', 'BOX_CONFIGURATION_LOGGING', 'FILENAME_CONFIGURATION', 'gID=10', 'configuration', 'Y', 9),
       ('configEmail', 'BOX_CONFIGURATION_EMAIL_OPTIONS', 'FILENAME_CONFIGURATION', 'gID=12', 'configuration', 'Y', 10),
       ('configAttributes', 'BOX_CONFIGURATION_ATTRIBUTE_OPTIONS', 'FILENAME_CONFIGURATION', 'gID=13', 'configuration', 'Y', 11),
       ('configGzipCompression', 'BOX_CONFIGURATION_GZIP_COMPRESSION', 'FILENAME_CONFIGURATION', 'gID=14', 'configuration', 'Y', 12),
       ('configSessions', 'BOX_CONFIGURATION_SESSIONS', 'FILENAME_CONFIGURATION', 'gID=15', 'configuration', 'Y', 13),
       ('configRegulations', 'BOX_CONFIGURATION_REGULATIONS', 'FILENAME_CONFIGURATION', 'gID=11', 'configuration', 'Y', 14),
       ('configGvCoupons', 'BOX_CONFIGURATION_GV_COUPONS', 'FILENAME_CONFIGURATION', 'gID=16', 'configuration', 'Y', 15),
       ('configCreditCards', 'BOX_CONFIGURATION_CREDIT_CARDS', 'FILENAME_CONFIGURATION', 'gID=17', 'configuration', 'Y', 16),
       ('configProductInfo', 'BOX_CONFIGURATION_PRODUCT_INFO', 'FILENAME_CONFIGURATION', 'gID=18', 'configuration', 'Y', 17),
       ('configLayoutSettings', 'BOX_CONFIGURATION_LAYOUT_SETTINGS', 'FILENAME_CONFIGURATION', 'gID=19', 'configuration', 'Y', 18),
       ('configWebsiteMaintenance', 'BOX_CONFIGURATION_WEBSITE_MAINTENANCE', 'FILENAME_CONFIGURATION', 'gID=20', 'configuration', 'Y', 19),
       ('configNewListing', 'BOX_CONFIGURATION_NEW_LISTING', 'FILENAME_CONFIGURATION', 'gID=21', 'configuration', 'Y', 20),
       ('configFeaturedListing', 'BOX_CONFIGURATION_FEATURED_LISTING', 'FILENAME_CONFIGURATION', 'gID=22', 'configuration', 'Y', 21),
       ('configAllListing', 'BOX_CONFIGURATION_ALL_LISTING', 'FILENAME_CONFIGURATION', 'gID=23', 'configuration', 'Y', 22),
       ('configIndexListing', 'BOX_CONFIGURATION_INDEX_LISTING', 'FILENAME_CONFIGURATION', 'gID=24', 'configuration', 'Y', 23),
       ('configDefinePageStatus', 'BOX_CONFIGURATION_DEFINE_PAGE_STATUS', 'FILENAME_CONFIGURATION', 'gID=25', 'configuration', 'Y', 24),
       ('configEzPagesSettings', 'BOX_CONFIGURATION_EZPAGES_SETTINGS', 'FILENAME_CONFIGURATION', 'gID=30', 'configuration', 'Y', 25),
       ('categories', 'BOX_CATALOG_CATEGORIES_PRODUCTS', 'FILENAME_CATEGORIES', '', 'catalog', 'Y', 1),
       ('productTypes', 'BOX_CATALOG_PRODUCT_TYPES', 'FILENAME_PRODUCT_TYPES', '', 'catalog', 'Y', 2),
       ('priceManager', 'BOX_CATALOG_PRODUCTS_PRICE_MANAGER', 'FILENAME_PRODUCTS_PRICE_MANAGER', '', 'catalog', 'Y', 3),
       ('optionNames', 'BOX_CATALOG_CATEGORIES_OPTIONS_NAME_MANAGER', 'FILENAME_OPTIONS_NAME_MANAGER', '', 'catalog', 'Y', 4),
       ('optionValues', 'BOX_CATALOG_CATEGORIES_OPTIONS_VALUES_MANAGER', 'FILENAME_OPTIONS_VALUES_MANAGER', '', 'catalog', 'Y', 5),
       ('attributes', 'BOX_CATALOG_CATEGORIES_ATTRIBUTES_CONTROLLER', 'FILENAME_ATTRIBUTES_CONTROLLER', '', 'catalog', 'Y', 6),
       ('downloads', 'BOX_CATALOG_CATEGORIES_ATTRIBUTES_DOWNLOADS_MANAGER', 'FILENAME_DOWNLOADS_MANAGER', '', 'catalog', 'Y', 7),
       ('optionNameSorter', 'BOX_CATALOG_PRODUCT_OPTIONS_NAME', 'FILENAME_PRODUCTS_OPTIONS_NAME', '', 'catalog', 'Y', 8),
       ('optionValueSorter', 'BOX_CATALOG_PRODUCT_OPTIONS_VALUES', 'FILENAME_PRODUCTS_OPTIONS_VALUES', '', 'catalog', 'Y', 9),
       ('manufacturers', 'BOX_CATALOG_MANUFACTURERS', 'FILENAME_MANUFACTURERS', '', 'catalog', 'Y', 10),
       ('reviews', 'BOX_CATALOG_REVIEWS', 'FILENAME_REVIEWS', '', 'catalog', 'Y', 11),
       ('specials', 'BOX_CATALOG_SPECIALS', 'FILENAME_SPECIALS', '', 'catalog', 'Y', 12),
       ('featured', 'BOX_CATALOG_FEATURED', 'FILENAME_FEATURED', '', 'catalog', 'Y', 13),
       ('salemaker', 'BOX_CATALOG_SALEMAKER', 'FILENAME_SALEMAKER', '', 'catalog', 'Y', 14),
       ('productsExpected', 'BOX_CATALOG_PRODUCTS_EXPECTED', 'FILENAME_PRODUCTS_EXPECTED', '', 'catalog', 'Y', 15),
       ('product', 'BOX_CATALOG_PRODUCT', 'FILENAME_PRODUCT', '', 'catalog', 'N', 16),
       ('productsToCategories', 'BOX_CATALOG_PRODUCTS_TO_CATEGORIES', 'FILENAME_PRODUCTS_TO_CATEGORIES', '', 'catalog', 'N', 17),
       ('payment', 'BOX_MODULES_PAYMENT', 'FILENAME_MODULES', 'set=payment', 'modules', 'Y', 1),
       ('shipping', 'BOX_MODULES_SHIPPING', 'FILENAME_MODULES', 'set=shipping', 'modules', 'Y', 2),
       ('orderTotal', 'BOX_MODULES_ORDER_TOTAL', 'FILENAME_MODULES', 'set=ordertotal', 'modules', 'Y', 3),
       ('customers', 'BOX_CUSTOMERS_CUSTOMERS', 'FILENAME_CUSTOMERS', '', 'customers', 'Y', 1),
       ('orders', 'BOX_CUSTOMERS_ORDERS', 'FILENAME_ORDERS', '', 'customers', 'Y', 2),
       ('groupPricing', 'BOX_CUSTOMERS_GROUP_PRICING', 'FILENAME_GROUP_PRICING', '', 'customers', 'Y', 3),
       ('paypal', 'BOX_CUSTOMERS_PAYPAL', 'FILENAME_PAYPAL', '', 'customers', 'Y', 4),
       ('invoice', 'BOX_CUSTOMERS_INVOICE', 'FILENAME_ORDERS_INVOICE', '', 'customers', 'N', 5),
       ('packingslip', 'BOX_CUSTOMERS_PACKING_SLIP', 'FILENAME_ORDERS_PACKINGSLIP', '', 'customers', 'N', 6),
       ('linkpointReview', 'BOX_CUSTOMERS_LINKPOINT_REVIEW', 'FILENAME_LINKPOINT_REVIEW', '', 'customers', 'Y', 7),
       ('countries', 'BOX_TAXES_COUNTRIES', 'FILENAME_COUNTRIES', '', 'taxes', 'Y', 1),
       ('zones', 'BOX_TAXES_ZONES', 'FILENAME_ZONES', '', 'taxes', 'Y', 2),
       ('geoZones', 'BOX_TAXES_GEO_ZONES', 'FILENAME_GEO_ZONES', '', 'taxes', 'Y', 3),
       ('taxClasses', 'BOX_TAXES_TAX_CLASSES', 'FILENAME_TAX_CLASSES', '', 'taxes', 'Y', 4),
       ('taxRates', 'BOX_TAXES_TAX_RATES', 'FILENAME_TAX_RATES', '', 'taxes', 'Y', 5),
       ('currencies', 'BOX_LOCALIZATION_CURRENCIES', 'FILENAME_CURRENCIES', '', 'localization', 'Y', 1),
       ('languages', 'BOX_LOCALIZATION_LANGUAGES', 'FILENAME_LANGUAGES', '', 'localization', 'Y', 2),
       ('ordersStatus', 'BOX_LOCALIZATION_ORDERS_STATUS', 'FILENAME_ORDERS_STATUS', '', 'localization', 'Y', 3),
       ('reportCustomers', 'BOX_REPORTS_ORDERS_TOTAL', 'FILENAME_STATS_CUSTOMERS', '', 'reports', 'Y', 1),
       ('reportReferrals', 'BOX_REPORTS_CUSTOMERS_REFERRALS', 'FILENAME_STATS_CUSTOMERS_REFERRALS', '', 'reports', 'Y', 2),
       ('reportLowStock', 'BOX_REPORTS_PRODUCTS_LOWSTOCK', 'FILENAME_STATS_PRODUCTS_LOWSTOCK', '', 'reports', 'Y', 3),
       ('reportProductsSold', 'BOX_REPORTS_PRODUCTS_PURCHASED', 'FILENAME_STATS_PRODUCTS_PURCHASED', '', 'reports', 'Y', 4),
       ('reportProductsViewed', 'BOX_REPORTS_PRODUCTS_VIEWED', 'FILENAME_STATS_PRODUCTS_VIEWED', '', 'reports', 'Y', 5),
       ('templateSelect', 'BOX_TOOLS_TEMPLATE_SELECT', 'FILENAME_TEMPLATE_SELECT', '', 'tools', 'Y', 1),
       ('layoutController', 'BOX_TOOLS_LAYOUT_CONTROLLER', 'FILENAME_LAYOUT_CONTROLLER', '', 'tools', 'Y', 2),
       ('banners', 'BOX_TOOLS_BANNER_MANAGER', 'FILENAME_BANNER_MANAGER', '', 'tools', 'Y', 3),
       ('mail', 'BOX_TOOLS_MAIL', 'FILENAME_MAIL', '', 'tools', 'Y', 4),
       ('newsletters', 'BOX_TOOLS_NEWSLETTER_MANAGER', 'FILENAME_NEWSLETTERS', '', 'tools', 'Y', 5),
       ('server', 'BOX_TOOLS_SERVER_INFO', 'FILENAME_SERVER_INFO', '', 'tools', 'Y', 6),
       ('whosOnline', 'BOX_TOOLS_WHOS_ONLINE', 'FILENAME_WHOS_ONLINE', '', 'tools', 'Y', 7),
       ('storeManager', 'BOX_TOOLS_STORE_MANAGER', 'FILENAME_STORE_MANAGER', '', 'tools', 'Y', 9),
       ('developersToolKit', 'BOX_TOOLS_DEVELOPERS_TOOL_KIT', 'FILENAME_DEVELOPERS_TOOL_KIT', '', 'tools', 'Y', 10),
       ('ezpages', 'BOX_TOOLS_EZPAGES', 'FILENAME_EZPAGES_ADMIN', '', 'tools', 'Y', 11),
       ('definePagesEditor', 'BOX_TOOLS_DEFINE_PAGES_EDITOR', 'FILENAME_DEFINE_PAGES_EDITOR', '', 'tools', 'Y', 12),
       ('sqlPatch', 'BOX_TOOLS_SQLPATCH', 'FILENAME_SQLPATCH', '', 'tools', 'Y', 13),
       ('couponAdmin', 'BOX_COUPON_ADMIN', 'FILENAME_COUPON_ADMIN', '', 'gv', 'Y', 1),
       ('couponRestrict', 'BOX_COUPON_RESTRICT', 'FILENAME_COUPON_RESTRICT', '', 'gv', 'N', 1),
       ('gvQueue', 'BOX_GV_ADMIN_QUEUE', 'FILENAME_GV_QUEUE', '', 'gv', 'Y', 2),
       ('gvMail', 'BOX_GV_ADMIN_MAIL', 'FILENAME_GV_MAIL', '', 'gv', 'Y', 3),
       ('gvSent', 'BOX_GV_ADMIN_SENT', 'FILENAME_GV_SENT', '', 'gv', 'Y', 4),
       ('profiles', 'BOX_ADMIN_ACCESS_PROFILES', 'FILENAME_PROFILES', '', 'access', 'Y', 1),
       ('users', 'BOX_ADMIN_ACCESS_USERS', 'FILENAME_USERS', '', 'access', 'Y', 2),
       ('pageRegistration', 'BOX_ADMIN_ACCESS_PAGE_REGISTRATION', 'FILENAME_ADMIN_PAGE_REGISTRATION', '', 'access', 'Y', 3),
       ('adminlogs', 'BOX_ADMIN_ACCESS_LOGS', 'FILENAME_ADMIN_ACTIVITY', '', 'access', 'Y', 4),
       ('recordArtists', 'BOX_CATALOG_RECORD_ARTISTS', 'FILENAME_RECORD_ARTISTS', '', 'extras', 'Y', 1),
       ('recordCompanies', 'BOX_CATALOG_RECORD_COMPANY', 'FILENAME_RECORD_COMPANY', '', 'extras', 'Y', 2),
       ('musicGenre', 'BOX_CATALOG_MUSIC_GENRE', 'FILENAME_MUSIC_GENRE', '', 'extras', 'Y', 3),
       ('mediaManager', 'BOX_CATALOG_MEDIA_MANAGER', 'FILENAME_MEDIA_MANAGER', '', 'extras', 'Y', 4),
       ('mediaTypes', 'BOX_CATALOG_MEDIA_TYPES', 'FILENAME_MEDIA_TYPES', '', 'extras', 'Y', 5);


INSERT INTO banners (banners_title, banners_url, banners_image, banners_group, banners_html_text, expires_impressions, expires_date, date_scheduled, date_added, date_status_change, status, banners_open_new_windows, banners_on_ssl, banners_sort_order) VALUES ('Zen Cart ITALIA', 'http://www.zen-cart.it', 'banners/zen-cart-it.gif', 'Footer_3', '', 0, NULL, NULL, '2004-01-11 20:59:12', NULL, 1, 1, 1, 0);
INSERT INTO banners (banners_title, banners_url, banners_image, banners_group, banners_html_text, expires_impressions, expires_date, date_scheduled, date_added, date_status_change, status, banners_open_new_windows, banners_on_ssl, banners_sort_order) VALUES ('Manuale Zen Cart Italia', 'http://www.zen-cart.it/manuale-operativo-zen-cart/', 'banners/manuale_zen.gif', 'Header_2', '', NULL, NULL, NULL, '2007-12-27 11:02:43', '2012-04-11 09:31:19', 1, 1, 0, 0);
INSERT INTO banners (banners_title, banners_url, banners_image, banners_group, banners_html_text, expires_impressions, expires_date, date_scheduled, date_added, date_status_change, status, banners_open_new_windows, banners_on_ssl, banners_sort_order) VALUES ('Download Zen Cart', 'http://www.zen-cart.it', 'banners/zencart-italia_468.gif', 'Footer_3', '', 0, NULL, NULL, '2007-09-10 11:02:43', NULL, 1, 1, 1, 0);
INSERT INTO banners (banners_title, banners_url, banners_image, banners_group, banners_html_text, expires_impressions, expires_date, date_scheduled, date_added, date_status_change, status, banners_open_new_windows, banners_on_ssl, banners_sort_order) VALUES ('PayPal', '', '', 'Footer_3', '<a href="https://www.paypal.com/it/mrb/pal=E6C2D32DZ9ZMN" target="_blank"><img src="https://www.paypalobjects.com/it_IT/IT/i/bnr/paypal_mrb_banner.gif" border="0" alt="Effettua la registrazione a PayPal e inizia ad accettare pagamenti tramite carta di credito immediatamente."></a>', 0, NULL, NULL, '2004-01-12 20:53:18', '2006-10-05 18:52:27', 1, 1, 1, 0);
INSERT INTO banners (banners_title, banners_url, banners_image, banners_group, banners_html_text, expires_impressions, expires_date, date_scheduled, date_added, date_status_change, status, banners_open_new_windows, banners_on_ssl, banners_sort_order) VALUES ('Moneybookers.com', '', '', 'Footer_3', '<a href="https://www.moneybookers.com/app/?rid=2017103" target="_blank"><img style="border-width: 1px; border-color: #8B8583;" src="http://www.moneybookers.com/images/banners/468_en_pay_auctions.gif" width="468" height="60" border="0" alt="" /></a>', 0, NULL, NULL, '2006-03-13 11:02:43', NULL, 1, 1, 1, 0);
INSERT INTO banners (banners_title, banners_url, banners_image, banners_group, banners_html_text, expires_impressions, expires_date, date_scheduled, date_added, date_status_change, status, banners_open_new_windows, banners_on_ssl, banners_sort_order) VALUES ('Zen Cart the art of e-commerce', 'http://www.zen-cart.it/', 'banners/125zen_logo.gif', 'BannersAll', '', 0, NULL, NULL, '2004-01-11 20:59:12', NULL, 1, 1, 1, 0);
INSERT INTO banners (banners_title, banners_url, banners_image, banners_group, banners_html_text, expires_impressions, expires_date, date_scheduled, date_added, date_status_change, status, banners_open_new_windows, banners_on_ssl, banners_sort_order) VALUES ('Zen-Cart l''arte dell'' E-commerce', '', 'banners/125x125_zen_logo.gif', 'SideLeft', 'Il <b>Manuale</b> per il tuo negozio lo trovi in <a href="http://www.zen-cart.it/manuale-operativo-zen-cart/" target="_blank">Zen Cart Italia</a>.', 0, NULL, NULL, '2007-08-02 20:59:12', NULL, 1, 1, 1, 0);
INSERT INTO banners (banners_title, banners_url, banners_image, banners_group, banners_html_text, expires_impressions, expires_date, date_scheduled, date_added, date_status_change, status, banners_open_new_windows, banners_on_ssl, banners_sort_order) VALUES ('Text banner', '', '', 'BannersAll', 'I <b>servizi</b> e la <b>consulenza</b> per approntare al meglio il tuo negozio li trovi in <a href="http://www.zen-cart.it/tutto-su-zen-cart/lo-staff-di-zen-cart-italia/info/" target="_blank">Zen Cart Italia</a>.', 0, NULL, NULL, '2006-08-31 18:08:41', NULL, 1, 1, 1, 0);
INSERT INTO banners (banners_title, banners_url, banners_image, banners_group, banners_html_text, expires_impressions, expires_date, date_scheduled, date_added, date_status_change, status, banners_open_new_windows, banners_on_ssl, banners_sort_order) VALUES ('Zen Cart image Manuale', 'http://www.zen-cart.it/manuale-operativo-zen-cart/', 'banners/cover-man-zc2.gif', 'SideRight', '', 0, NULL, NULL, '2005-05-13 10:54:38', NULL, 1, 1, 1, 10);
INSERT INTO banners (banners_title, banners_url, banners_image, banners_group, banners_html_text, expires_impressions, expires_date, date_scheduled, date_added, date_status_change, status, banners_open_new_windows, banners_on_ssl, banners_sort_order) VALUES ('HEADER STORE - Link della demo', '', '', 'Header_1', '<b>\r\n<a class="hop" href="http://geku.it/150-speciale/index.php?main_page=page_2">Dettagli della versione</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n<a class="hop" href="http://geku.it/150-speciale/index.php?main_page=page_3">Come personalizzare</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n<a class="hop" href="http://geku.it/150-speciale/index.php?main_page=page_4">Configurazione &amp; Note</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n<a class="hop" href="http://showroom.opzione.info/">Zen Cart Show Room</a>&nbsp;\r\n</b>', NULL, NULL, NULL, '2012-04-07 18:33:47', '2012-04-11 09:31:25', 0, 0, 0, 0);


INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Nome del Negozio', 'STORE_NAME', 'Zen Cart', 'Il nome del Negozio', '1', '1', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Proprietario', 'STORE_OWNER', 'Team Zen Cart', 'Il nome del proprietario del negozio', '1', '2', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Telefono - Servizio Clienti', 'STORE_TELEPHONE_CUSTSERVICE', '', 'Numero di telefono del Servizio Clienti. Questo numero pu&ograve; essere fornito ai clienti durante le transazioni dei pagamenti.', '1', '3', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Dati fiscali del Negozio', 'STORE_DATIFISCALI', '', 'La normativa italiana prevede obbligatoriamente l\'esposizione del numero di partita iva e dei dati societari per spa ed srl. Questo il campo per inserire i dati che appariranno nel footer - piede del negozio.<br />Esempio: P.I: 01234567890 - Capitale Sociale: 500.000 euro I.V.', '1', '4', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('Stato', 'STORE_COUNTRY', '223', 'Lo Stato in cui &egrave; situato il negozio <br /><br /><strong>Nota: Ricordati di aggiornare anche la Zona del negozio.</strong>', '1', '6', 'zen_get_country_name', 'zen_cfg_pull_down_country_list(', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('Zona', 'STORE_ZONE', '18', 'La Zona in cui si trova il negozio', '1', '7', 'zen_cfg_get_zone_name', 'zen_cfg_pull_down_zone_list(', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Ordinamento dei prodotti in arrivo', 'EXPECTED_PRODUCTS_SORT', 'desc', 'Questo &egrave; il tipo di ordinamento usato per i prodotti in arrivo.', '1', '8', 'zen_cfg_select_option(array(\'asc\', \'desc\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Campo di ordinamento dei prodotti in arrivo', 'EXPECTED_PRODUCTS_FIELD', 'date_expected', 'Questo &egrave; il campo scelto per l\'ordinamento dei prodotti in arrivo.', '1', '9', 'zen_cfg_select_option(array(\'products_name\', \'date_expected\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Utilizza automaticamente la Valuta impostata di default', 'USE_DEFAULT_LANGUAGE_CURRENCY', 'false', 'Commuta automaticamente la valuta del negozio a quella di default', '1', '10', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Selettore Lingua', 'LANGUAGE_DEFAULT_SELECTOR', 'Default', 'La lingua utilizzata di default deve essere basata sulle impostazioni del negozio, o sulle impostazioni del browser dell\'utente ?<br /><br />Default: Impostazioni di default del Negozio', '1', '11', 'zen_cfg_select_option(array(\'Default\', \'Browser\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Utilizza URLs sicuri per i motori di ricerca (ancora in sviluppo)', 'SEARCH_ENGINE_FRIENDLY_URLS', 'false', 'Utilizza URLs sicuri per l\'indicizzazione su tutti i motori di ricerca', '6', '12', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Mostra il Carrello dopo l\'aggiunta di un prodotto', 'DISPLAY_CART', 'true', 'Mostra il carrello dopo aver inserito un prodotto (oppure torna indietro alla pagina)', '1', '14', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Operatore di ricerca di default', 'ADVANCED_SEARCH_DEFAULT_OPERATOR', 'and', 'Operatore di ricerca di default', '1', '17', 'zen_cfg_select_option(array(\'and\', \'or\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Indirizzo e Telefono del Negozio', 'STORE_NAME_ADDRESS', 'Nome Negozio\nIndirizzo\nStato\nTelefono', 'Questi sono il Nome Negozio, Indirizzo e Telefono usati per i documenti stampabili e visualizzati Online', '1', '7', 'zen_cfg_textarea(', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Mostra Contatori di Categoria', 'SHOW_COUNTS', 'false', 'Conta ricorsivamente quanti prodotti ci sono in ogni categoria', '1', '19', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Cifre decimali delle Tasse', 'TAX_DECIMAL_PLACES', '0', 'Formatta l\'importo delle tasse con questi decimali', '1', '20', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Mostra i Prezzi con Tasse incluse', 'DISPLAY_PRICE_WITH_TAX', 'true', 'Mostra i Prezzi con Tasse incluse (true) o somma le Tasse alla fine (false)', '1', '21', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Mostra i Prezzi con Tasse incluse in Admin', 'DISPLAY_PRICE_WITH_TAX_ADMIN', 'true', 'Mostra i Prezzi con Tasse incluse (true) o somma le Tasse alla fine (false) in Admin(Fatture)', '1', '21', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Calcolo Tasse Prodotti basato su', 'STORE_PRODUCT_TAX_BASIS', 'Shipping', 'Su quali basi vengono calcolate le tasse sul Prodotto. Le opzioni sono:<br />Shipping - Basate sull\'indirizzo di spedizione del cliente<br />Billing - Basate sull\'indirizzo di fatturazione del cliente<br />Store - Basate sull\'indirizzo del negozio se la Zona di fatturazione/spedizione &egrave; uguale alla zona del negozio', '1', '21', 'zen_cfg_select_option(array(\'Shipping\', \'Billing\', \'Store\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Calcolo Tasse Spedizione basato su', 'STORE_SHIPPING_TAX_BASIS', 'Shipping', 'Su quali basi vengono calcolate le tasse sulla Spedizione. Le opzioni sono:<br />Shipping - Basate sull\'indirizzo di spedizione del cliente<br />Billing - Basate sull\'indirizzo di fatturazione del cliente<br />Store - Basate sull\'indirizzo del negozio se la Zona di fatturazione/spedizione &egrave; uguale alla zona del negozio. Questa impostazione pu&ograve; essere sovrascritta in base alle impostazioni inserite nel Modulo di Spedizione', '1', '21', 'zen_cfg_select_option(array(\'Shipping\', \'Billing\', \'Store\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Visualizzazione Tasse di Vendita', 'STORE_TAX_DISPLAY_STATUS', '0', 'Mostra sempre le Tasse anche quando l\'ammontare &egrave; 0.00 ?<br />0= no<br />1= si', '1', '21', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
# Aggiunta 139
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Mostra aliquote tasse individualmente', 'SHOW_SPLIT_TAX_CHECKOUT', 'false', 'Quando sono adoperate diverse aliquote di tassa, consente di disporle ognuna per singola riga nella pagina di chiusura ordine', '1', '22', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Admin - Time Out Sessione in Secondi', 'SESSION_TIMEOUT_ADMIN', '900', 'Inserisci il tempo in secondi.<br />Massimo consentito &egrave; 900 in ossequio ai requisiti PCI.<br /> Default=900<br />Esempio: 900= 15 min <br /><br />Nota: Troppo pochi secondi possono dare come conseguenza problemi di timeout ad esempio durante l\'inserimento/modifica dei prodotti', '1', '40', NULL, now(), NULL, 'zen_cfg_select_option(array(\'900\', \'600\', \'300\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Admin - Impostazione di max_execution_time per i processi', 'GLOBAL_SET_TIME_LIMIT', '60', 'Inserisci la durata massima in secondi per i processi. Default=60<br />Esempio: 60= 1 minuto<br /><br />Nota: Modifica il limite di tempo solamente se hai problemi di tempi di esecuzione di qualche processo', '1', '42', NULL, now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Visualizza se ci sono aggiornamenti disponibili', 'SHOW_VERSION_UPDATE_IN_HEADER', 'true', 'Controlla automaticamente se una nuova versione di ZenCart &egrave; disponibile online. Abilitare questa opzione rallenta lievemente il caricamento della pagina Admin (Visualizzato nella homepage del Pannello di Amministrazione dopo il Login e nella Pagina Info Server).', '1', '44', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Status: Negozio o Vetrina?', 'STORE_STATUS', '0', 'Che utilizzo ha il Negozio<br />0= Negozio Normale<br />1= Solo Vetrina senza prezzi<br />2= Solo Vetrina con prezzi', '1', '25', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Server Uptime', 'DISPLAY_SERVER_UPTIME', 'true', 'Visualizzare il Server uptime pu&ograve; causare inserimenti nel log degli errori su alcuni servers. (true = Visualizza, false = non visualizza)', '1', '46', '2003-11-08 20:24:47', '0001-01-01 00:00:00', '', 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Controllo pagine mancanti', 'MISSING_PAGE_CHECK', 'Page Not Found', 'Zen Cart pu&ograve; effettuare il controllo per le pagine mancanti nell\' URL e ridirezionarle alla pagina Index. Per il debugging potresti voler disattivare questo controllo. <br /><br /><strong>Default=On</strong><br />On = Manda le pagine mancanti all\' \'index\'<br />Off = Non controllare le pagine mancanti<br />Page Not Found = Usa la pagina Page-Not-Found', '1', '48', '2003-11-08 20:24:47', '0001-01-01 00:00:00', '', 'zen_cfg_select_option(array(\'On\', \'Off\', \'Page Not Found\'),');

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('cURL Proxy Status', 'CURL_PROXY_REQUIRED', 'False', 'Il tuo host richiede l\'uso di un proxy per le comunicazioni cURL?', 6, '50', 'zen_cfg_select_option(array(\'True\', \'False\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Indirizzo cURL Proxy', 'CURL_PROXY_SERVER_DETAILS', '', 'In caso di hosting che richiedono l\'uso di un proxy per comunicare con siti esterni via cURL, inserire qui l\'indirizzo del proxy.<br />formato: indirizzo:porta<br />ad esempio: 127.0.0.1:3128', '6', '51', NULL, now(), NULL, NULL);


INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Editor HTML', 'HTML_EDITOR_PREFERENCE', 'NONE', 'Definire un editor HTML/Testo da utilizzare per comporre email, newsletter e descrizioni prodotti in Admin', '1', '110', 'zen_cfg_pull_down_htmleditors(', now());
#phpbb
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Abilito collegamento con phpBB ?', 'PHPBB_LINKS_ENABLED', 'false', 'Zen Cart deve sincronizzare le informazioni sui nuovi account con il tuo forum phpBB (gi&agrave; installato) ?', '1', '120', 'zen_cfg_select_option(array(\'true\', \'false\'),', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Mostra Contatori Categoria - Lato Admin', 'SHOW_COUNTS_ADMIN', 'true', 'Mostrare Contatori Categoria in Admin ?', '1', '19', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Rapporto Conversione Valuta', 'CURRENCY_UPLIFT_RATIO', '1.05', 'Aggiornando le valute, quale maggiorazione del rapporto dovrebbe essere usato per calcolare il tasso di cambio usato nel negozio? <br/>Cio&egrave;: il tasso di cambio &egrave; ottenuto dal server; quale supplemento si desidera aggiungere per colmare la differenza fra il cambio bancario ed il cambio consumatore? <br/><br/><strong>Default: 1.05 </strong><br/>Questo permetter&agrave; al tasso di cambio di essere moltiplicato per 1.05 per fissare i tassi valuta nel negozio.', '1', '55', NULL, now(), NULL, NULL);


INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Nome', 'ENTRY_FIRST_NAME_MIN_LENGTH', '2', 'Lunghezza minima di Nome', '2', '1', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Cognome', 'ENTRY_LAST_NAME_MIN_LENGTH', '2', 'Lunghezza minima di Cognome', '2', '2', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Data di Nascita', 'ENTRY_DOB_MIN_LENGTH', '10', 'Lunghezza minima di Data di nascita', '2', '3', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Indirizzo Email', 'ENTRY_EMAIL_ADDRESS_MIN_LENGTH', '6', 'Lunghezza minima di Indirizzo email', '2', '4', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Indirizzo', 'ENTRY_STREET_ADDRESS_MIN_LENGTH', '5', 'Lunghezza minima di Indirizzo', '2', '5', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Societ&agrave;', 'ENTRY_COMPANY_MIN_LENGTH', '0', 'Lunghezza minima nome Societ&agrave;', '2', '6', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Cap', 'ENTRY_POSTCODE_MIN_LENGTH', '4', 'Lunghezza minima di Cap', '2', '7', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Comune', 'ENTRY_CITY_MIN_LENGTH', '3', 'Lunghezza minima di Comune', '2', '8', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Provincia', 'ENTRY_STATE_MIN_LENGTH', '2', 'Lunghezza minima di Provincia', '2', '9', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Numero Telefono', 'ENTRY_TELEPHONE_MIN_LENGTH', '3', 'Lunghezza minima di Numero di Telefono', '2', '10', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Password', 'ENTRY_PASSWORD_MIN_LENGTH', '7', 'Lunghezza minima di Password', '2', '11', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Nome Proprietario Carta di Credito', 'CC_OWNER_MIN_LENGTH', '3', 'Lunghezza minima del Nome Proprietario Carta di Credito', '2', '12', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Numero Carta di Credito', 'CC_NUMBER_MIN_LENGTH', '10', 'Lunghezza minima del Numero Carta di Credito', '2', '13', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Numero CVV Carta di Credito', 'CC_CVV_MIN_LENGTH', '3', 'Lunghezza minima del Numero CVV della Carta di Credito', '2', '13', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Testo Recensioni Prodotti', 'REVIEW_TEXT_MIN_LENGTH', '50', 'Lunghezza minima del testo nella Recensione Prodotto', '2', '14', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Pi&ugrave; Venduti', 'MIN_DISPLAY_BESTSELLERS', '1', 'Numero minimo di prodotti Pi&ugrave; Venduti da visualizzare', '2', '15', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Hanno acquistato anche', 'MIN_DISPLAY_ALSO_PURCHASED', '1', 'Numero minimo di prodotti da visualizzare nel box Hanno acquistato anche', '2', '16', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Nick Name', 'ENTRY_NICK_MIN_LENGTH', '3', 'Lunghezza minima di Nick Name', '2', '1', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Inserimenti Rubrica Indirizzi', 'MAX_ADDRESS_BOOK_ENTRIES', '5', 'Numero massimo consentito di inserimenti nella Rubrica Indirizzi del Cliente', '3', '1', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Risultati ricerca per Pagina', 'MAX_DISPLAY_SEARCH_RESULTS', '20', 'Numero di Prodotti da elencare su una Pagina Risultato della Ricerca', '3', '2', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Link Navigatore Prec./Succ.', 'MAX_DISPLAY_PAGE_LINKS', '5', 'Numero del \'numero\' di link usati per i set di pagine', '3', '3', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Prodotti in Offerta', 'MAX_DISPLAY_SPECIAL_PRODUCTS', '9', 'Numero di Prodotti in Offerta da visualizzare', '3', '4', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Prodotti Novit&agrave;', 'MAX_DISPLAY_NEW_PRODUCTS', '9', 'Numero di Prodotti Novit&agrave; da visualizzare in una Categoria', '3', '5', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Prodotti in Arrivo', 'MAX_DISPLAY_UPCOMING_PRODUCTS', '10', 'Numero di Prodotti in Arrivo da visualizzare', '3', '6', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Elenco Produttori - Box Scorrimento Dimensione/Stile', 'MAX_MANUFACTURERS_LIST', '3', 'Numero di Produttori da visualizzare nella finestra di scorrimento. Impostandolo a 1 o 0 sar&agrave; visualizzata una lista dropdown.', '3', '7', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Elenco Produttori - Verifica Esistenza Prodotto', 'PRODUCTS_MANUFACTURERS_STATUS', '1', 'Verifica che esista almeno 1 prodotto e sia attivo per mostrare il nome Produttore.<br /><br />Nota: Quando questa caratteristica &egrave; ON pu&ograve; produrre rallentamenti in siti con un gran numero di prodotti e/o produttori.<br />0= off 1= on', 3, 7, 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Elenco Generi Musicali - Dimensione/Stile Scroll Box', 'MAX_MUSIC_GENRES_LIST', '3', 'Numero di Generi Musicali da visualizzare nella finestra scrollabile. Impostandolo a 1 o 0 verr&agrave; visualizzata una lista a discesa.', '3', '7', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Elenco Case Discografiche - Dimensione/Stile Scroll Box', 'MAX_RECORD_COMPANY_LIST', '3', 'Numero di Case Discografiche da visualizzare nella finestra scrollabile. Impostandolo a 1 o 0 verr&agrave; visualizzata una lista a discesa.', '3', '7', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Lunghezza del Nome Casa Discografica', 'MAX_DISPLAY_RECORD_COMPANY_NAME_LEN', '15', 'Usato nel box Case Discografiche; lunghezza massima del nome Casa Discografica da visualizzare. I nomi pi&ugrave; lunghi saranno troncati.', '3', '8', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Lunghezza del Nome Genere Musicale', 'MAX_DISPLAY_MUSIC_GENRES_NAME_LEN', '15', 'Usato nel box Generi Musicali; lunghezza massima del nome Genere Musicale da visualizzare. I nomi pi&ugrave; lunghi saranno troncati.', '3', '8', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Lunghezza del Nome Produttore', 'MAX_DISPLAY_MANUFACTURER_NAME_LEN', '15', 'Usato nel box Produttori; lunghezza massima del nome Produttore da visualizzare. I nomi pi&ugrave; lunghi saranno troncati.', '3', '8', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Nuove Recensioni Prodotti per Pagina', 'MAX_DISPLAY_NEW_REVIEWS', '6', 'Numero di Nuove Recensioni da visualizzare in ogni pagina.', '3', '9', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Recensioni Prodotti visualizzate a rotazione casuale nel box laterale', 'MAX_RANDOM_SELECT_REVIEWS', '1', 'Numero di Recensioni Prodotti da visualizzare a rotazione casuale nel box laterale.<br />Inserire il numero di prodotti da visualizzare assieme nel box laterale.<br /><br />Quanti prodotti visualizzare nel box laterale?', '3', '10', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Prodotti Novit&agrave; visualizzati a rotazione casuale nel box laterale', 'MAX_RANDOM_SELECT_NEW', '1', 'Numero di Nuovi Prodotti da visualizzare a rotazione casuale nel box laterale.<br />Inserire il numero di prodotti da visualizzare assieme nel box laterale.<br /><br />Quanti prodotti visualizzare nel box laterale?', '3', '11', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Prodotti in Offerta visualizzati a rotazione casuale nel box laterale', 'MAX_RANDOM_SELECT_SPECIALS', '1', 'Numero di Prodotti in Offerta da visualizzare a rotazione casuale nel box laterale.<br />Inserire il numero di prodotti da visualizzare assieme nel box laterale.<br /><br />Quanti prodotti visualizzare nel box laterale?', '3', '12', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Categorie da elencare per Riga', 'MAX_DISPLAY_CATEGORIES_PER_ROW', '3', 'Numero di Categorie visualizzate per riga.', '3', '13', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Elenco Nuovi Prodotti - Numero per Pagina', 'MAX_DISPLAY_PRODUCTS_NEW', '10', 'Numero di Prodotti Novit&agrave; elencati per pagina.', '3', '14', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Pi&ugrave; Venduti per Box', 'MAX_DISPLAY_BESTSELLERS', '10', 'Numero di Prodotti Pi&ugrave; Venduti da visualizzare nel box.', '3', '15', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Hanno acquistato anche', 'MAX_DISPLAY_ALSO_PURCHASED', '6', 'Numero di Prodotti da visualizzare nel box Questo Cliente ha acquistato anche.', '3', '16', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Box Acquisti Recenti - NOTA: il box &egrave; disabilitato', 'MAX_DISPLAY_PRODUCTS_IN_ORDER_HISTORY_BOX', '6', 'Numero di Prodotti da visualizzare nel box Acquisti Recenti.', '3', '17', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Ordini visualizzati nella pagina Cronologia Ordini - Numero massimo', 'MAX_DISPLAY_ORDER_HISTORY', '10', 'Numero di Ordini da visualizzare nella Cronologia Ordini in Il Mio Account.', '3', '18', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Clienti visualizzati nella pagina Clienti - Numero massimo', 'MAX_DISPLAY_SEARCH_RESULTS_CUSTOMER', '20', 'Numero di Clienti visualizzati in Clienti.', 3, 19, now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Ordini visualizzati nella pagina Ordini - Numero massimo', 'MAX_DISPLAY_SEARCH_RESULTS_ORDERS', '20', 'Numero di Ordini visualizzati in Ordini.', 3, 20, now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Prodotti visualizzati nei Report - Numero massimo', 'MAX_DISPLAY_SEARCH_RESULTS_REPORTS', '20', 'Numero di Prodotti visualizzati nei Report.', 3, 21, now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Categorie Prodotti visualizzati - Numero massimo', 'MAX_DISPLAY_RESULTS_CATEGORIES', '10', 'Numero di Prodotti da visualizzare per videata.', 3, 22, now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Elenco Prodotti - Numero per Pagina', 'MAX_DISPLAY_PRODUCTS_LISTING', '10', 'Numero massimo di Prodotti da visualizzare per pagina nella Pagina Principale.', '3', '30', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Attributi Prodotti visualizzati in Nomi Opzioni e Valori - Numero massimo', 'MAX_ROW_LISTS_OPTIONS', '10', 'Numero massimo di Nomi Opzione e Valori da visualizzare nella pagina Attributi Prodotti.', '3', '24', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Attributi Prodotti visualizzati in Gestione Attributi - Numero massimo', 'MAX_ROW_LISTS_ATTRIBUTES_CONTROLLER', '30', 'Numero massimo di Attributi da visualizzare nella pagina del Gestore Attributi.', '3', '25', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Attributi Prodotti visualizzati in Gestore Downloads - Numero massimo', 'MAX_DISPLAY_SEARCH_RESULTS_DOWNLOADS_MANAGER', '30', 'Numero massimo di Attributi downloads da visualizzare nella pagina del Gestore Downloads.', '3', '26', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Prodotti in Vetrina visualizzati in Admin - Numero massimo', 'MAX_DISPLAY_SEARCH_RESULTS_FEATURED_ADMIN', '10', 'Numero massimo di Prodotti in Vetrina da visualizzare per videata - Admin.', '3', '27', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Prodotti in Vetrina visualizzati in Pagina Principale - Numero massimo', 'MAX_DISPLAY_SEARCH_RESULTS_FEATURED', '9', 'Numero massimo di Prodotti in Vetrina da visualizzare nella pagina principale.', '3', '28', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Prodotti in Vetrina visualizzati - Numero massimo', 'MAX_DISPLAY_PRODUCTS_FEATURED_PRODUCTS', '10', 'Numero massimo di Prodotti in Vetrina da visualizzare per videata.', '3', '29', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Prodotti in Vetrina visualizzati a rotazione casuale nel box laterale', 'MAX_RANDOM_SELECT_FEATURED_PRODUCTS', '1', 'Numero massimo di Prodotti in Vetrina visualizzati a rotazione casuale nel box laterale.<br /><br />Quanti prodotti visualizzare nel box laterale?', '3', '30', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Prodotti in Offerta visualizzati nella pagina Principale - Numero massimo', 'MAX_DISPLAY_SPECIAL_PRODUCTS_INDEX', '9', 'Numero massimo di Prodotti in Offerta da visualizzare in Pagina Principale.', '3', '31', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Prodotti Novit&agrave; visualizzati - Limitati a ...', 'SHOW_NEW_PRODUCTS_LIMIT', '0', 'imita il numero di Prodotti Novit&agrave; visualizzati a<br />0= Tutti i Prodotti<br />1= Mese Corrente<br />7= 7 Giorni<br />14= 14 Giorni<br />30= 30 Giorni<br />60= 60 Giorni<br />90= 90 Giorni<br />120= 120 Giorni', '3', '40', 'zen_cfg_select_option(array(\'0\', \'1\', \'7\', \'14\', \'30\', \'60\', \'90\', \'120\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Prodotti visualizzati nella pagina Tutti i Prodotti - Numero massimo', 'MAX_DISPLAY_PRODUCTS_ALL', '10', 'Numero massimo di Prodotti visualizzati per videata.', '3', '45', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Bandiere di Lingua visualizzate nel Box di scelta Lingua laterale - Numero massimo', 'MAX_LANGUAGE_FLAGS_COLUMNS', '3', 'Numero massimo di Bandiere di Lingua visualizzate per Riga.', '3', '50', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('File Upload - Dimensione massima', 'MAX_FILE_UPLOAD_SIZE', '2048000', 'Qual &egrave; la dimensione Massima di un file per uploads?<br />Default= 2048000', '3', '60', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Estensioni Filename consentite per l\'uploading', 'UPLOAD_FILENAME_EXTENSIONS', 'jpg,jpeg,gif,png,eps,cdr,ai,pdf,tif,tiff,bmp,zip', 'Elenca i tipi di file consentiti (estensioni filename) quando i files vengono uploadati sul tuo sito dai clienti. Separa i valori con la virgola (,). Non includere il punto(.).<br /><br />Impostazione suggerita: "jpg,jpeg,gif,png,eps,cdr,ai,pdf,tif,tiff,bmp,zip"', '3', '61', 'zen_cfg_textarea(', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Righe di dettaglio ordine visualizzate in Admin->Ordini - Numero massimo', 'MAX_DISPLAY_RESULTS_ORDERS_DETAILS_LISTING', '0', 'Numero massimo di Righe di Dettaglio Ordine<br />0 = Illimitate', '3', '65', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Numero massimo di transazioni PayPal visualizzate in Admin', 'MAX_DISPLAY_SEARCH_RESULTS_PAYPAL_IPN', '20', 'Numero massimo di transazioni PayPal visualizzate in Admin.<br />Il valore di Default &egrave; 20.', '3', '66', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Numero massimo di colonne visualizzate in Gestore Prodotti a Categorie Multiple', 'MAX_DISPLAY_PRODUCTS_TO_CATEGORIES_COLUMNS', '3', 'Numero massimo di colonne visualizzate in Gestore Prodotti a Categorie Multiple.<br />3 = Default', '3', '70', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Pagine EZ visualizzate - Numero massimo', 'MAX_DISPLAY_SEARCH_RESULTS_EZPAGE', '20', 'Numero massimo di EZ-Pages.<br />20 = Default', '3', '71', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Immagine Piccola - Larghezza', 'SMALL_IMAGE_WIDTH', '100', 'Larghezza in pixel delle immagini piccole.', '4', '1', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Immagine Piccola - Altezza', 'SMALL_IMAGE_HEIGHT', '80', 'Altezza in pixel delle immagini piccole.', '4', '2', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Immagine Intestazione in Admin - Larghezza', 'HEADING_IMAGE_WIDTH', '57', 'La larghezza in pixel dell\'immagine di testa in Admin.<br />NOTA: Attualmente, questo regola la spaziatura nella pagina delle pagine Admin o pu&ograve; essere usato per aggiungere immagini nell\'header di Admin', '4', '3', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Immagine Intestazione in Admin - Altezza', 'HEADING_IMAGE_HEIGHT', '40', 'L\'altezza in pixel dell\'immagine di testa in Admin.<br />NOTA: Attualmente, questo regola la spaziatura nella pagina delle pagine Admin o pu&ograve; essere usato per aggiungere immagini nell\'header di Admin', '4', '4', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Immagine Sottocategoria - Larghezza', 'SUBCATEGORY_IMAGE_WIDTH', '100', 'La larghezza in pixel delle immagini delle sottocategorie.', '4', '5', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Immagine Sottocategoria - Altezza', 'SUBCATEGORY_IMAGE_HEIGHT', '57', 'L\'altezza in pixel delle immagini delle sottocategorie.', '4', '6', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Calcola Dimensione Immagine', 'CONFIG_CALCULATE_IMAGE_SIZE', 'true', 'Calcolare la dimensione delle immagini?', '4', '7', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Immagine Richiesta', 'IMAGE_REQUIRED', 'true', 'Abilita la visualizzazione di immagini corrotte. Valido per sviluppo.', '4', '8', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Immagine Carrello - Status', 'IMAGE_SHOPPING_CART_STATUS', '1', 'Mostrare l\'immagine prodotto nel Carrello?<br />0= no<br />1= si', 4, 9, 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Immagine Carrello - Larghezza', 'IMAGE_SHOPPING_CART_WIDTH', '50', 'Default = 50', '4', '10', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Immagine Carrello - Altezza', 'IMAGE_SHOPPING_CART_HEIGHT', '40', 'Default = 40', '4', '11', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Larghezza Immagine Icona Categoria - Pagina Info Prodotto', 'CATEGORY_ICON_IMAGE_WIDTH', '57', 'La larghezza in pixel della Icona di Categoria nella pagina di Informazioni Prodotto.', '4', '13', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Altezza Immagine Icona Categoria - Pagina Info Prodotto', 'CATEGORY_ICON_IMAGE_HEIGHT', '40', 'L\'altezza in pixel della Icona di Categoria nella pagina di Informazioni Prodotto.', '4', '14', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Larghezza immagini Sotto Categorie Top', 'SUBCATEGORY_IMAGE_TOP_WIDTH', '150', 'Larghezza in pixel delle immagini sotto categorie Top<br />Sotto categorie Top si realizzano quando la Categoria principale contiene delle categorie', '4', '15', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Altezza immagini Sotto Categorie Top', 'SUBCATEGORY_IMAGE_TOP_HEIGHT', '85', 'Altezza in pixel delle immagini sotto categorie Top<br />Sotto categorie Top si realizzano quando la Categoria principale contiene delle categorie', '4', '16', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Info Prodotto - Larghezza Immagine', 'MEDIUM_IMAGE_WIDTH', '150', 'La larghezza in pixel dell\'immagine articolo nella scheda prodotto.', '4', '20', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Info Prodotto - Altezza Immagine', 'MEDIUM_IMAGE_HEIGHT', '120', 'L\'altezza in pixel dell\'immagine articolo nella scheda prodotto.', '4', '21', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Info Prodotto - Suffisso per Immagine Media', 'IMAGE_SUFFIX_MEDIUM', '_MED', 'Info Prodotto - Suffisso per l\'immagine Media<br />Default = _MED', '4', '22', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Info Prodotto - Suffisso per Immagine Grande', 'IMAGE_SUFFIX_LARGE', '_LRG', 'Info Prodotto - Suffisso per l\'immagine Grande<br />Default = _LRG', '4', '23', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Info Prodotto - Numero di Immagini Aggiuntive per Riga', 'IMAGES_AUTO_ADDED', '3', 'Info Prodotto - Indica il numero di immagini supplementari da visualizzare per riga.<br />Default = 3', '4', '30', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Immagine in Elenco Prodotti - Larghezza', 'IMAGE_PRODUCT_LISTING_WIDTH', '100', 'Default = 100', '4', '40', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Immagine in Elenco Prodotti - Altezza', 'IMAGE_PRODUCT_LISTING_HEIGHT', '80', 'Default = 80', '4', '41', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Immagine in Elenco Nuovi Prodotti - Larghezza', 'IMAGE_PRODUCT_NEW_LISTING_WIDTH', '100', 'Default = 100', '4', '42', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Immagine in Elenco Nuovi Prodotti - Altezza', 'IMAGE_PRODUCT_NEW_LISTING_HEIGHT', '80', 'Default = 80', '4', '43', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Immagine Prodotti Novit&agrave; - Larghezza', 'IMAGE_PRODUCT_NEW_WIDTH', '100', 'Default = 100', '4', '44', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Immagine Prodotti Novit&agrave; - Altezza', 'IMAGE_PRODUCT_NEW_HEIGHT', '80', 'Default = 80', '4', '45', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Immagine Prodotti in Vetrina - Larghezza', 'IMAGE_FEATURED_PRODUCTS_LISTING_WIDTH', '100', 'Default = 100', '4', '46', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Immagine Prodotti in Vetrina - Altezza', 'IMAGE_FEATURED_PRODUCTS_LISTING_HEIGHT', '80', 'Default = 80', '4', '47', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Immagine Elenco di Tutti i Prodotti - Larghezza', 'IMAGE_PRODUCT_ALL_LISTING_WIDTH', '100', 'Default = 100', '4', '48', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Immagine Elenco di Tutti i Prodotti - Altezza', 'IMAGE_PRODUCT_ALL_LISTING_HEIGHT', '80', 'Default = 80', '4', '49', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Immagine Prodotto, visualizza mancante?', 'PRODUCTS_IMAGE_NO_IMAGE_STATUS', '1', 'Uso automaticamente l\'immagine No Image quando non &egrave; abbinata alcuna immagine al prodotto?<br />0= no<br />1= si', '4', '60', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Se immagine mancante utilizza questa', 'PRODUCTS_IMAGE_NO_IMAGE', 'no_picture.gif', 'Nome dell\'immagine da utilizzare se non &egrave; abbinata alcuna immagine al prodotto.<br />Default = no_picture.gif', '4', '61', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Immagine - Usa Immagini Proporzionali in Prodotti e Categorie', 'PROPORTIONAL_IMAGES_STATUS', '1', 'Usa Immagini Proporzionali in Prodotti e Categorie?<br /><br />NOTA: Non utilizzare altezza 0 o impostazioni di larghezza per Immagini Proporzionali<br />0= no<br />1= si', '4', '75', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Titolo/Genere', 'ACCOUNT_GENDER', 'true', 'Mostra il selettore per Signor e Signora durante la creazione di un account e con le informazioni account.', '5', '1', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Data di Nascita', 'ACCOUNT_DOB', 'true', 'Mostra il campo Data di Nascita durante la creazione di un account e nelle informazioni account.<br />NOTA: Imposta il valore minimo di Data di Nascita a nullo se non richiesto.<br />Imposta il valore minimo di Data di Nascita a > 0 per richiederlo', '5', '2', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Societ&agrave;', 'ACCOUNT_COMPANY', 'true', 'Mostra il campo Societ&agrave; durante la creazione di un account e nelle informazioni account.', '5', '3', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Indirizzo riga aggiuntiva', 'ACCOUNT_SUBURB', 'false', 'Mostra un ulteriore campo per l\'indirizzo durante la creazione di un account e nelle informazioni account.', '5', '4', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Provincia', 'ACCOUNT_STATE', 'true', 'Mostra il campo Provincia durante la creazione di un account e nelle informazioni account.', '5', '5', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Provincia - Mostra sempre come men&ugrave; a tendina?', 'ACCOUNT_STATE_DRAW_INITIAL_DROPDOWN', 'true', 'Quando il campo provincia &egrave; disponibile, deve essere mostrato tramite un men&ugrave; a tendina?', '5', '5', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('Creazione Account - ID Stato di Default', 'SHOW_CREATE_ACCOUNT_DEFAULT_COUNTRY', '105', 'Imposta l\'ID Stato di default durante la creazione di un account a:<br />Il valore di Default &egrave; 105', '5', '6', 'zen_get_country_name', 'zen_cfg_pull_down_country_list_none(', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Numero Fax', 'ACCOUNT_FAX_NUMBER', 'true', 'Mostra il campo per il Numero Fax durante la creazione di un account e nelle informazioni account.', '5', '10', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Mostra Checkbox Newsletter', 'ACCOUNT_NEWSLETTER_STATUS', '1', 'Mostra Chekbox Newsletter<br />0= off<br />1= Mostra ''Non Accettato''<br />2= Mostra ''Accettato''<br /><strong>Nota: Predefinire questo valore come ''Accettato'' pu&ograve; essere in violazione con alcune regolamentazioni vigenti nel tuo Stato</strong>', '5', '45', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Cliente - Preferenze del Formato Email di Default', 'ACCOUNT_EMAIL_PREFERENCE', '0', 'Imposta il formato preferito da utilizzare per Default nelle Email Cliente.<br />0= Testo<br />1= HTML<br />', 5, 46, 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Cliente - Impostazione Notifiche Prodotto', 'CUSTOMERS_PRODUCTS_NOTIFICATION_STATUS', '1', 'Il Cliente deve essere interrogato riguardo alle notifiche prodotto dopo il completamento del checkout.<br />0= Non chiedere mai<br />1= Chiedere, a meno che sia gi&agrave; impostato a global<br /><br />Nota: Il box laterale deve essere disattivato separatamente.', '5', '50', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Cliente - Impostazione status del Negozio - Visualizzazione Negozio e Prezzi', 'CUSTOMERS_APPROVAL', '0', 'Il Cliente deve essere Registrato per fare acquisti nel negozio<br />0= Non richiesto<br />1= Deve effettuare il login per navigare nel sito<br />2= Pu&ograve; navigare nel sito ma non saranno visualizzati i prezzi a meno che non abbia effettuato il login<br />3= Solo Vetrina<br /><br />L\'opzioni 2 &egrave; sconsigliata perch&egrave; nel limitare la navigazione nel sito verr&agrave; di conseguenza limitata anche l\'indicizzazione con i crawler.', '5', '55', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ', now());

#customer approval to shop
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Stato Approvazione Cliente - Autorizzazione in Attesa', 'CUSTOMERS_APPROVAL_AUTHORIZATION', '0', 'Il Cliente deve essere Autorizzato per fare acquisti nel negozio<br />0= Non richiesto<br />1= Deve essere Autorizzato per navigare nel sito<br />2= Pu&ograve; navigare nel sito ma non saranno visualizzati i prezzi a meno che non sia Autorizzato<br />3= Il Cliente pu&ograve; navigare nel sito e vedere i prezzi ma deve essere Autorizzato per fare acquisti<br /><br />Le opzioni 2 e 3 sono sconsigliate perch&egrave; nel limitare la navigazione nel sito verr&agrave; di conseguenza limitata anche l\'indicizzazione con i crawler.', '5', '65', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added, use_function) VALUES ('Autorizzazione Cliente: filename', 'CUSTOMERS_AUTHORIZATION_FILENAME', 'customers_authorization', 'Autorizzazione Cliente: filename.<br />Nota: non includere l\'estensione file.<br />Default=customers_authorization', '5', '66', '', now(), NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added, use_function) VALUES ('Autorizzazione Cliente: Nasconde Testata', 'CUSTOMERS_AUTHORIZATION_HEADER_OFF', 'false', 'Autorizzazione Cliente: Nasconde Testata. <br />(true=nasconde false=visualizza)', '5', '67', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now(), NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added, use_function) VALUES ('Autorizzazione Cliente: Nasconde Colonna Sinistra', 'CUSTOMERS_AUTHORIZATION_COLUMN_LEFT_OFF', 'false', 'Autorizzazione Cliente: Nasconde Colonna Sinistra. <br />(true=nasconde false=visualizza)', '5', '68', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now(), NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added, use_function) VALUES ('Autorizzazione Cliente: Nasconde Colonna Destra', 'CUSTOMERS_AUTHORIZATION_COLUMN_RIGHT_OFF', 'false', 'Autorizzazione Cliente: Nasconde Colonna Destra. <br />(true=nasconde false=visualizza)', '5', '69', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now(), NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added, use_function) VALUES ('Autorizzazione Cliente: Nasconde Footer', 'CUSTOMERS_AUTHORIZATION_FOOTER_OFF', 'false', 'Autorizzazione Cliente: Nasconde Footer <br />(true=nasconde false=visualizza)', '5', '70', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now(), NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added, use_function) VALUES ('Autorizzazione Cliente: Nasconde Prezzi', 'CUSTOMERS_AUTHORIZATION_PRICES_OFF', 'false', 'Autorizzazione Cliente: Nasconde Prezzi. <br />(true=nasconde false=visualizza)', '5', '71', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now(), NULL);

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Segnalazione Cliente - Status', 'CUSTOMERS_REFERRAL_STATUS', '0', 'Il Codice di Segnalazione Cliente &egrave; creato da<br />0= Off<br />1= Dal 1mo Codice Buono Sconto utilizzato<br />2= Il Cliente pu&ograve; aggiungerlo durante la creazione dell\'account o modificarlo se non inserito.<br /><br />NOTA: Una volta che il Codice di Segnalazione Cliente &egrave; stato impostato pu&ograve; essere solamente modificato da Cliente in Admin.', '5', '80', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Moduli Installati', 'MODULE_PAYMENT_INSTALLED', 'freecharger.php;moneyorder.php', 'Elenco dei filenames dei moduli di pagamento separati da un punto e virgola (;). Questo &egrave; aggiornato automaticamente. Non richede di essere modificato. (Esempio: cc.php;cod.php;paypalwpp.php)', '6', '0', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Moduli Installati', 'MODULE_ORDER_TOTAL_INSTALLED', 'ot_subtotal.php;ot_shipping.php;ot_coupon.php;ot_group_pricing.php;ot_tax.php;ot_loworderfee.php;ot_gv.php;ot_total.php', 'Elenco dei filenames dei moduli totale ordine separati da un punto e virgola (;). Questo &egrave; aggiornato automaticamente. Non richede di essere modificato. (Esempio: ot_subtotal.php;ot_tax.php;ot_shipping.php;ot_total.php)', '6', '0', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Moduli Installati', 'MODULE_SHIPPING_INSTALLED', 'flat.php;freeshipper.php;item.php;storepickup.php', 'Elenco dei filenames dei moduli spedizione separati da un punto e virgola (;). Questo &egrave; aggiornato automaticamente. Non richede di essere modificato. (Esempio: flat.php;item.php)', '6', '0', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('Abilita SPEDIZIONE GRATUITA!', 'MODULE_SHIPPING_FREESHIPPER_STATUS', 'True', 'Offrire la modalit&agrave; di Spedizione Gratuita?', '6', '0', now(), NULL, 'zen_cfg_select_option(array(\'True\', \'False\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('Costo di Spedizione Gratuita', 'MODULE_SHIPPING_FREESHIPPER_COST', '0.00', 'Le Spese di Spedizione per tutti gli ordini che utilizzano questo metodo di spedizione.', '6', '6', now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('Costo di Packaging', 'MODULE_SHIPPING_FREESHIPPER_HANDLING', '0', 'Costo interno per questo tipo di spedizione.', '6', '0', now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('Classe IVA', 'MODULE_SHIPPING_FREESHIPPER_TAX_CLASS', '0', 'Applica la seguente aliquota IVA ai costi di spedizione.', '6', '0', now(), 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('Zona di Spedizione', 'MODULE_SHIPPING_FREESHIPPER_ZONE', '0', 'Se viene selezionata una Zona, attiva questo metodo di spedizione soltanto per questa Zona.', '6', '0', now(), 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('Ordine di Visualizzazione', 'MODULE_SHIPPING_FREESHIPPER_SORT_ORDER', '0', 'Ordine di Visualizzazione.', '6', '0', now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('Abilita Ritiro Merce presso il Negozio', 'MODULE_SHIPPING_STOREPICKUP_STATUS', 'True', 'Consentire la possibilit&agrave; di ritirare la merce presso la sede del Negozio?', '6', '0', now(), NULL, 'zen_cfg_select_option(array(\'True\', \'False\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('Costo di Spedizione', 'MODULE_SHIPPING_STOREPICKUP_COST', '0.00', 'Le Spese di Spedizione per tutti gli ordini che utilizzano questo metodo di spedizione.', '6', '0', now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('Classe IVA', 'MODULE_SHIPPING_STOREPICKUP_TAX_CLASS', '0', 'Applica la seguente aliquota IVA ai costi di spedizione.', '6', '0', now(), 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('Base di Tassa', 'MODULE_SHIPPING_STOREPICKUP_TAX_BASIS', 'Shipping', 'Su quali basi vengono calcolate le Tasse sulle Spese di Spedizione.  Le opzioni sono:<br />Shipping - Basata sull\'indirizzo di Spedizione del Cliente<br />Billing - Basata sull\'indirizzo di Fatturazione del Cliente', '6', '0', now(), NULL, 'zen_cfg_select_option(array(\'Shipping\', \'Billing\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('Zona di Spedizione', 'MODULE_SHIPPING_STOREPICKUP_ZONE', '0', 'If a zone is selected, only enable this shipping method for that zone.', '6', '0', now(), 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('Ordine di Visualizzazione', 'MODULE_SHIPPING_STOREPICKUP_SORT_ORDER', '0', 'Ordine di Visualizzazione.', 6, 0, now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('Abilita Spedizione per Articoli', 'MODULE_SHIPPING_ITEM_STATUS', 'True', 'Offrire la modalit&agrave; di spedizione il cui costo &egrave; basato sul numero di Articoli?', '6', '0', now(), NULL, 'zen_cfg_select_option(array(\'True\', \'False\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('Costo di Spedizione', 'MODULE_SHIPPING_ITEM_COST', '2.50', 'Il Costo di Spedizione indicato sar&agrave; moltiplicato per il numero di Articoli di un ordine che utilizza questo metodo di spedizione.', '6', '0', now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('Costo di Packaging', 'MODULE_SHIPPING_ITEM_HANDLING', '0', 'Costo di Packaging per questo metodo di spedizione.', '6', '0', now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('Classe IVA', 'MODULE_SHIPPING_ITEM_TAX_CLASS', '0', 'Applica la seguente aliquota IVA ai costi di spedizione.', '6', '0', now(), 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('Base di Tassa', 'MODULE_SHIPPING_ITEM_TAX_BASIS', 'Shipping', 'Su quali basi vengono calcolate le Tasse sulle Spese di Spedizione.  Le opzioni sono:<br />Shipping - Basata sull\'indirizzo di Spedizione del Cliente<br />Billing - Basata sull\'indirizzo di Fatturazione del Cliente<br />Store - Basata sull\'indirizzo del Negozio se la Zona di Fatturazione/Spedizione &egrave; uguale alla Zona del Negozio', '6', '0', now(), NULL, 'zen_cfg_select_option(array(\'Shipping\', \'Billing\', \'Store\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('Zona di Spedizione', 'MODULE_SHIPPING_ITEM_ZONE', '0', 'Se viene selezionata una Zona, attiva questo metodo di spedizione soltanto per questa Zona.', '6', '0', now(), 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('Ordine di Visualizzazione', 'MODULE_SHIPPING_ITEM_SORT_ORDER', '0', 'Ordine di Visualizzazione.', '6', '0', now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('Abilita il Modulo Ordine Gratuito', 'MODULE_PAYMENT_FREECHARGER_STATUS', 'True', 'Accettare pagamenti con questo metodo?', '6', '1', now(), NULL, 'zen_cfg_select_option(array(\'True\', \'False\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('Ordine di Visualizzazione', 'MODULE_PAYMENT_FREECHARGER_SORT_ORDER', '0', 'Ordine di Visualizzazione. Il pi&ugrave; basso viene visualizzato per primo.', '6', '0', now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('Zona di Pagamento', 'MODULE_PAYMENT_FREECHARGER_ZONE', '0', 'Se viene selezionata una Zona, attiva questo metodo di pagamento soltanto per questa Zona.', '6', '2', now(), 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('Imposta Stato Ordine', 'MODULE_PAYMENT_FREECHARGER_ORDER_STATUS_ID', '0', 'Imposta lo Stato degli Ordini eseguiti con questo modulo di pagamento a questo valore.', '6', '0', now(), 'zen_get_order_status_name', 'zen_cfg_pull_down_order_statuses(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('Abilita il Modulo Vaglia - Bonifico', 'MODULE_PAYMENT_MONEYORDER_STATUS', 'True', 'Accettare pagamenti con Vaglia - Bonifico?', '6', '1', now(), NULL, 'zen_cfg_select_option(array(\'True\', \'False\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('Intestare a favore di:', 'MODULE_PAYMENT_MONEYORDER_PAYTO', 'the Store Owner/Website Name', 'A chi dovrebbero essere intestati i pagamenti?', '6', '1', now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('Ordine di Visualizzazione', 'MODULE_PAYMENT_MONEYORDER_SORT_ORDER', '0', 'Ordine di Visualizzazione. Il pi&ugrave; basso viene visualizzato per primo.', '6', '0', now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('Zona di Pagamento', 'MODULE_PAYMENT_MONEYORDER_ZONE', '0', 'Se viene selezionata una Zona, attiva questo metodo di pagamento soltanto per questa Zona.', '6', '2', now(), 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('Imposta Stato Ordine', 'MODULE_PAYMENT_MONEYORDER_ORDER_STATUS_ID', '0', 'Imposta lo Stato degli Ordini eseguiti con questo modulo di pagamento a questo valore.', '6', '0', now(), 'zen_get_order_status_name', 'zen_cfg_pull_down_order_statuses(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('Includi Tassa', 'MODULE_ORDER_TOTAL_GROUP_PRICING_INC_TAX', 'false', 'Includi il valore della Tassa nell\'importo prima del calcolo dello sconto?', '6', '6', now(), NULL, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('Questo modulo &egrave; installato', 'MODULE_ORDER_TOTAL_GROUP_PRICING_STATUS', 'true', '', '6', '1', now(), NULL, 'zen_cfg_select_option(array(\'true\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('Ordine di Visualizzazione', 'MODULE_ORDER_TOTAL_GROUP_PRICING_SORT_ORDER', '290', 'Ordine di Visualizzazione.', '6', '2', now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('Includi Spedizione', 'MODULE_ORDER_TOTAL_GROUP_PRICING_INC_SHIPPING', 'false', 'Includi il valore della Spedizione nell\'importo prima del calcolo dello sconto?', '6', '5', now(), NULL, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('Ricalcola Tassa', 'MODULE_ORDER_TOTAL_GROUP_PRICING_CALC_TAX', 'Standard', 'Ricalcola Tassa.', '6', '7', now(), NULL, 'zen_cfg_select_option(array(\'None\', \'Standard\', \'Credit Note\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('Classe IVA', 'MODULE_ORDER_TOTAL_GROUP_PRICING_TAX_CLASS', '0', 'Usa la seguente aliquota IVA quando trattate il Gruppo di Sconto come Buono a Credito.', '6', '0', now(), 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes(');

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Abilita Spedizione Flat', 'MODULE_SHIPPING_FLAT_STATUS', 'True', 'Abilitare la modalit&agrave; di Spedizione Flat (a costo fisso)?', '6', '0', 'zen_cfg_select_option(array(\'True\', \'False\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Costo di Spedizione', 'MODULE_SHIPPING_FLAT_COST', '5.00', 'Le Spese di Spedizione per tutti gli ordini che utilizzano questo metodo di spedizione.', '6', '0', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('Classe IVA', 'MODULE_SHIPPING_FLAT_TAX_CLASS', '0', 'Applica la seguente aliquota IVA ai costi di spedizione.', '6', '0', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes(', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Base di Tassa', 'MODULE_SHIPPING_FLAT_TAX_BASIS', 'Shipping', 'Su quali basi vengono calcolate le Tasse sulle Spese di Spedizione. Le opzioni sono:<br />Shipping - Basata sull\'indirizzo di Spedizione del Cliente<br />Billing Basata sull\'indirizzo di Fatturazione del Cliente<br />Store - Basata sull\'indirizzo del Negozio se la Zona di Fatturazione/Spedizione &egrave; uguale alla Zona del Negozio', '6', '0', 'zen_cfg_select_option(array(\'Shipping\', \'Billing\', \'Store\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('Zona Spedizione', 'MODULE_SHIPPING_FLAT_ZONE', '0', 'Se &egrave; selezionata una Zona, attiva questo metodo di pagamento soltanto per questa zona.', '6', '0', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes(', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Ordine di Visualizzazione', 'MODULE_SHIPPING_FLAT_SORT_ORDER', '0', 'Ordine di Visualizzazione.', '6', '0', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Valuta di Default', 'DEFAULT_CURRENCY', 'EUR', 'Valuta di Default', '6', '0', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Lingua di Default', 'DEFAULT_LANGUAGE', 'it', 'Lingua di Default', '6', '0', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Stato Ordine di Default per i Nuovi Ordini', 'DEFAULT_ORDERS_STATUS_ID', '1', 'Quando un nuovo Ordine viene creato, gli sar&agrave; assegnato questo Stato ordine.', '6', '0', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Admin - mostra configuration_key', 'ADMIN_CONFIGURATION_KEY_ON', '0', 'Commuta manualmente a valore 1 per vedere il nome configuration_key nelle visualizzazioni di configurazione', '6', '0', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('Paese di origine', 'SHIPPING_ORIGIN_COUNTRY', '105', 'Seleziona lo Stato di provenienza (origine) da utilizzare nelle quotazioni dei costi di spedizione.', '7', '1', 'zen_get_country_name', 'zen_cfg_pull_down_country_list(', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Cap', 'SHIPPING_ORIGIN_ZIP', 'NONE', 'Inserisci il Codice Avviamento Postale (CAP) del negozio che sar&agrave; utilizzato per le quotazioni dei costi di spedizione. NOTA: Per l\'Italia, inserisci il Cap a 5 cifre.', '7', '2', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Inserisci il Massimo Peso per Imballo spedibile', 'SHIPPING_MAX_WEIGHT', '50', 'I Corrieri (Vettori) hanno un limite di peso massimo per il singolo imballo. Questo valore &egrave; in comune per tutti.', '7', '3', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Tara dell\'imballo Piccolo-Medio - aggiunta percentuale:peso', 'SHIPPING_BOX_WEIGHT', '0:3', 'Qual &egrave; il peso di un tipico imballo per pacchi da piccole a medie dimensioni ?<br />Esempio: 10% + 1Kg 10:1<br />10% + 0lKg 10:0<br />0% + 5Kg 0:5<br />0% + 0Kg 0:0', '7', '4', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Tara dell\'imballo Grande - aggiunta percentuale:peso', 'SHIPPING_BOX_PADDING', '10:0', 'Qual &egrave; il peso di un tipico imballo per pacchi di grandi dimensioni ?<br />Example: 10% + 1Kg 10:1<br />10% + 0Kg 10:0<br />0% + 5Kg 0:5<br />0% + 0Kg 0:0', '7', '5', now());

# moved to product_types
#INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Product Virtual Default Status - Skip Shipping Address', 'PRODUCTS_VIRTUAL_DEFAULT', '0', 'What should the Default Virtual Product status be when adding new products?<br /><br />0= Virtual Product Defaults to OFF<br />1= Virtual Product Defaults to ON<br />NOTE: Virtual Products do not require a Shipping Address', '7', '10', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
#INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Product Free Shipping Default Status - Normal Shipping Rules', 'PRODUCTS_IS_ALWAYS_FREE_SHIPPING_DEFAULT', '0', 'What should the Default Free Shipping status be when adding new products?<br /><br />0= Free Shipping Defaults to OFF<br />1= Free Shipping Defaults to ON<br />NOTE: Free Shipping Products require a Shipping Address', '7', '11', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Mostra Numero di Imballi e Peso', 'SHIPPING_BOX_WEIGHT_DISPLAY', '3', 'Mostra Peso di Spedizione e Numero di Imballi?<br /><br />0= off<br />1= Solo Imballi<br />2= Solo Peso<br />3= Sia Peso che Imballi', '7', '15', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Impostazioni di visualizzazione della Stima dei Costi di Spedizione nel Carrello', 'SHOW_SHIPPING_ESTIMATOR_BUTTON', '1', '<br />0= Off<br />1= Visualizza come Pulsante nel Carrello<br />2= Visualizza come elencazione nella pagina del Carrello', '7', '20', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('Aggiungi i commenti alla stampa delle fatture', 'ORDER_COMMENTS_INVOICE', '1', 'Si desidera inserire nella stampa delle fatture anche i commenti relativi all\'ordine?<br />0= OFF<br />1= Solo il primo commento del cliente<br />2= Tutti i commenti relativi all\'ordine', '7', '25', now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('Aggiungi i commenti alla stampa delle etichette pacco', 'ORDER_COMMENTS_PACKING_SLIP', '1', 'Si desidera inserire nella stampa delle etichette pacco anche i commenti relativi all\'ordine?<br />0= OFF<br />1= Solo il primo commento del cliente<br />2= Tutti i commenti relativi all\'ordine', '7', '26', now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ');


INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Abilito Spedizione Gratuita per Ordine con Peso = 0 ?', 'ORDER_WEIGHT_ZERO_STATUS', '0', 'Se non c\'&egrave; alcun peso nell\'ordine, vuoi spedire con Spedizione Gratuita ?<br />0= no<br />1= si<br /><br />Nota: Quando utilizzi Spedizione Gratuita, abilitando il Modulo Spedizione Gratuita questo sar&agrave; visualizzato solamente quando la Spedizione &egrave; Gratuita.', '7', '15', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Mostra Immagine Prodotto', 'PRODUCT_LIST_IMAGE', '1', 'Vuoi visualizzare l\'Immagine Prodotto ?<br />0= no<br />1= si', '8', '1', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Mostra Nome Produttore','PRODUCT_LIST_MANUFACTURER', '0', 'Vuoi visualizzare il Nome del Produttore ?<br />0= no<br />1= si', '8', '2', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Mostra Modello Prodotto', 'PRODUCT_LIST_MODEL', '0', 'Vuoi visualizzare il Modello Prodotto ?<br />0= no<br />1= si', '8', '3', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Mostra Nome Prodotto', 'PRODUCT_LIST_NAME', '2', 'Vuoi visualizzare il Nome Prodotto ?<br />0= no<br />1= si', '8', '4', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Mostra Prezzo/Aggiungi al Carrello', 'PRODUCT_LIST_PRICE', '3', 'Vuoi visualizzare il pulsante Prezzo/Aggiungi al Carrello ?<br />0= no<br />1= si', '8', '5', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Mostra Quantit&agrave; Prodotto', 'PRODUCT_LIST_QUANTITY', '0', 'Vuoi visualizzare la Quantit&agrave; Prodotto ?<br />0= no<br />1= si', '8', '6', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Mostra Peso Prodotto', 'PRODUCT_LIST_WEIGHT', '0', 'Vuoi visualizzare il Peso Prodotto ?<br />0= no<br />1= si', '8', '7', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Mostra Prezzo/Aggiungi al Carrello - Larghezza Colonna', 'PRODUCTS_LIST_PRICE_WIDTH', '125', 'Definisce la larghezza della colonna Prezzo/Aggiungi al Carrello.<br />Default= 125', '8', '8', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Mostra Filtro Categoria/Produttore', 'PRODUCT_LIST_FILTER', '1', 'Vuoi visualizzare il filtro Categoria/Produttore ?<br />0= no<br />1= si', '8', '9', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Posizione Pagina Navigazione Prec./Succ.', 'PREV_NEXT_BAR_LOCATION', '3', 'Imposta la posizione della barra di navigazione Prec./Succ.<br />1= Alto<br />2= Basso<br />3= Entrambe', '8', '10', 'zen_cfg_select_option(array(\'1\', \'2\', \'3\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Ordine di visualizzazione di default nell\'elencazione prodotti', 'PRODUCT_LISTING_DEFAULT_SORT_ORDER', '', 'Ordine visualizzazione di Default nell\'Elencazione Prodotti ?<br />NOTA: Lasciare lo spazio in bianco per l\'ordine di elencazione prodotti. Dispone la visualizzazione Prodotti nell\'ordine che desideri per la visualizzazione iniziale di default.<br />Esempio: 2a', '8', '15', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Mostra il pulsante Aggiungi Prodotto al Carrello (0=NO; 1=SI; 2=SI con box quantit&agrave; per prodotto)', 'PRODUCT_LIST_PRICE_BUY_NOW', '1', 'Vuoi visualizzare il bottone Aggiungi al Carrello? <br /><br /><strong>NOTA:</strong> Disabilita la voce Mostra i campi quantit&agrave; per Aggiungi Prodotti Multipli per utilizzare l\'Opzione 2 con Box Quantit&agrave; per Prodotto', '8', '20', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Mostra i campi quantit&agrave; per Aggiungi Prodotti Multipli e imposta la posizione del Pulsante', 'PRODUCT_LISTING_MULTIPLE_ADD_TO_CART', '3', 'Vuoi visualizzare i campi quantit&agrave; per Aggiungi Prodotti Multipli e imposta posizione del Pulsante ?<br />0= off<br />1= Alto<br />2= Basso<br />3= Entrambe', '8', '25', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Mostra Descrizione Prodotto', 'PRODUCT_LIST_DESCRIPTION', '150', 'Vuoi visualizzare la Descrizione Prodotto ?<br /><br />0= OFF<br />150= Lunghezza suggerita, o inserisci il numero massimo di caratteri da visualizzare.', '8', '30', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Simbolo Elencazione Prodotti in Ordine Ascendente', 'PRODUCT_LIST_SORT_ORDER_ASCENDING', '+', 'Cosa desideri utilizzare per indicare l\'ordine di visualizzazione Ascendente?<br />Default = +', '8', '40', NULL, now(), NULL, 'zen_cfg_textarea_small(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Simbolo Elencazione Prodotti in Ordine Discendente', 'PRODUCT_LIST_SORT_ORDER_DESCENDING', '-', 'Cosa desideri utilizzare per indicare l\'ordine di visualizzazione Discendente?<br />Default = -', '8', '41', NULL, now(), NULL, 'zen_cfg_textarea_small(');

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Includi dropdown con ordinamento alfabetico su elenco prodotti', 'PRODUCT_LIST_ALPHA_SORTER', 'true', 'Vuoi includere un dropdown  con ordinamento alfabetico su elenco prodotti?', '8', '50', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Includi immagine sotto-categorie nella lista prodotti', 'PRODUCT_LIST_CATEGORIES_IMAGE_STATUS', 'true', 'Vuoi includere l\'immagine delle sotto-categorie nellla lista prodotti?', '8', '52', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Includi immagine categorie principali nellla lista prodotti', 'PRODUCT_LIST_CATEGORIES_IMAGE_STATUS_TOP', 'true', 'Vuoi includere l\'immagine delle categorie principali nellla lista prodotti?', '8', '53', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Mostra Sotto-Categorie in Pagina Principale durante la navigazione', 'PRODUCT_LIST_CATEGORY_ROW_STATUS', '1', 'Mostra Sotto-Categorie nella Pagina Principale durante la navigazione nelle Categorie<br /><br />0= off<br />1= on', '8', '60', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Controlla Livello scorte di magazzino', 'STOCK_CHECK', 'true', 'Effettua un controllo per verificare se &egrave; disponibile in magazzino una quantit&agrave; sufficiente.', '9', '1', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Sottrae da magazzino', 'STOCK_LIMITED', 'true', 'Sottrae quantit&agrave; dai prodotti in magazzino in base ai prodotti ordinati.', '9', '2', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Consenti Checkout', 'STOCK_ALLOW_CHECKOUT', 'true', 'Consente al Cliente di effettuare il checkout anche se non &egrave; disponibile una quantit&agrave; sufficiente', '9', '3', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Marca prodotto come esaurito', 'STOCK_MARK_PRODUCT_OUT_OF_STOCK', '***', 'Visualizza qualcosa sullo schermo in modo che il cliente possa vedere che il prodotto non &egrave; disponibile in quantit&agrave; sufficiente.', '9', '4', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Imposta livello minimo di magazzino per il riordino', 'STOCK_REORDER_LEVEL', '5', 'Definisce la quantit&agrave; al di sotto della quale il prodotto necessita di essere ri-ordinato.', '9', '5', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Lo Stato Prodotti in Catalogo quando sono esauriti deve essere impostato a', 'SHOW_PRODUCTS_SOLD_OUT', '0', 'Visualizzo i Prodotti quando esauriti?<br /><br />0= imposta stato del prodotto ad OFF<br />1= lascia lo stato del prodotto ad ON', '9', '10', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Visualizzare l\'immagine Esaurito al posto dell\'immagine Aggiungi al Carrello', 'SHOW_PRODUCTS_SOLD_OUT_IMAGE', '1', 'Visualizzare l\'immagine Esaurito al posto dell\'immagine del pulsante Aggiungi al Carrello.<br />0= no<br />1= si', '9', '11', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Numero decimali in Quantit&agrave; Prodotto', 'QUANTITY_DECIMALS', '0', 'Quanti decimali utilizzare in quantit&agrave; prodotto<br /><br />0= off', '9', '15', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Carrello - mostra i Checkboxes Elimina o il pulsante Elimina', 'SHOW_SHOPPING_CART_DELETE', '3', 'Mostra nel Carrello il Pulsante Elimina e/o i Checkboxes.<br /><br />1= Solo Pulsante Elimina<br />2= Solo Checkbox<br />3= Sia Pulsante Elimina che Checkbox', '9', '20', 'zen_cfg_select_option(array(\'1\', \'2\', \'3\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Carrello - posizione del pulsante Aggiorna Carrello', 'SHOW_SHOPPING_CART_UPDATE', '3', 'Mostra nel Carrello il Pulsante Aggiorna Carrello posizionandolo:<br /><br />1= Vicino ad ogni campo Quantit&agrave;<br />2= Sotto a tutti i Prodotti<br />3= Sia vicino ad ogni campo Quantit&agrave; che sotto a tutti i Prodotti', '9', '22', 'zen_cfg_select_option(array(\'1\', \'2\', \'3\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Mostra Nuovi Prodotti in Pagina Carrello se vuoto', 'SHOW_SHOPPING_CART_EMPTY_NEW_PRODUCTS', '1', 'Mostra Nuovi Prodotti in Pagina Carrello se vuoto<br />0= NO oppure indica ordine di visualizzazione', '9', '30', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Mostra Prodotti in Vetrina in Pagina Carrello se vuoto', 'SHOW_SHOPPING_CART_EMPTY_FEATURED_PRODUCTS', '2', 'Mostra Prodotti in Vetrina in Pagina Carrello se vuoto<br />0= NO oppure indica ordine di visualizzazione', '9', '31', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Mostra Prodotti in Promozione in Pagina Carrello se vuoto', 'SHOW_SHOPPING_CART_EMPTY_SPECIALS_PRODUCTS', '3', 'Mostra Prodotti in Promozione in Pagina Carrello se vuoto<br />0= NO oppure indica ordine di visualizzazione', '9', '32', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Mostra Prodotti in Arrivo in Pagina Carrello se vuoto', 'SHOW_SHOPPING_CART_EMPTY_UPCOMING', '4', 'Mostra Prodotti in Arrivo in Pagina Carrello se vuoto<br />0= NO oppure indica ordine di visualizzazione', '9', '33', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Disponi avviso di integrazione carrello al login', 'SHOW_SHOPPING_CART_COMBINED', '1', 'Quando il cliente accede al proprio carrello con presenti articoli inseriti durante una sua precedente visita, aggiungendo un nuovo articolo, questo verr&agrave; sommato a quelli gi&agrave; presenti.<br /><br />Disporre l\'avviso di integrazione carrello al login?<br /><br />0= OFF, non comparir&agrave; alcun avviso<br />1= S&igrave; disponi l\'avviso e vai al carrello<br />2= S&igrave; disponi l\'avviso ma non andare al carrello', '9', '35', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Memorizza Page Parse Time', 'STORE_PAGE_PARSE_TIME', 'false', 'Memorizza il tempo richiesto per restituire una pagina.', '10', '1', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Log - Cartella di destinazione', 'STORE_PAGE_PARSE_TIME_LOG', '/var/log/www/zen/page_parse_time.log', 'Cartella e filename del log page parse time.', '10', '2', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Log - Formato Data', 'STORE_PARSE_DATE_TIME_FORMAT', '%d/%m/%Y %H:%M:%S', 'Il formato della data nel Log.', '10', '3', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Visualizza Page Parse Time', 'DISPLAY_PAGE_PARSE_TIME', 'false', 'Visualizza l\'Analisi del Tempo di Restituzione Pagina nella parte inferiore di ogni pagina.<br />Non &egrave; necessario memorizzare i tempi per visualizzarli nel Catalogo.', '10', '4', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Memorizza le interrogazioni Database', 'STORE_DB_TRANSACTIONS', 'false', 'Memorizza le interrogazioni database nel log del page parse time (solo<PHP4).', '10', '5', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Email - Metodo di invio', 'EMAIL_TRANSPORT', 'PHP', 'Definisce il metodo di inoltro delle mail.<br /><strong>PHP</strong> &egrave; di default ed usa il PHP wrapper quale processo.<br />Servers con Windows e MacOS cambieranno il settaggio in <strong>SMTP</strong>.<br /><br /><strong>SMTPAUTH</strong> dovrebbe essere usato solo se l\'autorizzazione SMTP &egrave; richiesta. Sar&agrave; necessario configurare il settaggio SMTPAUTH con gli appositi campi previsti nella sezione amministrativa.<br /><br /><strong>Sendmail</strong> &egrave; per hosting linux/unix che utilizzino questo processo<br /><strong>"sendmail-f"</strong> solo per servers che richiedono l\'utilizzo del parametro -f per invio mail. Questo &egrave; un settaggio di sicurezza per prevenire lo spoofing. Dar&agrave; errore se il server non &egrave; configurato all\'uso.<br /><br /><strong>Qmail</strong> &egrave; utilizzato per host linux/unix che utilizzano Qmail come sendmail wrapper in /var/qmail/bin/sendmail.', '12', '1', 'zen_cfg_select_option(array(\'PHP\', \'sendmail\', \'sendmail-f\', \'smtp\', \'smtpauth\', \'Qmail\'),', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('SMTP Email Account Mailbox', 'EMAIL_SMTPAUTH_MAILBOX', 'YourEmailAccountNameHere', 'Inserisci il nome account per il tuo mailbox (nome@miosito.com) fornito dal tuo host. Questo &egrave; il nome account che il tuo host richiede per la Autenticazione SMTP.<br />Richiesto solamente se stai utilizzando la Autenticazione SMTP per le email.', '12', '101', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function) VALUES ('SMTP Email Account Password', 'EMAIL_SMTPAUTH_PASSWORD', 'YourPasswordHere', 'Inserisci la password per il tuo mailbox SMTP. <br />Richiesto solamente se stai utilizzando la Autenticazione SMTP per le email.', '12', '101', now(), 'zen_cfg_password_display');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('SMTP Email Mail Host', 'EMAIL_SMTPAUTH_MAIL_SERVER', 'mail.EnterYourDomain.com', 'Inserisci il nome DNS del tuo server mail SMTP.<br />esempio: mail.miosito.com<br />oppure 55.66.77.88<br />Richiesto solamente se stai utilizzando la Autenticazione SMTP per le email.', '12', '101', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('SMTP Email Mail Server Port', 'EMAIL_SMTPAUTH_MAIL_SERVER_PORT', '25', 'Inserisci il numero IP della porta su cui opera il mailserver SMTP.<br />Richiesto solamente se stai utilizzando la Autenticazione SMTP per le email.', '12', '101', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Email Linefeeds', 'EMAIL_LINEFEED', 'LF', 'Definisce la sequenza di caratteri utilizzata per separare le intestazioni delle email.', '12', '2', 'zen_cfg_select_option(array(\'LF\', \'CRLF\'),', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Usa MIME HTML nell\'invio delle Emails', 'EMAIL_USE_HTML', 'false', 'Invia le e-mails in formato HTML.', '12', '3', 'zen_cfg_select_option(array(\'true\', \'false\'),', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Verifica l\'indirizzo Email attraverso il DNS', 'ENTRY_EMAIL_ADDRESS_CHECK', 'false', 'Verifica l\'indirizzo email attraverso un server DNS', '6', '6', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Invia Email', 'SEND_EMAILS', 'true', 'Invia Email', '12', '5', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Email Archiviazione Attiva?', 'EMAIL_ARCHIVE', 'false', 'Se desideri che i messaggi email siano archiviati/memorizzati quando inviati, imposta questo valore a "true".', '12', '6', 'zen_cfg_select_option(array(\'true\', \'false\'),', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('E-Mail Friendly-Errors', 'EMAIL_FRIENDLY_ERRORS', 'true', 'Volete mostrare friendly errors se le email falliscono?<br />Settandolo a  false verranno mostrati errori PHP e probabilmente faranno fallire lo script. Settate false solo quando risolvete i problemi, e true per un negozio live.
Do you want to display friendly errors if emails fail?  Setting this to false will display PHP errors and likely cause the script to fail. Only set to false while troubleshooting, and true for a live shop.', '12', '7', 'zen_cfg_select_option(array(\'true\', \'false\'),', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Email Indirizzo (Visualizzato in Contatti)', 'STORE_OWNER_EMAIL_ADDRESS', 'root@localhost', 'EIndirizzo Email del Proprietario del Negozio. Usato come "sola visualizzazione" quando vengono fornite ai clienti informazioni su come contattarti.', '12', '10', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Email Indirizzo (inviata DA)', 'EMAIL_FROM', 'Zen Cart <root@localhost>', 'L\'indirizzo dal quale i messaggi email saranno inviati per default. Pu&ograve; essere sovrascritto al momento della composizione nei moduli in admin.', '12', '11', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function) VALUES ('Emails devono essere inviate da un dominio conosciuto?', 'EMAIL_SEND_MUST_BE_STORE', 'No', 'Il tuo mailserver richiede che tutte le email in uscita abbiano il loro indirizzo "da" corrispondente ad un dominio conosciuto che esiste sul tuo webserver?<br /><br />Questo &egrave; spesso impostato in modo da prevenire spoofing e spam broadcasts.  Se impostato a Yes, questo far&agrav; si che l\'indirizzo email (inviato DA) sia usato come indirizzo "da" in tutte le email in uscita.', 12, 11, NULL, 'zen_cfg_select_option(array(\'No\', \'Yes\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function) VALUES ('Email Formato Admin?', 'ADMIN_EXTRA_EMAIL_FORMAT', 'TEXT', 'Per favore seleziona il formato delle email Admin extra.', 12, 12, NULL, 'zen_cfg_select_option(array(\'TEXT\', \'HTML\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Invia una copia della email di Conferma Ordine a', 'SEND_EXTRA_ORDER_EMAILS_TO', '', 'Invia una copia della email di Conferma Ordine ai seguenti indirizzi email, in questo formato: Nome 1 &lt;email@indirizzo1&gt;, Nome 2 &lt;email@indirizzo2&gt;', '12', '12', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Abilito invio di una copia della email di Creazione Account', 'SEND_EXTRA_CREATE_ACCOUNT_EMAILS_TO_STATUS', '0', 'Abilito invio di una copia della email di Creazione Account<br />0= no<br />1= si', '12', '13', 'zen_cfg_select_option(array(\'0\', \'1\'),', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Invia una copia della email di Creazione Account a', 'SEND_EXTRA_CREATE_ACCOUNT_EMAILS_TO', '', 'Invia una copia della email di Crezione Account ai seguenti indirizzi email, in questo formato: Nome 1 &lt;email@indirizzo1&gt;, Nome 2 &lt;email@indirizzo2&gt;', '12', '14', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Abilito ricezione di una copia della email di invio GV da Cliente a Cliente', 'SEND_EXTRA_GV_CUSTOMER_EMAILS_TO_STATUS', '0', 'Abilito invio di una copia della email di invio GV da Cliente a Cliente<br />0= no<br />1= si', '12', '17', 'zen_cfg_select_option(array(\'0\', \'1\'),', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Invia una copia della email di invio GV da Cliente a Cliente', 'SEND_EXTRA_GV_CUSTOMER_EMAILS_TO', '', 'Invia una copia della email di invio GV da Cliente a Cliente ai seguenti indirizzi email, in questo formato: Nome 1 &lt;email@indirizzo1&gt;, Nome 2 &lt;email@indirizzo2&gt;', '12', '18', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Abilito ricezione di una copia della email di invio GV da Admin', 'SEND_EXTRA_GV_ADMIN_EMAILS_TO_STATUS', '0', 'Abilito invio di una copia della email di invio GV da Admin<br />0= no<br />1= si', '12', '19', 'zen_cfg_select_option(array(\'0\', \'1\'),', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Invia una copia della email di GV da Admin a Cliente', 'SEND_EXTRA_GV_ADMIN_EMAILS_TO', '', 'Invia una copia della email di GV da Admin ai seguenti indirizzi email, in questo formato: Nome 1 &lt;email@indirizzo1&gt;, Nome 2 &lt;email@indirizzo2&gt;', '12', '20', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Abilito invio di una copia della email di Admin Buono Sconto Mail Emails', 'SEND_EXTRA_DISCOUNT_COUPON_ADMIN_EMAILS_TO_STATUS', '0', 'Abilito invio di una copia della email di Admin Buono Sconto Mail Emails<br />0= no<br />1= si', '12', '21', 'zen_cfg_select_option(array(\'0\', \'1\'),', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Invia una copia della email di Customer Admin Buono Sconto Mail Emails To', 'SEND_EXTRA_DISCOUNT_COUPON_ADMIN_EMAILS_TO', '', 'Invia una copia della email di Admin Buono Sconto Mail ai seguenti indirizzi email, in questo formato: Nome 1 &lt;email@indirizzo1&gt;, Nome 2 &lt;email@indirizzo2&gt;', '12', '22', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Abilito invio di una copia della email di Stato Ordini Admin', 'SEND_EXTRA_ORDERS_STATUS_ADMIN_EMAILS_TO_STATUS', '0', 'Abilito invio di una copia della email di Stato Ordini Admin<br />0= no<br />1= si', '12', '23', 'zen_cfg_select_option(array(\'0\', \'1\'),', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Invia una copia della email di Stato Ordini Admin a', 'SEND_EXTRA_ORDERS_STATUS_ADMIN_EMAILS_TO', '', 'Invia una copia della email di Stato Ordini Admin ai seguenti indirizzi email, in questo formato: Nome 1 &lt;email@indirizzo1&gt;, Nome 2 &lt;email@indirizzo2&gt;', '12', '24', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Abilito invio di una copia della email di Recensioni in Attesa', 'SEND_EXTRA_REVIEW_NOTIFICATION_EMAILS_TO_STATUS', '0', 'Abilito invio di una copia della email di Recensioni in Attesa<br />0= no<br />1= si', '12', '25', 'zen_cfg_select_option(array(\'0\', \'1\'),', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Invia una copia della email di Recensioni in Attesa a', 'SEND_EXTRA_REVIEW_NOTIFICATION_EMAILS_TO', '', 'Invia una copia della email di Recensioni in Attesa ai seguenti indirizzi email, in questo formato: Nome 1 &lt;email@indirizzo1&gt;, Nome 2 &lt;email@indirizzo2&gt;', '12', '26', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Impostazioni Elenco a Discesa delle Email "Per Contattarci"', 'CONTACT_US_LIST', '', 'Nella pagina "Per Contattarci", imposta l\'elenco degli indirizzi email, in questo formato: Nome 1 &lt;email@indirizzo1&gt;, Nome 2 &lt;email@indirizzo2&gt;', '12', '40', 'zen_cfg_textarea(', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Per Contattarci - Mostra Nome Negozio ed Indirizzo', 'CONTACT_US_STORE_NAME_ADDRESS', '1', 'Includere Nome Negozio e Indirizzo<br />0= no<br />1= si', '12', '50', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Abilito invio Extra di Emails segnalazione Bassa Scorta di magazzino', 'SEND_LOWSTOCK_EMAIL', '0', 'Abilito invio di Email per segnalazione Bassa Scorta di magazzino<br />0= no<br />1= si', '12', '60', now(), now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Invio di Email segnalazione Bassa Scorta di magazzino a', 'SEND_EXTRA_LOW_STOCK_EMAILS_TO', '', 'Quando il livello scorte di magazzino &egrave; al valore minimo o al di sotto di esso invia una email a questi indirizzi, in questo formato: Nome 1 &lt;email@indirizzo1&gt;, Nome 2 &lt;email@indirizzo2&gt;', '12', '61', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Mostra il link "Cancellazione Newsletter"?', 'SHOW_NEWSLETTER_UNSUBSCRIBE_LINK', 'true', 'Mostra il link "Cancellazione Newsletter" nel box laterale "Informazioni"?', '12', '70', 'zen_cfg_select_option(array(\'true\', \'false\'),', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Mostra Contatore Elenco Clienti', 'AUDIENCE_SELECT_DISPLAY_COUNTS', 'true', 'Quando vengono visualizzate le liste degli utenti/destinatari disponibili, dovr&agrave; essere incluso il contatore dei destinatari? <br /><em>(Questo pu&ograve; rallentare il processo se avete molti clienti o queries complesse di utenti)</em>', '12', '90', 'zen_cfg_select_option(array(\'true\', \'false\'),', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Abilita Downloads', 'DOWNLOAD_ENABLED', 'true', 'Abilita la funzione di download prodotti.', '13', '1', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Download tramite Redirect', 'DOWNLOAD_BY_REDIRECT', 'true', 'Usa la redirection del browser per il download. Disabilitato su sistemi non-Unix.<br /><br />Nota: Impostare gli attributi lettura/scrittura di /pub a 777 quando redirect &egrave; true', '13', '2', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Download tramite streaming', 'DOWNLOAD_IN_CHUNKS', 'false', 'Se download-tramite-redirect &egrave; disabilitato, ed il tuo PHP memory_limit &egrave; impostato  meno di 8 MB, potresti aver necessit&agrave; di abilitare questa impostazione per fare in modo che i files vengano inviati in segmenti pi&ugrave; piccoli al browser.<br /><br />Non ha alcun effetto se Download tramite Redirect &egrave; abilitato.', '13', '2', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Download Tempo Scadenza (Numero di Giorni)' ,'DOWNLOAD_MAX_DAYS', '7', 'Imposta il numero di giorni prima che scada il link al download. 0 significa illimitato.', '13', '3', '', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Numero di Downloads Consentiti - Per Prodotto' ,'DOWNLOAD_MAX_COUNT', '5', 'Imposta il numero massimo di downloads. 0 significa che non sono autorizzati downloads.', '13', '4', '', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Gestore Downloads - Valore Stato per Aggiornamento', 'DOWNLOADS_ORDERS_STATUS_UPDATED_VALUE', '4', 'Quale valore di orders_status resetta i Giorni Download ed i Massimi Downloads - Default &egrave; 4', '13', '10', now(), now(), NULL , NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Gestore Downloads - Valore Stato Ordine - valore >= valore inferiore', 'DOWNLOADS_CONTROLLER_ORDERS_STATUS', '2', 'Imposta il Valore Stato Ordine<br />I Downloads sono disponibili dopo il checkout in base allo stato ordini. Gli Ordini con lo Stato ordine maggiore di questo valore consentiranno il download. Lo Stato Ordine per gli ordini &egrave; impostato tramite i Moduli di Pagamento. Imposta il valore del limite inferiore per questo range.<br />Default >= 2', '13', '12', now(), now(), NULL , NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Gestore Downloads - Valore Stato Ordine - valore <= valore superiore', 'DOWNLOADS_CONTROLLER_ORDERS_STATUS_END', '4', 'Imposta il Valore Stato Ordine<br />I Downloads sono disponibili dopo il checkout in base allo stato ordini. Gli Ordini con lo Stato ordine minore di questo valore consentiranno il download. Lo Stato Ordine per gli ordini &egrave; impostato tramite i Moduli di Pagamento. Imposta il valore del limite superiore per questo range.<br />Default <= 4', '13', '13', now(), now(), NULL , NULL);

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Abilita Fattore Prezzo', 'ATTRIBUTES_ENABLED_PRICE_FACTOR', 'true', 'Abilita gli Attributi Fattore Prezzo.', '13', '25', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Abilita Sconto Prezzo per Quantit&agrave;', 'ATTRIBUTES_ENABLED_QTY_PRICES', 'true', 'Abilita gli Attributi Sconti Prezzi per Quantit&agrave;.', '13', '26', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Abilita Attributi Immagine', 'ATTRIBUTES_ENABLED_IMAGES', 'true', 'Abilita gli Attributi Immagini.', '13', '28', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Abilita Prezzatura Testo per parola o lettera', 'ATTRIBUTES_ENABLED_TEXT_PRICES', 'true', 'Abilita gli Attributi Prezzatura Testo per parola o lettera.', '13', '35', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Prezzatura Testo - Gli Spazi sono Gratis?', 'TEXT_SPACES_FREE', '1', 'Nella prezzatura Testo gli Spazi sono Gratis?<br /><br />0= no<br />1= si', '13', '36', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Tipo Opzione Sola Lettura - Ignorare pulsante Aggiungi al Carrello', 'PRODUCTS_OPTIONS_TYPE_READONLY_IGNORED', '1', 'Quando un Prodotto usa soltanto attributi di tipo Sola Lettura, il pulsante Aggiungi al Carrello deve essere On o Off?<br />0= OFF<br />1= ON', '13', '37', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Abilita Compressione GZip', 'GZIP_LEVEL', '0', 'Abilito Compressione GZip?<br />0= no<br />1= si', '14', '1', 'zen_cfg_select_option(array(\'0\', \'1\'),', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Cartella Sessioni', 'SESSION_WRITE_DIRECTORY', '/tmp', 'Se le Sessioni sono basate su files, memorizzale in questa cartella.', '15', '1', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Dominio Cookie', 'SESSION_USE_FQDN', 'True', 'Se impostato a True il nome completo del dominio sar&agrave; utilizzato per memorizzare il cookie, Esempio: www.miodominio.com. Se False solo una parte del nome dominio sar&agrave; utilizzata Esempio: miodominio.com. Se non sei sicuro riguardo a questa impostazione, lasciala sempre settata su true.', '15', '2', 'zen_cfg_select_option(array(\'True\', \'False\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Forza utilizzo dei Cookie', 'SESSION_FORCE_COOKIE_USE', 'False', 'Forza l\'utilizzo delle sessioni quando i cookies sono abilitati.', '15', '2', 'zen_cfg_select_option(array(\'True\', \'False\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Verifica ID Sessione SSL', 'SESSION_CHECK_SSL_SESSION_ID', 'False', 'Verifica l\'SSL_SESSION_ID ad ogni richiesta di una pagina sicura HTTPS.', '15', '3', 'zen_cfg_select_option(array(\'True\', \'False\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Verifica User Agent', 'SESSION_CHECK_USER_AGENT', 'False', 'Verifica l\'User Agent clients browser ad ogni pagina richiesta.', '15', '4', 'zen_cfg_select_option(array(\'True\', \'False\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Verifica Indirizzo IP', 'SESSION_CHECK_IP_ADDRESS', 'False', 'Verifica l\'indirizzo IP del cliente ad ogni pagina richiesta.', '15', '5', 'zen_cfg_select_option(array(\'True\', \'False\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Previene Sessioni Spider', 'SESSION_BLOCK_SPIDERS', 'True', 'Previene gli spiders conosciuti dall\'iniziare una sessione.', '15', '6', 'zen_cfg_select_option(array(\'True\', \'False\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Ricrea Sessione', 'SESSION_RECREATE', 'True', 'Ricrea la sessione per generare un nuovo ID di sessione quando il cliente effettua il login o crea un account (&egrave; richiesto PHP >=4.1).', '15', '7', 'zen_cfg_select_option(array(\'True\', \'False\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Conversione da IP a Host - Stato', 'SESSION_IP_TO_HOST_ADDRESS', 'true', 'Converte Indirizzo IP ad Indirizzo Host<br /><br />Nota: su alcuni servers questo pu&ograve; rallentare il processo di avvio di una sessione o l\'esecuzione di Email', '15', '10', 'zen_cfg_select_option(array(\'true\', \'false\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Lunghezza del Codice di Riscossione', 'SECURITY_CODE_LENGTH', '10', 'Inserisci la lunghezza del Codice di Riscossione<br />Una lunghezza maggiore corrisponde ad una sicurezza maggiore', '16', '1', NULL, now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, use_function, date_added) VALUES ('Stato di Default per gli Ordini con importo Totale = 0', 'DEFAULT_ZERO_BALANCE_ORDERS_STATUS_ID', '2', 'Quando il Totale di un Ordine &egrave; zero, questo stato sar&agrave; assegnato all\'ordine.', '16', '0', 'zen_cfg_pull_down_order_statuses(', 'zen_get_order_status_name', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Nuova Iscrizione ID# Buono Sconto', 'NEW_SIGNUP_DISCOUNT_COUPON', '', 'Seleziona il coupon<br />', '16', '75', NULL, now(), NULL, 'zen_cfg_select_coupon_id(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Nuova Iscrizione Importo Buono Regalo', 'NEW_SIGNUP_GIFT_VOUCHER_AMOUNT', '', 'Lascia lo spazio in bianco o inserisci un importo.<br />Esempio: 10 per 10.00EUR', 16, 76, NULL, now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Buoni Sconto - Numero massimo per Pagina', 'MAX_DISPLAY_SEARCH_RESULTS_DISCOUNT_COUPONS', '20', 'Buoni Sconto - Numero massimo da visualizzare per Pagina.', '16', '81', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Buoni Sconto - Numero massimo di risultati da elencare nella Pagina Rapporti', 'MAX_DISPLAY_SEARCH_RESULTS_DISCOUNT_COUPONS_REPORTS', '20', 'Buoni Sconto - Numero massimo da elencare nella Pagina Rapporti.', '16', '81', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Abilitazione Carta di Credito - VISA', 'CC_ENABLED_VISA', '1', 'Accettare VISA ?<br />0= no<br />1= si', '17', '1', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Abilitazione Carta di Credito - MasterCard', 'CC_ENABLED_MC', '1', 'Accettare MasterCard ?<br />0= no<br />1= si', '17', '2', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Abilitazione Carta di Credito - AmericanExpress', 'CC_ENABLED_AMEX', '0', 'Accettare AmericanExpress ?<br />0= no<br />1= si', '17', '3', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Abilitazione Carta di Credito - Diners Club', 'CC_ENABLED_DINERS_CLUB', '0', 'Accettare Diners Club ?<br />0= no<br />1= si', '17', '4', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Abilitazione Carta di Credito - Discover Card', 'CC_ENABLED_DISCOVER', '0', 'Accettare Discover Card ?<br />0= no<br />1= si', '17', '5', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Abilitazione Carta di Credito - JCB', 'CC_ENABLED_JCB', '0', 'Accettare JCB ?<br />0= no<br />1= si', '17', '6', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Abilitazione Carta di Credito - AUSTRALIAN BANKCARD', 'CC_ENABLED_AUSTRALIAN_BANKCARD', '0', 'Accettare AUSTRALIAN BANKCARD ?<br />0= no<br />1= si', '17', '7', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Attiva carta di credito - SOLO', 'CC_ENABLED_SOLO', '0', 'Accetta carta di credito SOLO 0= no 1= si', '17', '8', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Attiva carta di credito - Switch', 'CC_ENABLED_SWITCH', '0', 'Accetta carta di credito SWITCH 0= no 1= si', '17', '9', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Attiva carta di credito - Maestro', 'CC_ENABLED_MAESTRO', '0', 'Accetta carta di credito MAESTRO 0= no 1= si', '17', '10', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());


INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Abilitazione Carte di Credito - Visualizza nella pagina Pagamento', 'SHOW_ACCEPTED_CREDIT_CARDS', '0', 'Visualizzare le Carte di Credito accettate nella pagina Pagamento ?<br />0= off<br />1= Come Testo<br />2= Come Immagini<br /><br />Nota: immagini e testo devono essere definite sia nel database che nei files di lingua per uno specifico tipo di Carta di Credito.', '17', '50', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Questo modulo &egrave; installato', 'MODULE_ORDER_TOTAL_GV_STATUS', 'true', '', '6', '1', NULL, '2003-10-30 22:16:40', NULL, 'zen_cfg_select_option(array(\'true\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Ordine di Visualizzazione', 'MODULE_ORDER_TOTAL_GV_SORT_ORDER', '840', 'Ordine di Visualizzazione.', '6', '2', NULL, '2003-10-30 22:16:40', NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Accoda Acquisti', 'MODULE_ORDER_TOTAL_GV_QUEUE', 'true', 'Accodare gli acquisti del Certificato Regalo?', '6', '3', NULL, '2003-10-30 22:16:40', NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Includi Spedizione', 'MODULE_ORDER_TOTAL_GV_INC_SHIPPING', 'true', 'Includi la Spedizione nel calcolo.', '6', '5', NULL, '2003-10-30 22:16:40', NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Includi Tassa', 'MODULE_ORDER_TOTAL_GV_INC_TAX', 'true', 'Includi la Tassa nel calcolo.', '6', '6', NULL, '2003-10-30 22:16:40', NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Ricalcola Tassa', 'MODULE_ORDER_TOTAL_GV_CALC_TAX', 'None', 'Ricalcola Tassa', '6', '7', NULL, '2003-10-30 22:16:40', NULL, 'zen_cfg_select_option(array(\'None\', \'Standard\', \'Credit Note\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Classe IVA', 'MODULE_ORDER_TOTAL_GV_TAX_CLASS', '0', 'Usa la seguente aliquota IVA quando trattate il Certificato Regalo come Buono a Credito.', '6', '0', NULL, '2003-10-30 22:16:40', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Credito con inclusa Tassa', 'MODULE_ORDER_TOTAL_GV_CREDIT_TAX', 'false', 'Aggiungi una tassa ad un Certificato Regalo quando accreditato ad un Account.', '6', '8', NULL, '2003-10-30 22:16:40', NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Imposta Stato Ordine', 'MODULE_ORDER_TOTAL_GV_ORDER_STATUS_ID', '0', 'Imposta lo Stato Ordine da usare acquistando con Certificato Regalo', '6', '0', NULL, now(), 'zen_get_order_status_name', 'zen_cfg_pull_down_order_statuses(');

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Questo modulo &egrave; installato', 'MODULE_ORDER_TOTAL_LOWORDERFEE_STATUS', 'true', '', '6', '1', NULL, '2003-10-30 22:16:43', NULL, 'zen_cfg_select_option(array(\'true\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Ordine di Visualizzazione', 'MODULE_ORDER_TOTAL_LOWORDERFEE_SORT_ORDER', '400', 'Ordine di Visualizzazione.', '6', '2', NULL, '2003-10-30 22:16:43', NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Consenti Supplemento Ordine Minimo', 'MODULE_ORDER_TOTAL_LOWORDERFEE_LOW_ORDER_FEE', 'false', 'Volete consentire i supplementi ordine minimo?', '6', '3', NULL, '2003-10-30 22:16:43', NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Supplemento Ordine per Ordini inferiori a', 'MODULE_ORDER_TOTAL_LOWORDERFEE_ORDER_UNDER', '50', 'Aggiungi il supplemento di ordine minimo agli ordini inferiori a questo importo.', '6', '4', NULL, '2003-10-30 22:16:43', 'currencies->format', NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Supplemento Ordine', 'MODULE_ORDER_TOTAL_LOWORDERFEE_FEE', '5', 'Per il Calcolo della Percentuale - includete un % Esempio: 10%<br />Per un importo di spedizione con tariffa unica inserite solo l\'importo - Esempio: 5 per 5.00EUR', '6', '5', NULL, '2003-10-30 22:16:43', '', NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Unisci Supplemento Ordine Minimo agli Ordini fatti', 'MODULE_ORDER_TOTAL_LOWORDERFEE_DESTINATION', 'both', 'Unisci supplemento ordine minimo per gli ordini inviati alla destinazione impostata.', '6', '6', NULL, '2003-10-30 22:16:43', NULL, 'zen_cfg_select_option(array(\'national\', \'international\', \'both\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Classe IVA', 'MODULE_ORDER_TOTAL_LOWORDERFEE_TAX_CLASS', '0', 'Usa la seguente aliquota IVA per supplemento ordine minimo.', '6', '7', NULL, '2003-10-30 22:16:43', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Nessun Supplemento Ordine Minimo per Prodotti Virtuali', 'MODULE_ORDER_TOTAL_LOWORDERFEE_VIRTUAL', 'false', 'Non addebitare Supplemento Ordine Minimo quando nel carrello ci sono solo prodotti virtuali.', '6', '8', NULL, '2004-04-20 22:16:43', NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Nessun Supplemento Ordine Minimo per Certificato Regalo', 'MODULE_ORDER_TOTAL_LOWORDERFEE_GV', 'false', 'Non addebitare Supplemento Ordine Minimo quando nel carrello ci sono solo certificati regalo.', '6', '9', NULL, '2004-04-20 22:16:43', NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),');

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Questo modulo &egrave; installato', 'MODULE_ORDER_TOTAL_SHIPPING_STATUS', 'true', '', '6', '1', NULL, '2003-10-30 22:16:46', NULL, 'zen_cfg_select_option(array(\'true\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Ordine di Visualizzazione', 'MODULE_ORDER_TOTAL_SHIPPING_SORT_ORDER', '200', 'Ordine di Visualizzazione.', '6', '2', NULL, '2003-10-30 22:16:46', NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Consenti Spedizione Gratuita?', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING', 'false', 'Consentire la spedizione gratuita?', '6', '3', NULL, '2003-10-30 22:16:46', NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Spedizione Gratuita per Ordine Ordini superiori a', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING_OVER', '50', 'Fornire la spedizione gratuita per ordini oltre l\'importo impostato.', '6', '4', NULL, '2003-10-30 22:16:46', 'currencies->format', NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Fornisci Spedizione Gratuita per gli Ordini fatti', 'MODULE_ORDER_TOTAL_SHIPPING_DESTINATION', 'national', 'Fornisci spedizione gratuita per gli ordini inviati alla destinazione impostata.', '6', '5', NULL, '2003-10-30 22:16:46', NULL, 'zen_cfg_select_option(array(\'national\', \'international\', \'both\'),');

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Questo modulo &egrave; installato', 'MODULE_ORDER_TOTAL_SUBTOTAL_STATUS', 'true', '', '6', '1', NULL, '2003-10-30 22:16:49', NULL, 'zen_cfg_select_option(array(\'true\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Ordine di Visualizzazione', 'MODULE_ORDER_TOTAL_SUBTOTAL_SORT_ORDER', '100', 'Ordine di Visualizzazione.', '6', '2', NULL, '2003-10-30 22:16:49', NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Questo modulo &egrave; installato', 'MODULE_ORDER_TOTAL_TAX_STATUS', 'true', '', '6', '1', NULL, '2003-10-30 22:16:52', NULL, 'zen_cfg_select_option(array(\'true\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Ordine di visualizzazione', 'MODULE_ORDER_TOTAL_TAX_SORT_ORDER', '300', 'Ordine di visualizzazione.', '6', '2', NULL, '2003-10-30 22:16:52', NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Questo modulo &egrave; installato', 'MODULE_ORDER_TOTAL_TOTAL_STATUS', 'true', '', '6', '1', NULL, '2003-10-30 22:16:55', NULL, 'zen_cfg_select_option(array(\'true\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Ordine di Visualizzazione', 'MODULE_ORDER_TOTAL_TOTAL_SORT_ORDER', '999', 'Ordine di Visualizzazione.', '6', '2', NULL, '2003-10-30 22:16:55', NULL, NULL);

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Classe IVA', 'MODULE_ORDER_TOTAL_COUPON_TAX_CLASS', '0', 'Usa la seguente aliquota IVA quando trattate il Buono Sconto come Buono a Credito.', '6', '0', NULL, '2003-10-30 22:16:36', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Includi Tassa', 'MODULE_ORDER_TOTAL_COUPON_INC_TAX', 'false', 'Includi la Tassa nel calcolo.', '6', '6', NULL, '2003-10-30 22:16:36', NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Ordine di Visualizzazione', 'MODULE_ORDER_TOTAL_COUPON_SORT_ORDER', '280', 'Ordine di Visualizzazione.', '6', '2', NULL, '2003-10-30 22:16:36', NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Includi Spese di Spedizione', 'MODULE_ORDER_TOTAL_COUPON_INC_SHIPPING', 'false', 'Includi Spese di Spedizione nei conteggi.', '6', '5', NULL, '2003-10-30 22:16:36', NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Questo modulo &egrave; installato', 'MODULE_ORDER_TOTAL_COUPON_STATUS', 'true', '', '6', '1', NULL, '2003-10-30 22:16:36', NULL, 'zen_cfg_select_option(array(\'true\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Ricalcola Tassa', 'MODULE_ORDER_TOTAL_COUPON_CALC_TAX', 'Standard', 'Ricalcola Tassa.', '6', '7', NULL, '2003-10-30 22:16:36', NULL, 'zen_cfg_select_option(array(\'None\', \'Standard\', \'Credit Note\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Demo Admin - Stato', 'ADMIN_DEMO', '0', 'La modalit&agrave; Demo Admin deve essere on ?<br />0= no<br />1= si', 6, 0, 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Tipo di Selezione della Opzione Prodotto', 'PRODUCTS_OPTIONS_TYPE_SELECT', '0', 'Il numero rappresenta il Tipo di Selezione della Opzione Prodotto.', '0', NULL, now(), now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Tipo Opzione Prodotto Testo', 'PRODUCTS_OPTIONS_TYPE_TEXT', '1', 'Valore numerico del tipo opzione prodotto testo.', '6', NULL, now(), now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Tipo Opzione Prodotto Radio button', 'PRODUCTS_OPTIONS_TYPE_RADIO', '2', 'Valore numerico del tipo opzione prodotto radio button.', '6', NULL, now(), now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Tipo Opzione Prodotto Check box', 'PRODUCTS_OPTIONS_TYPE_CHECKBOX', '3', 'Valore numerico del tipo opzione prodotto check box.', '6', NULL, now(), now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Tipo Opzione Prodotto File', 'PRODUCTS_OPTIONS_TYPE_FILE', '4', 'Valore numerico del tipo opzione prodotto file.', '6', NULL, now(), now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('ID per i Valori Opzione Prodotto Testo e File', 'PRODUCTS_OPTIONS_VALUES_TEXT_ID', '0', 'Valore numerico del products_options_values_id usato dagli attributi testo e file.', '6', NULL, now(), now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Prefisso Upload', 'UPLOAD_PREFIX', 'upload_', 'Prefisso usato per differenziare tra le opzioni upload e le altre opzioni.', '0', NULL, now(), now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Prefisso Testo', 'TEXT_PREFIX', 'txt_', 'Prefisso usato per differenziare tra i valori opzione testo e gli altri valori opzione.', '0', NULL, now(), now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Tipo Opzione Sola Lettura', 'PRODUCTS_OPTIONS_TYPE_READONLY', '5', 'Valore numerico del tipo opzione prodotto file.', '6', NULL, now(), now(), NULL, NULL);

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('login mode https', 'SSLPWSTATUSCHECK', '', 'System setting. Do not edit.', '6', '99', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Info Prodotti - Nomi Opzioni Prodotti - Ordine elencazione', 'PRODUCTS_OPTIONS_SORT_ORDER', '0', 'Ordine di elencazione dei Nomi Opzione per Info Prodotti<br />0= Ordine Elencazione, Nome Opzione<br />1= Nome Opzione', '18', '35', now(), now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Info Prodotti - Valori Opzione Prodotti degli Attributi - Ordine elencazione', 'PRODUCTS_OPTIONS_SORT_BY_PRICE', '1', 'Ordine di elencazione dei Valori Opzione Prodotto degli Attributi in Info Prodotti<br />0= Ordine Elencazione, Prezzo<br />1= Ordine Elencazione, Nome Valore Opzione', '18', '36', now(), now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\'),');

# test remove and only use products_options_images_per_row
#INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Product Info - Number of Attribute Images per Row', 'PRODUCTS_IMAGES_ATTRIBUTES_PER_ROW', '5', 'Product Info - Enter the number of attribute images to display per row<br />Default = 5', '18', '40', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Info Prodotti - Mostra Nome del Valore Opzione sotto alla immagine Attributo', 'PRODUCT_IMAGES_ATTRIBUTES_NAMES', '1', 'Vuoi visualizzare il nome del valore di opzione sotto l\'immagine di attributo?<br />0= no<br />1= si', '18', '41', NULL, now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\'), ');

# test remove and only use products_options_images_style
#INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Product Info - Show Option Values and Attributes Images for Radio Buttons and Checkboxes', 'PRODUCT_IMAGES_ATTRIBUTES_NAMES_COLUMN', '0', '0= Images Below Option Names<br />1= Element, Image and Option Value<br />2= Element, Image and Option Name Below<br />3= Option Name Below Element and Image<br />4= Element Below Image and Option Name<br />5= Element Above Image and Option Name', 18, 42, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\', \'5\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Info Prodotti - Mostra l\'ammontare del risparmio ottenuto con lo sconto sul prezzo di vendita - Stato', 'SHOW_SALE_DISCOUNT_STATUS', '1', 'Vuoi visualizzare l\'ammontare del risparmio ottenuto con lo sconto sul prezzo di vendita ?<br />0= no<br />1= si', '18', '45', NULL, now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Info Prodotti - Mostra l\'ammontare del risparmio come Importo o Percentuale', 'SHOW_SALE_DISCOUNT', '1', 'Mostro l\'ammontare del risparmio come:<br />1= % <br />2= Importo', '18', '46', NULL, now(), NULL, 'zen_cfg_select_option(array(\'1\', \'2\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Info Prodotti - Numero decimali della percentuale di risparmio', 'SHOW_SALE_DISCOUNT_DECIMALS', '0', 'Mostro la percentuale di risparmio con quanti decimali ?<br />Default= 0', '18', '47', NULL, now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Info Prodotti - Gratis - Visualizzo Immagine o Testo?', 'OTHER_IMAGE_PRICE_IS_FREE_ON', '1', 'Mostro l\'immagine associata a Gratis o il Testo sul prezzo visualizzato?<br />0= Testo<br />1= Immagine', '18', '50', NULL, now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Info Prodotti - Prezzo a Richiesta - Visualizzo Immagine o Testo ?', 'PRODUCTS_PRICE_IS_CALL_IMAGE_ON', '1', 'Mostro l\'immagine associata a Prezzo a Richiesta o il Testo sul prezzo visualizzato ?<br />0= Testo<br />1= Immagine', '18', '51', NULL, now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Stato Box Quantit&agrave; Prodotto - Aggiunta Nuovo Prodotto', 'PRODUCTS_QTY_BOX_STATUS', '1', 'Quale deve essere lo Stato del Campo Quantit&agrave; nell\'aggiunta di un Nuovo Prodotto ?<br /><br />0= off<br />1= on<br />NOTA: Questo visualizzer&agrave; il campo Quantit&agrave; quando &egrave; ON ed imposter&agrave; il valore di default di Aggiungi al Carrello ad 1', '18', '55', NULL, now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Recensioni Prodotti - Richiesta Approvazione', 'REVIEWS_APPROVAL', '1', 'Le Recensioni Prodotti necessitano di una Approvazione ?<br /><br />Nota: Quando l\'impostazione &egrave; no, la richiesta non sar&agrave; visualizzata<br />0= no<br />1= si', '18', '62', NULL, now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\'), ');


INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Meta Tags - Includi Modello Prodotto nel Titolo', 'META_TAG_INCLUDE_MODEL', '1', 'Vuoi inserire il Modello Prodotto nel Meta Tag Titolo?<br /><br />0= off 1= on', '18', '69', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Meta Tags - Includere il Prezzo Prodotto nel Titolo', 'META_TAG_INCLUDE_PRICE', '1', 'Vuoi includere il Prezzo Prodotto nel Meta Tag Titolo ?<br />0= no<br />1= si', '18', '70', NULL, now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\'), ');

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Meta Tags - Lunghezza Massima della Descrizione generata ?', 'MAX_META_TAG_DESCRIPTION_LENGTH', '50', 'Imposta la Lunghezza Massima del Meta Tag Descrizione generato a: (parole)<br />Default= 50', '18', '71', NULL, now(), '', '');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Hanno acquistato anche - Colonne per Riga', 'SHOW_PRODUCT_INFO_COLUMNS_ALSO_PURCHASED_PRODUCTS', '3', 'Hanno acquistato anche - Colonne per Riga<br />0= off o imposta l\'ordine di elencazione', '18', '72', NULL, now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\', \'9\', \'10\', \'11\', \'12\'), ');

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Prec. Succ. - Posizione Barra di Navigazione', 'PRODUCT_INFO_PREVIOUS_NEXT', '1', 'La posizione della Barra di Navigazione di Prec./Succ.<br />0= off<br />1= In alto nella pagina<br />2= In basso nella pagina<br />3= Sia in alto che in basso nella pagina', '18', '21', now(), now(), NULL, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Off\'), array(\'id\'=>\'1\', \'text\'=>\'Top of Page\'), array(\'id\'=>\'2\', \'text\'=>\'Bottom of Page\'), array(\'id\'=>\'3\', \'text\'=>\'Both Top & Bottom of Page\')),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Prec. Succ. - Ordine Elencazione', 'PRODUCT_INFO_PREVIOUS_NEXT_SORT', '1', 'Visualizza Prodotti ordinati per<br />0= ID Prodotto<br />1= Nome Prodotto<br />2= Modello<br />3= Prezzo, Nome Prodotto<br />4= Prezzo, Modello<br />5= Nome Prodotto, Modello<br />6= Prodotto Ordine Elencazione', '18', '22', now(), now(), NULL, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Product ID\'), array(\'id\'=>\'1\', \'text\'=>\'Name\'), array(\'id\'=>\'2\', \'text\'=>\'Product Model\'), array(\'id\'=>\'3\', \'text\'=>\'Product Price - Name\'), array(\'id\'=>\'4\', \'text\'=>\'Product Price - Model\'), array(\'id\'=>\'5\', \'text\'=>\'Product Name - Model\'), array(\'id\'=>\'6\', \'text\'=>\'Product Sort Order\')),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Prec. Succ. - Stato Pulsanti ed Immagine', 'SHOW_PREVIOUS_NEXT_STATUS', '0', 'Lo Stato dei Pulsanti e dell\'Immagine Prodotto &egrave;:<br />0= Off<br />1= On', '18', '20', now(), now(), NULL, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Off\'), array(\'id\'=>\'1\', \'text\'=>\'On\')),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Prec. Succ. - Impostazioni Pulsanti ed Immagine', 'SHOW_PREVIOUS_NEXT_IMAGES', '0', 'Impostazioni di visualizzazione dei pulsanti Prec./Succ. e dell\'Immagine Prodotto<br />0= Solo Pulsante<br />1= Pulsante ed Immagine Prodotto<br />2= Solo Immagine Prodotto', '18', '21', now(), now(), NULL, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Button Only\'), array(\'id\'=>\'1\', \'text\'=>\'Button and Product Image\'), array(\'id\'=>\'2\', \'text\'=>\'Product Image Only\')),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Prec. Succ. - Larghezza Immagine', 'PREVIOUS_NEXT_IMAGE_WIDTH', '50', 'Imposta la Larghezza Immagine Prec./Succ.:', '18', '22', NULL, now(), '', '');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Prec. Succ. - Altezza Immagine', 'PREVIOUS_NEXT_IMAGE_HEIGHT', '40', 'Imposta la Altezza Immagine Prec./Succ.:', '18', '23', NULL, now(), '', '');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Prec. Succ. - Barra di Navigazione, posizione della Categoria', 'PRODUCT_INFO_CATEGORIES', '1', 'Visualizzo Immagine Categoria del prodotto ed il nome sopra alla barra di Navigazione Prec./Succ. ?<br />0= off<br />1= Allineate a Sinistra<br />2= Allineate al Centro<br />3= Allineate a Destra', '18', '20', now(), now(), NULL, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Off\'), array(\'id\'=>\'1\', \'text\'=>\'Align Left\'), array(\'id\'=>\'2\', \'text\'=>\'Align Center\'), array(\'id\'=>\'3\', \'text\'=>\'Align Right\')),');

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Prec. Succ. - Barra di Navigazione, stato nome e immagine categoria', 'PRODUCT_INFO_CATEGORIES_IMAGE_STATUS', '2', 'Stato nome e immagine categoria<br />0= Nome e immagine categoria sempre mostrate<br />1= Solo il nome<br />2= Nome e immagine, se esistente', '18', '20', now(), now(), NULL, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Category Name and Image Always\'), array(\'id\'=>\'1\', \'text\'=>\'Category Name only\'), array(\'id\'=>\'2\', \'text\'=>\'Category Name and Image when not blank\')),');

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Larghezza dei Boxes nella Colonna di Sinistra', 'BOX_WIDTH_LEFT', '160px', 'Larghezza dei Boxes nella Colonna di Sinistra<br />px pu&ograve; essere incluso<br />Default = 160px', '19', '1', NULL, '2003-11-21 22:16:36', NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Larghezza dei Boxes nella Colonna di Destra ', 'BOX_WIDTH_RIGHT', '160px', 'Larghezza dei Boxes nella Colonna di Destra<br />px pu&ograve; essere incluso<br />Default = 160px', '19', '2', NULL, '2003-11-21 22:16:36', NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Bread Crumbs - Separatore barra Navigazione', 'BREAD_CRUMBS_SEPARATOR', ':&nbsp;', 'Inserisci il simbolo da utilizzare come separatore fra le singole traccie nella Barra di Navigazione Bread Crumb<br />Nota: Includi gli spazi con il simbolo &amp;nbsp; se desiderate che facciano parte del separatore.<br />Default = &amp;nbsp;::&amp;nbsp;', '19', '3', NULL, '2003-11-21 22:16:36', NULL, 'zen_cfg_textarea_small(');

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Bread Crumbs - Definizione Stato', 'DEFINE_BREADCRUMB_STATUS', '2', 'Vuoi utilizzare i breadcrumbs?<br />0= NO<br />1= SI<br />2= Si, tranne in home page', '19', '4', NULL, now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ');

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Pi&ugrave; Venduti - Padding Numero', 'BEST_SELLERS_FILLER', '&nbsp;', 'Con che cosa vuoi effettuare il Padding dei numeri ?<br />Default = &amp;nbsp;', '19', '5', NULL, '2003-11-21 22:16:36', NULL, 'zen_cfg_textarea_small(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Pi&ugrave; Venduti - Troncatura Nomi Prodotti', 'BEST_SELLERS_TRUNCATE', '35', 'A quale dimensione desideri che siano troncati i Nomi dei Prodotti ?<br />Default = 35', '19', '6', NULL, '2003-11-21 22:16:36', NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Pi&ugrave; Venduti - Troncatura Nomi Prodotti seguita da ...', 'BEST_SELLERS_TRUNCATE_MORE', 'true', 'Quando vengono troncati i Nomi dei Prodotti falli seguire da ...<br />Default = true', '19', '7', '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),');

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Box Categorie - Mostra Link Offerte', 'SHOW_CATEGORIES_BOX_SPECIALS', 'true', 'Mostro collegamento ai Prodotti in Offerta nel Box Categorie ?', '19', '8', '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Box Categorie - Mostra Link Nuovi prodotti', 'SHOW_CATEGORIES_BOX_PRODUCTS_NEW', 'true', 'Mostro collegamento ai Nuovi Prodotti nel Box Categorie ?', '19', '9', '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Box Carrello - Stato', 'SHOW_SHOPPING_CART_BOX_STATUS', '1', 'Visualizza il box Carrello.<br />0= Sempre<br />1= Solo quando contiene qualcosa<br />2= Solo quando contiene qualcosa ma non &egrave; visualizzata la pagina del Carrello', '19', '10', NULL, now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Box Categorie - Mostra link Prodotti in Vetrina', 'SHOW_CATEGORIES_BOX_FEATURED_PRODUCTS', 'true', 'Mostro il link a Prodotti in Vetrina nel Box Categorie ?', '19', '11', '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Box Categorie - Mostra link Tutti i Prodotti', 'SHOW_CATEGORIES_BOX_PRODUCTS_ALL', 'true', 'Mostro il link a Tutti i Prodotti nel Box Categorie ?', '19', '12', '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),');

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Stato Colonna di Sinistra - Globale', 'COLUMN_LEFT_STATUS', '1', 'Mostro Colonna Sinistra, a meno che esista override di pagina ?<br />0= La Colonna Sinistra &egrave; sempre off<br />1= La Colonna Sinistra &egrave; on, a meno di un override di pagina', '19', '15', NULL, now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Stato Colonna di Destra - Globale', 'COLUMN_RIGHT_STATUS', '1', 'Mostro Colonna Destra, a meno che esista override di pagina ?<br />0= La Colonna Destra &egrave; sempre off<br />1= La Colonna Sinistra &egrave; on, a meno di un override di pagina', '19', '16', NULL, now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Larghezza Colonna di Sinistra', 'COLUMN_WIDTH_LEFT', '160px', 'Larghezza della Colonna di Sinistra<br />px pu&ograve; essere incluso<br />Default = 160px', '19', '20', NULL, '2003-11-21 22:16:36', NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Larghezza Colonna di Destra', 'COLUMN_WIDTH_RIGHT', '160px', 'Larghezza della Colonna di Destra<br />px pu&ograve; essere incluso<br />Default = 160px', '19', '21', NULL, '2003-11-21 22:16:36', NULL, NULL);

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Categorie - Stato del Separatore tra i link', 'SHOW_CATEGORIES_SEPARATOR_LINK', '1', 'Mostra Separatore di Categoria tra i Nomi Categorie ed i Link ?<br />0= no<br />1= si', '19', '24', NULL, now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Categories - Separatore tra il Nome Categoria ed il Contatore', 'CATEGORIES_SEPARATOR', '', 'Che separatore vuoi utilizzare tra il Nome Categoria ed il Contatore ?<br />Default = -&amp;gt;', '19', '25', NULL, '2003-11-21 22:16:36', NULL, 'zen_cfg_textarea_small(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Categorie - Separatore tra il Nome Categoria e le SottoCategorie', 'CATEGORIES_SEPARATOR_SUBS', '-&nbsp;', 'Che separatore vuoi utilizzare tra il Nome Categoria ed il Nome SottoCategoria ?<br />Default = |_&amp;nbsp;', '19', '26', NULL, '2004-03-25 22:16:36', NULL, 'zen_cfg_textarea_small(');

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Categorie - Prefisso Contatore', 'CATEGORIES_COUNT_PREFIX', '&nbsp;(', 'Che cosa vuoi utilizzare come Prefisso per il Contatore ?<br />Default= (', '19', '27', NULL, '2003-01-21 22:16:36', NULL, 'zen_cfg_textarea_small(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Categorie - Suffisso Contatore', 'CATEGORIES_COUNT_SUFFIX', ')', 'Che cosa vuoi utilizzare come Suffisso per il Contatore ?<br />Default= )', '19', '28', NULL, '2003-01-21 22:16:36', NULL, 'zen_cfg_textarea_small(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Categorie - Indentazione SottoCategorie', 'CATEGORIES_SUBCATEGORIES_INDENT', '&nbsp;&nbsp;', 'Che cosa vuoi utilizzare per indentare le SottoCategorie ?<br />Default = &amp;nbsp;&amp;nbsp;', '19', '29', NULL, '2004-06-24 22:16:36', NULL, 'zen_cfg_textarea_small(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Categorie - Stato categorie con 0 Prodotti', 'CATEGORIES_COUNT_ZERO', '0', 'Mostro Contatore di Categoria se sono presenti 0 Prodotti ?<br />0= no<br />1= si', '19', '30', NULL, now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Dividi Box Categorie', 'CATEGORIES_SPLIT_DISPLAY', 'True', 'Dividi il box categorie visualizzato per tipi di prodotto ?', '19', '31', NULL, now(), NULL, 'zen_cfg_select_option(array(\'True\', \'False\'), ');

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Carrello - Mostra Totali', 'SHOW_TOTALS_IN_CART', '1', 'Mostra i Totali sopra il Carrello ?<br />0= off<br />1= on: Voci Peso Importo<br />2= on: Voci Peso Importo, ma non mostra Peso quando &egrave; 0<br />3= on: Voci Importo', '19', '31', NULL, now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Benvenuto Cliente - Mostra nella Pagina Index', 'SHOW_CUSTOMER_GREETING', '1', 'Mostro sempre il Benvenuto Cliente nella Pagina Index ?<br />0= no<br />1= si', '19', '40', NULL, now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Categorie - Mostra sempre nella Pagina Principale', 'SHOW_CATEGORIES_ALWAYS', '0', 'Mostro sempre le Categorie nella Pagina Principale ?<br />0= no<br />1= si<br />La categoria di default pu&ograve; essere impostata a Livello Top o ad uno Specifico Livello Top', '19', '45', NULL, now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Pagina Principale - Apri con Categoria', 'CATEGORIES_START_MAIN', '0', '0= Categorie Livello Top<br />o inserisci l\'ID di Categoria<br />Nota: Possono anche essere utilizzare le SottoCategorie. Esempio: 3_10', '19', '46', NULL, now(), '', '');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Categorie - Apri sempre per mostrare le SottoCategorie', 'SHOW_CATEGORIES_SUBCATEGORIES_ALWAYS', '1', 'Mostro sempre le Categorie e le SottoCategorie ?<br />0= no, mostro soltanto le Categorie Top<br />1= si, mostro sempre le Categorie e le SottoCategorie quando selezionate', '19', '47', NULL, now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\'), ');

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Gruppi Visualizzazione Banner - Header Posizione 1', 'SHOW_BANNERS_GROUP_SET1', 'Header_1', 'I Gruppi Visualizzazione Banner possono essere di 1 Gruppo Banner o di Gruppi Multipli di Banner<br /><br />Per Gruppi Multipli di Banner inserisci il Nome del Gruppo Banner separato dal carattere <strong>:</strong><br /><br />Esempio: Wide-Banners:SideBox-Banners<br /><br />Quale Gruppo(i) di Banner vuoi utilizzare nella posizione Header 1?<br />Lasciare vuoto per nessuno', '19', '55', NULL, now(), '', '');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Gruppi Visualizzazione Banner - Header Posizione 2', 'SHOW_BANNERS_GROUP_SET2', 'Header_2', 'I Gruppi Visualizzazione Banner possono essere di 1 Gruppo Banner o di Gruppi Multipli di Banner<br /><br />Per Gruppi Multipli di Banner inserisci il Nome del Gruppo Banner separato dal carattere <strong>:</strong><br /><br />Esempio: Wide-Banners:SideBox-Banners<br /><br />Quale Gruppo(i) di Banner vuoi utilizzare nella posizione Header 2?<br />Lasciare vuoto per nessuno', '19', '56', NULL, now(), '', '');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Gruppi Visualizzazione Banner - Header Posizione 3', 'SHOW_BANNERS_GROUP_SET3', 'Header_3', 'I Gruppi Visualizzazione Banner possono essere di 1 Gruppo Banner o di Gruppi Multipli di Banner<br /><br />Per Gruppi Multipli di Banner inserisci il Nome del Gruppo Banner separato dal carattere <strong>:</strong><br /><br />Esempio: Wide-Banners:SideBox-Banners<br /><br />Quale Gruppo(i) di Banner vuoi utilizzare nella posizione Header 3?<br />Lasciare vuoto per nessuno', '19', '57', NULL, now(), '', '');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Gruppi Visualizzazione Banner - Footer Posizione 1', 'SHOW_BANNERS_GROUP_SET4', 'Footer_1', 'I Gruppi Visualizzazione Banner possono essere di 1 Gruppo Banner o di Gruppi Multipli di Banner<br /><br />Per Gruppi Multipli di Banner inserisci il Nome del Gruppo Banner separato dal carattere <strong>:</strong><br /><br />Esempio: Wide-Banners:SideBox-Banners<br /><br />Quale Gruppo(i) di Banner vuoi utilizzare nella posizione Footer 1?<br />Lasciare vuoto per nessuno', '19', '65', NULL, now(), '', '');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Gruppi Visualizzazione Banner - Footer Posizione 2', 'SHOW_BANNERS_GROUP_SET5', 'Footer_2', 'I Gruppi Visualizzazione Banner possono essere di 1 Gruppo Banner o di Gruppi Multipli di Banner<br /><br />Per Gruppi Multipli di Banner inserisci il Nome del Gruppo Banner separato dal carattere <strong>:</strong><br /><br />Esempio: Wide-Banners:SideBox-Banners<br /><br />Quale Gruppo(i) di Banner vuoi utilizzare nella posizione Footer 2?<br />Lasciare vuoto per nessuno', '19', '66', NULL, now(), '', '');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Gruppi Visualizzazione Banner - Footer Posizione 3', 'SHOW_BANNERS_GROUP_SET6', 'Footer_3', 'I Gruppi Visualizzazione Banner possono essere di 1 Gruppo Banner o di Gruppi Multipli di Banner<br /><br />Per Gruppi Multipli di Banner inserisci il Nome del Gruppo Banner separato dal carattere <strong>:</strong><br /><br />Esempio: Wide-Banners:SideBox-Banners<br /><br />Quale Gruppo(i) di Banner vuoi utilizzare nella posizione Footer 3?<br />Lasciare vuoto per nessuno', '19', '67', NULL, now(), '', '');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Gruppi Visualizzazione Banner - Box Laterale banner_box', 'SHOW_BANNERS_GROUP_SET7', 'SideLeft', 'I Gruppi Visualizzazione Banner possono essere di 1 Gruppo Banner o di Gruppi Multipli di Banner<br /><br />Per Gruppi Multipli di Banner inserisci il Nome del Gruppo Banner separato dal carattere  <strong>:</strong><br /><br />Esempio: Wide-Banners:SideBox-Banners<br />Il Gruppo di Default &egrave; SideBox-Banners<br /><br />Quale Gruppo(i) di Banner vuoi utilizzare nel Box Laterale - banner_box?<br />Lasciare vuoto per nessuno', '19', '70', NULL, now(), '', '');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Gruppi Visualizzazione Banner - Box Laterale banner_box2', 'SHOW_BANNERS_GROUP_SET8', 'SideRight', 'I Gruppi Visualizzazione Banner possono essere di 1 Gruppo Banner o di Gruppi Multipli di Banner<br /><br />Per Gruppi Multipli di Banner inserisci il Nome del Gruppo Banner separato dal carattere  <strong>:</strong><br /><br />Esempio: Wide-Banners:SideBox-Banners<br />Il Gruppo di Default &egrave; SideBox-Banners<br /><br />Quale Gruppo(i) di Banner vuoi utilizzare nel Box Laterale - banner_box2?<br />Lasciare vuoto per nessuno', '19', '71', NULL, now(), '', '');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Gruppo Visualizzazione Banner - Box Laterale banner_box_all', 'SHOW_BANNERS_GROUP_SET_ALL', 'BannersAll', 'Il Gruppo Visualizzazione Banner pu&ograve; essere solamente di (1) Gruppo Banner per il box laterale Banner All<br /><br />Il Gruppo di Default &egrave; BannersAll<br /><br />Quale Gruppo Banner vuoi utilizzare nel Box Laterale - banner_box_all?<br />Lasciare vuoto per nessuno', '19', '72', NULL, now(), '', '');

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Footer - Stato Visualizzazione Indirizzo IP', 'SHOW_FOOTER_IP', '1', 'Mostro l\'Indirizzo IP Cliente nel Footer ?<br />0= no<br />1= si', '19', '80', NULL, now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Sconti Prodotto per Quantit&agrave; - Quanti livelli di sconto vuoi gestire ?', 'DISCOUNT_QTY_ADD', '5', 'Quanti livelli di sconto devono essere gestiti per la Prezzatura dei Prodotti ?', '19', '90', NULL, now(), '', '');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Sconti Prodotto per Quantit&agrave; - Quanti ne visualizzo per riga ?', 'DISCOUNT_QUANTITY_PRICES_COLUMN', '5', 'Quanti sconti quantit&agrave; devono essere mostrati per ogni riga nella Pagina Info Prodotto ?', '19', '95', NULL, now(), '', '');

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Visualizzazione Categorie/Prodotti Ordine di Elencazione', 'CATEGORIES_PRODUCTS_SORT_ORDER', '0', 'Visualizzazione Categorie/Prodotti Ordine di Elencazione<br />0= Categorie/Prodotti Ordine Elencazione/Nome<br />1= Categorie/Prodotti Nome<br />2= Modello Prodotti<br />3= Quantit&agrave; Prodotti+, Nome Prodotti<br />4= Quantit&agrave; Prodotti-, Nome Prodotti<br />5= Prezzo Prodotti+, Nome Prodotti<br />6= Prezzo Prodotti-, Nome Prodotti', '19', '100', NULL, now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\', \'5\', \'6\'), ');

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Nomi Opzione e Valori - Stato Globale Aggiungi, Copia e Elimina Caratteristiche', 'OPTION_NAMES_VALUES_GLOBAL_STATUS', '1', 'Nomi Opzione e Valori - Stato Globale Aggiungi, Copia e Elimina Caratteristiche<br />0= Nascondi Caratteristiche<br />1= Mostra Caratteristiche<br />2= Modello Prodotti', '19', '110', NULL, now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Men&ugrave; Categorie Tabellare - ON/OFF', 'CATEGORIES_TABS_STATUS', '0', 'Men&ugrave; Categorie Tabellare<br />Questa opzione abilita la visualizzazione delle categorie del tuo negozio in un men&ugrave; che attraversa in alto l\'header di pagina. Ci sono molti potenziali usi creativi per questo.<br />0= Nasconde Men&ugrave; Categorie Tabellare<br />1= Mostra Men&ugrave; Categorie Tabellare', '19', '112', NULL, now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Mappa Sito - deve includere i link di Il Mio Account ?', 'SHOW_ACCOUNT_LINKS_ON_SITE_MAP', 'No', 'Devono essere mostrati i link di Il Mio Account nella Mappa del Sito ?<br />Nota: Gli Spiders tenteranno di indicizzare questa pagina, e probabilmente non dovrebbe essere trasmessa alle pagine sicure, poich&egrave; non vi &egrave; beneficio nell\'indirizzamento della pagina di login .<br /><br />Default: no', '19', '115', NULL, now(), NULL, 'zen_cfg_select_option(array(\'Yes\', \'No\'), ');

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Salta Categorie con 1 prodotto', 'SKIP_SINGLE_PRODUCT_CATEGORIES', 'True', 'Salta le categorie con un singolo prodotto<br />Se questa opzione &egrave; impostata su True, ed il cliente clicca su un link ad una categoria che contiene un singolo prodotto, Zen Cart lo indirizzer&agrave; direttamente alla pagina del prodotto, anzich&egrave; visualizzare un altro link da cliccare per vedere la pagina del prodotto.<br />Default: True', '19', '120', NULL, now(), NULL, 'zen_cfg_select_option(array(\'True\', \'False\'), ');

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Utilizza login separato da registrazione', 'USE_SPLIT_LOGIN_MODE', 'False', 'La pagina di login pu&ograve; essere visualizzata in due modi: Solo login oppure login pi&ugrave; registrazione.<br />Se scegli solo login, il modulo di registrazione sar&agrave; accessibile mediante un link apposito. Altrimenti, il modulo di registrazione sar&agrave; visualizzato subito sotto il modulo di login (come era nelle vecchie versioni).<br />Default: False', '19', '121', 'zen_cfg_select_option(array(\'True\', \'False\'), ', now());

# CSS Buttons switch
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Pulsanti CSS', 'IMAGE_USE_CSS_BUTTONS', 'No', 'Pulsanti CSS<br />Usa pulsanti CSS al posto delle immagini (GIF/JPG) ?<br />Gli stili di rappresentazione dei pulsanti devono essere definiti nello stylesheet se vuoi abilitare questa opzione.', '19', '147', NULL, now(), NULL, 'zen_cfg_select_option(array(\'No\', \'Yes\'), ');

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('<strong>Down per Manutenzione: ON/OFF</strong>', 'DOWN_FOR_MAINTENANCE', 'false', 'Down per Manutenzione <br />(true=on false=off)', '20', '1', NULL, now(), NULL, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Down per Manutenzione: filename', 'DOWN_FOR_MAINTENANCE_FILENAME', 'down_for_maintenance', 'Down per Manutenzione filename<br />Nota: non includere l\'estensione<br />Default=down_for_maintenance', '20', '2', NULL, now(), NULL, '');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Down per Manutenzione: Nasconde Header', 'DOWN_FOR_MAINTENANCE_HEADER_OFF', 'false', 'Down per Manutenzione: Nasconde Header <br />(true=nasconde false=mostra)', '20', '3', NULL, now(), NULL, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Down per Manutenzione: Nasconde Colonna Sinistra', 'DOWN_FOR_MAINTENANCE_COLUMN_LEFT_OFF', 'false', 'Down per Manutenzione: Nasconde Colonna Sinistra <br />(true=nasconde false=mostra)', '20', '4', NULL, now(), NULL, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Down per Manutenzione: Nasconde Colonna Destra', 'DOWN_FOR_MAINTENANCE_COLUMN_RIGHT_OFF', 'false', 'Down per Manutenzione: Nasconde Colonna Destra <br />(true=nasconde false=mostra)', '20', '5', NULL, now(), NULL, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Down per Manutenzione: Nasconde Footer', 'DOWN_FOR_MAINTENANCE_FOOTER_OFF', 'false', 'Down per Manutenzione: Nasconde Footer <br />(true=nasconde false=mostra)', '20', '6', NULL, now(), NULL, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Down per Manutenzione: Nasconde Prezzi', 'DOWN_FOR_MAINTENANCE_PRICES_OFF', 'false', 'Down per Manutenzione: Nasconde Prezzi <br />(true=nasconde false=mostra)', '20', '7', NULL, now(), NULL, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Down per Manutenzione (escludi questo indirizzo IP)', 'EXCLUDE_ADMIN_IP_FOR_MAINTENANCE', 'your IP (ADMIN)', 'Questo Indirizzo IP &egrave; abilitato ad accedere al Sito Web mentre &egrave; Down per Manutenzione (come webmaster).<br />Per inserire Indirizzi IP multipli, separali con una virgola. Se non conosci il tuo Indirizzo IP, controlla nel Footer della pagina del tuo Negozio.', '20', '8', '2003-03-21 13:43:22', '2003-03-21 21:20:07', NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('NOTIFICA PUBBLICA Prima di andare in Down per Manutenzione: ON/OFF', 'WARN_BEFORE_DOWN_FOR_MAINTENANCE', 'false', 'Mostra un AVVISO qualche tempo prima di porre il tuo Sito Web Down per Manutenzione.<br />(true=on false=off)<br />Se tu imposti il \'Down per Manutenzione: ON/OFF\' a true questo sar&agrave; automaticamente aggiornato a false.', '20', '9', '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Data ed ora per la notifica prima della manutenzione', 'PERIOD_BEFORE_DOWN_FOR_MAINTENANCE', '15/05/2003  2-3 PM', 'Data ed ora per la notifica prima della manutenzione del sito web, inserisci data e ora per la manutenzione del sito web.', '20', '10', '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Mostra quando il Webmaster ha abilitato la manutenzione', 'DISPLAY_MAINTENANCE_TIME', 'false', 'Mostra quando il Webmaster ha abilitato la manutenzione. <br />(true=on false=off)<br />', '20', '11', '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Visualizza il tempo di manutenzione Sito Web', 'DISPLAY_MAINTENANCE_PERIOD', 'false', 'Visualizza il tempo di manutenzione sito<br />(true=on false=off)<br />', '20', '12', '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Tempo manutenzione Sito Web', 'TEXT_MAINTENANCE_PERIOD_TIME', '2h00', 'Inserisci il tempo di Manutenzione del Sito Web (hh:mm)', '20', '13', '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, NULL);

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Conferma Termini e Condizioni Durante la procedura di Checkout', 'DISPLAY_CONDITIONS_ON_CHECKOUT', 'true', 'Mostra i Termini e Conditioni durante la procedura di checkout dove il cliente potr&agrave; confermarne l\'accettazione.', '11', '1', NULL, now(), NULL, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Conferma della Nota sulla Privacy Durante la procedura di Creazione Account e pagina Contatti', 'DISPLAY_PRIVACY_CONDITIONS', 'true', 'Mostra la Nota sulla Privacy durante la procedura di creazione account dove il cliente potr&agrave; confermarne l\'accettazione.', '11', '2', NULL, now(), NULL, 'zen_cfg_select_option(array(\'true\', \'false\'), ');

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Visualizza Immagine Prodotto', 'PRODUCT_NEW_LIST_IMAGE', '1102', 'Vuoi visualizzare l\'Immagine Prodotto ?<br /><br />0= off<br />1mo carattere Sinistra o Destra<br />2ndo e 3rzo carattere Ordine Elencazione<br />4rto carattere numero di interruzioni dopo<br />', '21', '1', NULL, now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Visualizza Quantit&agrave; Prodotto', 'PRODUCT_NEW_LIST_QUANTITY', '1202', 'Vuoi visualizzare la Quantit&agrave; Prodotto ?<br /><br />0= off<br />1mo carattere Sinistra o Destra<br />2ndo e 3rzo carattere Ordine Elencazione<br />4rto carattere numero di interruzioni dopo<br />', '21', '2', NULL, now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Visualizza pulsante Compra Subito', 'PRODUCT_NEW_BUY_NOW', '1300', 'Vuoi visualizzare il Pulsante Compra Subito ?<br /><br />0= off<br />1mo carattere Sinistra o Destra<br />2ndo e 3rzo carattere Ordine Elencazione<br />4rto carattere numero di interruzioni dopo<br />', '21', '3', NULL, now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Visualizza Nome Prodotto', 'PRODUCT_NEW_LIST_NAME', '2101', 'Vuoi visualizzare il Nome Prodotto ?<br /><br />0= off<br />1mo carattere Sinistra o Destra<br />2ndo e 3rzo carattere Ordine Elencazione<br />4rto carattere numero di interruzioni dopo<br />', '21', '4', NULL, now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Visualizza Modello Prodotto', 'PRODUCT_NEW_LIST_MODEL', '2201', 'Vuoi visualizzare il Modello Prodotto ?<br /><br />0= off<br />1mo carattere Sinistra o Destra<br />2ndo e 3rzo carattere Ordine Elencazione<br />4rto carattere numero di interruzioni dopo<br />', '21', '5', NULL, now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Visualizza Nome Produttore', 'PRODUCT_NEW_LIST_MANUFACTURER', '2302', 'Vuoi visualizzare il Nome del Produttore ?<br /><br />0= off<br />1mo carattere Sinistra o Destra<br />2ndo e 3rzo carattere Ordine Elencazione<br />4rto carattere numero di interruzioni dopo<br />', '21', '6', NULL, now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Visualizza Prezzo Prodotto', 'PRODUCT_NEW_LIST_PRICE', '2402', 'Vuoi visualizzare il Prezzo del Prodotto ?<br /><br />0= off<br />1mo carattere Sinistra o Destra<br />2ndo e 3rzo carattere Ordine Elencazione<br />4rto carattere numero di interruzioni dopo<br />', '21', '7', NULL, now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Visualizza Peso Prodotto', 'PRODUCT_NEW_LIST_WEIGHT', '2502', 'Vuoi visualizzare il Peso del Prodotto ?<br /><br />0= off<br />1mo carattere Sinistra o Destra<br />2ndo e 3rzo carattere Ordine Elencazione<br />4rto carattere numero di interruzioni dopo<br />', '21', '8', NULL, now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Visualizza Data Inserimento Prodotto', 'PRODUCT_NEW_LIST_DATE_ADDED', '2601', 'Vuoi visualizzare la Data di Inserimento del Prodotto ?<br /><br />0= off<br />1mo carattere Sinistra o Destra<br />2ndo e 3rzo carattere Ordine Elencazione<br />4rto carattere numero di interruzioni dopo<br />', '21', '9', NULL, now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Visualizza Descrizione Prodotto', 'PRODUCT_NEW_LIST_DESCRIPTION', '150', 'Quanti caratteri utilizzare nella Descrizione Prodotto?<br /><br />0= OFF<br />150= Valore consigliato, oppure inserire il numero massimo di caratteri da utilizzare', '21', '10', NULL, now(), NULL, '');

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Visualizzazione Prodotti - Ordine Elencazione di Default', 'PRODUCT_NEW_LIST_SORT_DEFAULT', '6', 'Quale ordine di elencazione deve essere utilizzato per Default nella visualizzazione di Nuovi Prodotti ?<br />Default= 6 da Data pi&ugrave; recente a pi&ugrave; vecchia<br /><br />1= Nome Prodotti<br />2= Nome Prodotti Discendente<br />3= Prezzo da basso ad alto, Nome Prodotti<br />4= Prezzo da alto a basso, Nome Prodotti<br />5= Modello<br />6= Data Inserimento discendente<br />7= Data Inserimento<br />8= Ordine Elencazione Prodotto', '21', '11', NULL, now(), NULL, 'zen_cfg_select_option(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Nuovi Prodotti - ID Gruppo di Default', 'PRODUCT_NEW_LIST_GROUP_ID', '21', 'Attenzione: Modificare questo valore solo se l\'ID Gruppo Nuovi Prodotti &egrave; stato cambiato dal valore di default di 21<br />Qual &egrave; il configuration_group_id per la visualizzazione Nuovi Prodotti ?', '21', '12', NULL, now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Stato Quantit&agrave; Aggiungi Prodotti Multipli e Impostazione Posizione pulsante', 'PRODUCT_NEW_LISTING_MULTIPLE_ADD_TO_CART', '3', 'Vuoi visualizzare il riquadro Quantit&agrave; Aggiungi Prodotti Multipli e definire la posizione del Pulsante ?<br />0= off<br />1= Alto<br />2= Basso<br />3= Entrambe', '21', '25', NULL, now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ');

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Maschera Prodotti in arrivo dall\'inclusione quali Novit&agrave;', 'SHOW_NEW_PRODUCTS_UPCOMING_MASKED', '0', '
Vuoi mascherare i Prodotti in Arrivo affinch&egrave; non siano presentati come Nuovi Prodotti in Elenchi, Box Laterali e Box Centrali?<br />0= off<br />1= on', '21', '30', 'zen_cfg_select_option(array(\'0\', \'1\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Visualizza Immagine Prodotto', 'PRODUCT_FEATURED_LIST_IMAGE', '1102', 'Vuoi visualizzare l\'Immagine Prodotto ?<br /><br />0= off<br />1mo carattere Sinistra o Destra<br />2ndo e 3rzo carattere Ordine Elencazione<br />4rto carattere numero di interruzioni dopo<br />', '22', '1', NULL, now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Visualizza Quantit&agrave; Prodotto', 'PRODUCT_FEATURED_LIST_QUANTITY', '1202', 'Vuoi visualizzare la Quantit&agrave; Prodotto ?<br /><br />0= off<br />1mo carattere Sinistra o Destra<br />2ndo e 3rzo carattere Ordine Elencazione<br />4rto carattere numero di interruzioni dopo<br />', '22', '2', NULL, now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Visualizza pulsante Compra Subito', 'PRODUCT_FEATURED_BUY_NOW', '1300', 'Vuoi visualizzare il Pulsante Compra Subito ?<br /><br />0= off<br />1mo carattere Sinistra o Destra<br />2ndo e 3rzo carattere Ordine Elencazione<br />4rto carattere numero di interruzioni dopo<br />', '22', '3', NULL, now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Visualizza Nome Prodotto', 'PRODUCT_FEATURED_LIST_NAME', '2101', 'Vuoi visualizzare il Nome Prodotto ?<br /><br />0= off<br />1mo carattere Sinistra o Destra<br />2ndo e 3rzo carattere Ordine Elencazione<br />4rto carattere numero di interruzioni dopo<br />', '22', '4', NULL, now(), NULL, NULL);

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Visualizza Modello Prodotto', 'PRODUCT_FEATURED_LIST_MODEL', '2201', 'Vuoi visualizzare il Modello Prodotto ?<br /><br />0= off<br />1mo carattere Sinistra o Destra<br />2ndo e 3rzo carattere Ordine Elencazione<br />4rto carattere numero di interruzioni dopo<br />', '22', '5', NULL, now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Visualizza Nome Produttore', 'PRODUCT_FEATURED_LIST_MANUFACTURER', '2302', 'Vuoi visualizzare il Nome del Produttore ?<br /><br />0= off<br />1mo carattere Sinistra o Destra<br />2ndo e 3rzo carattere Ordine Elencazione<br />4rto carattere numero di interruzioni dopo<br />', '22', '6', NULL, now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Visualizza Prezzo Prodotto', 'PRODUCT_FEATURED_LIST_PRICE', '2402', 'Vuoi visualizzare il Prezzo del Prodotto ?<br /><br />0= off<br />1mo carattere Sinistra o Destra<br />2ndo e 3rzo carattere Ordine Elencazione<br />4rto carattere numero di interruzioni dopo<br />', '22', '7', NULL, now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Visualizza Peso Prodotto', 'PRODUCT_FEATURED_LIST_WEIGHT', '2502', 'Vuoi visualizzare il Peso del Prodotto ?<br /><br />0= off<br />1mo carattere Sinistra o Destra<br />2ndo e 3rzo carattere Ordine Elencazione<br />4rto carattere numero di interruzioni dopo<br />', '22', '8', NULL, now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Visualizza Data Inserimento Prodotto', 'PRODUCT_FEATURED_LIST_DATE_ADDED', '2601', 'Vuoi visualizzare la Data di Inserimento del Prodotto ?<br /><br />0= off<br />1mo carattere Sinistra o Destra<br />2ndo e 3rzo carattere Ordine Elencazione<br />4rto carattere numero di interruzioni dopo<br />', '22', '9', NULL, now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Visualizza Descrizione Prodotto', 'PRODUCT_FEATURED_LIST_DESCRIPTION', '150', 'Quanti caratteri utilizzare nella Descrizione Prodotto?<br /><br />0= OFF<br />150= Valore consigliato, oppure inserire il numero massimo di caratteri da utilizzare', '22', '10', NULL, now(), NULL, '');

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Visualizzazione Prodotti - Ordine Elencazione di Default', 'PRODUCT_FEATURED_LIST_SORT_DEFAULT', '1', 'Qual &egrave; l\'ordine di elencazione di Default che deve essere utilizzato per la visualizzazione dei Prodotti  in Vetrina ?<br />Default= 1 per Nome Prodotto<br /><br />1= Nome Prodotto<br />2= Nome Prodotto Discendente<br />3= Prezzo dal pi&ugrave; basso al pi&ugrave; alto, Nome Prodotto<br />4= Prezzo dal pi&ugrave; alto al pi&ugrave; basso, Nome Prodotto<br />5= Modello<br />6= Data Inserimento discendente<br />7= Data Inserimento<br />8= Ordine Elencazione prodotto', '22', '11', NULL, now(), NULL, 'zen_cfg_select_option(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Prodotti in Vetrina - ID Gruppo di Default', 'PRODUCT_FEATURED_LIST_GROUP_ID', '22', 'Attenzione: Modifica questo valore solamente se l\'ID Gruppo Prodotti in Vetrina &egrave; stato modificato dal valore default di 22<br />Qual &egrave; il configuration_group_id per la visualizzazione di Prodotti in Vetrina ?', '22', '12', NULL, now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Stato Quantit&agrave; Aggiungi Prodotti Multipli e Impostazione Posizione pulsante', 'PRODUCT_FEATURED_LISTING_MULTIPLE_ADD_TO_CART', '3', 'Vuoi visualizzare il riquadro Quantit&agrave; Aggiungi Prodotti Multipli e definire la posizione del Pulsante ?<br />0= off<br />1= Alto<br />2= Basso<br />3= Entrambe', '22', '25', NULL, now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ');

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Visualizza Immagine Prodotto', 'PRODUCT_ALL_LIST_IMAGE', '1102', 'Vuoi visualizzare l\'Immagine Prodotto ?<br /><br />0= off<br />1mo carattere Sinistra o Destra<br />2ndo e 3rzo carattere Ordine Elencazione<br />4rto carattere numero di interruzioni dopo<br />', '23', '1', NULL, now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Visualizza Quantit&agrave; Prodotto', 'PRODUCT_ALL_LIST_QUANTITY', '1202', 'Vuoi visualizzare la Quantit&agrave; Prodotto  ?<br /><br />0= off<br />1mo carattere Sinistra o Destra<br />2ndo e 3rzo carattere Ordine Elencazione<br />4rto carattere numero di interruzioni dopo<br />', '23', '2', NULL, now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Visualizza pulsante Compra Subito', 'PRODUCT_ALL_BUY_NOW', '1300', 'Vuoi visualizzare il Pulsante Compra Subito ?<br /><br />0= off<br />1mo carattere Sinistra o Destra<br />2ndo e 3rzo carattere Ordine Elencazione<br />4rto carattere numero di interruzioni dopo<br />', '23', '3', NULL, now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Visualizza Nome Prodotto', 'PRODUCT_ALL_LIST_NAME', '2101', 'Vuoi visualizzare il Nome Prodotto ?<br /><br />0= off<br />1mo carattere Sinistra o Destra<br />2ndo e 3rzo carattere Ordine Elencazione<br />4rto carattere numero di interruzioni dopo<br />', '23', '4', NULL, now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Visualizza Modello Prodotto', 'PRODUCT_ALL_LIST_MODEL', '2201', 'Vuoi visualizzare il Modello Prodotto ?<br /><br />0= off<br />1mo carattere Sinistra o Destra<br />2ndo e 3rzo carattere Ordine Elencazione<br />4rto carattere numero di interruzioni dopo<br />', '23', '5', NULL, now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Visualizza Nome Produttore', 'PRODUCT_ALL_LIST_MANUFACTURER', '2302', 'Vuoi visualizzare il Nome del Produttore ?<br /><br />0= off<br />1mo carattere Sinistra o Destra<br />2ndo e 3rzo carattere Ordine Elencazione<br />4rto carattere numero di interruzioni dopo<br />', '23', '6', NULL, now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Visualizza Prezzo Prodotto', 'PRODUCT_ALL_LIST_PRICE', '2402', 'Vuoi visualizzare il Prezzo del Prodotto ?<br /><br />0= off<br />1mo carattere Sinistra o Destra<br />2ndo e 3rzo carattere Ordine Elencazione<br />4rto carattere numero di interruzioni dopo<br />', '23', '7', NULL, now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Visualizza Peso Prodotto', 'PRODUCT_ALL_LIST_WEIGHT', '2502', 'Vuoi visualizzare il Peso del Prodotto ?<br /><br />0= off<br />1mo carattere Sinistra o Destra<br />2ndo e 3rzo carattere Ordine Elencazione<br />4rto carattere numero di interruzioni dopo<br />', '23', '8', NULL, now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Visualizza Data Inserimento Prodotto', 'PRODUCT_ALL_LIST_DATE_ADDED', '2601', 'Vuoi visualizzare la Data di Inserimento del Prodotto ?<br /><br />0= off<br />1mo carattere Sinistra o Destra<br />2ndo e 3rzo carattere Ordine Elencazione<br />4rto carattere numero di interruzioni dopo<br />', '23', '9', NULL, now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Visualizza Descrizione Prodotto', 'PRODUCT_ALL_LIST_DESCRIPTION', '150', 'Quanti caratteri utilizzare nella Descrizione Prodotto?<br /><br />0= OFF<br />150= Valore consigliato, oppure inserire il numero massimo di caratteri da utilizzare', '23', '10', NULL, now(), NULL, '');

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Visualizzazione Prodotti - Ordine Elencazione di Default', 'PRODUCT_ALL_LIST_SORT_DEFAULT', '1', 'Quale ordine di elencazione deve essere utilizzato per Default nella visualizzazione di Tutti i Prodotti ?<br />Default= 1 per Nome Prodotto<br /><br />1= Nome Prodotto<br />2= Nome Prodotti Discendente<br />3= Prezzo da basso ad alto, Nome Prodotti<br />4= Prezzo da alto a basso, Nome Prodotti<br />5= Modello<br />6= Data Inserimento discendente<br />7= Data Inserimento<br />8= Ordine Elencazione Prodotto', '23', '11', NULL, now(), NULL, 'zen_cfg_select_option(array\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Tutti i Prodotti - ID Gruppo di Default', 'PRODUCT_ALL_LIST_GROUP_ID', '23', 'Attenzione: Modifica questo valore solamente se l\'ID Gruppo Tutti i Prodotti &egrave; stato modificato dal valore default di 23<br />Qual &egrave; il configuration_group_id per la visualizzazione di Tutti i Prodotti ?', '23', '12', NULL, now(), NULL, NULL);
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Stato Quantit&agrave; Aggiungi Prodotti Multipli e Impostazione Posizione pulsante', 'PRODUCT_ALL_LISTING_MULTIPLE_ADD_TO_CART', '3', 'Vuoi visualizzare il riquadro Quantit&agrave; Aggiungi Prodotti Multipli e definire la posizione del Pulsante ?<br />0= off<br />1= Alto<br />2= Basso<br />3= Entrambe', '23', '25', NULL, now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ');

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Mostra Nuovi Prodotti nella Pagina Principale', 'SHOW_PRODUCT_INFO_MAIN_NEW_PRODUCTS', '1', 'Mostra Nuovi Prodotti nella Pagina Principale<br />0= off o imposta l\'ordine di visualizzazione', '24', '65', NULL, now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Mostra Prodotti in Vetrina nella Pagina Principale', 'SHOW_PRODUCT_INFO_MAIN_FEATURED_PRODUCTS', '2', 'Mostra Prodotti in Vetrina nella Pagina Principale<br />0= off o imposta l\'ordine di visualizzazione', '24', '66', NULL, now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Mostra Prodotti in Offerta nella Pagina Principale', 'SHOW_PRODUCT_INFO_MAIN_SPECIALS_PRODUCTS', '3', 'Mostra Prodotti in Offerta nella Pagina Principale<br />0= off o imposta l\'ordine di visualizzazione', '24', '67', NULL, now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Mostra Prodotti in Arrivo nella Pagina Principale', 'SHOW_PRODUCT_INFO_MAIN_UPCOMING', '4', 'Mostra Prodotti in Arrivo nella Pagina Principale<br />0= off o imposta l\'ordine di visualizzazione', '24', '68', NULL, now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ');

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Mostra Nuovi Prodotti nella Pagina Principale - Categoria con SottoCategorie', 'SHOW_PRODUCT_INFO_CATEGORY_NEW_PRODUCTS', '1', 'Mostra Nuovi Prodotti nella Pagina Principale - Categoria con SottoCategorie<br />0= off o imposta l\'ordine di visualizzazione', '24', '70', NULL, now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Mostra Prodotti in Vetrina nella Pagina Principale - Categoria con SottoCategorie', 'SHOW_PRODUCT_INFO_CATEGORY_FEATURED_PRODUCTS', '2', 'Mostra Prodotti in Vetrina nella Pagina Principale - Categoria con SottoCategorie<br />0= off o imposta l\'ordine di visualizzazione', '24', '71', NULL, now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Mostra Prodotti in Offerta nella Pagina Principale - Categoria con SottoCategorie', 'SHOW_PRODUCT_INFO_CATEGORY_SPECIALS_PRODUCTS', '3', 'Mostra Prodotti in Offerta nella Pagina Principale - Categoria con SottoCategorie<br />0= off o imposta l\'ordine di visualizzazione', '24', '72', NULL, now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Mostra Prodotti in Arrivo nella Pagina Principale - Categoria con SottoCategorie', 'SHOW_PRODUCT_INFO_CATEGORY_UPCOMING', '4', 'Mostra Prodotti in Arrivo nella Pagina Principale - Categoria con SottoCategorie<br />0= off o imposta l\'ordine di visualizzazione', '24', '73', NULL, now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ');

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Mostra Nuovi Prodotti nella Pagina Principale - Pagina Errori e Prodotti Mancanti', 'SHOW_PRODUCT_INFO_MISSING_NEW_PRODUCTS', '1', 'Mostra Nuovi Prodotti nella Pagina Principale - Pagina Errori e Prodotti Mancanti<br />0= off o imposta l\'ordine di visualizzazione', '24', '75', NULL, now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Mostra Prodotti in Vetrina nella Pagina Principale - Pagina Errori e Prodotti Mancanti', 'SHOW_PRODUCT_INFO_MISSING_FEATURED_PRODUCTS', '2', 'Mostra Prodotti in Vetrina nella Pagina Principale - Pagina Errori e Prodotti Mancanti<br />0= off o imposta l\'ordine di visualizzazione', '24', '76', NULL, now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Mostra Prodotti in Offerta nella Pagina Principale - Pagina Errori e Prodotti Mancanti', 'SHOW_PRODUCT_INFO_MISSING_SPECIALS_PRODUCTS', '3', 'Mostra Prodotti in Offerta nella Pagina Principale - Pagina Errori e Prodotti Mancanti<br />0= off o imposta l\'ordine di visualizzazione', '24', '77', NULL, now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Mostra Prodotti in Arrivo nella Pagina Principale - Pagina Errori e Prodotti Mancanti', 'SHOW_PRODUCT_INFO_MISSING_UPCOMING', '4', 'Mostra Prodotti in Arrivo nella Pagina Principale - Pagina Errori e Prodotti Mancanti<br />0= off o imposta l\'ordine di visualizzazione', '24', '78', NULL, now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ');

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Mostra Nuovi Prodotti in Pagina Elenco Prodotti', 'SHOW_PRODUCT_INFO_LISTING_BELOW_NEW_PRODUCTS', '1', 'Mostra Nuovi Prodotti dopo l\'elenco prodotti<br />0= off o imposta l\'ordine di visualizzazione', '24', '85', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Mostra Prodotti in Vetrina in Pagina Elenco Prodotti', 'SHOW_PRODUCT_INFO_LISTING_BELOW_FEATURED_PRODUCTS', '2', 'Mostra Prodotti in Vetrina dopo l\'elenco prodotti<br />0= off o imposta l\'ordine di visualizzazione', '24', '86', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Mostra Prodotti in Offerta in Pagina Elenco Prodotti', 'SHOW_PRODUCT_INFO_LISTING_BELOW_SPECIALS_PRODUCTS', '3', 'Mostra Prodotti in Offerta dopo l\'elenco prodotti<br />0= off o imposta l\'ordine di visualizzazione', '24', '87', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Mostra Prodotti in Arrivo in Pagina Elenco Prodotti', 'SHOW_PRODUCT_INFO_LISTING_BELOW_UPCOMING', '4', 'Mostra Prodotti in Arrivo dopo l\'elenco prodotti<br />0= off o imposta l\'ordine di visualizzazione', '24', '88', 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Nuovi Prodotti - Colonne per Riga', 'SHOW_PRODUCT_INFO_COLUMNS_NEW_PRODUCTS', '3', 'Nuovi Prodotti - Colonne per Riga', '24', '95', NULL, now(), NULL, 'zen_cfg_select_option(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\', \'9\', \'10\', \'11\', \'12\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Mostra Prodotti in Vetrina - Colonne per Riga', 'SHOW_PRODUCT_INFO_COLUMNS_FEATURED_PRODUCTS', '3', 'Mostra Prodotti in Vetrina - Colonne per Riga', '24', '96', NULL, now(), NULL, 'zen_cfg_select_option(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\', \'9\', \'10\', \'11\', \'12\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Mostra Prodotti in Offerta - Colonne per Riga', 'SHOW_PRODUCT_INFO_COLUMNS_SPECIALS_PRODUCTS', '3', 'Mostra Prodotti in Offerta - Colonne per Riga', '24', '97', NULL, now(), NULL, 'zen_cfg_select_option(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\', \'9\', \'10\', \'11\', \'12\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Filtra Elenco Prodotti per la Categoria di livello Top selezionata quando Abilitato', 'SHOW_PRODUCT_INFO_ALL_PRODUCTS', '1', 'Filtra i prodotti quando Elenco Prodotti &egrave; abilitato per la Categoria Principale selezionata o mostra i prodotti da tutte le categorie?<br />0= Filtro Off 1=Filtro On ', '24', '100', NULL, now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\'), ');

#Define Page Status
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Definisce Stato della Pagina Principale', 'DEFINE_MAIN_PAGE_STATUS', '1', 'Abilita Link e Define del Testo per la Pagina Principale<br />0= Link ON, Define Testo OFF<br />1= Link ON, Define Testo ON<br />2= Link OFF, Define Testo ON<br />3= Link OFF, Define Testo OFF', '25', '60', now(), now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Definisce Stato della Pagina Per Contattarci', 'DEFINE_CONTACT_US_STATUS', '1', 'Abilita Link e Define del Testo per la Pagina Per Contattarci<br />0= Link ON, Define Testo OFF<br />1= Link ON, Define Testo ON<br />2= Link OFF, Define Testo ON<br />3= Link OFF, Define Testo OFF', '25', '61', now(), now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Definisce Stato della Pagina Privacy', 'DEFINE_PRIVACY_STATUS', '1', 'Abilita Link e Define del Testo per la Pagina Privacy<br />0= Link ON, Define Testo OFF<br />1= Link ON, Define Testo ON<br />2= Link OFF, Define Testo ON<br />3= Link OFF, Define Testo OFF', '25', '62', now(), now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Definisce Stato della Pagina Spedizioni & Consegne', 'DEFINE_SHIPPINGINFO_STATUS', '1', 'Abilita Link e Define del Testo per la Pagina Spedizioni & Consegne<br />0= Link ON, Define Testo OFF<br />1= Link ON, Define Testo ON<br />2= Link OFF, Define Testo ON<br />3= Link OFF, Define Testo OFF', '25', '63', now(), now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Definisce Stato della Pagina Condizioni di Vendita', 'DEFINE_CONDITIONS_STATUS', '1', 'Abilita Link e Define del Testo per la Pagina Condizioni di Vendita<br />0= Link ON, Define Testo OFF<br />1= Link ON, Define Testo ON<br />2= Link OFF, Define Testo ON<br />3= Link OFF, Define Testo OFF', '25', '64', now(), now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Definisce Stato della Pagina Conferma Checkout', 'DEFINE_CHECKOUT_SUCCESS_STATUS', '1', 'Abilita Link e Define del Testo per la Pagina Conferma Checkout<br />0= Link ON, Define Testo OFF<br />1= Link ON, Define Testo ON<br />2= Link OFF, Define Testo ON<br />3= Link OFF, Define Testo OFF', '25', '65', now(), now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Definisce Stato della Pagina Buono Sconto', 'DEFINE_DISCOUNT_COUPON_STATUS', '1', 'Abilita Link e Define del Testo per la Pagina Buono Sconto<br />0= Link ON, Define Testo OFF<br />1= Link ON, Define Testo ON<br />2= Link OFF, Define Testo ON<br />3= Link OFF, Define Testo OFF', '25', '66', now(), now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Definisce Stato della Pagina Mappa Sito Stato', 'DEFINE_SITE_MAP_STATUS', '1', 'Abilita Link e Define del Testo per la Pagina Mappa Sito<br />0= Link ON, Define Testo OFF<br />1= Link ON, Define Testo ON<br />2= Link OFF, Define Testo ON<br />3= Link OFF, Define Testo OFF', '25', '67', now(), now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('Status Pagina-non-trovata', 'DEFINE_PAGE_NOT_FOUND_STATUS', '1', 'Abilita la visualizzazione del testo per pagina-non-trovata tramite le define-pages?<br />0= NO<br />1= SI', '25', '67', now(), now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Definisce Stato della Pagina Pagina 2', 'DEFINE_PAGE_2_STATUS', '1', 'Abilita Link e Define del Testo per la Pagina Pagina 2<br />0= Link ON, Define Testo OFF<br />1= Link ON, Define Testo ON<br />2= Link OFF, Define Testo ON<br />3= Link OFF, Define Testo OFF', '25', '82', now(), now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Definisce Stato della Pagina Pagina 3', 'DEFINE_PAGE_3_STATUS', '1', 'Abilita Link e Define del Testo per la Pagina Pagina 3<br />0= Link ON, Define Testo OFF<br />1= Link ON, Define Testo ON<br />2= Link OFF, Define Testo ON<br />3= Link OFF, Define Testo OFF', '25', '83', now(), now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Definisce Stato della Pagina Pagina 4', 'DEFINE_PAGE_4_STATUS', '1', 'Abilita Link e Define del Testo per la Pagina Pagina 4<br />0= Link ON, Define Testo OFF<br />1= Link ON, Define Testo ON<br />2= Link OFF, Define Testo ON<br />3= Link OFF, Define Testo OFF', '25', '84', now(), now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),');

#EZ-Pages settings
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('EZ-Pages Stato Visualizzazione - Barra Header', 'EZPAGES_STATUS_HEADER', '1', 'La visualizzazione del contenuto di EZ-Pages pu&ograve; essere Globalmente abilitata/disabilitata per la Barra Header<br />0 = Off<br />1 = On<br />2= On SOLAMENTE IP ADMIN impostato in Manutezione Sito Web<br />NOTA: Attenzione mostrato solamente all\'Admin e non al pubblico', '30', '10', NULL, now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('EZ-Pages Stato Visualizzazione - Barra Footer', 'EZPAGES_STATUS_FOOTER', '1', 'La visualizzazione del contenuto di EZ-Pages pu&ograve; essere Globalmente abilitata/disabilitata per la Barra Footer<br />0 = Off<br />1 = On<br />2= On SOLAMENTE IP ADMIN impostato in Manutezione Sito Web<br />NOTA: Attenzione mostrato solamente all\'Admin e non al pubblico', '30', '11', NULL, now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('EZ-Pages Stato Visualizzazione - Sidebox', 'EZPAGES_STATUS_SIDEBOX', '1', 'La visualizzazione del contenuto di EZ-Pages pu&ograve; essere Globalmente abilitata/disabilitata per i Sidebox<br />0 = Off<br />1 = On<br />2= On SOLAMENTE IP ADMIN impostato in Manutezione Sito Web<br />NOTA: Attenzione mostrato solamente all\'Admin e non al pubblico', '30', '12', NULL, now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('EZ-Pages Separatore Link nell\'Header', 'EZPAGES_SEPARATOR_HEADER', ' ', 'Separatore dei Link nell\'Header EZ-Pages<br />Default = &amp;nbsp;::&amp;nbsp;', '30', '20', NULL, now(), NULL, 'zen_cfg_textarea_small(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('EZ-Pages Separatore Link nel Footer', 'EZPAGES_SEPARATOR_FOOTER', '&nbsp;::&nbsp;', 'Separatore dei Link nel Footer EZ-Pages<br />Default = &amp;nbsp;::&amp;nbsp;', '30', '21', NULL, now(), NULL, 'zen_cfg_textarea_small(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('EZ-Pages Pulsanti Prec./Succ.', 'EZPAGES_SHOW_PREV_NEXT_BUTTONS', '2', 'Visualizzo i pulsanti Prec./Continua/Succ. nelle pagine EZ-Pages ?<br />0=OFF (nessun pulsante)<br />1="Continua"<br />2="Prec./Continua/Succ."<br /><br />Default: 2.', '30', '30', NULL, now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('EZ-Pages Stato Tavola dei Contenuti per Capitolo', 'EZPAGES_SHOW_TABLE_CONTENTS', '1', 'Abilito la Tavola dei Contenuti per Capitoli di EZ-Pages ?<br />0= no<br />1= si', '30', '35', now(), now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\'),');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('EZ-Pages Pagine che disabilitano headers', 'EZPAGES_DISABLE_HEADER_DISPLAY_LIST', '', 'EZ-Pages "pagine" in cui non visualizzare l\' "header" per il tuo sito.<br />Elenca semplicemente i numeri di ID di pagina separati da virgole senza spazi.<br />I numeri ID di Pagina possono essere ottenuti dalla schermata EZ-Pages in Admin->Strumenti.<br />esempio: 1,5,2<br />o lasciare vuoto.', '30', '40', NULL, now(), NULL, 'zen_cfg_textarea_small(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('EZ-Pages Pagine che disabilitano footers', 'EZPAGES_DISABLE_FOOTER_DISPLAY_LIST', '', 'EZ-Pages "pagine" in cui non visualizzare il "footer" per il tuo sito.<br />Elenca semplicemente i numeri di ID di pagina separati da virgole senza spazi.<br />I numeri ID di Pagina possono essere ottenuti dalla schermata EZ-Pages in Admin->Strumenti.<br />esempio: 3,7<br />o lasciare vuoto.', '30', '41', NULL, now(), NULL, 'zen_cfg_textarea_small(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('EZ-Pages Pagine che disabilitano colonna-sinistra', 'EZPAGES_DISABLE_LEFTCOLUMN_DISPLAY_LIST', '', 'EZ-Pages "pagine" in cui non visualizzare la colonna "sinistra" (dei sideboxes) per il tuo sito.<br />Elenca semplicemente i numeri di ID di pagina separati da virgole senza spazi.<br />I numeri ID di Pagina possono essere ottenuti dalla schermata EZ-Pages in Admin->Strumenti.<br />esempio: 21<br />o lasciare vuoto.', '30', '42', NULL, now(), NULL, 'zen_cfg_textarea_small(');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('EZ-Pages Pagine che disabilitano colonna-destra', 'EZPAGES_DISABLE_RIGHTCOLUMN_DISPLAY_LIST', '', 'EZ-Pages "pagine" in cui non visualizzare la colonna "destra" (dei sideboxes) per il tuo sito.<br />Elenca semplicemente i numeri di ID di pagina separati da virgole senza spazi.<br />I numeri ID di Pagina possono essere ottenuti dalla schermata EZ-Pages in Admin->Strumenti.<br />esempio: 3,82,13<br />o lasciare vuoto.', '30', '43', NULL, now(), NULL, 'zen_cfg_textarea_small(');


INSERT INTO configuration_group VALUES ('1', 'Info Negozio', 'Info e Configurazione Negozio', '1', '1');
INSERT INTO configuration_group VALUES ('2', 'Valori Minimi', 'Configurazione per funzioni e dati', '2', '1');
INSERT INTO configuration_group VALUES ('3', 'Valori Massimi', 'Configurazione per funzioni e dati', '3', '1');
INSERT INTO configuration_group VALUES ('4', 'Gestione Immagini', 'Parametri Immagini', '4', '1');
INSERT INTO configuration_group VALUES ('5', 'Info Cliente', 'Configurazione dati Cliente', '5', '1');
INSERT INTO configuration_group VALUES ('6', 'Scelte x Modulo Opzioni', 'Configurazione', '6', '0');
INSERT INTO configuration_group VALUES ('7', 'Spedizioni/Imballo', 'Opzioni disponibili', '7', '1');
INSERT INTO configuration_group VALUES ('8', 'Listino Prodotti', 'Configura opzioni listino articoli', '8', '1');
INSERT INTO configuration_group VALUES ('9', 'Magazzino Scorte', 'Configurazione ed opzioni', '9', '1');
INSERT INTO configuration_group VALUES ('10', 'Connessione', 'Configurazione ed opzioni', '10', '1');
INSERT INTO configuration_group VALUES ('11', 'Regolamenti', 'Settaggio ed opzioni', '16', '1');
INSERT INTO configuration_group VALUES ('12', 'Gestione Email', 'Settaggio Email con opzioni di invio / inoltro', '12', '1');
INSERT INTO configuration_group VALUES ('13', 'Settaggio Additivi', 'Settaggio ed opzioni additivi prodotto', '13', '1');
INSERT INTO configuration_group VALUES ('14', 'Compressione GZip', 'Settaggio ed opzioni compressione', '14', '1');
INSERT INTO configuration_group VALUES ('15', 'Sessioni', 'Gestione delle Sessioni', '15', '1');
INSERT INTO configuration_group VALUES ('16', 'Certificati Regalo/Sconto', 'Configurazione Certificati Regalo/Sconto', '16', '1');
INSERT INTO configuration_group VALUES ('17', 'Carte Credito', 'Carte di Credito accetate', '17', '1');
INSERT INTO configuration_group VALUES ('18', 'Pagina Prodotto', 'Settaggio Informazioni nella Pagina del Prodotto', '18', '1');
INSERT INTO configuration_group VALUES ('19', 'Settaggi Layout', 'Configurazione Struttura Globale', '19', '1');
INSERT INTO configuration_group VALUES ('20', 'Manutenzione Sito', 'Opzioni per sospensione sito', '20', '1');
INSERT INTO configuration_group VALUES ('21', 'Lista Novit&agrave;', 'Settaggio ed opzioni della Lista', '21', '1');
INSERT INTO configuration_group VALUES ('22', 'Listino Vetrina', 'Settaggio ed opzioni della Lista', '22', '1');
INSERT INTO configuration_group VALUES ('23', 'Listino Generale', 'Settaggio ed opzioni della Lista', '23', '1');
INSERT INTO configuration_group VALUES ('24', 'Indice Listino', 'Settaggio e gestione indice', '24', '1');
INSERT INTO configuration_group VALUES ('25', 'Gestione Pagine', 'Settaggio Pagine Extra - Area HTML', '25', '1');
INSERT INTO configuration_group VALUES ('30', 'Pagine EZ', 'Settaggi ed opzioni relative Pagine EZ', '30', '1');

INSERT INTO currencies VALUES (1, 'US Dollar', 'USD', '$', '', '.', ',', '2', '1.38022494', now());
INSERT INTO currencies VALUES (2, 'Euro', 'EUR', '', 'EUR', '.', ',', '2', '1.00000000', now());
INSERT INTO currencies VALUES (3, 'GB Pound', 'GBP', '&pound;', '', '.', ',', '2', '0.87869251', now());
INSERT INTO currencies VALUES (4, 'Franco Svizzero', 'CHF', 'Fr.', '', '.', '''', '2', '1.26819003', now());
#INSERT INTO currencies VALUES (5, 'Canadian Dollar', 'CAD', '$', '', '.', ',', '2', '1.37854505', now());
#INSERT INTO currencies VALUES (6, 'Australian Dollar', 'AUD', '$', '', '.', ',', '2', '1.29422998', now());
#INSERT INTO currencies VALUES (7,'Japanese Yen','JPY','&yen;','','','','0','95.5927', now());

INSERT INTO languages VALUES (1,'English','en','icon.gif','english',1);
INSERT INTO languages VALUES (2,'Italiano','it','icon.gif','italian',0);

INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('default_template_settings', 'banner_box_all.php', 1, 1, 5, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('default_template_settings', 'banner_box.php', 1, 0, 300, 1, 127);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('default_template_settings', 'banner_box2.php', 1, 1, 15, 1, 15);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('default_template_settings', 'best_sellers.php', 1, 1, 30, 70, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('default_template_settings', 'categories.php', 1, 0, 10, 10, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('default_template_settings', 'currencies.php', 0, 1, 80, 60, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('default_template_settings', 'document_categories.php', 1, 0, 0, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('default_template_settings', 'ezpages.php', 1, 1, -1, 2, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('default_template_settings', 'featured.php', 1, 0, 45, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('default_template_settings', 'information.php', 1, 0, 50, 40, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('default_template_settings', 'languages.php', 0, 1, 70, 50, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('default_template_settings', 'manufacturers.php', 1, 0, 30, 20, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('default_template_settings', 'manufacturer_info.php', 1, 1, 35, 95, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('default_template_settings', 'more_information.php', 1, 0, 200, 200, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('default_template_settings', 'music_genres.php', 1, 1, 0, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('default_template_settings', 'order_history.php', 1, 1, 0, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('default_template_settings', 'product_notifications.php', 1, 1, 55, 85, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('default_template_settings', 'record_companies.php', 1, 1, 0, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('default_template_settings', 'reviews.php', 1, 0, 40, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('default_template_settings', 'search.php', 1, 1, 10, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('default_template_settings', 'search_header.php', 0, 0, 0, 0, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('default_template_settings', 'shopping_cart.php', 1, 1, 20, 30, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('default_template_settings', 'specials.php', 1, 1, 45, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('default_template_settings', 'whats_new.php', 1, 0, 20, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('default_template_settings', 'whos_online.php', 1, 1, 200, 200, 1);

INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('template_default', 'banner_box_all.php', 1, 1, 5, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('template_default', 'banner_box.php', 1, 0, 300, 1, 127);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('template_default', 'banner_box2.php', 1, 1, 15, 1, 15);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('template_default', 'best_sellers.php', 1, 1, 30, 70, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('template_default', 'categories.php', 1, 0, 10, 10, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('template_default', 'currencies.php', 0, 1, 80, 60, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('template_default', 'ezpages.php', 1, 1, -1, 2, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('template_default', 'featured.php', 1, 0, 45, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('template_default', 'information.php', 1, 0, 50, 40, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('template_default', 'languages.php', 0, 1, 70, 50, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('template_default', 'manufacturers.php', 1, 0, 30, 20, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('template_default', 'manufacturer_info.php', 1, 1, 35, 95, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('template_default', 'more_information.php', 1, 0, 200, 200, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('template_default', 'my_broken_box.php', 1, 0, 0, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('template_default', 'order_history.php', 1, 1, 0, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('template_default', 'product_notifications.php', 1, 1, 55, 85, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('template_default', 'reviews.php', 1, 0, 40, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('template_default', 'search.php', 1, 1, 10, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('template_default', 'search_header.php', 0, 0, 0, 0, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('template_default', 'shopping_cart.php', 1, 1, 20, 30, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('template_default', 'specials.php', 1, 1, 45, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('template_default', 'whats_new.php', 1, 0, 20, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('template_default', 'whos_online.php', 1, 1, 200, 200, 1);

INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('classic', 'banner_box.php', 1, 0, 300, 1, 127);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('classic', 'banner_box2.php', 1, 1, 15, 1, 15);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('classic', 'banner_box_all.php', 1, 1, 5, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('classic', 'best_sellers.php', 1, 1, 30, 70, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('classic', 'categories.php', 1, 0, 10, 10, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('classic', 'currencies.php', 0, 1, 80, 60, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('classic', 'document_categories.php', 1, 0, 0, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('classic', 'ezpages.php', 1, 1, -1, 2, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('classic', 'featured.php', 1, 0, 45, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('classic', 'information.php', 1, 0, 50, 40, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('classic', 'languages.php', 0, 1, 70, 50, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('classic', 'manufacturers.php', 1, 0, 30, 20, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('classic', 'manufacturer_info.php', 1, 1, 35, 95, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('classic', 'more_information.php', 1, 0, 200, 200, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('classic', 'music_genres.php', 1, 1, 0, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('classic', 'order_history.php', 1, 1, 0, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('classic', 'product_notifications.php', 1, 1, 55, 85, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('classic', 'record_companies.php', 1, 1, 0, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('classic', 'reviews.php', 1, 0, 40, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('classic', 'search.php', 1, 1, 10, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('classic', 'search_header.php', 0, 0, 0, 0, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('classic', 'shopping_cart.php', 1, 1, 20, 30, 1);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('classic', 'specials.php', 1, 1, 45, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('classic', 'whats_new.php', 1, 0, 20, 0, 0);
INSERT INTO layout_boxes (layout_template, layout_box_name, layout_box_status, layout_box_location, layout_box_sort_order, layout_box_sort_order_single, layout_box_status_single) VALUES ('classic', 'whos_online.php', 1, 1, 200, 200, 1);

INSERT INTO orders_status VALUES ( '1', '1', 'Pending');
INSERT INTO orders_status VALUES ( '2', '1', 'Processing');
INSERT INTO orders_status VALUES ( '3', '1', 'Delivered');
INSERT INTO orders_status VALUES ( '4', '1', 'Update');
INSERT INTO orders_status VALUES ( '1', '2', 'In Attesa'); 
INSERT INTO orders_status VALUES ( '2', '2', 'In Lavorazione'); 
INSERT INTO orders_status VALUES ( '3', '2', 'Spedito'); 
INSERT INTO orders_status VALUES ( '4', '2', 'Aggiornato');

INSERT INTO product_types VALUES (1, 'Product - General', 'product', '1', 'Y', '', now(), now());
INSERT INTO product_types VALUES (2, 'Product - Music', 'product_music', '1', 'Y', '', now(), now());
INSERT INTO product_types VALUES (3, 'Document - General', 'document_general', '3', 'N', '', now(), now());
INSERT INTO product_types VALUES (4, 'Document - Product', 'document_product', '3', 'Y', '', now(), now());
INSERT INTO product_types VALUES (5, 'Product - Free Shipping', 'product_free_shipping', '1', 'Y', '', now(), now());

INSERT INTO products_options_types (products_options_types_id, products_options_types_name) VALUES (0, 'Dropdown');
INSERT INTO products_options_types (products_options_types_id, products_options_types_name) VALUES (1, 'Text');
INSERT INTO products_options_types (products_options_types_id, products_options_types_name) VALUES (2, 'Radio');
INSERT INTO products_options_types (products_options_types_id, products_options_types_name) VALUES (3, 'Checkbox');
INSERT INTO products_options_types (products_options_types_id, products_options_types_name) VALUES (4, 'File');
INSERT INTO products_options_types (products_options_types_id, products_options_types_name) VALUES (5, 'Read Only');

INSERT INTO products_options_values (products_options_values_id, language_id, products_options_values_name) VALUES (0, 1, 'TEXT');
INSERT INTO products_options_values (products_options_values_id, language_id, products_options_values_name) VALUES (0, 2, 'TEXT');

# ITALIA
INSERT INTO tax_rates VALUES (1, 1, 1, 1, 21.0, 'IVA 21.0%', now(), now());
INSERT INTO geo_zones (geo_zone_id,geo_zone_name,geo_zone_description,date_added) VALUES (1,'Italia','IVA per Italia e paesi EU',now());
INSERT INTO zones_to_geo_zones (association_id,zone_country_id,zone_id,geo_zone_id,date_added) VALUES (1,105,NULL,1,now());
INSERT INTO tax_class (tax_class_id, tax_class_title, tax_class_description, date_added) VALUES (1, 'Beni 21 % IVA', 'Beni e servizi a cui applicare il 21 % IVA', now());

INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra Modello', 'SHOW_PRODUCT_INFO_MODEL', '1', 'Visualizzo Modello in Info Prodotto ?<br />0= no<br />1= si', '1', '1', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra Peso', 'SHOW_PRODUCT_INFO_WEIGHT', '1', 'Visualizzo Peso in Info Prodotto ?<br />0= no<br />1= si', '1', '2', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra Peso Attributo', 'SHOW_PRODUCT_INFO_WEIGHT_ATTRIBUTES', '1', 'Visualizzo Peso Attributo in Info Prodotto ?<br />0= no<br />1= si', '1', '3', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra Produttore', 'SHOW_PRODUCT_INFO_MANUFACTURER', '1', 'Visualizzo Produttore in Info Prodotto ?<br />0= no<br />1= si', '1', '4', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra Quantit&agrave; in Carrello', 'SHOW_PRODUCT_INFO_IN_CART_QTY', '1', 'Visualizzo Quantit&agrave; nel Carrello in Info Prodotto ?<br />0= no<br />1= si', '1', '5', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra Quantit&agrave; in magazzino', 'SHOW_PRODUCT_INFO_QUANTITY', '1', 'Visualizzo Quantit&agrave; in Magazzino in Info Prodotto ?<br />0= no<br />1= si', '1', '6', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra Contatore Recensioni Prodotti', 'SHOW_PRODUCT_INFO_REVIEWS_COUNT', '1', 'Visualizzo Contatore Recensioni Prodotti in Info Prodotto ?<br />0= no<br />1= si', '1', '7', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra Pulsante Recensioni Prodotti', 'SHOW_PRODUCT_INFO_REVIEWS', '1', 'Visualizzo Pulsante Recensioni Prodotti in Info Prodotto ?<br />0= no<br />1= si', '1', '8', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra Data Disponibilit&agrave;', 'SHOW_PRODUCT_INFO_DATE_AVAILABLE', '1', 'Visualizzo Data Disponibilit&agrave; in Info Prodotto ?<br />0= no<br />1= si', '1', '9', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra Data Inserimento', 'SHOW_PRODUCT_INFO_DATE_ADDED', '1', 'Visualizzo Data Inserimento in Info Prodotto ?<br />0= no<br />1= si', '1', '10', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra URL Prodotto', 'SHOW_PRODUCT_INFO_URL', '1', 'Visualizzo URL Prodotto in Info Prodotto ?<br />0= no<br />1= si', '1', '11', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra Immagini Addizionali Prodotto', 'SHOW_PRODUCT_INFO_ADDITIONAL_IMAGES', '1', 'Visualizzo Immagini Addizionali Prodotto in Info Prodotto ?<br />0= no<br />1= si', '1', '13', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());

INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra A partire da: nel Prezzo', 'SHOW_PRODUCT_INFO_STARTING_AT', '1', 'Visualizzo A partire da: in Info Prodotto ?<br />0= no<br />1= si', '1', '12', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());

INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra immagine Spedizione Gratuita in Info Prodotto', 'SHOW_PRODUCT_INFO_ALWAYS_FREE_SHIPPING_IMAGE_SWITCH', '0', 'Visualizzo l\'immagine Spedizione Gratuita in Info Prodotto ?<br />0= no<br />1= si', '1', '16', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
#admin defaults
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, use_function, set_function, date_added) VALUES ('Mostra Classe Tassa di Default quando inserisci un nuovo prodotto', 'DEFAULT_PRODUCT_TAX_CLASS_ID', '0', 'Quale deve essere l\'ID predefinito per la Classe di Tassa quando viene aggiunto un nuovo prodotto ?', '1', '100', '', '', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Se il Prodotto &egrave; Virtuale salta Indirizzo di Spedizione quando inserisci un nuovo prodotto', 'DEFAULT_PRODUCT_PRODUCTS_VIRTUAL', '0', 'Lo stato predefinito di Prodotto Virtuale deve essere ON quando viene aggiunto un nuovo prodotto ?', '1', '101', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());

INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Se il Prodotto &egrave; con Spedizione Gratuita usa Normali Regole di Spedizione quando aggiungi un nuovo prodotto', 'DEFAULT_PRODUCT_PRODUCTS_IS_ALWAYS_FREE_SHIPPING', '0', 'Quale deve essere lo stato predefinito di Spedizione Gratuita quando viene aggiunto un nuovo prodotto ?<br />Si, Spedizione Gratuita sempre ON<br />No, Spedizione Gratuita sempre OFF<br />Prodotti in Offerta, Prodotti/Scaricabili richiedono Spedizione', '1', '102', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes, Always ON\'), array(\'id\'=>\'0\', \'text\'=>\'No, Always OFF\'), array(\'id\'=>\'2\', \'text\'=>\'Special\')), ', now());


INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra Modello', 'SHOW_PRODUCT_MUSIC_INFO_MODEL', '1', 'Visualizzo Modello in Info Prodotto ?<br />0= no<br />1= si', '2', '1', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra Peso', 'SHOW_PRODUCT_MUSIC_INFO_WEIGHT', '0', 'Visualizzo Peso in Info Prodotto ?<br />0= no<br />1= si', '2', '2', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra Peso Attributo', 'SHOW_PRODUCT_MUSIC_INFO_WEIGHT_ATTRIBUTES', '1', 'Visualizzo Peso Attributo in Info Prodotto ?<br />0= no<br />1= si', '2', '3', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra Artista', 'SHOW_PRODUCT_MUSIC_INFO_ARTIST', '1', 'Visualizzo Artista in Info Prodotto ?<br />0= no<br />1= si', '2', '4', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra Genere Musicale', 'SHOW_PRODUCT_MUSIC_INFO_GENRE', '1', 'Visualizzo Genere Musicale in Info Prodotto ?<br />0= no<br />1= si', '2', '4', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra Casa Discografica', 'SHOW_PRODUCT_MUSIC_INFO_RECORD_COMPANY', '1', 'Visualizzo Casa Discografica in Info Prodotto ?<br />0= no<br />1= si', '2', '4', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra Quantit&agrave; nel Carrello', 'SHOW_PRODUCT_MUSIC_INFO_IN_CART_QTY', '1', 'Visualizzo Quantit&agrave; nel Carrello in Info Prodotto ?<br />0= no<br />1= si', '2', '5', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra Quantit&agrave; in magazzino', 'SHOW_PRODUCT_MUSIC_INFO_QUANTITY', '0', 'Visualizzo Quantit&agrave; in Magazzino in Info Prodotto ?<br />0= no<br />1= si', '2', '6', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra Contatore Recensioni Prodotti', 'SHOW_PRODUCT_MUSIC_INFO_REVIEWS_COUNT', '1', 'Visualizzo Contatore Recensioni Prodotti in Info Prodotto ?<br />0= no<br />1= si', '2', '7', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra Pulsante Recensioni Prodotti', 'SHOW_PRODUCT_MUSIC_INFO_REVIEWS', '1', 'Visualizzo Pulsante Recensioni Prodotti in Info Prodotto ?<br />0= no<br />1= si', '2', '8', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra Data Disponibilit&agrave;', 'SHOW_PRODUCT_MUSIC_INFO_DATE_AVAILABLE', '1', 'Visualizzo Data Disponibilit&agrave; in Info Prodotto ?<br />0= no<br />1= siVisualizzo Data Disponibilit&agrave; in Info Prodotto ?<br />0= no<br />1= si', '2', '9', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra Data Inserimento', 'SHOW_PRODUCT_MUSIC_INFO_DATE_ADDED', '1', 'Visualizzo Data Inserimento in Info Prodotto ?<br />0= no<br />1= si', '2', '10', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());

INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra A partire da: nel Prezzo', 'SHOW_PRODUCT_MUSIC_INFO_STARTING_AT', '1', 'Visualizzo A partire da: in Info Prodotto ?<br />0= no<br />1= si', '2', '12', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra Immagini Addizionali Prodotto', 'SHOW_PRODUCT_MUSIC_INFO_ADDITIONAL_IMAGES', '1', 'Visualizzo Immagini Addizionali Prodotto in Info Prodotto ?<br />0= no<br />1= si', '2', '13', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());

INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra immagine Spedizione Gratuita in Info Prodotto', 'SHOW_PRODUCT_MUSIC_INFO_ALWAYS_FREE_SHIPPING_IMAGE_SWITCH', '0', 'Visualizzo l\'immagine Spedizione Gratuita in Info Prodotto ?<br />0= no<br />1= si', '2', '16', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
#admin defaults
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, use_function, set_function, date_added) VALUES ('Mostra Classe Tassa di Default quando inserisci un nuovo prodotto', 'DEFAULT_PRODUCT_MUSIC_TAX_CLASS_ID', '0', 'Quale deve essere l\'ID predefinito per la Classe di Tassa quando viene aggiunto un nuovo prodotto ?', '2', '100', '', '', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Se il Prodotto &egrave; Virtuale salta Indirizzo di Spedizione quando inserisci un nuovo prodotto', 'DEFAULT_PRODUCT_MUSIC_PRODUCTS_VIRTUAL', '0', 'Lo stato predefinito di Prodotto Virtuale deve essere ON quando viene aggiunto un nuovo prodotto ?', '2', '101', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Se il Prodotto &egrave; con Spedizione Gratuita usa Normali Regole di Spedizione quando aggiungi un nuovo prodotto', 'DEFAULT_PRODUCT_MUSIC_PRODUCTS_IS_ALWAYS_FREE_SHIPPING', '0', 'Quale deve essere lo stato predefinito di Spedizione Gratuita quando viene aggiunto un nuovo prodotto ?<br />Si, Spedizione Gratuita sempre ON<br />No, Spedizione Gratuita sempre OFF<br />Prodotti in Offerta, Prodotti/Scaricabili richiedono Spedizione', '2', '102', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes, Always ON\'), array(\'id\'=>\'0\', \'text\'=>\'No, Always OFF\'), array(\'id\'=>\'2\', \'text\'=>\'Special\')), ', now());


INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra Contatore Recensioni Prodotti', 'SHOW_DOCUMENT_GENERAL_INFO_REVIEWS_COUNT', '1', 'Visualizzo Contatore Recensioni Prodotti in Info Prodotto ?<br />0= no<br />1= si', '3', '7', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra Pulsante Recensioni Prodotti', 'SHOW_DOCUMENT_GENERAL_INFO_REVIEWS', '1', 'Visualizzo Pulsante Recensioni Prodotti in Info Prodotto ?<br />0= no<br />1= si', '3', '8', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra Data Disponibilit&agrave;', 'SHOW_DOCUMENT_GENERAL_INFO_DATE_AVAILABLE', '1', 'Visualizzo Data Disponibilit&agrave; in Info Prodotto ?<br />0= no<br />1= siVisualizzo Data Disponibilit&agrave; in Info Prodotto ?<br />0= no<br />1= si', '3', '9', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra Data Inserimento', 'SHOW_DOCUMENT_GENERAL_INFO_DATE_ADDED', '1', 'Visualizzo Data Inserimento in Info Prodotto ?<br />0= no<br />1= si', '3', '10', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra URL Prodotto', 'SHOW_DOCUMENT_GENERAL_INFO_URL', '1', 'Visualizzo URL Prodotto in Info Prodotto ?<br />0= no<br />1= si', '3', '11', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra Immagini Addizionali Prodotto', 'SHOW_DOCUMENT_GENERAL_INFO_ADDITIONAL_IMAGES', '1', 'Visualizzo Immagini Addizionali Prodotto in Info Prodotto ?<br />0= no<br />1= si', '3', '13', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());

#admin defaults


INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra Modello', 'SHOW_DOCUMENT_PRODUCT_INFO_MODEL', '1', 'Visualizzo Modello in Info Prodotto ?<br />0= no<br />1= si', '4', '1', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra Peso', 'SHOW_DOCUMENT_PRODUCT_INFO_WEIGHT', '0', 'Visualizzo Peso in Info Prodotto ?<br />0= no<br />1= si', '4', '2', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra Peso Attributo', 'SHOW_DOCUMENT_PRODUCT_INFO_WEIGHT_ATTRIBUTES', '1', 'Visualizzo Peso Attributo in Info Prodotto ?<br />0= no<br />1= si', '4', '3', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra Produttore', 'SHOW_DOCUMENT_PRODUCT_INFO_MANUFACTURER', '1', 'Visualizzo Produttore in Info Prodotto ?<br />0= no<br />1= si', '4', '4', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra Quantit&agrave; in Carrello', 'SHOW_DOCUMENT_PRODUCT_INFO_IN_CART_QTY', '1', 'Visualizzo Quantit&agrave; nel Carrello in Info Prodotto ?<br />0= no<br />1= si', '4', '5', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra Quantit&agrave; in magazzino', 'SHOW_DOCUMENT_PRODUCT_INFO_QUANTITY', '0', 'Visualizzo Quantit&agrave; in Magazzino in Info Prodotto ?<br />0= no<br />1= si', '4', '6', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra Contatore Recensioni Prodotti', 'SHOW_DOCUMENT_PRODUCT_INFO_REVIEWS_COUNT', '1', 'Visualizzo Contatore Recensioni Prodotti in Info Prodotto ?<br />0= no<br />1= si', '4', '7', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra Pulsante Recensioni Prodotti', 'SHOW_DOCUMENT_PRODUCT_INFO_REVIEWS', '1', 'Visualizzo Pulsante Recensioni Prodotti in Info Prodotto ?<br />0= no<br />1= si', '4', '8', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra Data Disponibilit&agrave;', 'SHOW_DOCUMENT_PRODUCT_INFO_DATE_AVAILABLE', '1', 'Visualizzo Data Disponibilit&agrave; in Info Prodotto ?<br />0= no<br />1= siVisualizzo Data Disponibilit&agrave; in Info Prodotto ?<br />0= no<br />1= si', '4', '9', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra Data Inserimento', 'SHOW_DOCUMENT_PRODUCT_INFO_DATE_ADDED', '1', 'Visualizzo Data Inserimento in Info Prodotto ?<br />0= no<br />1= si', '4', '10', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra URL Prodotto', 'SHOW_DOCUMENT_PRODUCT_INFO_URL', '1', 'Visualizzo URL Prodotto in Info Prodotto ?<br />0= no<br />1= si', '4', '11', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra Immagini Addizionali Prodotto', 'SHOW_DOCUMENT_PRODUCT_INFO_ADDITIONAL_IMAGES', '1', 'Visualizzo Immagini Addizionali Prodotto in Info Prodotto ?<br />0= no<br />1= si', '4', '13', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());


INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra A partire da: nel Prezzo', 'SHOW_DOCUMENT_PRODUCT_INFO_STARTING_AT', '1', 'Visualizzo A partire da: in Info Prodotto ?<br />0= no<br />1= si', '4', '12', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());

INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra immagine Spedizione Gratuita in Info Prodotto', 'SHOW_DOCUMENT_PRODUCT_INFO_ALWAYS_FREE_SHIPPING_IMAGE_SWITCH', '0', 'Visualizzo l\'immagine Spedizione Gratuita in Info Prodotto ?<br />0= no<br />1= si', '4', '16', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
#admin defaults
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, use_function, set_function, date_added) VALUES ('Mostra Classe Tassa di Default quando inserisci un nuovo prodotto', 'DEFAULT_DOCUMENT_PRODUCT_TAX_CLASS_ID', '0', 'Quale deve essere l\'ID predefinito per la Classe di Tassa quando viene aggiunto un nuovo prodotto ?', '4', '100', '', '', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Se il Prodotto &egrave; Virtuale salta Indirizzo di Spedizione quando inserisci un nuovo prodotto', 'DEFAULT_DOCUMENT_PRODUCT_PRODUCTS_VIRTUAL', '0', 'Lo stato predefinito di Prodotto Virtuale deve essere ON quando viene aggiunto un nuovo prodotto ?', '4', '101', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Se il Prodotto &egrave; con Spedizione Gratuita usa Normali Regole di Spedizione quando aggiungi un nuovo prodotto', 'DEFAULT_DOCUMENT_PRODUCT_PRODUCTS_IS_ALWAYS_FREE_SHIPPING', '0', 'Quale deve essere lo stato predefinito di Spedizione Gratuita quando viene aggiunto un nuovo prodotto ?<br />Si, Spedizione Gratuita sempre ON<br />No, Spedizione Gratuita sempre OFF<br />Prodotti in Offerta, Prodotti/Scaricabili richiedono Spedizione', '4', '102', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes, Always ON\'), array(\'id\'=>\'0\', \'text\'=>\'No, Always OFF\'), array(\'id\'=>\'2\', \'text\'=>\'Special\')), ', now());


INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra Modello', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_MODEL', '1', 'Visualizzo Modello in Info Prodotto ?<br />0= no<br />1= si', '5', '1', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra Peso', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_WEIGHT', '0', 'Visualizzo Peso in Info Prodotto ?<br />0= no<br />1= si', '5', '2', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra Peso Attributo', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_WEIGHT_ATTRIBUTES', '1', 'Visualizzo Peso Attributo in Info Prodotto ?<br />0= no<br />1= si', '5', '3', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra Produttore', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_MANUFACTURER', '1', 'Visualizzo Produttore in Info Prodotto ?<br />0= no<br />1= si', '5', '4', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra Quantit&agrave; in Carrello', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_IN_CART_QTY', '1', 'Visualizzo Quantit&agrave; nel Carrello in Info Prodotto ?<br />0= no<br />1= si', '5', '5', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra Quantit&agrave; in magazzino', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_QUANTITY', '1', 'Visualizzo Quantit&agrave; in Magazzino in Info Prodotto ?<br />0= no<br />1= si', '5', '6', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra Contatore Recensioni Prodotti', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_REVIEWS_COUNT', '1', 'Visualizzo Contatore Recensioni Prodotti in Info Prodotto ?<br />0= no<br />1= si', '5', '7', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra Pulsante Recensioni Prodotti', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_REVIEWS', '1', 'Visualizzo Pulsante Recensioni Prodotti in Info Prodotto ?<br />0= no<br />1= si', '5', '8', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra Data Disponibilit&agrave;', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_DATE_AVAILABLE', '0', 'Visualizzo Data Disponibilit&agrave; in Info Prodotto ?<br />0= no<br />1= siVisualizzo Data Disponibilit&agrave; in Info Prodotto ?<br />0= no<br />1= si', '5', '9', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra Data Inserimento', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_DATE_ADDED', '1', 'Visualizzo Data Inserimento in Info Prodotto ?<br />0= no<br />1= si', '5', '10', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra URL Prodotto', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_URL', '1', 'Visualizzo URL Prodotto in Info Prodotto ?<br />0= no<br />1= si', '5', '11', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra Immagini Addizionali Prodotto', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_ADDITIONAL_IMAGES', '1', 'Visualizzo Immagini Addizionali Prodotto in Info Prodotto ?<br />0= no<br />1= si', '5', '13', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());

INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra A partire da: nel Prezzo', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_STARTING_AT', '1', 'Visualizzo A partire da: in Info Prodotto ?<br />0= no<br />1= si', '5', '12', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());

INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Mostra immagine Spedizione Gratuita in Info Prodotto', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_ALWAYS_FREE_SHIPPING_IMAGE_SWITCH', '1', 'Visualizzo l\'immagine Spedizione Gratuita in Info Prodotto ?<br />0= no<br />1= si', '5', '16', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
#admin defaults
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, use_function, set_function, date_added) VALUES ('Mostra Classe Tassa di Default quando inserisci un nuovo prodotto', 'DEFAULT_PRODUCT_FREE_SHIPPING_TAX_CLASS_ID', '0', 'Quale deve essere l\'ID predefinito per la Classe di Tassa quando viene aggiunto un nuovo prodotto ?', '5', '100', '', '', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Se il Prodotto &egrave; Virtuale salta Indirizzo di Spedizione quando inserisci un nuovo prodotto', 'DEFAULT_PRODUCT_FREE_SHIPPING_PRODUCTS_VIRTUAL', '0', 'Lo stato predefinito di Prodotto Virtuale deve essere ON quando viene aggiunto un nuovo prodotto ?', '5', '101', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Se il Prodotto &egrave; con Spedizione Gratuita usa Normali Regole di Spedizione quando aggiungi un nuovo prodotto', 'DEFAULT_PRODUCT_FREE_SHIPPING_PRODUCTS_IS_ALWAYS_FREE_SHIPPING', '1', 'Quale deve essere lo stato predefinito di Spedizione Gratuita quando viene aggiunto un nuovo prodotto ?<br />Si, Spedizione Gratuita sempre ON<br />No, Spedizione Gratuita sempre OFF<br />Prodotti in Offerta, Prodotti/Scaricabili richiedono Spedizione', '5', '102', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes, Always ON\'), array(\'id\'=>\'0\', \'text\'=>\'No, Always OFF\'), array(\'id\'=>\'2\', \'text\'=>\'Special\')), ', now());

#insert product type layout settings for meta-tags
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Visualizza Titolo Prodotto nei Meta Tags Titolo', 'SHOW_PRODUCT_INFO_METATAGS_TITLE_STATUS', '1', 'Visualizza Titolo Prodotto nei Meta Tags Titolo<br />0= off 1= on', '1', '50', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Visualizza Nome Prodotto nei Meta Tags Titolo', 'SHOW_PRODUCT_INFO_METATAGS_PRODUCTS_NAME_STATUS', '1', 'Visualizza Nome Prodotto nei Meta Tags Titolo<br />0= off 1= on', '1', '51', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Visualizza Modello Prodotto nei Meta Tags Titolo', 'SHOW_PRODUCT_INFO_METATAGS_MODEL_STATUS', '1', 'Visualizza Modello Prodotto nei Meta Tags Titolo<br />0= off 1= on', '1', '52', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Visualizza Prezzo Prodotto nei Meta Tags Titolo', 'SHOW_PRODUCT_INFO_METATAGS_PRICE_STATUS', '1', 'Visualizza Prezzo Prodotto nei Meta Tags Titolo<br />0= off 1= on', '1', '53', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Visualizza Tagline Prodotto nei Meta Tags Titolo', 'SHOW_PRODUCT_INFO_METATAGS_TITLE_TAGLINE_STATUS', '1', 'Visualizza Tagline Prodotto nei Meta Tags Titolo<br />0= off 1= on', '1', '54', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());

INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Visualizza Titolo Prodotto nei Meta Tags Titolo', 'SHOW_PRODUCT_MUSIC_INFO_METATAGS_TITLE_STATUS', '1', 'Visualizza Titolo Prodotto nei Meta Tags Titolo<br />0= off 1= on', '2', '50', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Visualizza Nome Prodotto nei Meta Tags Titolo', 'SHOW_PRODUCT_MUSIC_INFO_METATAGS_PRODUCTS_NAME_STATUS', '1', 'Visualizza Nome Prodotto nei Meta Tags Titolo<br />0= off 1= on', '2', '51', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Visualizza Modello Prodotto nei Meta Tags Titolo', 'SHOW_PRODUCT_MUSIC_INFO_METATAGS_MODEL_STATUS', '1', 'Visualizza Modello Prodotto nei Meta Tags Titolo<br />0= off 1= on', '2', '52', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Visualizza Prezzo Prodotto nei Meta Tags Titolo', 'SHOW_PRODUCT_MUSIC_INFO_METATAGS_PRICE_STATUS', '1', 'Visualizza Prezzo Prodotto nei Meta Tags Titolo<br />0= off 1= on', '2', '53', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Visualizza Tagline Prodotto nei Meta Tags Titolo', 'SHOW_PRODUCT_MUSIC_INFO_METATAGS_TITLE_TAGLINE_STATUS', '1', 'Visualizza Tagline Prodotto nei Meta Tags Titolo<br />0= off 1= on', '2', '54', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());

INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Visualizza Titolo Documento nei Meta Tags Titolo', 'SHOW_DOCUMENT_GENERAL_INFO_METATAGS_TITLE_STATUS', '1', 'Visualizza Titolo Documento nei Meta Tags Titolo<br />0= off 1= on', '3', '50', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Visualizza Nome Documento nei Meta Tags Titolo', 'SHOW_DOCUMENT_GENERAL_INFO_METATAGS_PRODUCTS_NAME_STATUS', '1', 'Visualizza Nome Documento nei Meta Tags Titolo<br />0= off 1= on', '3', '51', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Visualizza Tagline Documento nei Meta Tags Titolo', 'SHOW_DOCUMENT_GENERAL_INFO_METATAGS_TITLE_TAGLINE_STATUS', '1', 'Visualizza Tagline Documento nei Meta Tags Titolo<br />0= off 1= on', '3', '54', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());

INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Visualizza Titolo Documento nei Meta Tags Titolo', 'SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_TITLE_STATUS', '1', 'Visualizza Titolo Documento nei Meta Tags Titolo<br />0= off 1= on', '4', '50', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Visualizza Nome Documento nei Meta Tags Titolo', 'SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_PRODUCTS_NAME_STATUS', '1', 'Visualizza Nome Documento nei Meta Tags Titolo<br />0= off 1= on', '4', '51', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Visualizza Modello Documento nei Meta Tags Titolo', 'SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_MODEL_STATUS', '1', 'Visualizza Modello Documento nei Meta Tags Titolo<br />0= off 1= on', '4', '52', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Visualizza Prezzo Documento nei Meta Tags Titolo', 'SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_PRICE_STATUS', '1', 'Visualizza Prezzo Documento nei Meta Tags Titolo<br />0= off 1= on', '4', '53', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Visualizza Tagline Documento nei Meta Tags Titolo', 'SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_TITLE_TAGLINE_STATUS', '1', 'Visualizza Tagline Documento nei Meta Tags Titolo<br />0= off 1= on', '4', '54', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());

INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Visualizza Titolo Prodotto nei Meta Tags Titolo', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_TITLE_STATUS', '1', 'Visualizza Titolo Prodotto nei Meta Tags Titolo<br />0= off 1= on', '5', '50', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Visualizza Nome Prodotto nei Meta Tags Titolo', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_PRODUCTS_NAME_STATUS', '1', 'Visualizza Nome Prodotto nei Meta Tags Titolo<br />0= off 1= on', '5', '51', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Visualizza Modello Prodotto nei Meta Tags Titolo', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_MODEL_STATUS', '1', 'Visualizza Modello Prodotto nei Meta Tags Titolo<br />0= off 1= on', '5', '52', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Visualizza Prezzo Prodotto nei Meta Tags Titolo', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_PRICE_STATUS', '1', 'Visualizza Prezzo Prodotto nei Meta Tags Titolo<br />0= off 1= on', '5', '53', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('Visualizza Tagline Prodotto nei Meta Tags Titolo', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_TITLE_TAGLINE_STATUS', '1', 'Visualizza Tagline Prodotto nei Meta Tags Titolo<br />0= off 1= on', '5', '54', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ', now());
### eof: meta tags database updates and changes

#insert product type layout settings
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('PRODOTTO - Attributo Sola Visualizzazione - Default', 'DEFAULT_PRODUCT_ATTRIBUTES_DISPLAY_ONLY', '0', 'PRODOTTO - L\'Attributo &egrave; Sola Visualizzazione ?<br />Usato per Scopi di Sola Visualizzazione<br />0= No 1= Si', '1', '200', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('PRODOTTO - Attributo Gratis - Default', 'DEFAULT_PRODUCT_ATTRIBUTE_IS_FREE', '1', 'PRODOTTO - L\'Attributo &egrave; Gratis<br />L\'Attributo &egrave; Gratis quando il Prodotto &egrave; Gratis<br />0= No 1= Si', '1', '201', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('PRODOTTO - Attributo Default - Default', 'DEFAULT_PRODUCT_ATTRIBUTES_DEFAULT', '0', 'PRODOTTO - L\'Attributo &egrave; Default<br />L\'Attributo che per default deve essere marcato come Selezionato<br />0= No 1= Si', '1', '202', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('PRODOTTO - Attributo Scontato - Default', 'DEFAULT_PRODUCT_ATTRIBUTES_DISCOUNTED', '1', 'PRODOTTO - L\'Attributo &egrave; Scontato<br />Applica Sconti usato per i Prodotti in Offerta/Saldo<br />0= No 1= Si', '1', '203', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('PRODOTTO - Attributo Incluso in Prezzo Base - Default', 'DEFAULT_PRODUCT_ATTRIBUTES_PRICE_BASE_INCLUDED', '1', 'PRODOTTO - L\'Attributo &egrave; Incluso nel Prezzo Base<br />Includi nel Prezzo Base quando Prezzato per Attributi<br />0= No 1= Si', '1', '204', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('PRODOTTO - Attributo Richiesto - Default', 'DEFAULT_PRODUCT_ATTRIBUTES_REQUIRED', '0', 'PRODOTTO - L\'Attributo &egrave; Richiesto<br />Attributo Richiesto per Testo<br />0= No 1= Si', '1', '205', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('PRODOTTO - Attributo Prefisso Prezzo - Default', 'DEFAULT_PRODUCT_PRICE_PREFIX', '1', 'PRODOTTO - Il Prefisso Prezzo dell\'Attributo &egrave;<br />Prefisso Prezzo Attributo di Default<br />Vuoto, + o -', '1', '206', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('PRODOTTO - Attributo Prefisso Peso - Default', 'DEFAULT_PRODUCT_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX', '1', 'PRODOTTO - Il Prefisso Peso dell\'Attributo &egrave;<br />Prefisso Peso Attributo di Default<br />Vuoto, + o -', '1', '207', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), ', now());

INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('MUSICA - Attributo Sola Visualizzazione - Default', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_DISPLAY_ONLY', '0', 'MUSICA - L\'Attributo &egrave; Sola Visualizzazione ?<br />Usato per Scopi di Sola Visualizzazione<br />0= No 1= Si', '2', '200', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('MUSICA - Attributo Gratis - Default', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTE_IS_FREE', '1', 'MUSICA - L\'Attributo &egrave; Free<br />L\'Attributo &egrave; Gratis quando il Prodotto &egrave; Gratis<br />0= No 1= Si', '2', '201', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('MUSICA - Attributo Default - Default', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_DEFAULT', '0', 'MUSICA - L\'Attributo &egrave; Default<br />L\'Attributo che per default deve essere marcato come Selezionato<br />0= No 1= Si', '2', '202', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('MUSICA - Attributo Scontato - Default', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_DISCOUNTED', '1', 'MUSICA - L\'Attributo &egrave; Scontato<br />Applica Sconti usato per i Prodotti in Offerta/Sale<br />0= No 1= Si', '2', '203', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('MUSICA - Attributo Incluso in Prezzo Base - Default', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_PRICE_BASE_INCLUDED', '1', 'MUSICA - L\'Attributo &egrave; Incluso nel Prezzo Base<br />Includi nel Prezzo Base quando Prezzato per Attributi<br />0= No 1= Si', '2', '204', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('MUSICA - Attributo Richiesto - Default', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_REQUIRED', '0', 'MUSICA - L\'Attributo &egrave; Incluso nel Prezzo Base<br />Includi nel Prezzo Base quando Prezzato per Attributi<br />0= No 1= Si', '2', '205', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('MUSICA - Attributo Prefisso Prezzo - Default', 'DEFAULT_PRODUCT_MUSIC_PRICE_PREFIX', '1', 'MUSICA - Il Prefisso Prezzo dell\'Attributo &egrave;<br />Prefisso Prezzo Attributo di Default<br />Vuoto, + o -', '2', '206', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('MUSICA - Attributo Prefisso Peso - Default', 'DEFAULT_PRODUCT_MUSIC_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX', '1', 'MUSICA - Il Prefisso Peso dell\'Attributo &egrave;<br />Prefisso Peso Attributo di Default<br />Vuoto, + o -', '2', '207', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), ', now());

INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('DOCUMENTO GENERALE - Attributo Sola Visualizzazione - Default', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_DISPLAY_ONLY', '0', 'DOCUMENTO GENERALE - L\'Attributo &egrave; Sola Visualizzazione ?<br />Usato per Scopi di Sola Visualizzazione<br />0= No 1= Si', '3', '200', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('DOCUMENTO GENERALE - Attributo Gratis - Default', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTE_IS_FREE', '1', 'DOCUMENTO GENERALE - L\'Attributo &egrave; Free<br />L\'Attributo &egrave; Gratis quando il Prodotto &egrave; Gratis<br />0= No 1= Si', '3', '201', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('DOCUMENTO GENERALE - Default - Default', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_DEFAULT', '0', 'DOCUMENTO GENERALE - L\'Attributo &egrave; Default<br />L\'Attributo che per default deve essere marcato come Selezionato<br />0= No 1= Si', '3', '202', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('DOCUMENTO GENERALE - Attributo Scontato - Default', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_DISCOUNTED', '1', 'DOCUMENTO GENERALE - L\'Attributo &egrave; Scontato<br />Applica Sconti usato per i Prodotti in Offerta/Saldo<br />0= No 1= Si', '3', '203', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('DOCUMENTO GENERALE - Attributo Incluso in Prezzo Base - Default', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_PRICE_BASE_INCLUDED', '1', 'DOCUMENTO GENERALE - L\'Attributo &egrave; Incluso nel Prezzo Base<br />Includi nel Prezzo Base quando Priezzato per Attributi<br />0= No 1= Si', '3', '204', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('DOCUMENTO GENERALE - Attributo Richiesto - Default', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_REQUIRED', '0', 'DOCUMENTO GENERALE - L\'Attributo &egrave; Incluso nel Prezzo Base<br />Includi nel Prezzo Base quando Priezzato per Attributi<br />0= No 1= Si', '3', '205', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('DOCUMENTO GENERALE - Attributo Prefisso Prezzo - Default', 'DEFAULT_DOCUMENT_GENERAL_PRICE_PREFIX', '1', 'DOCUMENTO GENERALE - Il Prefisso Prezzo dell\'Attributo &egrave;<br />Prefisso Prezzo Attributo di Default<br />Vuoto, + o -', '3', '206', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('DOCUMENTO GENERALE - Attributo Prefisso Peso - Default', 'DEFAULT_DOCUMENT_GENERAL_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX', '1', 'DOCUMENTO GENERALE - Il Prefisso Peso dell\'Attributo &egrave;<br />Prefisso Peso Attributo di Default<br />Vuoto, + o -', '3', '207', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), ', now());

INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('DOCUMENTO PRODOTTO - Attributo Sola Visualizzazione - Default', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_DISPLAY_ONLY', '0', 'DOCUMENTO PRODOTTO - L\'Attributo &egrave; Sola Visualizzazione ?<br />Usato per Scopi di Sola Visualizzazione<br />0= No 1= Si', '4', '200', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('DOCUMENTO PRODOTTO - Attributo Gratis - Default', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTE_IS_FREE', '1', 'DOCUMENTO PRODOTTO - L\'Attributo &egrave; Free<br />L\'Attributo &egrave; Gratis quando il Prodotto &egrave; Gratis<br />0= No 1= Si', '4', '201', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('DOCUMENTO PRODOTTO - Default - Default', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_DEFAULT', '0', 'DOCUMENTO PRODOTTO - L\'Attributo &egrave; Default<br />L\'Attributo che per default deve essere marcato come Selezionato<br />0= No 1= Si', '4', '202', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('DOCUMENTO PRODOTTO - Attributo Scontato - Default', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_DISCOUNTED', '1', 'DOCUMENTO PRODOTTO - L\'Attributo &egrave; Scontato<br />Applica Sconti usato per i Prodotti in Offerta/Saldo<br />0= No 1= Si', '4', '203', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());

INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('DOCUMENTO PRODOTTO - Attributo Incluso in Prezzo Base - Default', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_PRICE_BASE_INCLUDED', '1', 'DOCUMENTO PRODOTTO - L\'Attributo &egrave; Incluso nel Prezzo Base<br />Includi nel Prezzo Base quando Prezzato per Attributi<br />0= No 1= Si', '4', '204', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('DOCUMENTO PRODOTTO - Attributo Richiesto - Default', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_REQUIRED', '0', 'DOCUMENTO PRODOTTO - L\'Attributo &egrave; Incluso nel Prezzo Base<br />Includi nel Prezzo Base quando Prezzato per Attributi<br />0= No 1= Si', '4', '205', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('DOCUMENTO PRODOTTO - Attributo Prefisso Prezzo - Default', 'DEFAULT_DOCUMENT_PRODUCT_PRICE_PREFIX', '1', 'DOCUMENTO PRODOTTO - Il Prefisso Prezzo dell\'Attributo &egrave;<br />Prefisso Prezzo Attributo di Default<br />Vuoto, + o -', '4', '206', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('DOCUMENTO PRODOTTO - Attributo Prefisso Peso - Default', 'DEFAULT_DOCUMENT_PRODUCT_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX', '1', 'DOCUMENTO PRODOTTO - Il Prefisso Peso dell\'Attributo &egrave;<br />Prefisso Peso Attributo di Default<br />Vuoto, + o -', '4', '207', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), ', now());

INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('PRODOTTO SPEDIZIONE GRATUITA - Attributo Sola Visualizzazione - Default', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_DISPLAY_ONLY', '0', 'PRODOTTO SPEDIZIONE GRATUITA - L\'Attributo &egrave; Sola Visualizzazione ?<br />Usato per Scopi di Sola Visualizzazione<br />0= No 1= Si', '5', '201', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('PRODOTTO SPEDIZIONE GRATUITA - Attributo Gratis - Default', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTE_IS_FREE', '1', 'PRODOTTO SPEDIZIONE GRATUITA - L\'Attributo &egrave; Free<br />L\'Attributo &egrave; Gratis quando il Prodotto &egrave; Gratis<br />0= No 1= Si', '5', '201', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('PRODOTTO SPEDIZIONE GRATUITA - Attributo Default - Default', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_DEFAULT', '0', 'PRODOTTO SPEDIZIONE GRATUITA - L\'Attributo &egrave; Default<br />L\'Attributo che per default deve essere marcato come Selezionato<br />0= No 1= Si', '5', '202', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('PRODOTTO SPEDIZIONE GRATUITA - Attributo Scontato - Default', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_DISCOUNTED', '1', 'PRODOTTO SPEDIZIONE GRATUITA - L\'Attributo &egrave; Scontato<br />Applica Sconti usato per i Prodotti in Offerta/Saldo<br />0= No 1= Si', '5', '203', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('PRODOTTO SPEDIZIONE GRATUITA - Attributo Incluso in Prezzo Base - Default', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_PRICE_BASE_INCLUDED', '1', 'PRODOTTO SPEDIZIONE GRATUITA - L\'Attributo &egrave; Incluso nel Prezzo Base<br />Includi nel Prezzo Base quando Prezzato per Attributi<br />0= No 1= Si', '5', '204', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('PRODOTTO SPEDIZIONE GRATUITA - Attributo Richiesto - Default', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_REQUIRED', '0', 'PRODOTTO SPEDIZIONE GRATUITA - L\'Attributo &egrave; Incluso nel Prezzo Base<br />Includi nel Prezzo Base quando Prezzato per Attributi<br />0= No 1= Si', '5', '205', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('PRODOTTO SPEDIZIONE GRATUITA - Attributo Prefisso Prezzo - Default', 'DEFAULT_PRODUCT_FREE_SHIPPING_PRICE_PREFIX', '1', 'PRODOTTO SPEDIZIONE GRATUITA - Il Prefisso Prezzo dell\'Attributo &egrave;<br />Prefisso Prezzo Attributo di Default<br />Vuoto, + o -', '5', '206', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), ', now());
INSERT INTO product_type_layout (configuration_title, configuration_key, configuration_value, configuration_description, product_type_id, sort_order, set_function, date_added) VALUES ('PRODOTTO SPEDIZIONE GRATUITA - Attributo Prefisso Peso - Default', 'DEFAULT_PRODUCT_FREE_SHIPPING_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX', '1', 'PRODOTTO SPEDIZIONE GRATUITA - Il Prefisso Peso dell\'Attributo &egrave;<br />Prefisso Peso Attributo di Default<br />Vuoto, + o -', '5', '207', 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), ', now());
### eof: attribute default database updates and changes

## Insert the default queries for "all customers" and "all newsletter subscribers"
INSERT INTO query_builder (query_id, query_category, query_name, query_description, query_string, query_keys_list) VALUES ('1', 'email', 'Tutti i Clienti', 'Restituisci nomi e indirizzi email di tutti i clienti per inviare email di massa (per esempio: per newsletter, buoni sconto, certificati regalo, messaggi, ecc).', 'select customers_email_address, customers_firstname, customers_lastname from TABLE_CUSTOMERS order by customers_lastname, customers_firstname, customers_email_address', '');
INSERT INTO query_builder (query_id, query_category, query_name, query_description, query_string, query_keys_list) VALUES ('2', 'email,newsletters', 'Tutti gli Abbonati alla Newsletter', 'Restituisci nome and indirizzo email degli abbonati alla newsletter.', 'select customers_firstname, customers_lastname, customers_email_address from TABLE_CUSTOMERS where customers_newsletter = \'1\'', '');
INSERT INTO query_builder (query_id, query_category, query_name, query_description, query_string, query_keys_list) VALUES ('3', 'email,newsletters', 'Clienti Inattivi (>3mesi) (Abbonati)', 'Abbonati che HANNO comprato qualcosa, ma NON hanno fatto acquisti negli ultimi 3 mesi.', 'select o.date_purchased, c.customers_email_address, c.customers_lastname, c.customers_firstname from TABLE_CUSTOMERS c, TABLE_ORDERS o WHERE c.customers_id = o.customers_id AND c.customers_newsletter = 1 GROUP BY c.customers_email_address HAVING max(o.date_purchased) <= subdate(now(),INTERVAL 3 MONTH) ORDER BY c.customers_lastname, c.customers_firstname ASC', '');
INSERT INTO query_builder (query_id, query_category, query_name, query_description, query_string, query_keys_list) VALUES ('4', 'email,newsletters', 'Clienti Attivi negli ultimi 3 mesi (Abbonati)', 'Abbonati alla Newsletter che sono anche clienti attivi (hanno comprato qualcosa) negli ultimi 3 mesi.', 'select c.customers_email_address, c.customers_lastname, c.customers_firstname from TABLE_CUSTOMERS c, TABLE_ORDERS o where c.customers_newsletter = \'1\' AND c.customers_id = o.customers_id and o.date_purchased > subdate(now(),INTERVAL 3 MONTH) GROUP BY c.customers_email_address order by c.customers_lastname, c.customers_firstname ASC', '');
INSERT INTO query_builder (query_id, query_category, query_name, query_description, query_string, query_keys_list) VALUES ('5', 'email,newsletters', 'Clienti Attivi negli ultimi 3 mesi (non in base allo stato dell\'abbonamento)', 'Tutti i Clienti Attivi (hanno comprato qualcosa) negli ultimi 3 mesi, senza considerare lo stato dell''abbonamento alla newsletter.', 'select c.customers_email_address, c.customers_lastname, c.customers_firstname from TABLE_CUSTOMERS c, TABLE_ORDERS o WHERE c.customers_id = o.customers_id and o.date_purchased > subdate(now(),INTERVAL 3 MONTH) GROUP BY c.customers_email_address order by c.customers_lastname, c.customers_firstname ASC', '');
INSERT INTO query_builder (query_id, query_category, query_name, query_description, query_string, query_keys_list) VALUES ('6', 'email,newsletters', 'Amministratore', 'Solo l\'account email dell\'attuale Amministratore.', 'select \'ADMIN\' as customers_firstname, admin_name as customers_lastname, admin_email as customers_email_address from TABLE_ADMIN where admin_id = $SESSION:admin_id', '');
#aggiunta lista clienti: clienti che si sono registrati ma non hanno ancora acquistato
INSERT INTO query_builder (query_id, query_category, query_name, query_description, query_string, query_keys_list) VALUES ('7', 'email,newsletters', 'Clienti che non hanno mai effettuato un acquisto', 'Per inviare newsletter a tutti i clienti registrati ma che non hanno mai effettuato acquisti', 'SELECT DISTINCT c.customers_email_address as customers_email_address, c.customers_lastname as customers_lastname, c.customers_firstname as customers_firstname FROM TABLE_CUSTOMERS c LEFT JOIN  TABLE_ORDERS o ON c.customers_id=o.customers_id WHERE o.date_purchased IS NULL', '');

#
# end of Query-Builder Setup
#

#
# Dumping data for table get_terms_to_filter
#

INSERT INTO get_terms_to_filter VALUES ('manufacturers_id', 'TABLE_MANUFACTURERS', 'manufacturers_name');
INSERT INTO get_terms_to_filter VALUES ('music_genre_id', 'TABLE_MUSIC_GENRE', 'music_genre_name');
INSERT INTO get_terms_to_filter VALUES ('record_company_id', 'TABLE_RECORD_COMPANY', 'record_company_name');

#
# Modifiche per codice fiscale e partita IVA
#

ALTER TABLE address_book ADD entry_vat VARCHAR(32) NULL ,
ADD entry_cf VARCHAR(32) NULL ;
ALTER TABLE orders ADD billing_vat VARCHAR(32) NULL AFTER billing_company ,
ADD billing_cf VARCHAR(32) NULL AFTER billing_vat ;
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Partita IVA', 'ENTRY_VAT_MIN_LENGTH', '0', 'Lunghezza minima Partita IVA', '2', '6', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('Partita IVA', 'ACCOUNT_VAT', 'true', 'Mostra il campo Partita IVA durante la creazione di un account e nelle informazioni account', '5', '3', now(), NULL, 'zen_cfg_select_option(array(''true'', ''false''), ');
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Codice Fiscale', 'ENTRY_CF_MIN_LENGTH', '0', 'Lunghezza minima Codice Fiscale', '2', '6', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES ('Codice Fiscale', 'ACCOUNT_CF', 'true', 'Mostra il campo Codice Fiscale durante la creazione di un account e nelle informazioni account', '5', '3', now(), NULL, 'zen_cfg_select_option(array(''true'', ''false''), ');


#
# Dumping data for table project_version
#

INSERT INTO project_version (project_version_id, project_version_key, project_version_major, project_version_minor, project_version_patch1, project_version_patch1_source, project_version_patch2, project_version_patch2_source, project_version_comment, project_version_date_applied) VALUES (1, 'Zen-Cart Main', '1', '5.1', '', '', '', '', 'Nuova installazione', now());
INSERT INTO project_version (project_version_id, project_version_key, project_version_major, project_version_minor, project_version_patch1, project_version_patch1_source, project_version_patch2, project_version_patch2_source, project_version_comment, project_version_date_applied) VALUES (2, 'Zen-Cart Database', '1', '5.1', '', '', '', '', 'Nuova installazione', now());
INSERT INTO project_version_history (project_version_id, project_version_key, project_version_major, project_version_minor, project_version_patch, project_version_comment, project_version_date_applied) VALUES (1, 'Zen-Cart Main', '1', '5.1', '', 'Nuova installazione', now());
INSERT INTO project_version_history (project_version_id, project_version_key, project_version_major, project_version_minor, project_version_patch, project_version_comment, project_version_date_applied) VALUES (2, 'Zen-Cart Database', '1', '5.1', '', 'Nuova installazione', now());

##### End of SQL setup for Zen Cart 151 italiano.
