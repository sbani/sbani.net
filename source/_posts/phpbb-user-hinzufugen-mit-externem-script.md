title: 'phpBB: User hinzufügen mit externem Script'
tags:
  - PHP
  - phpBB
id: 437
categories:
  - Internet
date: 2010-03-17 20:54:02
---

Auch hier habe ich den Code wieder in einer PHP in einem Forum Unterverzeichnis Namens _FORUMROOT/api/_ abgelegt. Wenn ihr einen anderen Ordner haben wollt, müsst ihr nur die Pfade ändern. <!--more-->

Ich lege mit dem "add user script" einen Standard User von phpBB3 an. Was man alles an Optionen ändern kann, erfahrt ihr hier: [Add User API](http://wiki.phpbb.com/Add_users)
```php
<?php

$username = 'user123';
$password = 'pws123';
$email = 'my@mail.ru';

$type = (isset($argv[4]) ? $argv[4] : 0);
$group = (isset($argv[5]) ? $argv[5] : 4);

define('IN_PHPBB', true);
$api_dir = dirname(__FILE__).DIRECTORY_SEPARATOR;
$phpbb_root_path = (defined('PHPBB_ROOT_PATH')) ? PHPBB_ROOT_PATH : str_replace('\api', '', str_replace('/api', '', $api_dir));
$phpEx = substr(strrchr(__FILE__, '.'), 1);
define('PHPBB_ROOT_PATH', $phpbb_root_path);
include($phpbb_root_path . 'common.' . $phpEx);

$user_row = array(
    'username'              => $username,
    'user_password'         => phpbb_hash($password),
    'user_email'            => $email,
    'group_id'              => $group,
    'user_timezone'         => (float) 1,
    'user_lang'             => 'en',
    'user_type'             => 0,
    'user_ip'               => '127.0.0.1',
    'user_regdate'          => time(),
);

// Register user...
require_once(PHPBB_ROOT_PATH.'includes/functions_user.'.$phpEx);
$user_id = user_add($user_row);

// something went wrong
if ($user_id == false) {
	die ('Could not add user');
} else {
	die ('User successfully added');
}

?>
```