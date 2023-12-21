-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 02, 2023 at 07:26 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `credit_card`
--
CREATE DATABASE IF NOT EXISTS `credit_card` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `credit_card`;

-- --------------------------------------------------------

--
-- Table structure for table `ada_algo`
--

DROP TABLE IF EXISTS `ada_algo`;
CREATE TABLE IF NOT EXISTS `ada_algo` (
  `ADA_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Accuracy` longtext NOT NULL,
  `Precession` longtext NOT NULL,
  `F1_Score` longtext NOT NULL,
  `Recall` longtext NOT NULL,
  `Name` longtext NOT NULL,
  PRIMARY KEY (`ADA_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ada_algo`
--

INSERT INTO `ada_algo` (`ADA_ID`, `Accuracy`, `Precession`, `F1_Score`, `Recall`, `Name`) VALUES
(1, '91.26', '91.25', '91.28', '91.28', 'ADA Boost Algorithm'),
(2, '91.66', '91.65', '91.67', '91.67', 'ADA Boost Algorithm'),
(3, '91.5', '91.49', '91.51', '91.51', 'ADA Boost Algorithm'),
(4, '91.63', '91.62', '91.64', '91.64', 'ADA Boost Algorithm'),
(5, '91.54', '91.53', '91.57', '91.57', 'ADA Boost Algorithm');

-- --------------------------------------------------------

--
-- Table structure for table `all_users`
--

DROP TABLE IF EXISTS `all_users`;
CREATE TABLE IF NOT EXISTS `all_users` (
  `User_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_Profile` varchar(100) NOT NULL,
  `User_Email` varchar(50) NOT NULL,
  `User_Status` varchar(10) NOT NULL,
  PRIMARY KEY (`User_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=89 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add last_login', 7, 'add_last_login'),
(26, 'Can change last_login', 7, 'change_last_login'),
(27, 'Can delete last_login', 7, 'delete_last_login'),
(28, 'Can view last_login', 7, 'view_last_login'),
(29, 'Can add user model', 8, 'add_usermodel'),
(30, 'Can change user model', 8, 'change_usermodel'),
(31, 'Can delete user model', 8, 'delete_usermodel'),
(32, 'Can view user model', 8, 'view_usermodel'),
(33, 'Can add all_users_model', 9, 'add_all_users_model'),
(34, 'Can change all_users_model', 9, 'change_all_users_model'),
(35, 'Can delete all_users_model', 9, 'delete_all_users_model'),
(36, 'Can view all_users_model', 9, 'view_all_users_model'),
(37, 'Can add upload_dataset_model', 10, 'add_upload_dataset_model'),
(38, 'Can change upload_dataset_model', 10, 'change_upload_dataset_model'),
(39, 'Can delete upload_dataset_model', 10, 'delete_upload_dataset_model'),
(40, 'Can view upload_dataset_model', 10, 'view_upload_dataset_model'),
(41, 'Can add dataset', 11, 'add_dataset'),
(42, 'Can change dataset', 11, 'change_dataset'),
(43, 'Can delete dataset', 11, 'delete_dataset'),
(44, 'Can view dataset', 11, 'view_dataset'),
(45, 'Can add feedback', 12, 'add_feedback'),
(46, 'Can change feedback', 12, 'change_feedback'),
(47, 'Can delete feedback', 12, 'delete_feedback'),
(48, 'Can view feedback', 12, 'view_feedback'),
(49, 'Can add ad a_algo', 13, 'add_ada_algo'),
(50, 'Can change ad a_algo', 13, 'change_ada_algo'),
(51, 'Can delete ad a_algo', 13, 'delete_ada_algo'),
(52, 'Can view ad a_algo', 13, 'view_ada_algo'),
(53, 'Can add dataset', 14, 'add_dataset'),
(54, 'Can change dataset', 14, 'change_dataset'),
(55, 'Can delete dataset', 14, 'delete_dataset'),
(56, 'Can view dataset', 14, 'view_dataset'),
(57, 'Can add d t_algo', 15, 'add_dt_algo'),
(58, 'Can change d t_algo', 15, 'change_dt_algo'),
(59, 'Can delete d t_algo', 15, 'delete_dt_algo'),
(60, 'Can view d t_algo', 15, 'view_dt_algo'),
(61, 'Can add g d_algo', 16, 'add_gd_algo'),
(62, 'Can change g d_algo', 16, 'change_gd_algo'),
(63, 'Can delete g d_algo', 16, 'delete_gd_algo'),
(64, 'Can view g d_algo', 16, 'view_gd_algo'),
(65, 'Can add kn n_algo', 17, 'add_knn_algo'),
(66, 'Can change kn n_algo', 17, 'change_knn_algo'),
(67, 'Can delete kn n_algo', 17, 'delete_knn_algo'),
(68, 'Can view kn n_algo', 17, 'view_knn_algo'),
(69, 'Can add logistic', 18, 'add_logistic'),
(70, 'Can change logistic', 18, 'change_logistic'),
(71, 'Can delete logistic', 18, 'delete_logistic'),
(72, 'Can view logistic', 18, 'view_logistic'),
(73, 'Can add random forest', 19, 'add_randomforest'),
(74, 'Can change random forest', 19, 'change_randomforest'),
(75, 'Can delete random forest', 19, 'delete_randomforest'),
(76, 'Can view random forest', 19, 'view_randomforest'),
(77, 'Can add sv m_algo', 20, 'add_svm_algo'),
(78, 'Can change sv m_algo', 20, 'change_svm_algo'),
(79, 'Can delete sv m_algo', 20, 'delete_svm_algo'),
(80, 'Can view sv m_algo', 20, 'view_svm_algo'),
(81, 'Can add x g_algo', 21, 'add_xg_algo'),
(82, 'Can change x g_algo', 21, 'change_xg_algo'),
(83, 'Can delete x g_algo', 21, 'delete_xg_algo'),
(84, 'Can view x g_algo', 21, 'view_xg_algo'),
(85, 'Can add predict_details', 22, 'add_predict_details'),
(86, 'Can change predict_details', 22, 'change_predict_details'),
(87, 'Can delete predict_details', 22, 'delete_predict_details'),
(88, 'Can view predict_details', 22, 'view_predict_details');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dataset`
--

DROP TABLE IF EXISTS `dataset`;
CREATE TABLE IF NOT EXISTS `dataset` (
  `DS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Age` int(11) NOT NULL,
  `Glucose` int(11) NOT NULL,
  `BloodPressure` int(11) NOT NULL,
  `SkinThickness` int(11) NOT NULL,
  `Insulin` int(11) NOT NULL,
  `BMI` int(11) NOT NULL,
  `DiabetesPedigreeFunction` int(11) NOT NULL,
  `Pregnancies` int(11) NOT NULL,
  PRIMARY KEY (`DS_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'mainapp', 'last_login'),
(8, 'mainapp', 'usermodel'),
(9, 'adminapp', 'all_users_model'),
(10, 'adminapp', 'upload_dataset_model'),
(11, 'userapp', 'dataset'),
(12, 'userapp', 'feedback'),
(13, 'adminapp', 'ada_algo'),
(14, 'adminapp', 'dataset'),
(15, 'adminapp', 'dt_algo'),
(16, 'adminapp', 'gd_algo'),
(17, 'adminapp', 'knn_algo'),
(18, 'adminapp', 'logistic'),
(19, 'adminapp', 'randomforest'),
(20, 'adminapp', 'svm_algo'),
(21, 'adminapp', 'xg_algo'),
(22, 'mainapp', 'predict_details');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-11-21 08:06:15.451031'),
(2, 'auth', '0001_initial', '2023-11-21 08:06:16.001081'),
(3, 'admin', '0001_initial', '2023-11-21 08:06:16.165524'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-11-21 08:06:16.165524'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-11-21 08:06:16.187691'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-11-21 08:06:16.317439'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-11-21 08:06:16.384028'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-11-21 08:06:16.453514'),
(9, 'auth', '0004_alter_user_username_opts', '2023-11-21 08:06:16.470216'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-11-21 08:06:16.536411'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-11-21 08:06:16.536411'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-11-21 08:06:16.552545'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-11-21 08:06:16.623588'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-11-21 08:06:16.681007'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-11-21 08:06:16.733439'),
(16, 'auth', '0011_update_proxy_permissions', '2023-11-21 08:06:16.752578'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-11-21 08:06:16.809904'),
(18, 'mainapp', '0001_initial', '2023-11-21 08:06:16.855016'),
(19, 'sessions', '0001_initial', '2023-11-21 08:06:16.919699'),
(20, 'adminapp', '0001_initial', '2023-11-22 06:47:51.924942'),
(21, 'userapp', '0001_initial', '2023-11-23 07:47:32.095063'),
(22, 'adminapp', '0002_ada_algo_dataset_dt_algo_gd_algo_knn_algo_logistic_and_more', '2023-11-23 10:04:49.340900'),
(23, 'mainapp', '0002_predict_details', '2023-11-24 08:59:01.803771');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('z1614q3i2kwtrbwb9zhczmsgixhl3g6a', 'eyJ1c2VyX2VtYWlsIjoicHByYXNoYW50aGkxNjlAZ21haWwuY29tIiwidXNlcl9pZCI6MTJ9:1r5PAX:RR3K8vdckKiKw3GEHM-TQ3y7rdT0C70chdPeiPbtJ2U', '2023-12-05 11:43:53.003491'),
('f2gbhvi41uliveqkz2tmod1hzy77zh2t', 'eyJ1c2VyX2lkIjoxMn0:1r5ils:SPhE2Ab9H6wNfD490vFyQMBbZkIiMhfYKNMJ_Y3VEJY', '2023-12-06 08:39:44.627534'),
('kj0turug3bkdlj04hcyzrrl5uga4rv6a', 'eyJ1c2VyX2lkIjoxMn0:1r5ivR:N1UIU0305z4UQ_trDM1fvVL2snqf60h_BpIICVXcM90', '2023-12-06 08:49:37.310395'),
('igb25ihfdh1m904rtvpkrewary2jmcq7', 'eyJ1c2VyX2VtYWlsIjoicHJhdmVlbmx1Y2t5MzIyQGdtYWlsLmNvbSIsInVzZXJfaWQiOjEyfQ:1r9KEm:xU5uVKSq08X5xt88DrtcbQuVRBSpsqttT75sY2oU7SU', '2023-12-16 07:16:28.549066');

-- --------------------------------------------------------

--
-- Table structure for table `dt_algo`
--

DROP TABLE IF EXISTS `dt_algo`;
CREATE TABLE IF NOT EXISTS `dt_algo` (
  `DT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Accuracy` longtext NOT NULL,
  `Precession` longtext NOT NULL,
  `F1_Score` longtext NOT NULL,
  `Recall` longtext NOT NULL,
  `Name` longtext NOT NULL,
  PRIMARY KEY (`DT_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dt_algo`
--

INSERT INTO `dt_algo` (`DT_ID`, `Accuracy`, `Precession`, `F1_Score`, `Recall`, `Name`) VALUES
(1, '99.46', '99.46', '99.46', '99.46', 'Decision Tree Algorithm'),
(2, '99.44', '99.44', '99.44', '99.44', 'Decision Tree Algorithm'),
(3, '99.53', '99.54', '99.53', '99.53', 'Decision Tree Algorithm'),
(4, '99.44', '99.44', '99.44', '99.44', 'Decision Tree Algorithm');

-- --------------------------------------------------------

--
-- Table structure for table `feedback_details`
--

DROP TABLE IF EXISTS `feedback_details`;
CREATE TABLE IF NOT EXISTS `feedback_details` (
  `Feed_id` int(11) NOT NULL AUTO_INCREMENT,
  `Rating` varchar(100) DEFAULT NULL,
  `Review` varchar(225) DEFAULT NULL,
  `Sentiment` varchar(100) DEFAULT NULL,
  `datetime` datetime(6) NOT NULL,
  `Reviewer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Feed_id`),
  KEY `feedback_details_Reviewer_id_13cf49be` (`Reviewer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedback_details`
--

INSERT INTO `feedback_details` (`Feed_id`, `Rating`, `Review`, `Sentiment`, `datetime`, `Reviewer_id`) VALUES
(1, '3', 'average', 'neutral', '2023-11-23 08:08:54.387858', 12),
(2, '5', 'verygood', 'neutral', '2023-11-23 12:42:19.117960', 12),
(3, '4', 'Good', 'positive', '2023-11-29 08:02:59.312885', 12);

-- --------------------------------------------------------

--
-- Table structure for table `gd_algo`
--

DROP TABLE IF EXISTS `gd_algo`;
CREATE TABLE IF NOT EXISTS `gd_algo` (
  `GD_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Accuracy` longtext NOT NULL,
  `Precession` longtext NOT NULL,
  `F1_Score` longtext NOT NULL,
  `Recall` longtext NOT NULL,
  `Name` longtext NOT NULL,
  PRIMARY KEY (`GD_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gd_algo`
--

INSERT INTO `gd_algo` (`GD_ID`, `Accuracy`, `Precession`, `F1_Score`, `Recall`, `Name`) VALUES
(1, '95.5', '95.5', '95.5', '95.5', 'Gr Boost Algorithm'),
(2, '95.31', '95.3', '95.31', '95.31', 'Gr Boost Algorithm'),
(3, '95.7', '95.7', '95.7', '95.7', 'Gr Boost Algorithm'),
(4, '95.22', '95.21', '95.22', '95.22', 'Gr Boost Algorithm');

-- --------------------------------------------------------

--
-- Table structure for table `knn_algo`
--

DROP TABLE IF EXISTS `knn_algo`;
CREATE TABLE IF NOT EXISTS `knn_algo` (
  `KNN_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Accuracy` longtext NOT NULL,
  `Precession` longtext NOT NULL,
  `F1_Score` longtext NOT NULL,
  `Recall` longtext NOT NULL,
  `Name` longtext NOT NULL,
  PRIMARY KEY (`KNN_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `knn_algo`
--

INSERT INTO `knn_algo` (`KNN_ID`, `Accuracy`, `Precession`, `F1_Score`, `Recall`, `Name`) VALUES
(1, '96.82', '96.85', '96.96', '96.96', 'KNN Algorithm'),
(2, '96.82', '96.85', '96.96', '96.96', 'KNN Algorithm'),
(3, '96.8', '96.84', '96.95', '96.95', 'KNN Algorithm'),
(4, '96.82', '96.86', '96.97', '96.97', 'KNN Algorithm'),
(5, '96.81', '96.85', '96.96', '96.96', 'KNN Algorithm');

-- --------------------------------------------------------

--
-- Table structure for table `last_login`
--

DROP TABLE IF EXISTS `last_login`;
CREATE TABLE IF NOT EXISTS `last_login` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Login_Time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `logistic`
--

DROP TABLE IF EXISTS `logistic`;
CREATE TABLE IF NOT EXISTS `logistic` (
  `Logistic_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Accuracy` longtext NOT NULL,
  `Precession` longtext NOT NULL,
  `F1_Score` longtext NOT NULL,
  `Recall` longtext NOT NULL,
  `Name` longtext NOT NULL,
  PRIMARY KEY (`Logistic_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logistic`
--

INSERT INTO `logistic` (`Logistic_ID`, `Accuracy`, `Precession`, `F1_Score`, `Recall`, `Name`) VALUES
(1, '84.83', '84.75', '85.6', '85.6', 'ADA Boost Algorithm'),
(2, '84.87', '84.78', '85.67', '85.67', 'ADA Boost Algorithm'),
(3, '84.94', '84.86', '85.7', '85.7', 'Logistic Algorithm'),
(4, '84.84', '84.75', '85.61', '85.61', 'Logistic Algorithm'),
(5, '84.82', '84.74', '85.61', '85.61', 'Logistic Algorithm'),
(6, '84.55', '84.47', '85.38', '85.38', 'Logistic Algorithm'),
(7, '85.22', '85.14', '85.94', '85.94', 'Logistic Algorithm'),
(8, '85.17', '85.1', '85.91', '85.91', 'Logistic Algorithm'),
(9, '84.63', '84.54', '85.4', '85.4', 'Logistic Algorithm'),
(10, '84.76', '84.68', '85.56', '85.56', 'Logistic Algorithm');

-- --------------------------------------------------------

--
-- Table structure for table `predict_detail`
--

DROP TABLE IF EXISTS `predict_detail`;
CREATE TABLE IF NOT EXISTS `predict_detail` (
  `predict_id` int(11) NOT NULL AUTO_INCREMENT,
  `Field_1` varchar(60) DEFAULT NULL,
  `Field_2` varchar(60) DEFAULT NULL,
  `Field_3` varchar(60) DEFAULT NULL,
  `Field_4` varchar(60) DEFAULT NULL,
  `Field_5` varchar(60) DEFAULT NULL,
  `Field_6` varchar(60) DEFAULT NULL,
  `Field_7` varchar(60) DEFAULT NULL,
  `Field_8` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`predict_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `randomforest`
--

DROP TABLE IF EXISTS `randomforest`;
CREATE TABLE IF NOT EXISTS `randomforest` (
  `Random_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Accuracy` longtext NOT NULL,
  `Precession` longtext NOT NULL,
  `F1_Score` longtext NOT NULL,
  `Recall` longtext NOT NULL,
  `Name` longtext NOT NULL,
  PRIMARY KEY (`Random_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `randomforest`
--

INSERT INTO `randomforest` (`Random_ID`, `Accuracy`, `Precession`, `F1_Score`, `Recall`, `Name`) VALUES
(1, '99.76', '99.76', '99.76', '99.76', 'Random Forest Algorithm'),
(2, '99.77', '99.77', '99.76', '99.76', 'Random Forest Algorithm'),
(3, '99.76', '99.76', '99.75', '99.75', 'Random Forest Algorithm'),
(4, '99.76', '99.76', '99.75', '99.75', 'Random Forest Algorithm'),
(5, '99.77', '99.77', '99.76', '99.76', 'Random Forest Algorithm'),
(6, '99.77', '99.77', '99.77', '99.77', 'Random Forest Algorithm'),
(7, '99.76', '99.76', '99.76', '99.76', 'Random Forest Algorithm');

-- --------------------------------------------------------

--
-- Table structure for table `sxm_algo`
--

DROP TABLE IF EXISTS `sxm_algo`;
CREATE TABLE IF NOT EXISTS `sxm_algo` (
  `SVM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Accuracy` longtext NOT NULL,
  `Precession` longtext NOT NULL,
  `F1_Score` longtext NOT NULL,
  `Recall` longtext NOT NULL,
  `Name` longtext NOT NULL,
  PRIMARY KEY (`SVM_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `upload`
--

DROP TABLE IF EXISTS `upload`;
CREATE TABLE IF NOT EXISTS `upload` (
  `Data_id` int(11) NOT NULL AUTO_INCREMENT,
  `Image` varchar(100) NOT NULL,
  PRIMARY KEY (`Data_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `upload_dataset`
--

DROP TABLE IF EXISTS `upload_dataset`;
CREATE TABLE IF NOT EXISTS `upload_dataset` (
  `User_id` int(11) NOT NULL AUTO_INCREMENT,
  `Dataset` varchar(100) DEFAULT NULL,
  `File_size` varchar(100) NOT NULL,
  `Date_Time` datetime(6) NOT NULL,
  PRIMARY KEY (`User_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `upload_dataset`
--

INSERT INTO `upload_dataset` (`User_id`, `Dataset`, `File_size`, `Date_Time`) VALUES
(4, 'fraud_clean_9ZkICxv.csv', '5929.77734375 kb', '2023-11-29 08:47:13.421991');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

DROP TABLE IF EXISTS `user_details`;
CREATE TABLE IF NOT EXISTS `user_details` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `user_age` int(11) DEFAULT NULL,
  `user_email` varchar(254) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  `user_address` longtext NOT NULL,
  `user_contact` varchar(15) NOT NULL,
  `user_image` varchar(100) DEFAULT NULL,
  `Date_Time` datetime(6) DEFAULT NULL,
  `User_Status` longtext DEFAULT NULL,
  `Otp_Num` int(11) DEFAULT NULL,
  `Otp_Status` longtext DEFAULT NULL,
  `Last_Login_Time` time(6) DEFAULT NULL,
  `Last_Login_Date` date DEFAULT NULL,
  `No_Of_Times_Login` int(11) DEFAULT NULL,
  `Message` longtext DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`user_id`, `user_name`, `user_age`, `user_email`, `user_password`, `user_address`, `user_contact`, `user_image`, `Date_Time`, `User_Status`, `Otp_Num`, `Otp_Status`, `Last_Login_Time`, `Last_Login_Date`, `No_Of_Times_Login`, `Message`) VALUES
(12, 'prashanthii', 25, 'pprashanthi169@gmail.com', 'Amma@123', '8-3-232/b/50/c/6 , venkatagiri, yousufguda , hyderabad', '+919949803766', 'media/rose_SMb1hMK.jpg', '2023-12-02 07:16:28.447576', 'accepted', 7680, 'verified', '14:45:06.640722', '2023-11-21', 32, 'good');

-- --------------------------------------------------------

--
-- Table structure for table `xg_algo`
--

DROP TABLE IF EXISTS `xg_algo`;
CREATE TABLE IF NOT EXISTS `xg_algo` (
  `XG_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Accuracy` longtext NOT NULL,
  `Precession` longtext NOT NULL,
  `F1_Score` longtext NOT NULL,
  `Recall` longtext NOT NULL,
  `Name` longtext NOT NULL,
  PRIMARY KEY (`XG_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xg_algo`
--

INSERT INTO `xg_algo` (`XG_ID`, `Accuracy`, `Precession`, `F1_Score`, `Recall`, `Name`) VALUES
(1, '99.5', '99.51', '99.5', '99.5', 'XG Boost Algorithm'),
(2, '99.5', '99.51', '99.5', '99.5', 'XG Boost Algorithm'),
(3, '99.5', '99.5', '99.5', '99.5', 'XG Boost Algorithm'),
(4, '99.52', '99.52', '99.52', '99.52', 'XG Boost Algorithm'),
(5, '99.49', '99.5', '99.49', '99.49', 'XG Boost Algorithm'),
(6, '99.47', '99.47', '99.47', '99.47', 'XG Boost Algorithm'),
(7, '99.46', '99.46', '99.46', '99.46', 'XG Boost Algorithm'),
(8, '99.49', '99.5', '99.49', '99.49', 'XG Boost Algorithm'),
(9, '99.51', '99.52', '99.51', '99.51', 'XG Boost Algorithm'),
(10, '99.51', '99.52', '99.51', '99.51', 'XG Boost Algorithm'),
(11, '99.49', '99.49', '99.49', '99.49', 'XG Boost Algorithm'),
(12, '99.49', '99.5', '99.49', '99.49', 'XG Boost Algorithm'),
(13, '99.48', '99.49', '99.48', '99.48', 'XG Boost Algorithm'),
(14, '99.49', '99.49', '99.49', '99.49', 'XG Boost Algorithm'),
(15, '99.46', '99.46', '99.46', '99.46', 'XG Boost Algorithm'),
(16, '99.48', '99.49', '99.48', '99.48', 'XG Boost Algorithm'),
(17, '99.48', '99.48', '99.48', '99.48', 'XG Boost Algorithm'),
(18, '99.51', '99.51', '99.51', '99.51', 'XG Boost Algorithm'),
(19, '99.47', '99.48', '99.47', '99.47', 'XG Boost Algorithm'),
(20, '99.42', '99.43', '99.42', '99.42', 'XG Boost Algorithm'),
(21, '99.5', '99.5', '99.5', '99.5', 'XG Boost Algorithm'),
(22, '99.5', '99.5', '99.5', '99.5', 'XG Boost Algorithm'),
(23, '99.46', '99.47', '99.46', '99.46', 'XG Boost Algorithm'),
(24, '99.48', '99.49', '99.48', '99.48', 'XG Boost Algorithm'),
(25, '99.52', '99.53', '99.52', '99.52', 'XG Boost Algorithm'),
(26, '99.48', '99.49', '99.48', '99.48', 'XG Boost Algorithm'),
(27, '99.51', '99.51', '99.51', '99.51', 'XG Boost Algorithm'),
(28, '99.47', '99.47', '99.47', '99.47', 'XG Boost Algorithm'),
(29, '99.47', '99.47', '99.47', '99.47', 'XG Boost Algorithm'),
(30, '99.52', '99.52', '99.52', '99.52', 'XG Boost Algorithm'),
(31, '99.5', '99.51', '99.5', '99.5', 'XG Boost Algorithm'),
(32, '99.46', '99.47', '99.46', '99.46', 'XG Boost Algorithm'),
(33, '99.5', '99.5', '99.5', '99.5', 'XG Boost Algorithm'),
(34, '99.45', '99.45', '99.45', '99.45', 'XG Boost Algorithm'),
(35, '99.5', '99.5', '99.5', '99.5', 'XG Boost Algorithm'),
(36, '99.48', '99.49', '99.48', '99.48', 'XG Boost Algorithm'),
(37, '99.48', '99.49', '99.48', '99.48', 'XG Boost Algorithm'),
(38, '99.47', '99.47', '99.47', '99.47', 'XG Boost Algorithm'),
(39, '99.47', '99.47', '99.47', '99.47', 'XG Boost Algorithm'),
(40, '99.5', '99.51', '99.5', '99.5', 'XG Boost Algorithm'),
(41, '99.47', '99.47', '99.47', '99.47', 'XG Boost Algorithm'),
(42, '99.49', '99.49', '99.49', '99.49', 'XG Boost Algorithm'),
(43, '99.51', '99.51', '99.51', '99.51', 'XG Boost Algorithm'),
(44, '99.48', '99.49', '99.48', '99.48', 'XG Boost Algorithm'),
(45, '99.49', '99.49', '99.49', '99.49', 'XG Boost Algorithm'),
(46, '99.52', '99.53', '99.52', '99.52', 'XG Boost Algorithm'),
(47, '99.49', '99.49', '99.49', '99.49', 'XG Boost Algorithm'),
(48, '99.49', '99.49', '99.49', '99.49', 'XG Boost Algorithm'),
(49, '99.51', '99.51', '99.51', '99.51', 'XG Boost Algorithm'),
(50, '99.51', '99.51', '99.51', '99.51', 'XG Boost Algorithm'),
(51, '99.48', '99.48', '99.48', '99.48', 'XG Boost Algorithm'),
(52, '99.51', '99.52', '99.51', '99.51', 'XG Boost Algorithm'),
(53, '99.51', '99.52', '99.51', '99.51', 'XG Boost Algorithm'),
(54, '99.49', '99.49', '99.49', '99.49', 'XG Boost Algorithm'),
(55, '99.51', '99.51', '99.51', '99.51', 'XG Boost Algorithm'),
(56, '99.47', '99.47', '99.47', '99.47', 'XG Boost Algorithm'),
(57, '99.48', '99.48', '99.48', '99.48', 'XG Boost Algorithm'),
(58, '99.52', '99.53', '99.52', '99.52', 'XG Boost Algorithm'),
(59, '99.49', '99.49', '99.49', '99.49', 'XG Boost Algorithm'),
(60, '99.47', '99.47', '99.47', '99.47', 'XG Boost Algorithm'),
(61, '99.51', '99.52', '99.51', '99.51', 'XG Boost Algorithm'),
(62, '99.49', '99.5', '99.49', '99.49', 'XG Boost Algorithm'),
(63, '99.48', '99.48', '99.48', '99.48', 'XG Boost Algorithm'),
(64, '99.5', '99.51', '99.5', '99.5', 'XG Boost Algorithm'),
(65, '99.45', '99.45', '99.45', '99.45', 'XG Boost Algorithm'),
(66, '99.49', '99.49', '99.49', '99.49', 'XG Boost Algorithm'),
(67, '99.5', '99.5', '99.5', '99.5', 'XG Boost Algorithm');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
