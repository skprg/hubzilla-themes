<?php

// This pulls the default config and styles from Redbasic.
// This allows your child theme to only specify changes. Anything undefined is pulled from Redbasic.
//

// ! If you change the name of the directory containing the theme, be sure to change this line to match.
echo @file_get_contents('view/theme/utsukta-default/css/style.css');


// Allow layouts to over-ride the schema
if (isset($_REQUEST['schema']) && preg_match('/^[\w_-]+$/i', $_REQUEST['schema'])) {
    $schema = $_REQUEST['schema'];
  }
  
  if (($schema) && ($schema != '---')) {
  
      // Check it exists, because this setting gets distributed to clones
      if(file_exists('view/theme/redbasic/schema/' . $schema . '.php')) {
          $schemefile = 'view/theme/redbasic/schema/' . $schema . '.php';
          require_once ($schemefile);
      }
  
      if(file_exists('view/theme/redbasic/schema/' . $schema . '.css')) {
          $schemecss = file_get_contents('view/theme/redbasic/schema/' . $schema . '.css');
      }
  
  }
  
  // Allow admins to set a default schema for the hub.
  // default.php and default.css MUST be symlinks to existing schema files in view/theme/redbasic/schema
  if ((!$schema) || ($schema == '---')) {
  
      if(file_exists('view/theme/redbasic/schema/default.php')) {
          $schemefile = 'view/theme/redbasic/schema/default.php';
          require_once ($schemefile);
      }
  
      $schemecss = '';
      if(file_exists('view/theme/redbasic/schema/default.css')) {
          $schemecss = file_get_contents('view/theme/redbasic/schema/default.css');
      }
  
  }

// Set the schema to the default schema in derived themes. See the documentation for creating derived themes how to override this.

if(local_channel() && App::$channel && App::$channel['channel_theme'] != 'redbasic')
	set_pconfig(local_channel(), 'redbasic', 'schema', '---');
