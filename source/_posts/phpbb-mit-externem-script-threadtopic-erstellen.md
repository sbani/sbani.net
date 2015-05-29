title: 'phpBB: Mit externem Script Thread/Topic erstellen'
tags:
  - Community
  - PHP
  - phpBB
id: 429
categories:
  - Tutorials
  - Web Development
date: 2010-03-17 20:44:46
---

Ich hoffe ein paar Leute können wie ich ein Script brauchen, mit dem man "außerhalb" von phpBB einen Thread erstellen kann. Es ist nicht besonderes, da phpBB3 im Grunde schon eine [API](http://wiki.phpbb.com/Function.submit_post "submit_post()") liefert, aber es hilft sicher überhaupt zu wissen, was man für configs einbinden muss. <!--more-->

Meine Scripts habe ich im Ordner _FORUMROOT/api/_ abgelegt. Um sie außerhalb zu lagern müssen nur die Pfade zu den includes angepasst werden.
```php
<?php

$subject = 'This Subject';
$username = 'username';
$password = 'password';
$message = 'This is a message';
$forum = 2;

define('IN_PHPBB', true);
$api_dir = dirname(__FILE__).DIRECTORY_SEPARATOR;
$phpbb_root_path = (defined('PHPBB_ROOT_PATH')) ? PHPBB_ROOT_PATH : str_replace('\api', '', str_replace('/api', '', $api_dir));
$phpEx = substr(strrchr(__FILE__, '.'), 1);
define('PHPBB_ROOT_PATH', $phpbb_root_path);

include($phpbb_root_path . 'common.' . $phpEx);
include($phpbb_root_path . 'includes/functions_posting.' . $phpEx);
include($phpbb_root_path . 'includes/message_parser.' . $phpEx);

$user->session_begin();
$auth->acl($user->data);
$user->setup();

$auth->login($username,$password);

$my_subject      = utf8_normalize_nfc($subject);
$my_text      = utf8_normalize_nfc($message);

$poll = $uid = $bitfield = $options = '';

generate_text_for_storage($my_subject, $uid, $bitfield, $options, false, false, false);
generate_text_for_storage($my_text, $uid, $bitfield, $options, true, true, true);

$data = array(
   'forum_id'      => $forum,
   'icon_id'      => false,

   'enable_bbcode'   => true,
   'enable_smilies'   => true,
   'enable_urls'      => true,
   'enable_sig'      => true,

   'message'      => $my_text,
   'message_md5'      => md5($my_text),

   'bbcode_bitfield'   => $bitfield,
   'bbcode_uid'      => $uid,

   'post_edit_locked'   => 0,
   'topic_title'      => $my_subject,
   'notify_set'      => false,
   'notify'         => false,
   'post_time'      => 0,
   'forum_name'      => '',
   'enable_indexing'   => true,
);

submit_post('post', $my_subject, $username, POST_NORMAL, $poll, $data);

echo 'Thread added succesfully';
?>
```