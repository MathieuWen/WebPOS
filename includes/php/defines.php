<?php
$parts = explode(DS, ZPATH_BASE);

define('ZPATH_ROOT',			implode(DS, $parts));
define('ZPATH_SITE',			ZPATH_ROOT);
define('ZPATH_LIBRARIES',		ZPATH_ROOT.DS.'libraries');
define('ZPATH_INCLUDES',		ZPATH_ROOT.DS.'includes');
define('ZPATH_PLUGINS',			ZPATH_ROOT.DS.'plugins'  );
define('ZPATH_TEMPLATES',			ZPATH_ROOT.DS.'templates');
define('ZPATH_CACHE',			ZPATH_ROOT.DS.'cache');
define('ZPATH_MEDIA',			ZPATH_ROOT.DS.'media');
define('ZPATH_THEMES',			ZPATH_ROOT.DS.'themes');
define('ZPATH_LANGUAGE',			ZPATH_ROOT.DS.'language');
define('ZPATH_DATA',			ZPATH_ROOT.DS.'data');
define('ZPATH_LOGS',			ZPATH_ROOT.DS.'logs');
define('ZPATH_TMP',			ZPATH_ROOT.DS.'tmp');
define('ZPATH_PRINT',			ZPATH_ROOT.DS.'print');
define('ZPATH_GUARD',			ZPATH_ROOT.DS.'guard');

define('ZDIR_LIBRARIES',		str_replace(ZPATH_ROOT.DS, '', ZPATH_LIBRARIES.'/'));
define('ZDIR_INCLUDES',		str_replace(ZPATH_ROOT.DS, '', ZPATH_INCLUDES.'/'));
define('ZDIR_PLUGINS',			str_replace(ZPATH_ROOT.DS, '', ZPATH_PLUGINS.'/'));
define('ZDIR_TEMPLATES',	str_replace(ZPATH_ROOT.DS, '', ZPATH_TEMPLATES.'/'));
define('ZDIR_LANGUAGE',			str_replace(ZPATH_ROOT.DS, '', ZPATH_LANGUAGE.'/'));
define('ZDIR_CACHE',			str_replace(ZPATH_ROOT.DS, '', ZPATH_CACHE.'/'));
define('ZDIR_MEDIA',			str_replace(ZPATH_ROOT.DS, '', ZPATH_MEDIA.'/'));
define('ZDIR_THEMES',		str_replace(ZPATH_ROOT.DS, '', ZPATH_THEMES.'/'));
define('ZDIR_DATA',		str_replace(ZPATH_ROOT.DS, '', ZPATH_DATA.'/'));
define('ZDIR_LOGS',			str_replace(ZPATH_ROOT.DS, '', ZPATH_LOGS.'/'));
define('ZDIR_TMP',			str_replace(ZPATH_ROOT.DS, '', ZPATH_TMP.'/'));
define('ZDIR_PRINT',			str_replace(ZPATH_ROOT.DS, '', ZPATH_PRINT.'/'));
define('ZDIR_GUARD',			str_replace(ZPATH_ROOT.DS, '', ZPATH_GUARD.'/'));

?>