CREATE TABLE `[#DB_PREFIX#]active_data` (
  `active_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `expire_time` int(10) DEFAULT NULL,
  `active_code` varchar(32) DEFAULT NULL,
  `active_type_code` varchar(16) DEFAULT NULL,
  `add_time` int(10) DEFAULT NULL,
  `add_ip` bigint(12) DEFAULT NULL,
  `active_time` int(10) DEFAULT NULL,
  `active_ip` bigint(12) DEFAULT NULL,
  PRIMARY KEY (`active_id`),
  KEY `active_code` (`active_code`),
  KEY `active_type_code` (`active_type_code`),
  KEY `uid` (`uid`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]answer` (
  `answer_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '回答id',
  `question_id` int(11) NOT NULL COMMENT '問題id',
  `answer_content` text COMMENT '回答內容',
  `add_time` int(10) DEFAULT '0' COMMENT '添加時間',
  `against_count` int(11) NOT NULL DEFAULT '0' COMMENT '反對人數',
  `agree_count` int(11) NOT NULL DEFAULT '0' COMMENT '支持人數',
  `uid` int(11) DEFAULT '0' COMMENT '發佈問題用戶ID',
  `comment_count` int(11) DEFAULT '0' COMMENT '評論總數',
  `uninterested_count` int(11) DEFAULT '0' COMMENT '不感興趣',
  `thanks_count` int(11) DEFAULT '0' COMMENT '感謝數量',
  `category_id` int(11) DEFAULT '0' COMMENT '分類id',
  `has_attach` tinyint(1) DEFAULT '0' COMMENT '是否存在附件',
  `ip` bigint(11) DEFAULT NULL,
  `force_fold` TINYINT( 1 ) NULL DEFAULT '0' COMMENT '強制折疊',
  `anonymous` TINYINT( 1 ) NULL DEFAULT '0',
  `publish_source` VARCHAR( 16 ) NULL,
  PRIMARY KEY (`answer_id`),
  KEY `question_id` (`question_id`),
  KEY `agree_count` (`agree_count`),
  KEY `against_count` (`against_count`),
  KEY `add_time` (`add_time`),
  KEY `uid` (`uid`),
  KEY `uninterested_count` (`uninterested_count`),
  KEY `force_fold` (`force_fold`),
  KEY `anonymous` (`anonymous`),
  KEY `publich_source` (`publish_source`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8 COMMENT='回答';

CREATE TABLE `[#DB_PREFIX#]approval` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(16) DEFAULT NULL,
  `data` mediumtext NOT NULL,
  `uid` int(11) NOT NULL DEFAULT '0',
  `time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `uid` (`uid`),
  KEY `time` (`time`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]article` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text,
  `comments` int(10) DEFAULT '0',
  `views` int(10) DEFAULT '0',
  `add_time` int(10) DEFAULT NULL,
  `has_attach` tinyint(1) NOT NULL DEFAULT '0',
  `lock` int(1) NOT NULL DEFAULT '0',
  `votes` int(10) DEFAULT '0',
  `title_fulltext` text,
  `category_id` int(10) DEFAULT '0',
  `is_recommend` tinyint(1) DEFAULT '0',
  `chapter_id` int(10) UNSIGNED DEFAULT NULL,
  `sort` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `has_attach` (`has_attach`),
  KEY `uid` (`uid`),
  KEY `comments` (`comments`),
  KEY `views` (`views`),
  KEY `add_time` (`add_time`),
  KEY `lock` (`lock`),
  KEY `votes` (`votes`),
  KEY `category_id` (`category_id`),
  KEY `is_recommend` (`is_recommend`),
  KEY `chapter_id` (`chapter_id`),
  KEY `sort` (`sort`),
  FULLTEXT KEY `title_fulltext` (`title_fulltext`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]article_comments` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `article_id` int(10) NOT NULL,
  `message` text NOT NULL,
  `add_time` int(10) NOT NULL,
  `at_uid` int(10) DEFAULT NULL,
  `votes` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `article_id` (`article_id`),
  KEY `add_time` (`add_time`),
  KEY `votes` (`votes`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]article_vote` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `type` varchar(16) DEFAULT NULL,
  `item_id` int(10) NOT NULL,
  `rating` tinyint(1) DEFAULT '0',
  `time` int(10) NOT NULL,
  `reputation_factor` int(10) DEFAULT '0',
  `item_uid` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `type` (`type`),
  KEY `item_id` (`item_id`),
  KEY `time` (`time`),
  KEY `item_uid` (`item_uid`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]attach` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) DEFAULT NULL COMMENT '附件名稱',
  `access_key` varchar(32) DEFAULT NULL COMMENT '批次 Key',
  `add_time` int(10) DEFAULT '0' COMMENT '上傳時間',
  `file_location` varchar(255) DEFAULT NULL COMMENT '文件位置',
  `is_image` int(1) DEFAULT '0',
  `item_type` varchar(32) DEFAULT '0' COMMENT '關聯類型',
  `item_id` bigint(20) DEFAULT '0' COMMENT '關聯 ID',
  `wait_approval` TINYINT( 1 ) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `access_key` (`access_key`),
  KEY `is_image` (`is_image`),
  KEY `fetch` (`item_id`,`item_type`),
  KEY `wait_approval` (`wait_approval`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]answer_comments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `answer_id` int(11) DEFAULT '0',
  `uid` int(11) DEFAULT '0',
  `message` text DEFAULT NULL,
  `time` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `answer_id` (`answer_id`),
  KEY `time` (`time`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]answer_thanks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `answer_id` int(11) DEFAULT '0',
  `user_name` varchar(255) DEFAULT NULL,
  `time` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `answer_id` (`answer_id`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]answer_uninterested` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `answer_id` int(11) DEFAULT '0',
  `user_name` varchar(255) DEFAULT NULL,
  `time` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `answer_id` (`answer_id`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]answer_vote` (
  `voter_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自動ID',
  `answer_id` int(11) DEFAULT NULL COMMENT '回復id',
  `answer_uid` int(11) DEFAULT NULL COMMENT '回復作者id',
  `vote_uid` int(11) DEFAULT NULL COMMENT '用戶ID',
  `add_time` int(10) DEFAULT NULL COMMENT '添加時間',
  `vote_value` tinyint(4) NOT NULL COMMENT '-1反對 1 支持',
  `reputation_factor` int(10) DEFAULT '0',
  PRIMARY KEY (`voter_id`),
  KEY `answer_id` (`answer_id`),
  KEY `vote_value` (`vote_value`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL,
  `type` varchar(16) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT '0',
  `sort` SMALLINT(6) DEFAULT '0',
  `url_token` VARCHAR( 32 ) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `url_token` (`url_token`),
  KEY `title` (`title`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]draft` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `type` varchar(16) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `data` text,
  `time` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `item_id` (`item_id`),
  KEY `time` (`time`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]education_experience` (
  `education_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '用戶UID',
  `education_years` int(11) DEFAULT NULL COMMENT '入學年份',
  `school_name` varchar(64) DEFAULT NULL COMMENT '學校名',
  `school_type` tinyint(4) DEFAULT NULL COMMENT '學校類別',
  `departments` varchar(64) DEFAULT NULL COMMENT '院系',
  `add_time` int(10) DEFAULT NULL COMMENT '記錄添加時間',
  PRIMARY KEY (`education_id`),
  KEY `uid` (`uid`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8 COMMENT='教育經歷';

CREATE TABLE `[#DB_PREFIX#]feature` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `title` VARCHAR(200) DEFAULT NULL COMMENT '專題標題',
  `description` VARCHAR(255) DEFAULT NULL COMMENT '專題描述',
  `icon` VARCHAR(255) DEFAULT NULL COMMENT '專題圖標',
  `topic_count` INT(11) NOT NULL DEFAULT '0' COMMENT '話題計數',
  `css` TEXT COMMENT '自定義CSS',
  `url_token` VARCHAR(32) DEFAULT NULL,
  `seo_title` VARCHAR(255) DEFAULT NULL,
  `enabled` TINYINT(1) NOT NULL DEFAULT '0',
  PRIMARY KEY ( `id` ),
  KEY `url_token` (`url_token`),
  KEY `title` (`title`),
  KEY `enabled` (`enabled`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]feature_topic` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `feature_id` INT(11) NOT NULL DEFAULT '0' COMMENT '專題ID',
  `topic_id` INT(11) NOT NULL DEFAULT '0' COMMENT '話題ID',
  PRIMARY KEY (`id`),
  KEY `feature_id` (`feature_id`),
  KEY `topic_id` (`topic_id`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]favorite` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `item_id` int(11) DEFAULT '0',
  `time` int(10) DEFAULT '0',
  `type` varchar(16) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `time` (`time`),
  KEY `item_id` (`item_id`),
  KEY `type` (`type`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]favorite_tag` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `title` varchar(128) DEFAULT NULL,
  `item_id` int(11) DEFAULT '0',
  `type` varchar(16) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `title` (`title`),
  KEY `type` (`type`),
  KEY `item_id` (`item_id`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]invitation` (
  `invitation_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '激活ID',
  `uid` int(11) DEFAULT '0' COMMENT '用戶ID',
  `invitation_code` varchar(32) DEFAULT NULL COMMENT '激活碼',
  `invitation_email` varchar(255) DEFAULT NULL COMMENT '激活email',
  `add_time` int(10) DEFAULT NULL COMMENT '添加時間',
  `add_ip` bigint(12) DEFAULT NULL COMMENT '添加IP',
  `active_expire` tinyint(1) DEFAULT '0' COMMENT '激活過期',
  `active_time` int(10) DEFAULT NULL COMMENT '激活時間',
  `active_ip` bigint(12) DEFAULT NULL COMMENT '激活IP',
  `active_status` tinyint(4) DEFAULT '0' COMMENT '1已使用0未使用-1已刪除',
  `active_uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`invitation_id`),
  KEY `uid` (`uid`),
  KEY `invitation_code` (`invitation_code`),
  KEY `invitation_email` (`invitation_email`),
  KEY `active_time` (`active_time`),
  KEY `active_ip` (`active_ip`),
  KEY `active_status` (`active_status`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(64) DEFAULT NULL COMMENT '職位名',
  PRIMARY KEY (`id`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]integral_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `action` varchar(16) DEFAULT NULL,
  `integral` int(11) DEFAULT NULL,
  `note` varchar(128) DEFAULT NULL,
  `balance` int(11) DEFAULT '0',
  `item_id` int(11) DEFAULT '0',
  `time` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `action` (`action`),
  KEY `time` (`time`),
  KEY `integral` (`integral`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]nav_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(16) DEFAULT NULL,
  `type_id` int(11) DEFAULT '0',
  `link` varchar(255) DEFAULT NULL COMMENT '鏈接',
  `icon` varchar(255) DEFAULT NULL COMMENT '圖標',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`link`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]inbox` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '發送者 ID',
  `dialog_id` int(11) DEFAULT NULL COMMENT '對話id',
  `message` text COMMENT '內容',
  `add_time` int(10) DEFAULT NULL COMMENT '添加時間',
  `sender_remove` tinyint(1) DEFAULT '0',
  `recipient_remove` tinyint(1) DEFAULT '0',
  `receipt` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `dialog_id` (`dialog_id`),
  KEY `uid` (`uid`),
  KEY `add_time` (`add_time`),
  KEY `sender_remove` (`sender_remove`),
  KEY `recipient_remove` (`recipient_remove`),
  KEY `sender_receipt` (`receipt`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]inbox_dialog` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '對話ID',
  `sender_uid` int(11) DEFAULT NULL COMMENT '發送者UID',
  `sender_unread` int(11) DEFAULT NULL COMMENT '發送者未讀',
  `recipient_uid` int(11) DEFAULT NULL COMMENT '接收者UID',
  `recipient_unread` int(11) DEFAULT NULL COMMENT '接收者未讀',
  `add_time` int(11) DEFAULT NULL COMMENT '添加時間',
  `update_time` int(11) DEFAULT NULL COMMENT '最後更新時間',
  `sender_count` int(11) DEFAULT NULL COMMENT '發送者顯示對話條數',
  `recipient_count` int(11) DEFAULT NULL COMMENT '接收者顯示對話條數',
  PRIMARY KEY (`id`),
  KEY `recipient_uid` (`recipient_uid`),
  KEY `sender_uid` (`sender_uid`),
  KEY `update_time` (`update_time`),
  KEY `add_time` (`add_time`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]notification` (
  `notification_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `sender_uid` int(11) DEFAULT NULL COMMENT '發送者ID',
  `recipient_uid` int(11) DEFAULT '0' COMMENT '接收者ID',
  `action_type` int(4) DEFAULT NULL COMMENT '操作類型',
  `model_type` smallint(11) NOT NULL DEFAULT '0',
  `source_id` varchar(16) NOT NULL DEFAULT '0' COMMENT '關聯 ID',
  `add_time` int(10) DEFAULT NULL COMMENT '添加時間',
  `read_flag` TINYINT( 1 ) NULL DEFAULT '0' COMMENT '閱讀狀態',
  PRIMARY KEY (`notification_id`),
  KEY `recipient_read_flag` (`recipient_uid`,`read_flag`),
  KEY `sender_uid` (`sender_uid`),
  KEY `model_type` (`model_type`),
  KEY `source_id` (`source_id`),
  KEY `action_type` (`action_type`),
  KEY `add_time` (`add_time`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8 COMMENT='系統通知';

CREATE TABLE `[#DB_PREFIX#]notification_data` (
  `notification_id` int(11) unsigned NOT NULL,
  `data` text,
  PRIMARY KEY (`notification_id`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8 COMMENT='系統通知數據表';

CREATE TABLE `[#DB_PREFIX#]mail_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `send_to` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `is_error` tinyint(1) NOT NULL DEFAULT '0',
  `error_message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `is_error` (`is_error`),
  KEY `send_to` (`send_to`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `[#DB_PREFIX#]pages` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `url_token` varchar(32) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `contents` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `url_token` (`url_token`),
  KEY `enabled` (`enabled`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]posts_index` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `post_id` int(10) NOT NULL,
  `post_type` varchar(16) NOT NULL DEFAULT '',
  `add_time` int(10) NOT NULL,
  `update_time` int(10) DEFAULT '0',
  `category_id` int(10) DEFAULT '0',
  `is_recommend` tinyint(1) DEFAULT '0',
  `view_count` int(10) DEFAULT '0',
  `anonymous` tinyint(1) DEFAULT '0',
  `popular_value` int(10) DEFAULT '0',
  `uid` int(10) NOT NULL,
  `lock` tinyint(1) DEFAULT '0',
  `agree_count` int(10) DEFAULT '0',
  `answer_count` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  KEY `post_type` (`post_type`),
  KEY `add_time` (`add_time`),
  KEY `update_time` (`update_time`),
  KEY `category_id` (`category_id`),
  KEY `is_recommend` (`is_recommend`),
  KEY `anonymous` (`anonymous`),
  KEY `popular_value` (`popular_value`),
  KEY `uid` (`uid`),
  KEY `lock` (`lock`),
  KEY `agree_count` (`agree_count`),
  KEY `answer_count` (`answer_count`),
  KEY `view_count` (`view_count`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]question` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_content` varchar(255) NOT NULL DEFAULT '' COMMENT '問題內容',
  `question_detail` text COMMENT '問題說明',
  `add_time` int(11) NOT NULL COMMENT '添加時間',
  `update_time` int(11) DEFAULT NULL,
  `published_uid` int(11) DEFAULT NULL COMMENT '發佈用戶UID',
  `answer_count` int(11) NOT NULL DEFAULT '0' COMMENT '回答計數',
  `answer_users` int(11) NOT NULL DEFAULT '0' COMMENT '回答人數',
  `view_count` int(11)NOT NULL DEFAULT '0' COMMENT '瀏覽次數',
  `focus_count` int(11) NOT NULL DEFAULT '0' COMMENT '關注數',
  `comment_count` int(11) NOT NULL DEFAULT '0' COMMENT '評論數',
  `action_history_id` int(11) NOT NULL DEFAULT '0' COMMENT '動作的記錄表的關連id',
  `category_id` int(11) NOT NULL DEFAULT '0' COMMENT '分類 ID',
  `agree_count` int(11) NOT NULL DEFAULT '0' COMMENT '回復贊同數總和',
  `against_count` int(11) NOT NULL DEFAULT '0' COMMENT '回復反對數總和',
  `best_answer` int(11) NOT NULL DEFAULT '0' COMMENT '最佳回復 ID',
  `has_attach` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否存在附件',
  `unverified_modify` text,
  `unverified_modify_count` int(10) NOT NULL DEFAULT '0',
  `ip` bigint(11) DEFAULT NULL,
  `last_answer` int(11) NOT NULL DEFAULT '0' COMMENT '最後回答 ID',
  `popular_value` double NOT NULL DEFAULT '0',
  `popular_value_update` int(10) NOT NULL DEFAULT '0',
  `lock` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否鎖定',
  `anonymous` tinyint(1) NOT NULL DEFAULT '0',
  `thanks_count` int(10) NOT NULL DEFAULT '0',
  `question_content_fulltext` text,
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0',
  `weibo_msg_id` bigint(20) DEFAULT NULL,
  `received_email_id` int(10) DEFAULT NULL,
  `chapter_id` int(10) UNSIGNED DEFAULT NULL,
  `sort` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`question_id`),
  KEY `category_id` (`category_id`),
  KEY `update_time` (`update_time`),
  KEY `add_time` (`add_time`),
  KEY `published_uid` (`published_uid`),
  KEY `answer_count` (`answer_count`),
  KEY `agree_count` (`agree_count`),
  KEY `question_content` (`question_content`),
  KEY `lock` (`lock`),
  KEY `thanks_count` (`thanks_count`),
  KEY `anonymous` (`anonymous`),
  KEY `popular_value` (`popular_value`),
  KEY `best_answer` (`best_answer`),
  KEY `popular_value_update` (`popular_value_update`),
  KEY `against_count` (`against_count`),
  KEY `is_recommend` (`is_recommend`),
  KEY `weibo_msg_id` (`weibo_msg_id`),
  KEY `received_email_id` (`received_email_id`),
  KEY `unverified_modify_count` (`unverified_modify_count`),
  KEY `chapter_id` (`chapter_id`),
  KEY `sort` (`sort`),
  FULLTEXT KEY `question_content_fulltext` (`question_content_fulltext`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8 COMMENT='問題列表';

CREATE TABLE `[#DB_PREFIX#]question_thanks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `question_id` int(11) DEFAULT '0',
  `user_name` varchar(255) DEFAULT NULL,
  `time` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `question_id` (`question_id`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]question_comments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `question_id` int(11) DEFAULT '0',
  `uid` int(11) DEFAULT '0',
  `message` text DEFAULT NULL,
  `time` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `question_id` (`question_id`),
  KEY `time` (`time`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]question_focus` (
  `focus_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `question_id` int(11) DEFAULT NULL COMMENT '話題ID',
  `uid` int(11) DEFAULT NULL COMMENT '用戶UID',
  `add_time` int(10) DEFAULT NULL,
  PRIMARY KEY (`focus_id`),
  KEY `question_id` (`question_id`),
  KEY `question_uid` ( `question_id`, `uid` )
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8 COMMENT='問題關注表';

CREATE TABLE `[#DB_PREFIX#]question_invite` (
  `question_invite_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `question_id` int(11) NOT NULL COMMENT '問題ID',
  `sender_uid` int(11) NOT NULL,
  `recipients_uid` INT(11) NULL DEFAULT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL COMMENT '受邀Email',
  `add_time` int(10) DEFAULT '0' COMMENT '添加時間',
  `available_time` int(10) DEFAULT '0' COMMENT '生效時間',
  PRIMARY KEY (`question_invite_id`),
  KEY `question_id` (`question_id`),
  KEY `sender_uid` (`sender_uid`),
  KEY `recipients_uid` (`recipients_uid`),
  KEY `add_time` (`add_time`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8 COMMENT='邀請問答';

CREATE TABLE `[#DB_PREFIX#]question_uninterested` (
  `interested_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `question_id` int(11) DEFAULT NULL COMMENT '話題ID',
  `uid` int(11) DEFAULT NULL COMMENT '用戶UID',
  `add_time` int(10) DEFAULT NULL,
  PRIMARY KEY (`interested_id`),
  KEY `uid` (`uid`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8 COMMENT='問題不感興趣表';

CREATE TABLE `[#DB_PREFIX#]report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0' COMMENT '舉報用戶id',
  `type` varchar(50) DEFAULT NULL COMMENT '類別',
  `target_id` int(11) DEFAULT '0' COMMENT 'ID',
  `reason` varchar(255) DEFAULT NULL COMMENT '舉報理由',
  `url` varchar(255) DEFAULT NULL,
  `add_time` int(11) DEFAULT '0' COMMENT '舉報時間',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否處理',
  PRIMARY KEY (`id`),
  KEY `add_time` (`add_time`),
  KEY `status` (`status`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]reputation_topic` (
  `auto_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `topic_id` int(11) DEFAULT '0' COMMENT '話題ID',
  `topic_count` int(10) DEFAULT '0' COMMENT '威望問題話題計數',
  `update_time` int(10) DEFAULT NULL COMMENT '更新時間',
  `agree_count` INT(10) DEFAULT '0' COMMENT '贊成',
  `thanks_count` INT(10) DEFAULT '0' COMMENT '感謝',
  `reputation` INT(10) DEFAULT '0',
  PRIMARY KEY (`auto_id`),
  KEY `topic_count` (`topic_count`),
  KEY `uid` (`uid`),
  KEY `topic_id` (`topic_id`),
  KEY `reputation` (`reputation`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]related_topic` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) DEFAULT '0' COMMENT '話題 ID',
  `related_id` int(11) DEFAULT '0' COMMENT '相關話題 ID',
  PRIMARY KEY (`id`),
  KEY `topic_id` (`topic_id`),
  KEY `related_id` (`related_id`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]related_links` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `item_type` varchar(32) NOT NULL,
  `item_id` int(10) NOT NULL,
  `link` varchar(255) NOT NULL,
  `add_time` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `item_type` (`item_type`),
  KEY `item_id` (`item_id`),
  KEY `add_time` (`add_time`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]school` (
  `school_id` int(11) NOT NULL COMMENT '自增ID',
  `school_type` tinyint(4) DEFAULT NULL COMMENT '學校類型ID',
  `school_code` int(11) DEFAULT NULL COMMENT '學校編碼',
  `school_name` varchar(64) DEFAULT NULL COMMENT '學校名稱',
  `area_code` int(11) DEFAULT NULL COMMENT '地區代碼',
  PRIMARY KEY (`school_id`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8 COMMENT='學校';

CREATE TABLE `[#DB_PREFIX#]sessions` (
  `id` varchar(32) NOT NULL,
  `modified` int(10) NOT NULL,
  `data` text NOT NULL,
  `lifetime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `modified` (`modified`),
  KEY `lifetime` (`lifetime`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]search_cache` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) NOT NULL,
  `data` mediumtext NOT NULL,
  `time` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hash` (`hash`),
  KEY `time` (`time`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]system_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `varname` VARCHAR( 255 ) NOT NULL COMMENT '字段名',
  `value` text COMMENT '變量值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `varname` (`varname`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8 COMMENT='系統設置';

CREATE TABLE `[#DB_PREFIX#]topic` (
  `topic_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '話題id',
  `topic_title` varchar(64) DEFAULT NULL COMMENT '話題標題',
  `add_time` int(10) DEFAULT NULL COMMENT '添加時間',
  `discuss_count` int(11) DEFAULT '0' COMMENT '討論計數',
  `topic_description` text COMMENT '話題描述',
  `topic_pic` varchar(255) DEFAULT NULL COMMENT '話題圖片',
  `topic_lock` tinyint(2) NOT NULL DEFAULT '0' COMMENT '話題是否鎖定 1 鎖定 0 未鎖定',
  `focus_count` int(11) DEFAULT '0' COMMENT '關注計數',
  `user_related` tinyint(1) DEFAULT '0' COMMENT '是否被用戶關聯',
  `url_token` VARCHAR(32) DEFAULT NULL,
  `merged_id` INT( 11 ) NULL DEFAULT '0',
  `seo_title` varchar(255) DEFAULT NULL,
  `parent_id` INT(10) NULL DEFAULT '0',
  `is_parent` TINYINT(1) NULL DEFAULT '0',
  `discuss_count_last_week` INT(10) NULL DEFAULT '0',
  `discuss_count_last_month` INT(10) NULL DEFAULT '0',
  `discuss_count_update` INT(10) NULL DEFAULT '0',
  PRIMARY KEY (`topic_id`),
  UNIQUE KEY `topic_title` (`topic_title`),
  KEY `url_token` (`url_token`),
  KEY `merged_id` (`merged_id`),
  KEY `discuss_count` (`discuss_count`),
  KEY `add_time` (`add_time`),
  KEY `user_related` (`user_related`),
  KEY `focus_count` (`focus_count`),
  KEY `topic_lock` (`topic_lock`),
  KEY `parent_id` (`parent_id`),
  KEY `is_parent` (`is_parent`),
  KEY `discuss_count_last_week` (`discuss_count_last_week`),
  KEY `discuss_count_last_month` (`discuss_count_last_month`),
  KEY `discuss_count_update` (`discuss_count_update`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8 COMMENT='話題';

CREATE TABLE `[#DB_PREFIX#]topic_focus` (
  `focus_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `topic_id` int(11) DEFAULT NULL COMMENT '話題ID',
  `uid` int(11) DEFAULT NULL COMMENT '用戶UID',
  `add_time` int(10) DEFAULT NULL COMMENT '添加時間',
  PRIMARY KEY (`focus_id`),
  KEY `uid` (`uid`),
  KEY `topic_id` ( `topic_id` ),
  KEY `topic_uid` ( `topic_id`, `uid` )
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8 COMMENT='話題關注表';

CREATE TABLE `[#DB_PREFIX#]topic_merge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source_id` int(11) NOT NULL DEFAULT '0',
  `target_id` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) DEFAULT '0',
  `time` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `source_id` (`source_id`),
  KEY `target_id` (`target_id`),
  KEY `uid` (`uid`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]topic_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增 ID',
  `topic_id` int(11) DEFAULT '0' COMMENT '話題id',
  `item_id` int(11) DEFAULT '0',
  `add_time` int(10) DEFAULT '0' COMMENT '添加時間',
  `uid` int(11) DEFAULT '0' COMMENT '用戶ID',
  `type` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `topic_id` (`topic_id`),
  KEY `uid` (`uid`),
  KEY `type` (`type`),
  KEY `item_id` (`item_id`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]users` (
  `uid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用戶的 UID',
  `user_name` varchar(255) DEFAULT NULL COMMENT '用戶名',
  `email` varchar(255) DEFAULT NULL COMMENT 'EMAIL',
  `mobile` varchar(16) DEFAULT NULL COMMENT '用戶手機',
  `password` varchar(32) DEFAULT NULL COMMENT '用戶密碼',
  `salt` varchar(16) DEFAULT NULL COMMENT '用戶附加混淆碼',
  `avatar_file` varchar(128) DEFAULT NULL COMMENT '頭像文件',
  `sex` tinyint(1) DEFAULT NULL COMMENT '性別',
  `birthday` int(10) DEFAULT NULL COMMENT '生日',
  `province` varchar(64) DEFAULT NULL COMMENT '省',
  `city` varchar(64) DEFAULT NULL COMMENT '市',
  `job_id` int(10) DEFAULT '0' COMMENT '職業ID',
  `reg_time` int(10) DEFAULT NULL COMMENT '註冊時間',
  `reg_ip` bigint(12) DEFAULT NULL COMMENT '註冊IP',
  `last_login` int(10) DEFAULT '0' COMMENT '最後登錄時間',
  `last_ip` bigint(12) DEFAULT NULL COMMENT '最後登錄 IP',
  `online_time` int(10) DEFAULT '0' COMMENT '在線時間',
  `last_active` int(10) DEFAULT NULL COMMENT '最後活躍時間',
  `notification_unread` int(11) NOT NULL DEFAULT '0' COMMENT '未讀系統通知',
  `inbox_unread` int(11) NOT NULL DEFAULT '0' COMMENT '未讀短信息',
  `inbox_recv` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-所有人可以發給我,1-我關注的人',
  `fans_count` int(10) NOT NULL DEFAULT '0' COMMENT '粉絲數',
  `friend_count` int(10) NOT NULL DEFAULT '0' COMMENT '觀眾數',
  `invite_count` int(10) NOT NULL DEFAULT '0' COMMENT '邀請我回答數量',
  `article_count` int(10) NOT NULL DEFAULT '0' COMMENT '文章數量',
  `question_count` int(10) NOT NULL DEFAULT '0' COMMENT '問題數量',
  `answer_count` int(10) NOT NULL DEFAULT '0' COMMENT '回答數量',
  `topic_focus_count` int(10) NOT NULL DEFAULT '0' COMMENT '關注話題數量',
  `invitation_available` int(10) NOT NULL DEFAULT '0' COMMENT '邀請數量',
  `group_id` int(10) DEFAULT '0' COMMENT '用戶組',
  `reputation_group` int(10) DEFAULT '0' COMMENT '威望對應組',
  `forbidden` tinyint(1) DEFAULT '0' COMMENT '是否禁止用戶',
  `valid_email` tinyint(1) DEFAULT '0' COMMENT '郵箱驗證',
  `is_first_login` tinyint(1) DEFAULT '1' COMMENT '首次登錄標記',
  `agree_count` int(10) DEFAULT '0' COMMENT '贊同數量',
  `thanks_count` int(10) DEFAULT '0' COMMENT '感謝數量',
  `views_count` int(10) DEFAULT '0' COMMENT '個人主頁查看數量',
  `reputation` int(10) DEFAULT '0' COMMENT '威望',
  `reputation_update_time` int(10) DEFAULT '0' COMMENT '威望更新',
  `weibo_visit` tinyint(1) DEFAULT '1' COMMENT '微博允許訪問',
  `integral` int(10) DEFAULT '0',
  `draft_count` int(10) DEFAULT NULL,
  `common_email` varchar(255) DEFAULT NULL COMMENT '常用郵箱',
  `url_token` varchar(32) DEFAULT NULL COMMENT '個性網址',
  `url_token_update` int(10) DEFAULT '0',
  `verified` varchar(32) DEFAULT NULL,
  `default_timezone` varchar(32) DEFAULT NULL,
  `email_settings` varchar(255) DEFAULT '',
  `weixin_settings` varchar(255) DEFAULT '',
  `recent_topics` text,
  PRIMARY KEY (`uid`),
  KEY `user_name` (`user_name`),
  KEY `email` (`email`),
  KEY `reputation` (`reputation`),
  KEY `reputation_update_time` (`reputation_update_time`),
  KEY `group_id` (`group_id`),
  KEY `agree_count` (`agree_count`),
  KEY `thanks_count` (`thanks_count`),
  KEY `forbidden` (`forbidden`),
  KEY `valid_email` (`valid_email`),
  KEY `last_active` (`last_active`),
  KEY `integral` (`integral`),
  KEY `url_token` (`url_token`),
  KEY `verified` (`verified`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]users_attrib` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` int(11) DEFAULT NULL COMMENT '用戶UID',
  `introduction` varchar(255) DEFAULT NULL COMMENT '個人簡介',
  `signature` varchar(255) DEFAULT NULL COMMENT '個人簽名',
  `qq` bigint(15) DEFAULT NULL,
  `homepage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8 COMMENT='用戶附加屬性表';

CREATE TABLE `[#DB_PREFIX#]weixin_login` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `token` int(10) NOT NULL,
  `uid` int(10) DEFAULT NULL,
  `session_id` varchar(32) NOT NULL,
  `expire` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `session_id` (`session_id`),
  KEY `token` (`token`),
  KEY `expire` (`expire`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]weixin_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weixin_id` varchar(32) NOT NULL,
  `content` varchar(255) NOT NULL,
  `action` text,
  `time` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `weixin_id` (`weixin_id`),
  KEY `time` (`time`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]redirect` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT '0',
  `target_id` int(11) DEFAULT '0',
  `time` int(10) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `uid` (`uid`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]users_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) DEFAULT '0' COMMENT '0-會員組 1-系統組',
  `custom` tinyint(1) DEFAULT '0' COMMENT '是否自定義',
  `group_name` varchar(50) NOT NULL,
  `reputation_lower` int(11) DEFAULT '0',
  `reputation_higer` int(11) DEFAULT '0',
  `reputation_factor` float DEFAULT '0' COMMENT '威望係數',
  `permission` text COMMENT '權限設置',
  PRIMARY KEY (`group_id`),
  KEY `type` (`type`),
  KEY `custom` (`custom`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8 COMMENT='用戶組';

CREATE TABLE `[#DB_PREFIX#]users_notification_setting` (
  `notice_setting_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` int(11) NOT NULL,
  `data` text COMMENT '設置數據',
  PRIMARY KEY (`notice_setting_id`),
  KEY `uid` (`uid`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8 COMMENT='通知設定';

CREATE TABLE `[#DB_PREFIX#]users_online` (
  `uid` int(11) NOT NULL COMMENT '用戶 ID',
  `last_active` INT( 11 ) NULL DEFAULT '0' COMMENT '上次活動時間',
  `ip` BIGINT( 12 ) NULL DEFAULT '0' COMMENT '客戶端ip',
  `active_url` VARCHAR( 255 ) NULL DEFAULT NULL COMMENT '停留頁面',
  `user_agent` VARCHAR( 255 ) NULL DEFAULT NULL COMMENT '用戶客戶端信息',
  KEY `uid` (`uid`),
  KEY `last_active` (`last_active`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8 COMMENT='在線用戶列表';

CREATE TABLE `[#DB_PREFIX#]users_qq` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用戶在本地的UID',
  `nickname` varchar(64) DEFAULT NULL,
  `openid` varchar(128) DEFAULT '',
  `gender` varchar(8) DEFAULT NULL,
  `add_time` int(10) DEFAULT NULL COMMENT '添加時間',
  `access_token` varchar(64) DEFAULT NULL,
  `refresh_token` varchar(64) DEFAULT NULL,
  `expires_time` int(10) DEFAULT NULL,
  `figureurl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `add_time` (`add_time`),
  KEY `access_token` (`access_token`),
  KEY `openid` (`openid`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]users_sina` (
  `id` bigint(11) NOT NULL COMMENT '新浪用戶 ID',
  `uid` int(11) NOT NULL COMMENT '用戶在本地的UID',
  `name` varchar(64) DEFAULT NULL COMMENT '微博暱稱',
  `location` varchar(255) DEFAULT NULL COMMENT '地址',
  `description` text COMMENT '個人描述',
  `url` varchar(255) DEFAULT NULL COMMENT '用戶博客地址',
  `profile_image_url` varchar(255) DEFAULT NULL COMMENT 'Sina 自定義頭像地址',
  `gender` varchar(8) DEFAULT NULL,
  `add_time` int(10) DEFAULT NULL COMMENT '添加時間',
  `expires_time` int(10) DEFAULT '0' COMMENT '過期時間',
  `access_token` varchar(64) DEFAULT NULL,
  `last_msg_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`),
  KEY `access_token` (`access_token`),
  KEY `last_msg_id` (`last_msg_id`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]geo_location` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `item_type` varchar(32) NOT NULL,
  `item_id` int(10) NOT NULL,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL,
  `add_time` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `item_type` (`item_type`),
  KEY `add_time` (`add_time`),
  KEY `geo_location` (`latitude`,`longitude`),
  KEY `item_id` (`item_id`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]users_weixin` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `openid` varchar(255) NOT NULL,
  `expires_in` int(10) DEFAULT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `refresh_token` varchar(255) DEFAULT NULL,
  `scope` varchar(64) DEFAULT NULL,
  `headimgurl` varchar(255) DEFAULT NULL,
  `nickname` varchar(64) DEFAULT NULL,
  `sex` tinyint(1) DEFAULT '0',
  `province` varchar(32) DEFAULT NULL,
  `city` varchar(32) DEFAULT NULL,
  `country` varchar(32) DEFAULT NULL,
  `add_time` int(10) NOT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `location_update` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`),
  KEY `openid` (`openid`),
  KEY `expires_in` (`expires_in`),
  KEY `scope` (`scope`),
  KEY `sex` (`sex`),
  KEY `province` (`province`),
  KEY `city` (`city`),
  KEY `country` (`country`),
  KEY `add_time` (`add_time`),
  KEY `latitude` (`latitude`,`longitude`),
  KEY `location_update` (`location_update`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]users_ucenter` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `uc_uid` int(11) DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `uc_uid` (`uc_uid`),
  KEY `email` (`email`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]users_google` (
  `id` varchar(64) NOT NULL,
  `uid` int(11) UNSIGNED NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `locale` varchar(16) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `gender` varchar(8) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `add_time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `access_token` varchar(128) DEFAULT NULL,
  `refresh_token` varchar(128) DEFAULT NULL,
  `expires_time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`),
  KEY `access_token` (`access_token`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]users_facebook` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uid` int(11) UNSIGNED NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `gender` varchar(8) DEFAULT NULL,
  `locale` varchar(16) DEFAULT NULL,
  `timezone` tinyint(3) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `expires_time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `add_time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`),
  KEY `access_token` (`access_token`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]users_twitter` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uid` int(11) UNSIGNED NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `screen_name` varchar(128) DEFAULT NULL,
  `location` varchar(64) DEFAULT NULL,
  `time_zone` varchar(64) DEFAULT NULL,
  `lang` varchar(16) DEFAULT NULL,
  `profile_image_url` varchar(255) DEFAULT NULL,
  `add_time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `access_token` varchar(255) NOT NULL DEFAULT 'a:2:{s:11:"oauth_token";s:0:"";s:18:"oauth_token_secret";s:0:"";}',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`),
  KEY `access_token` (`access_token`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]user_action_history` (
  `history_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uid` int(11) NOT NULL COMMENT '用戶id',
  `associate_type` tinyint(1) DEFAULT NULL COMMENT '關聯類型: 1 問題 2 回答 3 評論 4 話題',
  `associate_action` smallint(3) DEFAULT NULL COMMENT '操作類型',
  `associate_id` int(11) DEFAULT NULL COMMENT '關聯ID',
  `add_time` int(10) DEFAULT NULL COMMENT '添加時間',
  `associate_attached` int(11) DEFAULT NULL,
  `anonymous` TINYINT( 1 ) NULL DEFAULT '0' COMMENT '是否匿名',
  `fold_status` TINYINT( 1 ) NULL DEFAULT '0',
  PRIMARY KEY (`history_id`),
  KEY `add_time` (`add_time`),
  KEY `uid` (`uid`),
  KEY `associate_id` (`associate_id`),
  KEY `anonymous` (`anonymous`),
  KEY `fold_status` (`fold_status`),
  KEY `associate` (`associate_type`,`associate_action`),
  KEY `associate_attached` (`associate_attached`),
  KEY `associate_with_id` (`associate_id`, `associate_type`, `associate_action`),
  KEY `associate_with_uid` (`uid`, `associate_type`, `associate_action`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8 COMMENT='用戶操作記錄';

CREATE TABLE `[#DB_PREFIX#]user_action_history_data` (
  `history_id` int(11) unsigned NOT NULL,
  `associate_content` text,
  `associate_attached` text,
  `addon_data` TEXT NULL DEFAULT NULL COMMENT '附加數據',
  PRIMARY KEY (`history_id`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]user_action_history_fresh` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `history_id` int(11) NOT NULL,
  `associate_id` int(11) NOT NULL,
  `associate_type` tinyint(1) NOT NULL,
  `associate_action` smallint(3) NOT NULL,
  `add_time` int(10) NOT NULL DEFAULT '0',
  `uid` int(10) NOT NULL DEFAULT '0',
  `anonymous` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `associate` (`associate_type`,`associate_action`),
  KEY `add_time` (`add_time`),
  KEY `uid` (`uid`),
  KEY `history_id` (`history_id`),
  KEY `associate_with_id` (`id`,`associate_type`,`associate_action`),
  KEY `associate_with_uid` (`uid`,`associate_type`,`associate_action`),
  KEY `anonymous` (`anonymous`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]user_follow` (
  `follow_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `fans_uid` int(11) DEFAULT NULL COMMENT '關注人的UID',
  `friend_uid` int(11) DEFAULT NULL COMMENT '被關注人的uid',
  `add_time` int(10) DEFAULT NULL COMMENT '添加時間',
  PRIMARY KEY (`follow_id`),
  KEY `fans_uid` (`fans_uid`),
  KEY `friend_uid` (`friend_uid`),
  KEY `user_follow` ( `fans_uid`, `friend_uid` )
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8 COMMENT='用戶關注表';

CREATE TABLE `[#DB_PREFIX#]work_experience` (
  `work_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uid` int(11) DEFAULT NULL COMMENT '用戶ID',
  `start_year` int(11) DEFAULT NULL COMMENT '開始年份',
  `end_year` int(11) DEFAULT NULL COMMENT '結束年月',
  `company_name` varchar(64) DEFAULT NULL COMMENT '公司名',
  `job_id` int(11) DEFAULT NULL COMMENT '職位ID',
  `add_time` int(10) DEFAULT NULL COMMENT '添加時間',
  PRIMARY KEY (`work_id`),
  KEY `uid` (`uid`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8 COMMENT='工作經歷';

CREATE TABLE `[#DB_PREFIX#]reputation_category` (
  `auto_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` INT(10) DEFAULT '0',
  `category_id` SMALLINT(4) DEFAULT '0',
  `update_time` INT(10) DEFAULT '0',
  `reputation` INT(10) DEFAULT '0',
  `thanks_count` INT(10) DEFAULT '0',
  `agree_count` INT(10) DEFAULT '0',
  `question_count` INT(10) DEFAULT '0',
  PRIMARY KEY (`auto_id`),
  UNIQUE KEY `uid_category_id` (`uid`, `category_id`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]edm_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `message` mediumtext NOT NULL,
  `subject` varchar(255) NOT NULL,
  `from_name` varchar(255) NOT NULL,
  `time` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]edm_taskdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskid` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `sent_time` int(10) NOT NULL,
  `view_time` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `taskid` (`taskid`),
  KEY `sent_time` (`sent_time`),
  KEY `view_time` (`view_time`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]edm_userdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usergroup` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usergroup` (`usergroup`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;


CREATE TABLE `[#DB_PREFIX#]edm_usergroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `time` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]edm_unsubscription` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `time` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]verify_apply` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `attach` varchar(255) DEFAULT NULL,
  `time` int(10) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `data` text,
  `status` tinyint(1) DEFAULT '0',
  `type` varchar(16) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `time` (`time`),
  KEY `name` (`name`,`status`),
  KEY `type` (`type`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]weixin_reply_rule` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `account_id` int(10) NOT NULL DEFAULT '0',
  `keyword` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_file` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `description` text COLLATE utf8_unicode_ci,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '0',
  `sort_status` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`),
  KEY `keyword` (`keyword`),
  KEY `enabled` (`enabled`),
  KEY `sort_status` (`sort_status`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8;

CREATE TABLE `[#DB_PREFIX#]weixin_accounts` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `weixin_mp_token` varchar(255) NOT NULL,
  `weixin_account_role` varchar(20) DEFAULT 'base',
  `weixin_app_id` varchar(255) DEFAULT '',
  `weixin_app_secret` varchar(255) DEFAULT '',
  `weixin_mp_menu` text,
  `weixin_subscribe_message_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `weixin_no_result_message_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `weixin_encoding_aes_key` varchar(43) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `weixin_mp_token` (`weixin_mp_token`),
  KEY `weixin_account_role` (`weixin_account_role`),
  KEY `weixin_app_id` (`weixin_app_id`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8 COMMENT='微信多賬號設置';

CREATE TABLE `[#DB_PREFIX#]weixin_msg` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `msg_id` bigint(20) NOT NULL,
  `group_name` varchar(255) NOT NULL DEFAULT '未分組',
  `status` varchar(15) NOT NULL DEFAULT 'unsent',
  `error_num` int(10) DEFAULT NULL,
  `main_msg` text,
  `articles_info` text,
  `questions_info` text,
  `create_time` int(10) NOT NULL,
  `filter_count` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `msg_id` (`msg_id`),
  KEY `group_name` (`group_name`),
  KEY `status` (`status`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8 COMMENT='微信群發列表';

CREATE TABLE `[#DB_PREFIX#]weibo_msg` (
  `id` bigint(20) NOT NULL,
  `created_at` int(10) NOT NULL,
  `msg_author_uid` bigint(20) NOT NULL,
  `text` varchar(255) NOT NULL,
  `access_key` varchar(32) NOT NULL,
  `has_attach` tinyint(1) NOT NULL DEFAULT '0',
  `uid` int(10) NOT NULL,
  `weibo_uid` bigint(20) NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `ticket_id` int(11) DEFAULT NULL,
  PRIMARY KEY `id` (`id`),
  KEY `created_at` (`created_at`),
  KEY `uid` (`uid`),
  KEY `weibo_uid` (`weibo_uid`),
  KEY `question_id` (`question_id`),
  KEY `ticket_id` (`ticket_id`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8 COMMENT='新浪微博消息列表';

CREATE TABLE `[#DB_PREFIX#]weixin_qr_code` (
  `scene_id` mediumint(5) NOT NULL AUTO_INCREMENT,
  `ticket` varchar(255) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `subscribe_num` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY `scene_id` (`scene_id`),
  KEY `ticket` (`ticket`),
  KEY `subscribe_num` (`subscribe_num`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8 COMMENT='微信二維碼';

CREATE TABLE `[#DB_PREFIX#]receiving_email_config` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `protocol` varchar(10) NOT NULL,
  `server` varchar(255) NOT NULL,
  `ssl` tinyint(1) NOT NULL DEFAULT '0',
  `port` smallint(5) DEFAULT NULL,
  `username` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `uid` int(10) NOT NULL,
  `access_key` varchar(32) NOT NULL,
  `has_attach` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `server` (`server`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8 COMMENT='郵件賬號列表';

CREATE TABLE `[#DB_PREFIX#]received_email` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `config_id` int(10) NOT NULL,
  `message_id` varchar(255) NOT NULL,
  `date` int(10) NOT NULL,
  `from` varchar(255) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `content` text,
  `question_id` int(11) DEFAULT NULL,
  `ticket_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `config_id` (`config_id`),
  KEY `message_id` (`message_id`),
  KEY `date` (`date`),
  KEY `ticket_id` (`ticket_id`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8 COMMENT='已導入郵件列表';

CREATE TABLE `[#DB_PREFIX#]weixin_third_party_api` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `account_id` int(10) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `rank` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`),
  KEY `enabled` (`enabled`),
  KEY `rank` (`rank`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8 COMMENT='微信第三方接入';

CREATE TABLE `[#DB_PREFIX#]help_chapter` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `url_token` varchar(32) DEFAULT NULL,
  `sort` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `url_token` (`url_token`),
  KEY `sort` (`sort`)
) ENGINE=[#DB_ENGINE#] DEFAULT CHARSET=utf8 COMMENT='幫助中心';

INSERT INTO `[#DB_PREFIX#]category`(`title`,`type`) VALUES
('默認分類', 'question');

INSERT INTO `[#DB_PREFIX#]nav_menu`(`title`,`description`,`type`,`type_id`) VALUES
('默認分類', '默認分類描述', 'category', 1);

INSERT INTO `[#DB_PREFIX#]jobs` (`id`, `job_name`) VALUES
(1, '銷售'),
(2, '市場/市場拓展/公關'),
(3, '商務/採購/貿易'),
(4, '計算機軟、硬件/互聯網/IT'),
(5, '電子/半導體/儀表儀器'),
(6, '通信技術'),
(7, '客戶服務/技術支持'),
(8, '行政/後勤'),
(9, '人力資源'),
(10, '高級管理'),
(11, '生產/加工/製造'),
(12, '質控/安檢'),
(13, '工程機械'),
(14, '技工'),
(15, '財會/審計/統計'),
(16, '金融/銀行/保險/證券/投資'),
(17, '建築/房地產/裝修/物業'),
(18, '交通/倉儲/物流'),
(19, '普通勞動力/家政服務'),
(20, '零售業'),
(21, '教育/培訓'),
(22, '咨詢/顧問'),
(23, '學術/科研'),
(24, '法律'),
(25, '美術/設計/創意'),
(26, '編輯/文案/傳媒/影視/新聞'),
(27, '酒店/餐飲/旅遊/娛樂'),
(28, '化工'),
(29, '能源/礦產/地質勘查'),
(30, '醫療/護理/保健/美容'),
(31, '生物/製藥/醫療器械'),
(32, '翻譯（口譯與筆譯）'),
(33, '公務員'),
(34, '環境科學/環保'),
(35, '農/林/牧/漁業'),
(36, '兼職/臨時/培訓生/儲備幹部'),
(37, '在校學生'),
(38, '其他');

INSERT INTO `[#DB_PREFIX#]topic` (`topic_title`, `topic_description`) VALUES('默認話題', '默認話題');

INSERT INTO `[#DB_PREFIX#]users_group` (`group_id`, `type`, `custom`, `group_name`, `reputation_lower`, `reputation_higer`, `reputation_factor`, `permission`) VALUES
(1, 0, 0, '超級管理員', 0, 0, 5, 'a:15:{s:16:"is_administortar";s:1:"1";s:12:"is_moderator";s:1:"1";s:16:"publish_question";s:1:"1";s:21:"publish_approval_time";a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}s:13:"edit_question";s:1:"1";s:10:"edit_topic";s:1:"1";s:12:"manage_topic";s:1:"1";s:12:"create_topic";s:1:"1";s:17:"redirect_question";s:1:"1";s:13:"upload_attach";s:1:"1";s:11:"publish_url";s:1:"1";s:15:"publish_article";s:1:"1";s:12:"edit_article";s:1:"1";s:19:"edit_question_topic";s:1:"1";s:15:"publish_comment";s:1:"1";}'),
(2, 0, 0, '前台管理員', 0, 0, 4, 'a:14:{s:12:"is_moderator";s:1:"1";s:16:"publish_question";s:1:"1";s:21:"publish_approval_time";a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}s:13:"edit_question";s:1:"1";s:10:"edit_topic";s:1:"1";s:12:"manage_topic";s:1:"1";s:12:"create_topic";s:1:"1";s:17:"redirect_question";s:1:"1";s:13:"upload_attach";s:1:"1";s:11:"publish_url";s:1:"1";s:15:"publish_article";s:1:"1";s:12:"edit_article";s:1:"1";s:19:"edit_question_topic";s:1:"1";s:15:"publish_comment";s:1:"1";}'),
(3, 0, 0, '未驗證會員', 0, 0, 0, 'a:5:{s:16:"publish_question";s:1:"1";s:21:"publish_approval_time";a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}s:11:"human_valid";s:1:"1";s:19:"question_valid_hour";s:1:"2";s:17:"answer_valid_hour";s:1:"2";}'),
(4, 0, 0, '普通會員', 0, 0, 0, 'a:3:{s:21:"publish_approval_time";a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}s:19:"question_valid_hour";s:2:"10";s:17:"answer_valid_hour";s:2:"10";}'),
(5, 1, 0, '註冊會員', 0, 100, 1, 'a:6:{s:16:"publish_question";s:1:"1";s:21:"publish_approval_time";a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}s:11:"human_valid";s:1:"1";s:19:"question_valid_hour";s:1:"5";s:17:"answer_valid_hour";s:1:"5";s:15:"publish_comment";s:1:"1";}'),
(6, 1, 0, '初級會員', 100, 200, 1, 'a:8:{s:16:"publish_question";s:1:"1";s:21:"publish_approval_time";a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}s:13:"upload_attach";s:1:"1";s:11:"publish_url";s:1:"1";s:19:"question_valid_hour";s:1:"5";s:17:"answer_valid_hour";s:1:"5";s:15:"publish_article";s:1:"1";s:19:"edit_question_topic";s:1:"1";}'),
(7, 1, 0, '中級會員', 200, 500, 1, 'a:9:{s:16:"publish_question";s:1:"1";s:21:"publish_approval_time";a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}s:10:"edit_topic";s:1:"1";s:12:"create_topic";s:1:"1";s:17:"redirect_question";s:1:"1";s:13:"upload_attach";s:1:"1";s:11:"publish_url";s:1:"1";s:15:"publish_article";s:1:"1";s:15:"publish_comment";s:1:"1";}'),
(8, 1, 0, '高級會員', 500, 1000, 1, 'a:11:{s:16:"publish_question";s:1:"1";s:21:"publish_approval_time";a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}s:13:"edit_question";s:1:"1";s:10:"edit_topic";s:1:"1";s:12:"create_topic";s:1:"1";s:17:"redirect_question";s:1:"1";s:13:"upload_attach";s:1:"1";s:11:"publish_url";s:1:"1";s:15:"publish_article";s:1:"1";s:19:"edit_question_topic";s:1:"1";s:15:"publish_comment";s:1:"1";}'),
(9, 1, 0, '核心會員', 1000, 999999, 1, 'a:12:{s:16:"publish_question";s:1:"1";s:21:"publish_approval_time";a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}s:13:"edit_question";s:1:"1";s:10:"edit_topic";s:1:"1";s:12:"manage_topic";s:1:"1";s:12:"create_topic";s:1:"1";s:17:"redirect_question";s:1:"1";s:13:"upload_attach";s:1:"1";s:11:"publish_url";s:1:"1";s:15:"publish_article";s:1:"1";s:19:"edit_question_topic";s:1:"1";s:15:"publish_comment";s:1:"1";}'),
(99, 0, 0, '遊客', 0, 0, 0, 'a:9:{s:10:"visit_site";s:1:"1";s:13:"visit_explore";s:1:"1";s:12:"search_avail";s:1:"1";s:14:"visit_question";s:1:"1";s:11:"visit_topic";s:1:"1";s:13:"visit_feature";s:1:"1";s:12:"visit_people";s:1:"1";s:13:"visit_chapter";s:1:"1";s:11:"answer_show";s:1:"1";}');
