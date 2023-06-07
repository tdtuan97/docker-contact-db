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
    `created_user_id` INT(11) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
    `updated_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
    `updated_user_id` INT(11) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `username` (`username`) USING BTREE,
    INDEX `email` (`email`) USING BTREE,
    INDEX `created_user_id` (`created_user_id`) USING BTREE
    ) COLLATE='utf8mb4_unicode_ci' ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `tbl_contact_group` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_unicode_ci',
    `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `is_deleted` TINYINT(1) NOT NULL DEFAULT '0',
    `is_active` TINYINT(1) NOT NULL DEFAULT '0',
    `created_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `created_user_id` INT(11) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
    `updated_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
    `updated_user_id` INT(11) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
    PRIMARY KEY (`id`) USING BTREE
    ) COLLATE='utf8mb4_unicode_ci' ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `tbl_contact` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `group_id` int(11) DEFAULT NULL,
    `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `phone_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
    `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
    `is_public` tinyint(1) NOT NULL DEFAULT '0',
    `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
    `is_active` tinyint(1) NOT NULL DEFAULT '0',
    `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `created_user_id` int(11) DEFAULT NULL,
    `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
    `updated_user_id` int(11) DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `phone_number` (`phone_number`) USING BTREE,
    INDEX `email` (`email`) USING BTREE,
    INDEX `created_user_id` (`created_user_id`) USING BTREE
    ) COLLATE='utf8mb4_unicode_ci' ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `tbl_contact_sharing` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `user_id` INT(11) NOT NULL,
    `contact_id` INT(11) NOT NULL,
    `mode` ENUM('read') DEFAULT 'read',
    `created_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `created_user_id` INT(11) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
    `updated_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
    `updated_user_id` INT(11) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `user_contact_mode` (`user_id`, `contact_id`, `mode`) USING BTREE,
    INDEX `created_user_id` (`created_user_id`) USING BTREE
    ) COLLATE='utf8mb4_unicode_ci' ENGINE=InnoDB;


INSERT INTO tbl_user
(id, username, password, salt, first_name, last_name, email, address, is_deleted, is_active, created_at, created_user_id, updated_at, updated_user_id)
VALUES
    (1, 'trantuan', '$2b$10$yrnzTG8yi5hmZEuOmNzOlOAkUxW/CvTJvGnVi61pCt849.hw1JzQG', '$2b$10$yrnzTG8yi5hmZEuOmNzOlO', 'Tran', 'Tuan', 'email@email.com', '', 0, 1, '2023-06-05 01:18:22.200691', NULL, '2023-06-05 01:18:22.200691', NULL),
    (2, 'username_002', '$2b$10$yrnzTG8yi5hmZEuOmNzOlOAkUxW/CvTJvGnVi61pCt849.hw1JzQG', '$2b$10$yrnzTG8yi5hmZEuOmNzOlO', 'Tran', 'Tuan', 'email_002@email.com', '', 0, 1, '2023-06-05 01:18:22.200691', NULL, '2023-06-05 01:18:22.200691', NULL),
    (3, 'username_003', '$2b$10$yrnzTG8yi5hmZEuOmNzOlOAkUxW/CvTJvGnVi61pCt849.hw1JzQG', '$2b$10$yrnzTG8yi5hmZEuOmNzOlO', 'Tran', 'Tuan', 'email_003@email.com', '', 0, 1, '2023-06-05 01:18:22.200691', NULL, '2023-06-05 01:18:22.200691', NULL),
    (4, 'username_004', '$2b$10$yrnzTG8yi5hmZEuOmNzOlOAkUxW/CvTJvGnVi61pCt849.hw1JzQG', '$2b$10$yrnzTG8yi5hmZEuOmNzOlO', 'Tran', 'Tuan', 'email_004@email.com', '', 0, 1, '2023-06-05 01:18:22.200691', NULL, '2023-06-05 01:18:22.200691', NULL),
    (5, 'username_005', '$2b$10$yrnzTG8yi5hmZEuOmNzOlOAkUxW/CvTJvGnVi61pCt849.hw1JzQG', '$2b$10$yrnzTG8yi5hmZEuOmNzOlO', 'Tran', 'Tuan', 'email_005@email.com', '', 0, 1, '2023-06-05 01:18:22.200691', NULL, '2023-06-05 01:18:22.200691', NULL),
    (6, 'username_006', '$2b$10$yrnzTG8yi5hmZEuOmNzOlOAkUxW/CvTJvGnVi61pCt849.hw1JzQG', '$2b$10$yrnzTG8yi5hmZEuOmNzOlO', 'Tran', 'Tuan', 'email_006@email.com', '', 0, 1, '2023-06-05 01:18:22.200691', NULL, '2023-06-05 01:18:22.200691', NULL),
    (7, 'username_007', '$2b$10$yrnzTG8yi5hmZEuOmNzOlOAkUxW/CvTJvGnVi61pCt849.hw1JzQG', '$2b$10$yrnzTG8yi5hmZEuOmNzOlO', 'Tran', 'Tuan', 'email_007@email.com', '', 0, 1, '2023-06-05 01:18:22.200691', NULL, '2023-06-05 01:18:22.200691', NULL),
    (8, 'username_008', '$2b$10$yrnzTG8yi5hmZEuOmNzOlOAkUxW/CvTJvGnVi61pCt849.hw1JzQG', '$2b$10$yrnzTG8yi5hmZEuOmNzOlO', 'Tran', 'Tuan', 'email_008@email.com', '', 0, 1, '2023-06-05 01:18:22.200691', NULL, '2023-06-05 01:18:22.200691', NULL),
    (9, 'username_009', '$2b$10$yrnzTG8yi5hmZEuOmNzOlOAkUxW/CvTJvGnVi61pCt849.hw1JzQG', '$2b$10$yrnzTG8yi5hmZEuOmNzOlO', 'Tran', 'Tuan', 'email_009@email.com', '', 0, 1, '2023-06-05 01:18:22.200691', NULL, '2023-06-05 01:18:22.200691', NULL);

INSERT INTO contact_management.tbl_contact_group (id, name, description, is_deleted, is_active, created_at, created_user_id, updated_at, updated_user_id)
VALUES
    (1, 'Group 1', 'This is description', 0, 1, '2023-06-05 01:25:37.075112', 1, '2023-06-05 01:25:37.075112', NULL),
    (2, 'Group 2', 'This is description', 0, 1, '2023-06-05 01:25:37.075112', 1, '2023-06-05 01:25:37.075112', NULL),
    (3, 'Group 3', 'This is description', 0, 1, '2023-06-05 01:25:37.075112', 1, '2023-06-05 01:25:37.075112', NULL),
    (4, 'Group 4', 'This is description', 0, 1, '2023-06-05 01:25:37.075112', 1, '2023-06-05 01:25:37.075112', NULL),
    (5, 'Group 5', 'This is description', 0, 1, '2023-06-05 01:25:37.075112', 1, '2023-06-05 01:25:37.075112', NULL),
    (6, 'Group 6', 'This is description', 0, 1, '2023-06-05 01:25:37.075112', 1, '2023-06-05 01:25:37.075112', NULL),
    (7, 'Group 7', 'This is description', 0, 1, '2023-06-05 01:25:37.075112', 1, '2023-06-05 01:25:37.075112', NULL),
    (8, 'Group 8', 'This is description', 0, 1, '2023-06-05 01:25:37.075112', 1, '2023-06-05 01:25:37.075112', NULL),
    (9, 'Group 9', 'This is description', 0, 1, '2023-06-05 01:25:37.075112', 1, '2023-06-05 01:25:37.075112', NULL),
    (10, 'Group 10', 'This is description', 0, 1, '2023-06-05 01:25:37.075112', 1, '2023-06-05 01:25:37.075112', NULL),
    (11, 'Group 11', 'This is description', 0, 1, '2023-06-05 01:25:37.075112', 1, '2023-06-05 01:25:37.075112', NULL),
    (12, 'Group 12', 'This is description', 0, 1, '2023-06-05 01:25:37.075112', 1, '2023-06-05 01:25:37.075112', NULL),
    (13, 'Group 13', 'This is description', 0, 1, '2023-06-05 01:25:37.075112', 1, '2023-06-05 01:25:37.075112', NULL),
    (14, 'Group 14', 'This is description', 0, 1, '2023-06-05 01:25:37.075112', 1, '2023-06-05 01:25:37.075112', NULL),
    (15, 'Group 15', 'This is description', 0, 1, '2023-06-05 01:25:37.075112', 1, '2023-06-05 01:25:37.075112', NULL),
    (16, 'Group 16', 'This is description', 0, 1, '2023-06-05 01:25:37.075112', 1, '2023-06-05 01:25:37.075112', NULL),
    (17, 'Group 17', 'This is description', 0, 1, '2023-06-05 01:25:37.075112', 1, '2023-06-05 01:25:37.075112', NULL),
    (18, 'Group 18', 'This is description', 0, 1, '2023-06-05 01:25:37.075112', 1, '2023-06-05 01:25:37.075112', NULL),
    (19, 'Group 19', 'This is description', 0, 1, '2023-06-05 01:25:37.075112', 1, '2023-06-05 01:25:37.075112', NULL),
    (20, 'Group 20', 'This is description', 0, 1, '2023-06-05 01:25:37.075112', 1, '2023-06-05 01:25:37.075112', NULL),
    (22, 'Group 22', 'This is description', 0, 1, '2023-06-05 01:25:37.075112', 1, '2023-06-05 01:25:37.075112', NULL),
    (23, 'Group 23', 'This is description', 0, 1, '2023-06-05 01:25:37.075112', 1, '2023-06-05 01:25:37.075112', NULL),
    (24, 'Group 24', 'This is description', 0, 1, '2023-06-05 01:25:37.075112', 1, '2023-06-05 01:25:37.075112', NULL),
    (25, 'Group 25', 'This is description', 0, 1, '2023-06-05 01:25:37.075112', 1, '2023-06-05 01:25:37.075112', NULL),
    (26, 'Group 26', 'This is description', 0, 1, '2023-06-05 01:25:37.075112', 1, '2023-06-05 01:25:37.075112', NULL),
    (27, 'Group 27', 'This is description', 0, 1, '2023-06-05 01:25:37.075112', 1, '2023-06-05 01:25:37.075112', NULL),
    (28, 'Group 28', 'This is description', 0, 1, '2023-06-05 01:25:37.075112', 1, '2023-06-05 01:25:37.075112', NULL),
    (29, 'Group 29', 'This is description', 0, 1, '2023-06-05 01:25:37.075112', 1, '2023-06-05 01:25:37.075112', NULL),
    (30, 'Group 30', 'This is description', 0, 1, '2023-06-05 01:25:37.075112', 1, '2023-06-05 01:25:37.075112', NULL),
    (31, 'Group 31', 'This is description', 0, 1, '2023-06-05 01:25:37.075112', 1, '2023-06-05 01:25:37.075112', NULL),
    (32, 'Group 32', 'This is description', 0, 1, '2023-06-05 01:25:37.075112', 1, '2023-06-05 01:25:37.075112', NULL),
    (33, 'Group 33', 'This is description', 0, 1, '2023-06-05 01:25:37.075112', 1, '2023-06-05 01:25:37.075112', NULL);

INSERT INTO tbl_contact
(id, group_id, name, phone_number, email, is_deleted, is_active, created_at, created_user_id, updated_at, updated_user_id)
VALUES
    (1, NULL, 'Contact 1', '0901230001', 'email_0001@email.com', 0, 1, '2023-06-05 01:54:10.856918', 1, '2023-06-05 01:54:31.183598', NULL),
    (2, NULL, 'Contact 2', '0901230002', 'email_0002@email.com', 0, 1, '2023-06-05 01:54:10.856918', 1, '2023-06-05 01:54:31.183598', NULL),
    (3, NULL, 'Contact 3', '0901230003', 'email_0003@email.com', 0, 1, '2023-06-05 01:54:10.856918', 1, '2023-06-05 01:54:31.183598', NULL),
    (4, NULL, 'Contact 4', '0901230004', 'email_0004@email.com', 0, 1, '2023-06-05 01:54:10.856918', 1, '2023-06-05 01:54:31.183598', NULL),
    (5, NULL, 'Contact 5', '0901230005', 'email_0005@email.com', 0, 1, '2023-06-05 01:54:10.856918', 1, '2023-06-05 01:54:31.183598', NULL),
    (6, NULL, 'Contact 6', '0901230006', 'email_0006@email.com', 0, 1, '2023-06-05 01:54:10.856918', 1, '2023-06-05 01:54:31.183598', NULL),
    (7, NULL, 'Contact 7', '0901230007', 'email_0007@email.com', 0, 1, '2023-06-05 01:54:10.856918', 1, '2023-06-05 01:54:31.183598', NULL),
    (8, NULL, 'Contact 8', '0901230008', 'email_0008@email.com', 0, 1, '2023-06-05 01:54:10.856918', 1, '2023-06-05 01:54:31.183598', NULL),
    (9, NULL, 'Contact 9', '0901230009', 'email_0009@email.com', 0, 1, '2023-06-05 01:54:10.856918', 1, '2023-06-05 01:54:31.183598', NULL),
    (10, NULL, 'Contact 10', '0901230010', 'email_0010@email.com', 0, 1, '2023-06-05 01:54:10.856918', 1, '2023-06-05 01:54:31.183598', NULL),
    (11, NULL, 'Contact 11', '0901230011', 'email_0011@email.com', 0, 1, '2023-06-05 01:54:10.856918', 1, '2023-06-05 01:54:31.183598', NULL),
    (12, NULL, 'Contact 12', '0901230012', 'email_0012@email.com', 0, 1, '2023-06-05 01:54:10.856918', 1, '2023-06-05 01:54:31.183598', NULL),
    (13, NULL, 'Contact 13', '0901230013', 'email_0013@email.com', 0, 1, '2023-06-05 01:54:10.856918', 1, '2023-06-05 01:54:31.183598', NULL),
    (14, NULL, 'Contact 14', '0901230014', 'email_0014@email.com', 0, 1, '2023-06-05 01:54:10.856918', 1, '2023-06-05 01:54:31.183598', NULL),
    (15, NULL, 'Contact 15', '0901230015', 'email_0015@email.com', 0, 1, '2023-06-05 01:54:10.856918', 1, '2023-06-05 01:54:31.183598', NULL),
    (16, NULL, 'Contact 16', '0901230016', 'email_0016@email.com', 0, 1, '2023-06-05 01:54:10.856918', 1, '2023-06-05 01:54:31.183598', NULL),
    (17, NULL, 'Contact 17', '0901230017', 'email_0017@email.com', 0, 1, '2023-06-05 01:54:10.856918', 1, '2023-06-05 01:54:31.183598', NULL),
    (18, NULL, 'Contact 18', '0901230018', 'email_0018@email.com', 0, 1, '2023-06-05 01:54:10.856918', 1, '2023-06-05 01:54:31.183598', NULL),
    (19, NULL, 'Contact 19', '0901230019', 'email_0019@email.com', 0, 1, '2023-06-05 01:54:10.856918', 1, '2023-06-05 01:54:31.183598', NULL),
    (20, NULL, 'Contact 20', '0901230020', 'email_0020@email.com', 0, 1, '2023-06-05 01:54:10.856918', 1, '2023-06-05 01:54:31.183598', NULL),
    (22, NULL, 'Contact 22', '0901230022', 'email_0022@email.com', 0, 1, '2023-06-05 01:54:10.856918', 1, '2023-06-05 01:54:31.183598', NULL),
    (23, NULL, 'Contact 23', '0901230023', 'email_0023@email.com', 0, 1, '2023-06-05 01:54:10.856918', 1, '2023-06-05 01:54:31.183598', NULL),
    (24, NULL, 'Contact 24', '0901230024', 'email_0024@email.com', 0, 1, '2023-06-05 01:54:10.856918', 1, '2023-06-05 01:54:31.183598', NULL),
    (25, NULL, 'Contact 25', '0901230025', 'email_0025@email.com', 0, 1, '2023-06-05 01:54:10.856918', 1, '2023-06-05 01:54:31.183598', NULL),
    (26, NULL, 'Contact 26', '0901230026', 'email_0026@email.com', 0, 1, '2023-06-05 01:54:10.856918', 1, '2023-06-05 01:54:31.183598', NULL),
    (27, NULL, 'Contact 27', '0901230027', 'email_0027@email.com', 0, 1, '2023-06-05 01:54:10.856918', 1, '2023-06-05 01:54:31.183598', NULL),
    (28, NULL, 'Contact 28', '0901230028', 'email_0028@email.com', 0, 1, '2023-06-05 01:54:10.856918', 1, '2023-06-05 01:54:31.183598', NULL),
    (29, NULL, 'Contact 29', '0901230029', 'email_0029@email.com', 0, 1, '2023-06-05 01:54:10.856918', 1, '2023-06-05 01:54:31.183598', NULL),
    (30, NULL, 'Contact 30', '0901230030', 'email_0030@email.com', 0, 1, '2023-06-05 01:54:10.856918', 1, '2023-06-05 01:54:31.183598', NULL),
    (31, NULL, 'Contact 31', '0901230031', 'email_0031@email.com', 0, 1, '2023-06-05 01:54:10.856918', 1, '2023-06-05 01:54:31.183598', NULL),
    (32, NULL, 'Contact 32', '0901230032', 'email_0032@email.com', 0, 1, '2023-06-05 01:54:10.856918', 1, '2023-06-05 01:54:31.183598', NULL),
    (33, NULL, 'Contact 33', '0901230033', 'email_0033@email.com', 0, 1, '2023-06-05 01:54:10.856918', 1, '2023-06-05 01:54:31.183598', NULL);
