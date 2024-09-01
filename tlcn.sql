/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80028 (8.0.28)
 Source Host           : localhost:3306
 Source Schema         : tlcn

 Target Server Type    : MySQL
 Target Server Version : 80028 (8.0.28)
 File Encoding         : 65001

 Date: 14/08/2024 22:23:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for brands
-- ----------------------------
DROP TABLE IF EXISTS `brands`;
CREATE TABLE `brands`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `show_hide` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `brands_name_unique`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of brands
-- ----------------------------
INSERT INTO `brands` VALUES (1, 'Apple', 'apple', '1', 'Việt Nam', 0, '2024-02-01 02:28:25', '2024-06-11 23:35:43');
INSERT INTO `brands` VALUES (6, 't', 't', '2', 'Việt Nam', 1, '2024-06-16 20:25:35', '2024-06-16 20:27:14');

-- ----------------------------
-- Table structure for carts
-- ----------------------------
DROP TABLE IF EXISTS `carts`;
CREATE TABLE `carts`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `quantity` int UNSIGNED NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `variant_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `carts_user_id_foreign`(`user_id` ASC) USING BTREE,
  CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of carts
-- ----------------------------
INSERT INTO `carts` VALUES (39, 1, 999.00, 33, 12, 6, NULL, NULL);
INSERT INTO `carts` VALUES (40, 1, 1200.00, 33, 8, 5, NULL, NULL);

-- ----------------------------
-- Table structure for categories_news
-- ----------------------------
DROP TABLE IF EXISTS `categories_news`;
CREATE TABLE `categories_news`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int NOT NULL DEFAULT 1,
  `show_hide` tinyint(1) NOT NULL DEFAULT 1,
  `parent_category_id` int UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `categories_news_name_unique`(`name` ASC) USING BTREE,
  INDEX `categories_news_parent_category_id_foreign`(`parent_category_id` ASC) USING BTREE,
  CONSTRAINT `categories_news_parent_category_id_foreign` FOREIGN KEY (`parent_category_id`) REFERENCES `categories_news` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories_news
-- ----------------------------

-- ----------------------------
-- Table structure for categories_products
-- ----------------------------
DROP TABLE IF EXISTS `categories_products`;
CREATE TABLE `categories_products`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int NOT NULL DEFAULT 1,
  `show_hide` tinyint(1) NOT NULL DEFAULT 1,
  `parent_category_id` int UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `categories_products_name_unique`(`name` ASC) USING BTREE,
  INDEX `categories_products_parent_category_id_foreign`(`parent_category_id` ASC) USING BTREE,
  CONSTRAINT `categories_products_parent_category_id_foreign` FOREIGN KEY (`parent_category_id`) REFERENCES `categories_products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories_products
-- ----------------------------
INSERT INTO `categories_products` VALUES (3, 'Iphone', 'iphone', 'Iphone', 5, 1, NULL, '2024-02-01 02:29:15', '2024-06-08 16:29:29');
INSERT INTO `categories_products` VALUES (4, 'cate', 'cate', 'cate', 2, 1, NULL, '2024-06-08 15:03:35', NULL);

-- ----------------------------
-- Table structure for comment_news
-- ----------------------------
DROP TABLE IF EXISTS `comment_news`;
CREATE TABLE `comment_news`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `likes` int NOT NULL DEFAULT 0,
  `show_hide` tinyint(1) NOT NULL DEFAULT 1,
  `datetime_create` datetime NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `news_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `comment_news_user_id_foreign`(`user_id` ASC) USING BTREE,
  INDEX `comment_news_news_id_foreign`(`news_id` ASC) USING BTREE,
  CONSTRAINT `comment_news_news_id_foreign` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comment_news_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment_news
-- ----------------------------

-- ----------------------------
-- Table structure for comment_news_likes
-- ----------------------------
DROP TABLE IF EXISTS `comment_news_likes`;
CREATE TABLE `comment_news_likes`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED NOT NULL,
  `comment_news_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `comment_news_likes_user_id_foreign`(`user_id` ASC) USING BTREE,
  INDEX `comment_news_likes_comment_news_id_foreign`(`comment_news_id` ASC) USING BTREE,
  CONSTRAINT `comment_news_likes_comment_news_id_foreign` FOREIGN KEY (`comment_news_id`) REFERENCES `comment_news` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comment_news_likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment_news_likes
-- ----------------------------

-- ----------------------------
-- Table structure for comment_product_likes
-- ----------------------------
DROP TABLE IF EXISTS `comment_product_likes`;
CREATE TABLE `comment_product_likes`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED NOT NULL,
  `comment_products_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `comment_product_likes_user_id_foreign`(`user_id` ASC) USING BTREE,
  INDEX `comment_product_likes_comment_products_id_foreign`(`comment_products_id` ASC) USING BTREE,
  CONSTRAINT `comment_product_likes_comment_products_id_foreign` FOREIGN KEY (`comment_products_id`) REFERENCES `comment_products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comment_product_likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment_product_likes
-- ----------------------------

-- ----------------------------
-- Table structure for comment_products
-- ----------------------------
DROP TABLE IF EXISTS `comment_products`;
CREATE TABLE `comment_products`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `likes` int NOT NULL DEFAULT 0,
  `user_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `comment_products_user_id_foreign`(`user_id` ASC) USING BTREE,
  INDEX `comment_products_product_id_foreign`(`product_id` ASC) USING BTREE,
  CONSTRAINT `comment_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comment_products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment_products
-- ----------------------------

-- ----------------------------
-- Table structure for contacts
-- ----------------------------
DROP TABLE IF EXISTS `contacts`;
CREATE TABLE `contacts`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `datetime_create` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of contacts
-- ----------------------------

-- ----------------------------
-- Table structure for deliveries
-- ----------------------------
DROP TABLE IF EXISTS `deliveries`;
CREATE TABLE `deliveries`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `delivery_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_name` varchar(22) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_fee` decimal(10, 2) NOT NULL,
  `delivery_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `delivery_status` enum('pending','in_progress','completed') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `estimated_delivery_time` datetime NOT NULL,
  `completed_at` datetime NULL DEFAULT NULL,
  `delivered_at` datetime NULL DEFAULT NULL,
  `order_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `deliveries_delivery_number_unique`(`delivery_number` ASC) USING BTREE,
  INDEX `deliveries_order_id_foreign`(`order_id` ASC) USING BTREE,
  CONSTRAINT `deliveries_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of deliveries
-- ----------------------------

-- ----------------------------
-- Table structure for detail_users
-- ----------------------------
DROP TABLE IF EXISTS `detail_users`;
CREATE TABLE `detail_users`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_numbers` varchar(22) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `set_default` tinyint(1) NOT NULL DEFAULT 0,
  `google_map` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `detail_users_user_id_foreign`(`user_id` ASC) USING BTREE,
  CONSTRAINT `detail_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of detail_users
-- ----------------------------

-- ----------------------------
-- Table structure for discounts
-- ----------------------------
DROP TABLE IF EXISTS `discounts`;
CREATE TABLE `discounts`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `discount_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount_price` decimal(10, 2) NOT NULL,
  `discount_total` int NOT NULL,
  `used_discount` int NOT NULL DEFAULT 0,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `show_hide` tinyint(1) NOT NULL DEFAULT 1,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `discounts_discount_code_unique`(`discount_code` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of discounts
-- ----------------------------

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for images_products
-- ----------------------------
DROP TABLE IF EXISTS `images_products`;
CREATE TABLE `images_products`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `image_path` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int NOT NULL DEFAULT 1,
  `show_hide` tinyint(1) NOT NULL DEFAULT 1,
  `variation_gallery_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `images_products_variation_gallery_id_foreign`(`variation_gallery_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of images_products
-- ----------------------------
INSERT INTO `images_products` VALUES (13, '/images/iphone-12-black.jpg', '/images/iphone-12-black.jpg', 1, 1, 7, '2024-04-02 09:53:02', '2024-04-02 09:53:02');
INSERT INTO `images_products` VALUES (14, '/images/iphone-12-white.jpg', '/images/iphone-12-white.jpg', 1, 1, 8, '2024-04-02 09:53:02', '2024-04-02 09:53:02');
INSERT INTO `images_products` VALUES (15, '/images/iphone-12-blue.jpg', '/images/iphone-12-blue.jpg', 1, 1, 9, '2024-04-02 09:53:02', '2024-04-02 09:53:02');
INSERT INTO `images_products` VALUES (16, '/images/s21-gray.jpg', '/images/s21-gray.jpg', 1, 1, 10, '2024-04-02 09:53:02', '2024-04-02 09:53:02');
INSERT INTO `images_products` VALUES (17, '/images/s21-black.jpg', '/images/s21-black.jpg', 1, 1, 11, '2024-04-02 09:53:02', '2024-04-02 09:53:02');
INSERT INTO `images_products` VALUES (18, '/images/s21-pink.jpg', '/images/s21-pink.jpg', 1, 1, 12, '2024-04-02 09:53:02', '2024-04-02 09:53:02');

-- ----------------------------
-- Table structure for jobs
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED NULL DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `jobs_queue_index`(`queue` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jobs
-- ----------------------------
INSERT INTO `jobs` VALUES (1, 'email', '{\"uuid\":\"71e239c5-c85e-4325-9094-3e6f3ed7189e\",\"displayName\":\"App\\\\Jobs\\\\SendEmailForgotPass\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmailForgotPass\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\SendEmailForgotPass\\\":4:{s:8:\\\"\\u0000*\\u0000email\\\";s:21:\\\"vutrieu2002@gmail.com\\\";s:7:\\\"\\u0000*\\u0000code\\\";s:6:\\\"072601\\\";s:7:\\\"\\u0000*\\u0000name\\\";s:18:\\\"Vũ Đức Triệu\\\";s:5:\\\"queue\\\";s:5:\\\"email\\\";}\"}}', 0, NULL, 1714921215, 1714921215);
INSERT INTO `jobs` VALUES (2, 'email', '{\"uuid\":\"94c0c9ab-b644-4156-8ed8-dbeb789929b3\",\"displayName\":\"App\\\\Jobs\\\\SendEmailForgotPass\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmailForgotPass\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\SendEmailForgotPass\\\":4:{s:8:\\\"\\u0000*\\u0000email\\\";s:21:\\\"vutrieu2002@gmail.com\\\";s:7:\\\"\\u0000*\\u0000code\\\";s:6:\\\"823097\\\";s:7:\\\"\\u0000*\\u0000name\\\";s:18:\\\"Vũ Đức Triệu\\\";s:5:\\\"queue\\\";s:5:\\\"email\\\";}\"}}', 0, NULL, 1714921455, 1714921455);

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_reset_tokens_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (5, '2023_11_15_170429_create_categories_products_table', 1);
INSERT INTO `migrations` VALUES (6, '2023_11_18_180133_create_orders_table', 1);
INSERT INTO `migrations` VALUES (7, '2024_01_15_073955_create_brands_table', 1);
INSERT INTO `migrations` VALUES (8, '2024_01_29_152056_create_categories_news_table', 1);
INSERT INTO `migrations` VALUES (9, '2024_01_30_152034_create_news_table', 1);
INSERT INTO `migrations` VALUES (10, '2024_02_03_040921_create_tags_table', 1);
INSERT INTO `migrations` VALUES (11, '2024_02_04_135047_create_payments_table', 1);
INSERT INTO `migrations` VALUES (12, '2024_02_05_071322_create_discounts_table', 1);
INSERT INTO `migrations` VALUES (13, '2024_02_05_071340_create_deliveries_table', 1);
INSERT INTO `migrations` VALUES (14, '2024_02_05_071450_create_contacts_table', 1);
INSERT INTO `migrations` VALUES (15, '2024_02_05_071458_create_policies_table', 1);
INSERT INTO `migrations` VALUES (16, '2024_02_05_071519_create_slide_ads_table', 1);
INSERT INTO `migrations` VALUES (17, '2024_02_10_064430_create_detail_users_table', 1);
INSERT INTO `migrations` VALUES (18, '2024_02_10_114606_create_roles_table', 1);
INSERT INTO `migrations` VALUES (19, '2024_02_10_114618_create_user_roles_table', 1);
INSERT INTO `migrations` VALUES (20, '2024_02_10_153316_create_rating_news_table', 1);
INSERT INTO `migrations` VALUES (21, '2024_02_10_163035_create_comment_news_table', 1);
INSERT INTO `migrations` VALUES (23, '2024_02_27_152134_create_tag_relation_news_table', 1);
INSERT INTO `migrations` VALUES (24, '2024_03_02_141617_create_comment_news_likes_table', 1);
INSERT INTO `migrations` VALUES (25, '2024_03_02_141643_create_news_likes_table', 1);
INSERT INTO `migrations` VALUES (26, '2024_03_03_044147_create_gallery_product_variations_table', 1);
INSERT INTO `migrations` VALUES (27, '2024_03_18_133335_create_jobs_table', 1);
INSERT INTO `migrations` VALUES (28, '2024_03_18_134327_add_column_reset_code_user', 1);
INSERT INTO `migrations` VALUES (29, '2024_11_18_180112_create_products_table', 1);
INSERT INTO `migrations` VALUES (30, '2024_12_02_140648_create_product_relation_categories_table', 1);
INSERT INTO `migrations` VALUES (31, '2024_12_16_024102_create_specifications_products_table', 1);
INSERT INTO `migrations` VALUES (32, '2024_12_17_022805_create_product_variations_table', 1);
INSERT INTO `migrations` VALUES (33, '2024_12_18_074728_create_images_products_table', 1);
INSERT INTO `migrations` VALUES (34, '2024_12_18_180143_create_order_items_table', 1);
INSERT INTO `migrations` VALUES (36, '2024_12_50_153309_create_rating_products_table', 1);
INSERT INTO `migrations` VALUES (37, '2024_12_55_163023_create_comment_products_table', 1);
INSERT INTO `migrations` VALUES (38, '2024_12_56_143435_create_comment_product_likes_table', 1);
INSERT INTO `migrations` VALUES (39, '2024_04_02_020544_add_title_to_categories_products_table', 2);
INSERT INTO `migrations` VALUES (40, '2024_02_22_100807_create_carts_table', 3);
INSERT INTO `migrations` VALUES (41, '2024_12_22_101205_create_cart_items_table', 3);
INSERT INTO `migrations` VALUES (42, '2024_04_02_064325_add_variant_id_to_order_items_table', 4);
INSERT INTO `migrations` VALUES (43, '2024_04_03_012846_add_status__to_orders_table', 5);

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_create` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_create` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int NOT NULL DEFAULT 0,
  `views` int UNSIGNED NOT NULL DEFAULT 0,
  `show_hide` tinyint(1) NOT NULL DEFAULT 1,
  `user_id` int UNSIGNED NOT NULL,
  `categories_news_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `news_title_unique`(`title` ASC) USING BTREE,
  UNIQUE INDEX `news_seo_keywords_unique`(`seo_keywords` ASC) USING BTREE,
  INDEX `news_user_id_foreign`(`user_id` ASC) USING BTREE,
  INDEX `news_categories_news_id_foreign`(`categories_news_id` ASC) USING BTREE,
  CONSTRAINT `news_categories_news_id_foreign` FOREIGN KEY (`categories_news_id`) REFERENCES `categories_news` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `news_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news
-- ----------------------------

-- ----------------------------
-- Table structure for news_likes
-- ----------------------------
DROP TABLE IF EXISTS `news_likes`;
CREATE TABLE `news_likes`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED NOT NULL,
  `news_id` int UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `news_likes_news_id_foreign`(`news_id` ASC) USING BTREE,
  INDEX `news_likes_user_id_foreign`(`user_id` ASC) USING BTREE,
  CONSTRAINT `news_likes_news_id_foreign` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `news_likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news_likes
-- ----------------------------

-- ----------------------------
-- Table structure for order_items
-- ----------------------------
DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `order_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `variant_id` bigint UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_items_order_id_foreign`(`order_id` ASC) USING BTREE,
  INDEX `order_items_product_id_foreign`(`product_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_items
-- ----------------------------
INSERT INTO `order_items` VALUES (31, 1, 1200.00, 29, 5, 8, '2024-06-27 21:38:04', NULL);
INSERT INTO `order_items` VALUES (32, 1, 999.00, 30, 6, 12, '2024-06-27 21:38:04', NULL);
INSERT INTO `order_items` VALUES (33, 4, 999.00, 31, 6, 11, '2024-06-27 21:38:04', NULL);
INSERT INTO `order_items` VALUES (34, 1, 999.00, 32, 6, 12, '2024-06-27 21:38:04', NULL);
INSERT INTO `order_items` VALUES (35, 1, 999.00, 33, 6, 12, '2024-06-27 21:38:04', NULL);
INSERT INTO `order_items` VALUES (36, 1, 999.00, 34, 6, 12, '2024-06-27 21:38:04', NULL);
INSERT INTO `order_items` VALUES (37, 1, 999.00, 35, 6, 12, '2024-06-27 21:38:04', NULL);
INSERT INTO `order_items` VALUES (38, 1, 999.00, 36, 6, 12, '2024-06-27 21:38:04', NULL);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `date_create` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_create` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `orders_order_number_unique`(`order_number` ASC) USING BTREE,
  INDEX `orders_user_id_foreign`(`user_id` ASC) USING BTREE,
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (29, '1718460990474', 'test', '0123456789', '1 Võ Văn Ngân, Trường Thọ, Thủ Đức', 41, '2024-06-15', '21:16:30.474', '2024-06-15 21:16:30', NULL, 'paid');
INSERT INTO `orders` VALUES (30, '1718548050733', 'test', '0987654321', 'Việt Nam', 41, '2024-06-16', '21:27:30.734', '2024-06-16 21:27:31', NULL, 'pending');
INSERT INTO `orders` VALUES (31, '1718548101370', 'test', '0987654321', 'Việt Nam', 41, '2024-06-16', '21:28:21.370', '2024-06-16 21:28:21', '2024-06-16 21:31:35', 'unpaid');
INSERT INTO `orders` VALUES (32, '1718635487932', 't', '098763', 'Việt Nam', 41, '2024-06-17', '21:44:47.932', '2024-06-17 21:44:48', NULL, 'pending');
INSERT INTO `orders` VALUES (33, '1718635543198', '', '', '', 41, '2024-06-17', '21:45:43.199', '2024-06-17 21:45:43', NULL, 'pending');
INSERT INTO `orders` VALUES (34, '1718636257446', '', '', '', 41, '2024-06-17', '21:57:37.447', '2024-06-17 21:57:37', NULL, 'pending');
INSERT INTO `orders` VALUES (35, '1718636671495', '', '', '', 41, '2024-06-17', '22:04:31.496', '2024-06-17 22:04:31', NULL, 'pending');
INSERT INTO `orders` VALUES (36, '1718636735803', '', '', '', 41, '2024-06-17', '22:05:35.804', '2024-06-17 22:05:36', NULL, 'pending');

-- ----------------------------
-- Table structure for payments
-- ----------------------------
DROP TABLE IF EXISTS `payments`;
CREATE TABLE `payments`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `payment_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10, 2) NOT NULL,
  `status` enum('pending','in_progress','completed') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `payment_qr_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `payment_momo_link` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `order_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `date_create` date NOT NULL,
  `time_create` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `payments_payment_number_unique`(`payment_number` ASC) USING BTREE,
  INDEX `payments_order_id_foreign`(`order_id` ASC) USING BTREE,
  INDEX `payments_user_id_foreign`(`user_id` ASC) USING BTREE,
  CONSTRAINT `payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of payments
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `brand_id` bigint NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `seo_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `show_hide` bit(1) NULL DEFAULT NULL,
  `categories_product_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------

-- ----------------------------
-- Table structure for product_relation_categories
-- ----------------------------
DROP TABLE IF EXISTS `product_relation_categories`;
CREATE TABLE `product_relation_categories`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `categories_product_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_relation_categories_categories_product_id_foreign`(`categories_product_id` ASC) USING BTREE,
  INDEX `product_relation_categories_product_id_foreign`(`product_id` ASC) USING BTREE,
  CONSTRAINT `product_relation_categories_categories_product_id_foreign` FOREIGN KEY (`categories_product_id`) REFERENCES `categories_products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `product_relation_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_relation_categories
-- ----------------------------

-- ----------------------------
-- Table structure for product_variations
-- ----------------------------
DROP TABLE IF EXISTS `product_variations`;
CREATE TABLE `product_variations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `image_url` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_path` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `color_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `price_sale` decimal(10, 2) NOT NULL,
  `quantity` int NOT NULL,
  `position` int NOT NULL DEFAULT 1,
  `show_hide` tinyint(1) NOT NULL DEFAULT 1,
  `quantity_available` int NOT NULL,
  `quantity_sold` int NOT NULL DEFAULT 0,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `product_id` int UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_variations_product_id_foreign`(`product_id` ASC) USING BTREE,
  CONSTRAINT `product_variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_variations
-- ----------------------------
INSERT INTO `product_variations` VALUES (7, 'https://cdn.sforum.vn/sforum/wp-content/uploads/2020/09/anh-render-iPhone12-1.jpg', '', 'Black', 799.99, 0.00, 100, 1, 1, 100, 0, 'none', 5, '2024-04-02 09:46:06', '2024-04-02 09:46:06');
INSERT INTO `product_variations` VALUES (8, 'https://kenh14cdn.com/203336854389633024/2023/12/30/photo-6-1703922103741519572199.jpg', '', 'White', 1200.00, 0.00, 100, 1, 1, 100, 0, 'none', 5, '2024-04-02 09:46:06', '2024-04-02 09:46:06');
INSERT INTO `product_variations` VALUES (9, 'https://cdn.sforum.vn/sforum/wp-content/uploads/2020/09/anh-render-iPhone12-1.jpg', '', 'Blue', 799.99, 0.00, 100, 1, 1, 100, 0, 'none', 6, '2024-04-02 09:46:06', '2024-04-02 09:46:06');
INSERT INTO `product_variations` VALUES (10, 'https://cdn.sforum.vn/sforum/wp-content/uploads/2020/09/anh-render-iPhone12-1.jpg', '', 'Gray', 999.99, 0.00, 50, 1, 1, 50, 123, 'none', 6, '2024-04-02 09:46:06', '2024-04-02 09:46:06');
INSERT INTO `product_variations` VALUES (11, 'https://cdn.sforum.vn/sforum/wp-content/uploads/2020/09/anh-render-iPhone12-1.jpg', '', 'Black', 999.99, 0.00, 50, 1, 1, 50, 0, 'none', 6, '2024-04-02 09:46:06', '2024-04-02 09:46:06');
INSERT INTO `product_variations` VALUES (12, 'https://cdn.sforum.vn/sforum/wp-content/uploads/2020/09/anh-render-iPhone12-1.jpg', '', 'Pink', 999.99, 0.00, 50, 1, 1, 50, 0, 'none', 6, '2024-04-02 09:46:06', '2024-04-02 09:46:06');
INSERT INTO `product_variations` VALUES (13, 'dfghj', NULL, 'blue', 0.00, 0.00, 0, 1, 1, 0, 0, 'none', NULL, NULL, NULL);
INSERT INTO `product_variations` VALUES (22, 'http://res.cloudinary.com/du06b9aap/image/upload/v1720313762/test/file1720313763049.jpg', NULL, 'red', 0.00, 0.00, 123, 1, 1, 123, 0, 'none', 24, NULL, NULL);
INSERT INTO `product_variations` VALUES (23, 'http://res.cloudinary.com/du06b9aap/image/upload/v1720317291/test/file1720317288693.jpg', NULL, 'red', 0.00, 0.00, 213, 1, 1, 213, 0, 'none', 24, NULL, NULL);
INSERT INTO `product_variations` VALUES (24, '', NULL, 'yellow', 0.00, 0.00, 21312, 1, 1, 21312, 0, 'none', 24, NULL, NULL);

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `show_hide` tinyint(1) NOT NULL DEFAULT 1,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `categories_product_id` int UNSIGNED NOT NULL,
  `brand_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `products_name_unique`(`name` ASC) USING BTREE,
  UNIQUE INDEX `products_seo_keywords_unique`(`seo_keywords` ASC) USING BTREE,
  INDEX `products_categories_product_id_foreign`(`categories_product_id` ASC) USING BTREE,
  INDEX `products_brand_id_foreign`(`brand_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (5, 'iPhone 12', 'iphone-12', 'iPhone, Smartphone', 'Phone', 'The iPhone 12 is a powerful smartphone with a sleek design.', 1, 'new', 3, 1, '2024-04-02 09:44:45', '2024-04-02 09:44:45');
INSERT INTO `products` VALUES (6, 'Samsung Galaxy S21', 'samsung-galaxy-s21', 'Samsung, Smartphone', 'Phone', 'The Samsung Galaxy S21 is a flagship smartphone with top-notch features.', 1, 'hot', 3, 2, '2024-04-02 09:44:45', '2024-04-02 09:44:45');
INSERT INTO `products` VALUES (24, 'test', 'test', 'test', NULL, '', 1, 'none', 3, 1, '2024-07-07 07:51:01', NULL);

-- ----------------------------
-- Table structure for rating_news
-- ----------------------------
DROP TABLE IF EXISTS `rating_news`;
CREATE TABLE `rating_news`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `rating` int NOT NULL DEFAULT 0,
  `review_date` datetime NOT NULL,
  `news_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `rating_news_news_id_foreign`(`news_id` ASC) USING BTREE,
  INDEX `rating_news_user_id_foreign`(`user_id` ASC) USING BTREE,
  CONSTRAINT `rating_news_news_id_foreign` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `rating_news_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rating_news
-- ----------------------------

-- ----------------------------
-- Table structure for rating_products
-- ----------------------------
DROP TABLE IF EXISTS `rating_products`;
CREATE TABLE `rating_products`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `rating` int NOT NULL DEFAULT 0,
  `date_rating` datetime NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `rating_products_product_id_foreign`(`product_id` ASC) USING BTREE,
  INDEX `rating_products_user_id_foreign`(`user_id` ASC) USING BTREE,
  CONSTRAINT `rating_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `rating_products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rating_products
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `roles_role_name_unique`(`role_name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------

-- ----------------------------
-- Table structure for slide_ads
-- ----------------------------
DROP TABLE IF EXISTS `slide_ads`;
CREATE TABLE `slide_ads`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int NOT NULL DEFAULT 1,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `show_hide` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of slide_ads
-- ----------------------------

-- ----------------------------
-- Table structure for specifications_products
-- ----------------------------
DROP TABLE IF EXISTS `specifications_products`;
CREATE TABLE `specifications_products`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int NOT NULL DEFAULT 1,
  `show_hide` tinyint(1) NOT NULL DEFAULT 1,
  `product_id` int UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `specifications_products_product_id_foreign`(`product_id` ASC) USING BTREE,
  CONSTRAINT `specifications_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of specifications_products
-- ----------------------------

-- ----------------------------
-- Table structure for tag_relation_news
-- ----------------------------
DROP TABLE IF EXISTS `tag_relation_news`;
CREATE TABLE `tag_relation_news`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `tag_id` int UNSIGNED NOT NULL,
  `news_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tag_relation_news_tag_id_foreign`(`tag_id` ASC) USING BTREE,
  INDEX `tag_relation_news_news_id_foreign`(`news_id` ASC) USING BTREE,
  CONSTRAINT `tag_relation_news_news_id_foreign` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tag_relation_news_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tag_relation_news
-- ----------------------------

-- ----------------------------
-- Table structure for tags
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int NOT NULL DEFAULT 1,
  `show_hide` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `tags_name_unique`(`name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tags
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reset_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `image_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `google_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `google_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `google_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `google_avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'online',
  `role` tinyint NOT NULL DEFAULT 1,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_name_unique`(`name` ASC) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (22, 'Long', 'lboyer@example.org', NULL, '$2y$12$5HLXaT2YdWwi0oP6C5At3.Ix9geX3JYA9Njv9LopSEVYujkYv7tEy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 1, NULL, '2024-02-01 00:57:27', '2024-02-01 00:57:27');
INSERT INTO `users` VALUES (31, 'Admin User', 'admin@example.com', '2024-01-31 23:47:30', '$2y$12$GZ7.Z3eFJp6Ruy6m7nRH4egKTWxIMX4M5VbmJs7.duh7qQeul2Qam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, '8wIVAZ7bXH7krKibIf8hdngsYHHl0Nu6FVEpHrfh23VrKb7kXEbSVCUxiA4J', '2024-01-31 23:47:30', '2024-01-31 23:47:30');
INSERT INTO `users` VALUES (33, 'tri', 'vutrieu2002@gmail.com', NULL, '$2a$10$hRlse1J1iUTuuA8q02iFquKlktBVicTyey4Aeep43BRkK.q.vPeH2', '800967', NULL, NULL, NULL, NULL, NULL, NULL, 'active', 1, NULL, '2024-05-05 15:18:26', '2024-05-05 15:18:26');
INSERT INTO `users` VALUES (40, 'admin1', 'admin1@admin.com', NULL, '$2y$12$i52wftACK.SNIUq1cKP6jetdhS4bzGTZWaf9wdPRWV07KU4OvK9xy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, 'YXS2wNFVXBVH8XskQL20Ie2wLKkCnrwCzSvGEuwBgR2wT9V8FIAcF8NS2BRo', '2024-05-19 15:42:00', '2024-05-19 15:42:00');
INSERT INTO `users` VALUES (41, 'test', 'test@gmail.com', NULL, '$2a$10$XGZApbPfm0Yg9WH3XZORg.Qbbmu18nd9mSn/2kBVGh6BWL3R1eNv.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, NULL, NULL);
INSERT INTO `users` VALUES (42, 'trieu vu', 'shop.vuductrieu@gmail.com', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
