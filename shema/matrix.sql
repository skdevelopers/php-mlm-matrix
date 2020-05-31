-- ----------------------------
-- Table structure for matrix
-- ----------------------------
DROP TABLE IF EXISTS `matrix`;
CREATE TABLE `matrix` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `depth` tinyint(4) unsigned NOT NULL DEFAULT '3' COMMENT 'Уровни матрицы Parent Matrix ID',
  `pow` tinyint(4) unsigned NOT NULL DEFAULT '2' COMMENT 'Вид матрицы (например двоичная) 
Matrix type (e.g. binary)',
  `date_create` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Дата создания date of creation',
  `date_close` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Дата закрытия 
closing date',
  `filled` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Матрица поделена The matrix is divided
',
  `parent_id` int(11) unsigned DEFAULT NULL COMMENT 'Идентификатор родительской матрицы Parent Matrix ID
',
  PRIMARY KEY (`id`),
  KEY `matrix_alias_id` (`id`), -- alias_id is not found rather I updated on Primary Key-- 
  CONSTRAINT `FK_matrix_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `matrix` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Матрицы matrix';

-- ----------------------------
-- Table structure for matrix_users
-- ----------------------------
DROP TABLE IF EXISTS `matrix_users`;
CREATE TABLE `matrix_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `matrix_id` int(11) unsigned NOT NULL COMMENT 'Матрица 
The matrix',
  `user_id` int(11) unsigned NOT NULL COMMENT 'Пользователь User',
  `depth` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Уровень пользователя в матрице User Level in Matrix
',
  `number` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Номер пользователя в уровне в матрице Matrix level user number',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Дата входа 
Login date',
  PRIMARY KEY (`id`),
  KEY `matrix_users_matrix_id` (`matrix_id`),
  KEY `matrix_users_user_id` (`user_id`),
  -- Again rectify error there is no Matrix_id in matrix table
  CONSTRAINT `FK_matrix_users_matrix_id` FOREIGN KEY (`matrix_id`) REFERENCES `matrix` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Пользователи в матрицах Matrix Users';
