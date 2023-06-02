CREATE DATABASE IF NOT EXISTS `contact_management` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `contact_management`;

CREATE TABLE IF NOT EXISTS `tbl_user` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_unicode_ci',
    `password` VARCHAR(100) NOT NULL COLLATE 'utf8mb4_unicode_ci',
    `salt` VARCHAR(100) NOT NULL COLLATE 'utf8mb4_unicode_ci',
    `first_name` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_unicode_ci',
    `last_name` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_unicode_ci',
    `email` VARCHAR(255) NOT NULL DEFAULT '' COLLATE 'utf8mb4_unicode_ci',
    `address` VARCHAR(255) NULL DEFAULT '' COLLATE 'utf8mb4_unicode_ci',
    `is_deleted` TINYINT(1) NOT NULL DEFAULT '0',
    `is_active` TINYINT(1) NOT NULL DEFAULT '0',
    `created_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `created_user` VARCHAR(50) NULL DEFAULT 'system' COLLATE 'utf8mb4_unicode_ci',
    `updated_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
    `updated_user` VARCHAR(50) NULL DEFAULT 'system' COLLATE 'utf8mb4_unicode_ci',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `username` (`username`) USING BTREE,
    UNIQUE INDEX `email` (`email`) USING BTREE
    ) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `tbl_contact_group` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `user_id` INT(11) NOT NULL,
    `name` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_unicode_ci',
    `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `is_deleted` TINYINT(1) NOT NULL DEFAULT '0',
    `is_active` TINYINT(1) NOT NULL DEFAULT '0',
    `created_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `created_user` VARCHAR(50) NULL DEFAULT 'system' COLLATE 'utf8mb4_unicode_ci',
    `updated_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
    `updated_user` VARCHAR(50) NULL DEFAULT 'system' COLLATE 'utf8mb4_unicode_ci',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `name` (`name`) USING BTREE
) COLLATE='utf8mb4_unicode_ci' ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `tbl_contact` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `group_id` INT(11) NOT NULL,
    `user_id` INT(11) NOT NULL,
    `name` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_unicode_ci',
    `phone_number` VARCHAR(50) NULL DEFAULT '' COLLATE 'utf8mb4_unicode_ci',
    `email` VARCHAR(255) NOT NULL DEFAULT '' COLLATE 'utf8mb4_unicode_ci',
    `is_deleted` TINYINT(1) NOT NULL DEFAULT '0',
    `is_active` TINYINT(1) NOT NULL DEFAULT '0',
    `created_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `created_user` VARCHAR(50) NULL DEFAULT 'system' COLLATE 'utf8mb4_unicode_ci',
    `updated_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
    `updated_user` VARCHAR(50) NULL DEFAULT 'system' COLLATE 'utf8mb4_unicode_ci',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `phone_number` (`phone_number`) USING BTREE,
    UNIQUE INDEX `email` (`email`) USING BTREE
) COLLATE='utf8mb4_unicode_ci' ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `tbl_contact_sharing` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `user_id` INT(11) NOT NULL,
    `contact_id` INT(11) NOT NULL,
    `mode` ENUM('read') DEFAULT 'read',
    `created_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `created_user` VARCHAR(50) NULL DEFAULT 'system' COLLATE 'utf8mb4_unicode_ci',
    `updated_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
    `updated_user` VARCHAR(50) NULL DEFAULT 'system' COLLATE 'utf8mb4_unicode_ci',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `user_contact_mode` (`user_id`, `contact_id`, `mode`) USING BTREE
    ) COLLATE='utf8mb4_unicode_ci' ENGINE=InnoDB;
