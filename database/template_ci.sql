/*
 Navicat Premium Dump SQL

 Source Server         : yoga
 Source Server Type    : MySQL
 Source Server Version : 100428 (10.4.28-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : template_ci

 Target Server Type    : MySQL
 Target Server Version : 100428 (10.4.28-MariaDB)
 File Encoding         : 65001

 Date: 17/02/2025 21:03:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for history
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history`  (
  `id_history` int NOT NULL AUTO_INCREMENT,
  `id_user` int NULL DEFAULT NULL,
  `hasil` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `waktu` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_history`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of history
-- ----------------------------
INSERT INTO `history` VALUES (100, 1, 'L = 2 x 2 = 4', '2025-02-03 09:06:59');
INSERT INTO `history` VALUES (101, 31, 'L = 4 x 4 = 16', '2025-02-03 09:36:03');
INSERT INTO `history` VALUES (102, 31, 'L = L =4 × t =12 = 48', '2025-02-03 09:36:12');
INSERT INTO `history` VALUES (103, 31, 'V = 3³ = 27', '2025-02-03 09:36:20');
INSERT INTO `history` VALUES (104, 31, 'V = π × r² × t = π × (12²) × 20 = 9047.79', '2025-02-03 09:36:34');
INSERT INTO `history` VALUES (105, 31, 'Turunan dari fungsi 4x adalah: 4', '2025-02-03 09:36:41');
INSERT INTO `history` VALUES (106, 31, 'Turunan dari fungsi 4 adalah: 0', '2025-02-03 09:36:45');
INSERT INTO `history` VALUES (107, 31, 'Turunan dari fungsi 4x^4 adalah: 16*x^3', '2025-02-03 09:36:49');
INSERT INTO `history` VALUES (110, 1, 'L = 2 x 2 = 4', '2025-02-05 08:32:19');

-- ----------------------------
-- Table structure for setting
-- ----------------------------
DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting`  (
  `id_setting` int NOT NULL AUTO_INCREMENT,
  `nama_website` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `logo_website` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tab_icon` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `login_icon` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `create_by` int NULL DEFAULT NULL,
  `update_by` int NULL DEFAULT NULL,
  `deleted_by` int NULL DEFAULT NULL,
  `create_at` datetime NULL DEFAULT NULL,
  `update_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_setting`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of setting
-- ----------------------------
INSERT INTO `setting` VALUES (1, 'WEB MATEMATIKA', '1738597112_9b48b1230ddd6dfc4058.jpg', '1738597112_849ca114658ec3a0589b.jpg', '1738597112_f35f11593a891ad744e6.jpg', NULL, 1, NULL, NULL, '2025-02-03 09:38:32', NULL);

-- ----------------------------
-- Table structure for upload
-- ----------------------------
DROP TABLE IF EXISTS `upload`;
CREATE TABLE `upload`  (
  `id_upload` int NOT NULL AUTO_INCREMENT,
  `nama_upload` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_upload`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of upload
-- ----------------------------
INSERT INTO `upload` VALUES (2, 'oke', '1739793842_8513e5753fcc27823a49.png');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `level` enum('admin','pengguna') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  `deleted_by` int NULL DEFAULT NULL,
  `backup_by` int NULL DEFAULT NULL,
  `backup_at` datetime NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_user`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'c4ca4238a0b923820dcc509a6f75849b', '1738595372_14b8a5a78994e6715333.jpg', NULL, 'admin', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (29, 'bobi123', 'c4ca4238a0b923820dcc509a6f75849b', NULL, 'bobi123@gmail.com', 'pengguna', NULL, NULL, NULL, NULL, 1, '2025-02-03 09:29:16');
INSERT INTO `user` VALUES (31, 'boba', 'c4ca4238a0b923820dcc509a6f75849b', NULL, 'boba@gmail.com', 'pengguna', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (32, 'boba kecap', 'c4ca4238a0b923820dcc509a6f75849b', NULL, 'bobakecap@gmail.com', 'pengguna', '2025-02-05 08:35:13', NULL, NULL, NULL, 1, '2025-02-03 09:37:55');

-- ----------------------------
-- Table structure for user_activity
-- ----------------------------
DROP TABLE IF EXISTS `user_activity`;
CREATE TABLE `user_activity`  (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `id_user` int NULL DEFAULT NULL,
  `menu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_log`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 335 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_activity
-- ----------------------------
INSERT INTO `user_activity` VALUES (1, 1, 'Masuk ke Dashboard', '2025-02-03 09:15:40');
INSERT INTO `user_activity` VALUES (2, 1, 'Masuk ke User', '2025-02-03 09:15:41');
INSERT INTO `user_activity` VALUES (3, 1, 'Masuk ke Rumus persegi', '2025-02-03 09:15:41');
INSERT INTO `user_activity` VALUES (4, 1, 'Masuk ke Log Activity', '2025-02-03 09:15:42');
INSERT INTO `user_activity` VALUES (5, 1, 'Masuk ke Log Activity', '2025-02-03 09:16:11');
INSERT INTO `user_activity` VALUES (6, 1, 'Masuk ke User', '2025-02-03 09:16:13');
INSERT INTO `user_activity` VALUES (7, 1, 'Masuk ke User', '2025-02-03 09:20:25');
INSERT INTO `user_activity` VALUES (8, 1, 'Masuk ke User', '2025-02-03 09:20:26');
INSERT INTO `user_activity` VALUES (9, 1, 'Masuk ke Soft Delete', '2025-02-03 09:20:44');
INSERT INTO `user_activity` VALUES (10, 1, 'Masuk ke User', '2025-02-03 09:21:06');
INSERT INTO `user_activity` VALUES (11, 1, 'Masuk ke User', '2025-02-03 09:22:54');
INSERT INTO `user_activity` VALUES (12, 1, 'Masuk ke Soft Delete', '2025-02-03 09:22:57');
INSERT INTO `user_activity` VALUES (13, 1, 'Masuk ke User', '2025-02-03 09:22:58');
INSERT INTO `user_activity` VALUES (14, 1, 'Masuk ke User', '2025-02-03 09:25:06');
INSERT INTO `user_activity` VALUES (15, 1, 'Masuk ke User', '2025-02-03 09:25:08');
INSERT INTO `user_activity` VALUES (16, 1, 'Masuk ke Soft Delete', '2025-02-03 09:25:09');
INSERT INTO `user_activity` VALUES (17, 1, 'Masuk ke Soft Delete', '2025-02-03 09:25:44');
INSERT INTO `user_activity` VALUES (18, 1, 'Masuk ke Soft Delete', '2025-02-03 09:25:45');
INSERT INTO `user_activity` VALUES (19, 1, 'Masuk ke Soft Delete', '2025-02-03 09:26:24');
INSERT INTO `user_activity` VALUES (20, 1, 'Masuk ke Soft Delete', '2025-02-03 09:26:26');
INSERT INTO `user_activity` VALUES (21, 1, 'Masuk ke Soft Delete', '2025-02-03 09:26:31');
INSERT INTO `user_activity` VALUES (22, 1, 'Masuk ke Soft Delete', '2025-02-03 09:26:31');
INSERT INTO `user_activity` VALUES (23, 1, 'Masuk ke Restore Edit User', '2025-02-03 09:26:32');
INSERT INTO `user_activity` VALUES (24, 1, 'Masuk ke Soft Delete', '2025-02-03 09:26:33');
INSERT INTO `user_activity` VALUES (25, 1, 'Masuk ke Restore Edit User', '2025-02-03 09:26:34');
INSERT INTO `user_activity` VALUES (26, 1, 'Masuk ke Soft Delete', '2025-02-03 09:26:34');
INSERT INTO `user_activity` VALUES (27, 1, 'Masuk ke User', '2025-02-03 09:26:35');
INSERT INTO `user_activity` VALUES (28, 1, 'Masuk ke Edit User', '2025-02-03 09:26:36');
INSERT INTO `user_activity` VALUES (29, 1, 'Masuk ke User', '2025-02-03 09:27:06');
INSERT INTO `user_activity` VALUES (30, 1, 'Masuk ke Edit User', '2025-02-03 09:27:08');
INSERT INTO `user_activity` VALUES (31, 1, 'Masuk ke User', '2025-02-03 09:27:29');
INSERT INTO `user_activity` VALUES (32, 1, 'Masuk ke Edit User', '2025-02-03 09:27:30');
INSERT INTO `user_activity` VALUES (33, 1, 'Masuk ke User', '2025-02-03 09:27:36');
INSERT INTO `user_activity` VALUES (34, 1, 'Masuk ke User', '2025-02-03 09:29:14');
INSERT INTO `user_activity` VALUES (35, 1, 'Masuk ke Edit User', '2025-02-03 09:29:14');
INSERT INTO `user_activity` VALUES (36, 1, 'Masuk ke User', '2025-02-03 09:29:16');
INSERT INTO `user_activity` VALUES (37, 1, 'Masuk ke Log Activity', '2025-02-03 09:29:18');
INSERT INTO `user_activity` VALUES (38, 1, 'Masuk ke Restore Edit User', '2025-02-03 09:29:19');
INSERT INTO `user_activity` VALUES (39, 1, 'Masuk ke User', '2025-02-03 09:29:31');
INSERT INTO `user_activity` VALUES (40, 1, 'Masuk ke Soft Delete', '2025-02-03 09:29:33');
INSERT INTO `user_activity` VALUES (41, 1, 'Masuk ke User', '2025-02-03 09:29:34');
INSERT INTO `user_activity` VALUES (42, 1, 'Masuk ke User', '2025-02-03 09:29:36');
INSERT INTO `user_activity` VALUES (43, 1, 'Masuk ke Soft Delete', '2025-02-03 09:29:37');
INSERT INTO `user_activity` VALUES (44, 1, 'Masuk ke User', '2025-02-03 09:29:38');
INSERT INTO `user_activity` VALUES (45, 1, 'Masuk ke Log Activity', '2025-02-03 09:29:40');
INSERT INTO `user_activity` VALUES (46, 1, 'Masuk ke Dashboard', '2025-02-03 09:29:42');
INSERT INTO `user_activity` VALUES (47, NULL, 'Masuk ke Login', '2025-02-03 09:30:02');
INSERT INTO `user_activity` VALUES (48, NULL, 'Masuk ke Register', '2025-02-03 09:30:03');
INSERT INTO `user_activity` VALUES (49, NULL, 'Masuk ke Register', '2025-02-03 09:31:17');
INSERT INTO `user_activity` VALUES (50, NULL, 'Masuk ke Register', '2025-02-03 09:31:33');
INSERT INTO `user_activity` VALUES (51, NULL, 'Masuk ke Register', '2025-02-03 09:32:05');
INSERT INTO `user_activity` VALUES (52, NULL, 'Masuk ke Register', '2025-02-03 09:32:33');
INSERT INTO `user_activity` VALUES (53, NULL, 'Masuk ke Login', '2025-02-03 09:32:35');
INSERT INTO `user_activity` VALUES (54, NULL, 'Masuk ke Login', '2025-02-03 09:32:35');
INSERT INTO `user_activity` VALUES (55, NULL, 'Masuk ke Register', '2025-02-03 09:33:42');
INSERT INTO `user_activity` VALUES (56, NULL, 'Masuk ke Login', '2025-02-03 09:33:51');
INSERT INTO `user_activity` VALUES (57, NULL, 'Masuk ke Login', '2025-02-03 09:34:45');
INSERT INTO `user_activity` VALUES (58, NULL, 'Masuk ke Register', '2025-02-03 09:35:29');
INSERT INTO `user_activity` VALUES (59, NULL, 'Masuk ke Login', '2025-02-03 09:35:37');
INSERT INTO `user_activity` VALUES (60, 31, 'Masuk ke Dashboard', '2025-02-03 09:35:41');
INSERT INTO `user_activity` VALUES (61, 31, 'Masuk ke Rumus persegi', '2025-02-03 09:35:51');
INSERT INTO `user_activity` VALUES (62, 31, 'Melihat History Perhitungan Luas Persegi', '2025-02-03 09:35:51');
INSERT INTO `user_activity` VALUES (63, 31, 'Masuk ke Rumus persegi', '2025-02-03 09:35:55');
INSERT INTO `user_activity` VALUES (64, 31, 'Melihat History Perhitungan Luas Persegi', '2025-02-03 09:35:55');
INSERT INTO `user_activity` VALUES (65, 31, 'Masuk ke Rumus persegi', '2025-02-03 09:35:57');
INSERT INTO `user_activity` VALUES (66, 31, 'Melihat History Perhitungan Luas Persegi', '2025-02-03 09:35:57');
INSERT INTO `user_activity` VALUES (67, 31, 'Masuk ke Rumus persegi', '2025-02-03 09:35:58');
INSERT INTO `user_activity` VALUES (68, 31, 'Melihat History Perhitungan Luas Persegi', '2025-02-03 09:35:58');
INSERT INTO `user_activity` VALUES (69, 31, 'Masuk ke Rumus persegi', '2025-02-03 09:35:59');
INSERT INTO `user_activity` VALUES (70, 31, 'Melihat History Perhitungan Luas Persegi', '2025-02-03 09:35:59');
INSERT INTO `user_activity` VALUES (71, 31, 'Melihat History Perhitungan Luas Persegi', '2025-02-03 09:36:03');
INSERT INTO `user_activity` VALUES (72, 31, 'Masuk ke Rumus persegi', '2025-02-03 09:36:03');
INSERT INTO `user_activity` VALUES (73, 31, 'Masuk ke Rumus persegi', '2025-02-03 09:36:08');
INSERT INTO `user_activity` VALUES (74, 31, 'Melihat History Perhitungan Luas Persegi', '2025-02-03 09:36:08');
INSERT INTO `user_activity` VALUES (75, 31, 'Melihat History Perhitungan Luas Persegi', '2025-02-03 09:36:12');
INSERT INTO `user_activity` VALUES (76, 31, 'Masuk ke Rumus persegi', '2025-02-03 09:36:12');
INSERT INTO `user_activity` VALUES (77, 31, 'Masuk ke Rumus persegi', '2025-02-03 09:36:18');
INSERT INTO `user_activity` VALUES (78, 31, 'Melihat History Perhitungan Luas Persegi', '2025-02-03 09:36:18');
INSERT INTO `user_activity` VALUES (79, 31, 'Melihat History Perhitungan Luas Persegi', '2025-02-03 09:36:20');
INSERT INTO `user_activity` VALUES (80, 31, 'Masuk ke Rumus persegi', '2025-02-03 09:36:20');
INSERT INTO `user_activity` VALUES (81, 31, 'Masuk ke Rumus persegi', '2025-02-03 09:36:28');
INSERT INTO `user_activity` VALUES (82, 31, 'Melihat History Perhitungan Luas Persegi', '2025-02-03 09:36:28');
INSERT INTO `user_activity` VALUES (83, 31, 'Melihat History Perhitungan Luas Persegi', '2025-02-03 09:36:34');
INSERT INTO `user_activity` VALUES (84, 31, 'Masuk ke Rumus persegi', '2025-02-03 09:36:34');
INSERT INTO `user_activity` VALUES (85, 31, 'Masuk ke Rumus persegi', '2025-02-03 09:36:37');
INSERT INTO `user_activity` VALUES (86, 31, 'Melihat History Perhitungan Luas Persegi', '2025-02-03 09:36:37');
INSERT INTO `user_activity` VALUES (87, 31, 'Melihat History Perhitungan Luas Persegi', '2025-02-03 09:36:41');
INSERT INTO `user_activity` VALUES (88, 31, 'Melihat History Perhitungan Luas Persegi', '2025-02-03 09:36:45');
INSERT INTO `user_activity` VALUES (89, 31, 'Melihat History Perhitungan Luas Persegi', '2025-02-03 09:36:49');
INSERT INTO `user_activity` VALUES (90, 31, 'Masuk ke Rumus persegi', '2025-02-03 09:36:52');
INSERT INTO `user_activity` VALUES (91, 31, 'Melihat History Perhitungan Luas Persegi', '2025-02-03 09:36:52');
INSERT INTO `user_activity` VALUES (92, 31, 'Melihat History Perhitungan Luas Persegi', '2025-02-03 09:36:59');
INSERT INTO `user_activity` VALUES (93, 31, 'Melihat History Perhitungan Luas Persegi', '2025-02-03 09:37:06');
INSERT INTO `user_activity` VALUES (94, 31, 'Masuk ke Rumus persegi', '2025-02-03 09:37:11');
INSERT INTO `user_activity` VALUES (95, 31, 'Masuk ke Rumus persegi', '2025-02-03 09:37:25');
INSERT INTO `user_activity` VALUES (96, 31, 'Masuk ke Rumus persegi', '2025-02-03 09:37:27');
INSERT INTO `user_activity` VALUES (97, NULL, 'Masuk ke Login', '2025-02-03 09:37:28');
INSERT INTO `user_activity` VALUES (98, 1, 'Masuk ke Dashboard', '2025-02-03 09:37:34');
INSERT INTO `user_activity` VALUES (99, 1, 'Masuk ke User', '2025-02-03 09:37:37');
INSERT INTO `user_activity` VALUES (100, 1, 'Masuk ke Tambah User', '2025-02-03 09:37:39');
INSERT INTO `user_activity` VALUES (101, 1, 'Masuk ke User', '2025-02-03 09:37:51');
INSERT INTO `user_activity` VALUES (102, 1, 'Masuk ke Edit User', '2025-02-03 09:37:53');
INSERT INTO `user_activity` VALUES (103, 1, 'Masuk ke User', '2025-02-03 09:37:55');
INSERT INTO `user_activity` VALUES (104, 1, 'Masuk ke Restore Edit User', '2025-02-03 09:37:57');
INSERT INTO `user_activity` VALUES (105, 1, 'Masuk ke User', '2025-02-03 09:37:59');
INSERT INTO `user_activity` VALUES (106, 1, 'Masuk ke User', '2025-02-03 09:38:01');
INSERT INTO `user_activity` VALUES (107, 1, 'Masuk ke Soft Delete', '2025-02-03 09:38:04');
INSERT INTO `user_activity` VALUES (108, 1, 'Masuk ke User', '2025-02-03 09:38:05');
INSERT INTO `user_activity` VALUES (109, 1, 'Masuk ke Log Activity', '2025-02-03 09:38:08');
INSERT INTO `user_activity` VALUES (110, 1, 'Masuk ke Setting', '2025-02-03 09:38:18');
INSERT INTO `user_activity` VALUES (111, 1, 'Masuk ke Setting', '2025-02-03 09:38:32');
INSERT INTO `user_activity` VALUES (112, NULL, 'Masuk ke Login', '2025-02-03 09:38:37');
INSERT INTO `user_activity` VALUES (113, NULL, 'Masuk ke Login', '2025-02-05 08:30:56');
INSERT INTO `user_activity` VALUES (114, NULL, 'Masuk ke Register', '2025-02-05 08:31:08');
INSERT INTO `user_activity` VALUES (115, NULL, 'Masuk ke Login', '2025-02-05 08:31:26');
INSERT INTO `user_activity` VALUES (116, 1, 'Masuk ke Dashboard', '2025-02-05 08:31:31');
INSERT INTO `user_activity` VALUES (117, 1, 'Masuk ke Rumus persegi', '2025-02-05 08:31:51');
INSERT INTO `user_activity` VALUES (118, 1, 'Melihat History Perhitungan Luas Persegi', '2025-02-05 08:31:51');
INSERT INTO `user_activity` VALUES (119, 1, 'Melihat History Perhitungan Luas Persegi', '2025-02-05 08:32:19');
INSERT INTO `user_activity` VALUES (120, 1, 'Masuk ke Rumus persegi', '2025-02-05 08:32:19');
INSERT INTO `user_activity` VALUES (121, 1, 'Masuk ke Rumus persegi', '2025-02-05 08:32:50');
INSERT INTO `user_activity` VALUES (122, 1, 'Masuk ke User', '2025-02-05 08:33:35');
INSERT INTO `user_activity` VALUES (123, 1, 'Masuk ke Tambah User', '2025-02-05 08:33:47');
INSERT INTO `user_activity` VALUES (124, 1, 'Masuk ke Tambah User', '2025-02-05 08:33:58');
INSERT INTO `user_activity` VALUES (125, 1, 'Masuk ke Edit User', '2025-02-05 08:34:10');
INSERT INTO `user_activity` VALUES (126, 1, 'Masuk ke Setting', '2025-02-05 08:34:35');
INSERT INTO `user_activity` VALUES (127, 1, 'Masuk ke Soft Delete', '2025-02-05 08:35:08');
INSERT INTO `user_activity` VALUES (128, 1, 'Masuk ke Rumus persegi', '2025-02-05 08:35:09');
INSERT INTO `user_activity` VALUES (129, 1, 'Melihat History Perhitungan Luas Persegi', '2025-02-05 08:35:09');
INSERT INTO `user_activity` VALUES (130, 1, 'Masuk ke Rumus persegi', '2025-02-05 08:35:10');
INSERT INTO `user_activity` VALUES (131, 1, 'Melihat History Perhitungan Luas Persegi', '2025-02-05 08:35:10');
INSERT INTO `user_activity` VALUES (132, 1, 'Masuk ke User', '2025-02-05 08:35:11');
INSERT INTO `user_activity` VALUES (133, 1, 'Masuk ke User', '2025-02-05 08:35:13');
INSERT INTO `user_activity` VALUES (134, 1, 'Masuk ke Soft Delete', '2025-02-05 08:35:13');
INSERT INTO `user_activity` VALUES (135, 1, 'Masuk ke Restore Edit User', '2025-02-05 08:35:22');
INSERT INTO `user_activity` VALUES (136, 1, 'Masuk ke Log Activity', '2025-02-05 08:35:30');
INSERT INTO `user_activity` VALUES (137, NULL, 'Masuk ke Login', '2025-02-06 08:06:22');
INSERT INTO `user_activity` VALUES (138, 1, 'Masuk ke Dashboard', '2025-02-06 08:06:33');
INSERT INTO `user_activity` VALUES (139, 1, 'Masuk ke Kalkulator', '2025-02-06 08:08:53');
INSERT INTO `user_activity` VALUES (140, 1, 'Masuk ke Rumus persegi', '2025-02-06 08:08:54');
INSERT INTO `user_activity` VALUES (141, 1, 'Masuk ke Kalkulator', '2025-02-06 08:08:55');
INSERT INTO `user_activity` VALUES (142, 1, 'Masuk ke Kalkulator', '2025-02-06 08:09:51');
INSERT INTO `user_activity` VALUES (143, 1, 'Masuk ke Kalkulator', '2025-02-06 08:09:55');
INSERT INTO `user_activity` VALUES (144, 1, 'Masuk ke Kalkulator', '2025-02-06 08:09:59');
INSERT INTO `user_activity` VALUES (145, 1, 'Masuk ke Kalkulator', '2025-02-06 08:10:03');
INSERT INTO `user_activity` VALUES (146, 1, 'Masuk ke Kalkulator', '2025-02-06 08:10:06');
INSERT INTO `user_activity` VALUES (147, 1, 'Masuk ke Kalkulator', '2025-02-06 08:10:10');
INSERT INTO `user_activity` VALUES (148, 1, 'Masuk ke Kalkulator', '2025-02-06 08:10:15');
INSERT INTO `user_activity` VALUES (149, 1, 'Masuk ke Kalkulator', '2025-02-06 08:10:22');
INSERT INTO `user_activity` VALUES (150, 1, 'Masuk ke Kalkulator', '2025-02-06 08:16:04');
INSERT INTO `user_activity` VALUES (151, 1, 'Masuk ke Kalkulator', '2025-02-06 08:16:11');
INSERT INTO `user_activity` VALUES (152, 1, 'Masuk ke Kalkulator', '2025-02-06 08:18:52');
INSERT INTO `user_activity` VALUES (153, 1, 'Masuk ke Kalkulator', '2025-02-06 08:19:05');
INSERT INTO `user_activity` VALUES (154, 1, 'Masuk ke Kalkulator', '2025-02-06 08:28:09');
INSERT INTO `user_activity` VALUES (155, 1, 'Masuk ke Kalkulator', '2025-02-06 08:29:34');
INSERT INTO `user_activity` VALUES (156, 1, 'Masuk ke Kalkulator', '2025-02-06 08:31:06');
INSERT INTO `user_activity` VALUES (157, 1, 'Masuk ke Kalkulator', '2025-02-06 08:32:39');
INSERT INTO `user_activity` VALUES (158, 1, 'Masuk ke Kalkulator', '2025-02-06 08:32:56');
INSERT INTO `user_activity` VALUES (159, 1, 'Masuk ke Kalkulator', '2025-02-06 08:32:58');
INSERT INTO `user_activity` VALUES (160, 1, 'Masuk ke Kalkulator', '2025-02-06 08:34:12');
INSERT INTO `user_activity` VALUES (161, 1, 'Masuk ke Kalkulator', '2025-02-06 08:34:14');
INSERT INTO `user_activity` VALUES (162, 1, 'Masuk ke Kalkulator', '2025-02-06 08:34:35');
INSERT INTO `user_activity` VALUES (163, 1, 'Masuk ke Kalkulator', '2025-02-06 08:35:47');
INSERT INTO `user_activity` VALUES (164, 1, 'Masuk ke Kalkulator', '2025-02-06 08:36:00');
INSERT INTO `user_activity` VALUES (165, 1, 'Masuk ke Kalkulator', '2025-02-06 08:36:06');
INSERT INTO `user_activity` VALUES (166, 1, 'Masuk ke Kalkulator', '2025-02-06 08:36:07');
INSERT INTO `user_activity` VALUES (167, 1, 'Masuk ke Kalkulator', '2025-02-06 08:36:07');
INSERT INTO `user_activity` VALUES (168, 1, 'Masuk ke Kalkulator', '2025-02-06 08:37:13');
INSERT INTO `user_activity` VALUES (169, 1, 'Masuk ke Kalkulator', '2025-02-06 08:37:13');
INSERT INTO `user_activity` VALUES (170, 1, 'Masuk ke Kalkulator', '2025-02-06 08:37:14');
INSERT INTO `user_activity` VALUES (171, 1, 'Masuk ke Kalkulator', '2025-02-06 08:39:13');
INSERT INTO `user_activity` VALUES (172, 1, 'Masuk ke Kalkulator', '2025-02-06 08:41:41');
INSERT INTO `user_activity` VALUES (173, 1, 'Masuk ke Kalkulator', '2025-02-06 08:41:46');
INSERT INTO `user_activity` VALUES (174, 1, 'Masuk ke Kalkulator', '2025-02-06 08:42:16');
INSERT INTO `user_activity` VALUES (175, 1, 'Masuk ke Kalkulator', '2025-02-06 08:45:59');
INSERT INTO `user_activity` VALUES (176, 1, 'Masuk ke Kalkulator', '2025-02-06 08:47:04');
INSERT INTO `user_activity` VALUES (177, 1, 'Masuk ke Kalkulator', '2025-02-06 08:47:28');
INSERT INTO `user_activity` VALUES (178, 1, 'Masuk ke Kalkulator', '2025-02-06 08:47:49');
INSERT INTO `user_activity` VALUES (179, 1, 'Masuk ke Kalkulator', '2025-02-06 08:47:55');
INSERT INTO `user_activity` VALUES (180, 1, 'Masuk ke Kalkulator', '2025-02-06 08:51:22');
INSERT INTO `user_activity` VALUES (181, 1, 'Masuk ke Kalkulator', '2025-02-06 08:52:41');
INSERT INTO `user_activity` VALUES (182, 1, 'Masuk ke Kalkulator', '2025-02-06 08:52:51');
INSERT INTO `user_activity` VALUES (183, 1, 'Masuk ke Kalkulator', '2025-02-06 08:52:52');
INSERT INTO `user_activity` VALUES (184, 1, 'Masuk ke Kalkulator', '2025-02-06 08:53:01');
INSERT INTO `user_activity` VALUES (185, 1, 'Masuk ke Kalkulator', '2025-02-06 08:53:12');
INSERT INTO `user_activity` VALUES (186, 1, 'Masuk ke Kalkulator', '2025-02-06 08:53:30');
INSERT INTO `user_activity` VALUES (187, 1, 'Masuk ke Kalkulator', '2025-02-06 08:53:45');
INSERT INTO `user_activity` VALUES (188, 1, 'Masuk ke Kalkulator', '2025-02-06 08:54:01');
INSERT INTO `user_activity` VALUES (189, 1, 'Masuk ke Kalkulator', '2025-02-06 08:54:05');
INSERT INTO `user_activity` VALUES (190, 1, 'Masuk ke Kalkulator', '2025-02-06 08:54:08');
INSERT INTO `user_activity` VALUES (191, 1, 'Masuk ke Kalkulator', '2025-02-06 08:54:11');
INSERT INTO `user_activity` VALUES (192, 1, 'Masuk ke Kalkulator', '2025-02-06 08:54:26');
INSERT INTO `user_activity` VALUES (193, 1, 'Masuk ke Kalkulator', '2025-02-06 08:54:41');
INSERT INTO `user_activity` VALUES (194, 1, 'Masuk ke Kalkulator', '2025-02-06 08:54:43');
INSERT INTO `user_activity` VALUES (195, 1, 'Masuk ke Kalkulator', '2025-02-06 08:54:48');
INSERT INTO `user_activity` VALUES (196, 1, 'Masuk ke Kalkulator', '2025-02-06 08:54:51');
INSERT INTO `user_activity` VALUES (197, 1, 'Masuk ke Kalkulator', '2025-02-06 08:54:54');
INSERT INTO `user_activity` VALUES (198, 1, 'Masuk ke Kalkulator', '2025-02-06 08:55:00');
INSERT INTO `user_activity` VALUES (199, 1, 'Masuk ke Kalkulator', '2025-02-06 08:55:01');
INSERT INTO `user_activity` VALUES (200, 1, 'Masuk ke Kalkulator', '2025-02-06 08:55:04');
INSERT INTO `user_activity` VALUES (201, 1, 'Masuk ke Kalkulator', '2025-02-06 08:55:21');
INSERT INTO `user_activity` VALUES (202, 1, 'Masuk ke Kalkulator', '2025-02-06 08:55:28');
INSERT INTO `user_activity` VALUES (203, 1, 'Masuk ke Kalkulator', '2025-02-06 08:55:32');
INSERT INTO `user_activity` VALUES (204, 1, 'Masuk ke Kalkulator', '2025-02-06 08:55:34');
INSERT INTO `user_activity` VALUES (205, 1, 'Masuk ke Kalkulator', '2025-02-06 08:55:52');
INSERT INTO `user_activity` VALUES (206, 1, 'Masuk ke Kalkulator', '2025-02-06 08:55:54');
INSERT INTO `user_activity` VALUES (207, 1, 'Masuk ke Kalkulator', '2025-02-06 09:03:47');
INSERT INTO `user_activity` VALUES (208, 1, 'Masuk ke Kalkulator', '2025-02-06 09:06:05');
INSERT INTO `user_activity` VALUES (209, 1, 'Masuk ke Kalkulator', '2025-02-06 09:08:20');
INSERT INTO `user_activity` VALUES (210, 1, 'Masuk ke Kalkulator', '2025-02-06 09:08:38');
INSERT INTO `user_activity` VALUES (211, 1, 'Masuk ke Kalkulator', '2025-02-06 09:10:40');
INSERT INTO `user_activity` VALUES (212, 1, 'Masuk ke Kalkulator', '2025-02-06 09:11:12');
INSERT INTO `user_activity` VALUES (213, 1, 'Masuk ke Kalkulator', '2025-02-06 09:11:32');
INSERT INTO `user_activity` VALUES (214, 1, 'Masuk ke Kalkulator', '2025-02-06 09:12:51');
INSERT INTO `user_activity` VALUES (215, 1, 'Masuk ke Kalkulator', '2025-02-06 09:13:23');
INSERT INTO `user_activity` VALUES (216, 1, 'Masuk ke Kalkulator', '2025-02-06 09:15:49');
INSERT INTO `user_activity` VALUES (217, 1, 'Masuk ke Kalkulator', '2025-02-06 09:17:27');
INSERT INTO `user_activity` VALUES (218, 1, 'Masuk ke Kalkulator', '2025-02-06 09:20:21');
INSERT INTO `user_activity` VALUES (219, 1, 'Masuk ke Kalkulator', '2025-02-06 09:22:00');
INSERT INTO `user_activity` VALUES (220, 1, 'Masuk ke Kalkulator', '2025-02-06 09:23:02');
INSERT INTO `user_activity` VALUES (221, 1, 'Masuk ke Kalkulator', '2025-02-06 09:23:03');
INSERT INTO `user_activity` VALUES (222, 1, 'Masuk ke Kalkulator', '2025-02-06 09:27:08');
INSERT INTO `user_activity` VALUES (223, 1, 'Masuk ke Kalkulator', '2025-02-06 09:29:25');
INSERT INTO `user_activity` VALUES (224, 1, 'Masuk ke Kalkulator', '2025-02-06 09:30:02');
INSERT INTO `user_activity` VALUES (225, 1, 'Masuk ke Kalkulator', '2025-02-06 09:31:23');
INSERT INTO `user_activity` VALUES (226, 1, 'Masuk ke Kalkulator', '2025-02-06 09:32:06');
INSERT INTO `user_activity` VALUES (227, 1, 'Masuk ke Kalkulator', '2025-02-06 09:32:11');
INSERT INTO `user_activity` VALUES (228, 1, 'Masuk ke Kalkulator', '2025-02-06 09:32:15');
INSERT INTO `user_activity` VALUES (229, 1, 'Masuk ke Kalkulator', '2025-02-06 09:32:20');
INSERT INTO `user_activity` VALUES (230, 1, 'Masuk ke Kalkulator', '2025-02-06 09:36:14');
INSERT INTO `user_activity` VALUES (231, 1, 'Masuk ke Kalkulator', '2025-02-06 09:44:33');
INSERT INTO `user_activity` VALUES (232, 1, 'Masuk ke Kalkulator', '2025-02-06 09:47:14');
INSERT INTO `user_activity` VALUES (233, 1, 'Masuk ke Kalkulator', '2025-02-06 09:48:58');
INSERT INTO `user_activity` VALUES (234, 1, 'Masuk ke Kalkulator', '2025-02-06 09:48:58');
INSERT INTO `user_activity` VALUES (235, NULL, 'Masuk ke Login', '2025-02-06 09:49:08');
INSERT INTO `user_activity` VALUES (236, 1, 'Masuk ke Dashboard', '2025-02-06 09:49:11');
INSERT INTO `user_activity` VALUES (237, 1, 'Masuk ke Kalkulator', '2025-02-06 09:49:13');
INSERT INTO `user_activity` VALUES (238, 1, 'Masuk ke Kalkulator', '2025-02-06 09:49:32');
INSERT INTO `user_activity` VALUES (239, 1, 'Masuk ke Kalkulator', '2025-02-06 09:53:18');
INSERT INTO `user_activity` VALUES (240, 1, 'Masuk ke Kalkulator', '2025-02-06 09:54:54');
INSERT INTO `user_activity` VALUES (241, 1, 'Masuk ke Kalkulator', '2025-02-06 09:57:39');
INSERT INTO `user_activity` VALUES (242, 1, 'Masuk ke Kalkulator', '2025-02-06 09:57:47');
INSERT INTO `user_activity` VALUES (243, 1, 'Masuk ke Kalkulator', '2025-02-06 09:59:08');
INSERT INTO `user_activity` VALUES (244, 1, 'Masuk ke Kalkulator', '2025-02-06 10:00:08');
INSERT INTO `user_activity` VALUES (245, NULL, 'Masuk ke Kalkulator', '2025-02-09 09:13:37');
INSERT INTO `user_activity` VALUES (246, NULL, 'Masuk ke Login', '2025-02-09 09:13:40');
INSERT INTO `user_activity` VALUES (247, 1, 'Masuk ke Login', '2025-02-09 09:13:44');
INSERT INTO `user_activity` VALUES (248, 1, 'Masuk ke Dashboard', '2025-02-09 09:13:48');
INSERT INTO `user_activity` VALUES (249, 1, 'Masuk ke Kalkulator', '2025-02-09 09:13:51');
INSERT INTO `user_activity` VALUES (250, 1, 'Masuk ke Kalkulator', '2025-02-09 09:14:00');
INSERT INTO `user_activity` VALUES (251, NULL, 'Masuk ke Login', '2025-02-13 07:51:36');
INSERT INTO `user_activity` VALUES (252, 1, 'Masuk ke Dashboard', '2025-02-13 07:51:40');
INSERT INTO `user_activity` VALUES (253, 1, 'Masuk ke Kalkulator', '2025-02-13 07:51:42');
INSERT INTO `user_activity` VALUES (254, 1, 'Masuk ke User', '2025-02-13 07:52:04');
INSERT INTO `user_activity` VALUES (255, 1, 'Masuk ke Kalkulator', '2025-02-13 07:52:05');
INSERT INTO `user_activity` VALUES (256, 1, 'Masuk ke Rumus persegi', '2025-02-13 07:52:15');
INSERT INTO `user_activity` VALUES (257, 1, 'Melihat History Perhitungan Luas Persegi', '2025-02-13 07:52:15');
INSERT INTO `user_activity` VALUES (258, 1, 'Masuk ke Rumus persegi', '2025-02-13 07:52:17');
INSERT INTO `user_activity` VALUES (259, 1, 'Melihat History Perhitungan Luas Persegi', '2025-02-13 07:52:17');
INSERT INTO `user_activity` VALUES (260, 1, 'Masuk ke Rumus persegi', '2025-02-13 07:52:18');
INSERT INTO `user_activity` VALUES (261, 1, 'Melihat History Perhitungan Luas Persegi', '2025-02-13 07:52:18');
INSERT INTO `user_activity` VALUES (262, 1, 'Masuk ke Rumus persegi', '2025-02-13 07:52:45');
INSERT INTO `user_activity` VALUES (263, 1, 'Melihat History Perhitungan Luas Persegi', '2025-02-13 07:52:45');
INSERT INTO `user_activity` VALUES (264, 1, 'Masuk ke Rumus persegi', '2025-02-13 07:52:55');
INSERT INTO `user_activity` VALUES (265, 1, 'Melihat History Perhitungan Luas Persegi', '2025-02-13 07:52:55');
INSERT INTO `user_activity` VALUES (266, 1, 'Masuk ke Rumus persegi', '2025-02-13 07:52:59');
INSERT INTO `user_activity` VALUES (267, 1, 'Masuk ke Rumus persegi', '2025-02-13 07:53:13');
INSERT INTO `user_activity` VALUES (268, 1, 'Masuk ke Rumus persegi', '2025-02-13 07:53:17');
INSERT INTO `user_activity` VALUES (269, 1, 'Masuk ke Rumus persegi', '2025-02-13 07:54:38');
INSERT INTO `user_activity` VALUES (270, NULL, 'Masuk ke Login', '2025-02-17 05:27:59');
INSERT INTO `user_activity` VALUES (271, NULL, 'Masuk ke Login', '2025-02-17 05:28:07');
INSERT INTO `user_activity` VALUES (272, NULL, 'Masuk ke Login', '2025-02-17 05:28:18');
INSERT INTO `user_activity` VALUES (273, 1, 'Masuk ke Dashboard', '2025-02-17 05:28:26');
INSERT INTO `user_activity` VALUES (274, 1, 'Masuk ke Rumus persegi', '2025-02-17 05:28:31');
INSERT INTO `user_activity` VALUES (275, 1, 'Melihat History Perhitungan Luas Persegi', '2025-02-17 05:28:32');
INSERT INTO `user_activity` VALUES (276, 1, 'Masuk ke Rumus persegi', '2025-02-17 05:28:33');
INSERT INTO `user_activity` VALUES (277, 1, 'Masuk ke Kalkulator', '2025-02-17 05:28:34');
INSERT INTO `user_activity` VALUES (278, 1, 'Masuk ke Kalkulator', '2025-02-17 05:28:49');
INSERT INTO `user_activity` VALUES (279, 1, 'Masuk ke Dashboard', '2025-02-17 05:28:49');
INSERT INTO `user_activity` VALUES (280, 1, 'Masuk ke Kalkulator', '2025-02-17 05:28:50');
INSERT INTO `user_activity` VALUES (281, 1, 'Masuk ke Kalkulator', '2025-02-17 05:30:19');
INSERT INTO `user_activity` VALUES (282, 1, 'Masuk ke Kalkulator', '2025-02-17 05:30:33');
INSERT INTO `user_activity` VALUES (283, 1, 'Masuk ke Kalkulator', '2025-02-17 05:46:26');
INSERT INTO `user_activity` VALUES (284, 1, 'Masuk ke Upload', '2025-02-17 05:46:28');
INSERT INTO `user_activity` VALUES (285, 1, 'Masuk ke Upload', '2025-02-17 05:46:42');
INSERT INTO `user_activity` VALUES (286, 1, 'Masuk ke Upload', '2025-02-17 05:46:43');
INSERT INTO `user_activity` VALUES (287, 1, 'Masuk ke Upload', '2025-02-17 05:46:43');
INSERT INTO `user_activity` VALUES (288, 1, 'Masuk ke Upload', '2025-02-17 05:46:43');
INSERT INTO `user_activity` VALUES (289, 1, 'Masuk ke Upload', '2025-02-17 05:47:04');
INSERT INTO `user_activity` VALUES (290, 1, 'Masuk ke Kalkulator', '2025-02-17 05:47:06');
INSERT INTO `user_activity` VALUES (291, 1, 'Masuk ke Kalkulator', '2025-02-17 05:50:01');
INSERT INTO `user_activity` VALUES (292, 1, 'Masuk ke Upload', '2025-02-17 05:50:02');
INSERT INTO `user_activity` VALUES (293, 1, 'Masuk ke Tambah Upload', '2025-02-17 05:50:03');
INSERT INTO `user_activity` VALUES (294, 1, 'Masuk ke Upload', '2025-02-17 05:50:54');
INSERT INTO `user_activity` VALUES (295, 1, 'Masuk ke Tambah Upload', '2025-02-17 05:50:56');
INSERT INTO `user_activity` VALUES (296, 1, 'Masuk ke Upload', '2025-02-17 05:51:00');
INSERT INTO `user_activity` VALUES (297, 1, 'Masuk ke Tambah Upload', '2025-02-17 05:51:01');
INSERT INTO `user_activity` VALUES (298, 1, 'Masuk ke Upload', '2025-02-17 05:51:06');
INSERT INTO `user_activity` VALUES (299, 1, 'Masuk ke Upload', '2025-02-17 05:53:02');
INSERT INTO `user_activity` VALUES (300, 1, 'Masuk ke Tambah Upload', '2025-02-17 05:53:02');
INSERT INTO `user_activity` VALUES (301, 1, 'Masuk ke Upload', '2025-02-17 05:53:08');
INSERT INTO `user_activity` VALUES (302, 1, 'Masuk ke Upload', '2025-02-17 05:55:39');
INSERT INTO `user_activity` VALUES (303, 1, 'Masuk ke Upload', '2025-02-17 05:58:03');
INSERT INTO `user_activity` VALUES (304, 1, 'Masuk ke Edit Upload', '2025-02-17 05:58:04');
INSERT INTO `user_activity` VALUES (305, 1, 'Masuk ke Upload', '2025-02-17 05:58:20');
INSERT INTO `user_activity` VALUES (306, 1, 'Masuk ke Upload', '2025-02-17 05:59:12');
INSERT INTO `user_activity` VALUES (307, 1, 'Masuk ke Edit Upload', '2025-02-17 05:59:13');
INSERT INTO `user_activity` VALUES (308, 1, 'Masuk ke Upload', '2025-02-17 05:59:14');
INSERT INTO `user_activity` VALUES (309, 1, 'Masuk ke Upload', '2025-02-17 05:59:38');
INSERT INTO `user_activity` VALUES (310, 1, 'Masuk ke Edit Upload', '2025-02-17 05:59:38');
INSERT INTO `user_activity` VALUES (311, 1, 'Masuk ke Upload', '2025-02-17 05:59:40');
INSERT INTO `user_activity` VALUES (312, 1, 'Masuk ke Upload', '2025-02-17 06:00:03');
INSERT INTO `user_activity` VALUES (313, 1, 'Masuk ke Edit Upload', '2025-02-17 06:00:04');
INSERT INTO `user_activity` VALUES (314, 1, 'Masuk ke Upload', '2025-02-17 06:00:05');
INSERT INTO `user_activity` VALUES (315, 1, 'Masuk ke Upload', '2025-02-17 06:01:42');
INSERT INTO `user_activity` VALUES (316, 1, 'Masuk ke Edit Upload', '2025-02-17 06:01:43');
INSERT INTO `user_activity` VALUES (317, 1, 'Masuk ke Upload', '2025-02-17 06:01:51');
INSERT INTO `user_activity` VALUES (318, 1, 'Masuk ke Upload', '2025-02-17 06:02:52');
INSERT INTO `user_activity` VALUES (319, 1, 'Masuk ke Edit Upload', '2025-02-17 06:02:53');
INSERT INTO `user_activity` VALUES (320, 1, 'Masuk ke Upload', '2025-02-17 06:02:56');
INSERT INTO `user_activity` VALUES (321, 1, 'Masuk ke Upload', '2025-02-17 06:03:31');
INSERT INTO `user_activity` VALUES (322, 1, 'Masuk ke Edit Upload', '2025-02-17 06:03:32');
INSERT INTO `user_activity` VALUES (323, 1, 'Masuk ke Upload', '2025-02-17 06:03:36');
INSERT INTO `user_activity` VALUES (324, 1, 'Masuk ke Edit Upload', '2025-02-17 06:03:38');
INSERT INTO `user_activity` VALUES (325, 1, 'Masuk ke Upload', '2025-02-17 06:03:43');
INSERT INTO `user_activity` VALUES (326, 1, 'Masuk ke Edit Upload', '2025-02-17 06:03:44');
INSERT INTO `user_activity` VALUES (327, 1, 'Masuk ke Upload', '2025-02-17 06:03:48');
INSERT INTO `user_activity` VALUES (328, 1, 'Masuk ke Edit Upload', '2025-02-17 06:03:49');
INSERT INTO `user_activity` VALUES (329, 1, 'Masuk ke Upload', '2025-02-17 06:03:53');
INSERT INTO `user_activity` VALUES (330, 1, 'Masuk ke Edit Upload', '2025-02-17 06:03:53');
INSERT INTO `user_activity` VALUES (331, 1, 'Masuk ke Upload', '2025-02-17 06:04:02');
INSERT INTO `user_activity` VALUES (332, 1, 'Masuk ke Edit Upload', '2025-02-17 06:04:05');
INSERT INTO `user_activity` VALUES (333, 1, 'Masuk ke Upload', '2025-02-17 06:04:41');
INSERT INTO `user_activity` VALUES (334, 1, 'Masuk ke Upload', '2025-02-17 06:04:41');

-- ----------------------------
-- Table structure for user_backup
-- ----------------------------
DROP TABLE IF EXISTS `user_backup`;
CREATE TABLE `user_backup`  (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `level` enum('admin','pengguna') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `backup_by` int NULL DEFAULT NULL,
  `backup_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_user`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_backup
-- ----------------------------
INSERT INTO `user_backup` VALUES (29, 'bobi123', NULL, NULL, 'bobi123@gmail.com', 'pengguna', NULL, NULL, NULL, NULL);
INSERT INTO `user_backup` VALUES (32, 'boba kecap', NULL, NULL, 'bobakecap@gmail.com', 'pengguna', NULL, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
