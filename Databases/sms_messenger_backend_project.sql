-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Apr 19, 2016 at 11:41 AM
-- Server version: 5.5.42
-- PHP Version: 5.6.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sms_messenger_backend_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `message_id` int(11) NOT NULL,
  `message_subject` varchar(300) NOT NULL,
  `message_body` varchar(500) NOT NULL,
  `message_create_date` datetime NOT NULL,
  `message_author_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`message_id`, `message_subject`, `message_body`, `message_create_date`, `message_author_id`) VALUES
(1, 'sample message', 'Hello', '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `message_delivery`
--

CREATE TABLE `message_delivery` (
  `delivery_id` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `delivery_message` varchar(20) NOT NULL,
  `delivery_date_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `message_history`
--

CREATE TABLE `message_history` (
  `history_log_id` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  `message_sent_group_id` int(11) NOT NULL,
  `message_sent_list` int(11) NOT NULL,
  `delivery_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1460982916),
('m130524_201442_init', 1460982920);

-- --------------------------------------------------------

--
-- Table structure for table `recipient_list`
--

CREATE TABLE `recipient_list` (
  `recipient_list_id` int(11) NOT NULL,
  `recipient_name` varchar(100) NOT NULL,
  `recipient_phone_number` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sent_list`
--

CREATE TABLE `sent_list` (
  `sent_list_id` int(11) NOT NULL,
  `recipient_phone_number` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_phone_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `user_phone_number`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Admin', '2345678901', '057znzCUQzE1BByP6l972Iyd_mfBJAIi', '$2y$13$BfAVQFWKsi4kWU3GI4vGMe4gTkZflvVmKwsFuM3dwLNtuTvGfkX1G', '', 'admin@gmail.com', 10, 1460982992, 1460982992),
(2, 'omal', '1234567890', 'FoTPYFzSdyoJAXwEOo9PAhLqqUrxZ5fu', '$2y$13$WBK.Wgaog94WJgv/.oB.auvWBzWRtQusVeLHncrq5ZL1d31QTDx8y', NULL, 'omal@gmail.com', 10, 1460983291, 1460983291);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_email_verified` tinyint(1) NOT NULL,
  `user_phone_number` varchar(20) NOT NULL,
  `user_credits` decimal(15,2) NOT NULL,
  `user_registration_date` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_email`, `user_password`, `user_name`, `user_email_verified`, `user_phone_number`, `user_credits`, `user_registration_date`) VALUES
(1, 'qwe@qwe.sd', '123456', 'qwert', 1, '1234567890', '1234.00', '2016-04-03 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `user_group`
--

CREATE TABLE `user_group` (
  `group_id` int(11) NOT NULL,
  `group_owner_id` int(11) NOT NULL,
  `group_name` varchar(50) NOT NULL,
  `group_registration_date` datetime NOT NULL,
  `group_recipient_list_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`message_id`),
  ADD UNIQUE KEY `message_id` (`message_id`),
  ADD KEY `message_and_user_id` (`message_author_id`);

--
-- Indexes for table `message_delivery`
--
ALTER TABLE `message_delivery`
  ADD PRIMARY KEY (`delivery_id`),
  ADD UNIQUE KEY `delivery_id` (`delivery_id`),
  ADD KEY `message_id` (`message_id`);

--
-- Indexes for table `message_history`
--
ALTER TABLE `message_history`
  ADD PRIMARY KEY (`history_log_id`),
  ADD UNIQUE KEY `history_log_id` (`history_log_id`),
  ADD UNIQUE KEY `message_sent_list` (`message_sent_list`),
  ADD KEY `message_id` (`message_id`),
  ADD KEY `delivery_id` (`delivery_id`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `recipient_list`
--
ALTER TABLE `recipient_list`
  ADD PRIMARY KEY (`recipient_list_id`),
  ADD UNIQUE KEY `recipient_list_id` (`recipient_list_id`);

--
-- Indexes for table `sent_list`
--
ALTER TABLE `sent_list`
  ADD PRIMARY KEY (`sent_list_id`),
  ADD UNIQUE KEY `sent_list_id` (`sent_list_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_emai` (`user_email`);

--
-- Indexes for table `user_group`
--
ALTER TABLE `user_group`
  ADD PRIMARY KEY (`group_id`),
  ADD UNIQUE KEY `group_id` (`group_id`),
  ADD UNIQUE KEY `group_recipient_list_id` (`group_recipient_list_id`),
  ADD KEY `user_group_and_owner_id` (`group_owner_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_and_user_id` FOREIGN KEY (`message_author_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `message_delivery`
--
ALTER TABLE `message_delivery`
  ADD CONSTRAINT `message_delivery_ibfk_1` FOREIGN KEY (`message_id`) REFERENCES `message` (`message_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `message_history`
--
ALTER TABLE `message_history`
  ADD CONSTRAINT `message_history_ibfk_1` FOREIGN KEY (`message_id`) REFERENCES `message` (`message_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `message_history_ibfk_2` FOREIGN KEY (`delivery_id`) REFERENCES `message_delivery` (`delivery_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `recipient_list`
--
ALTER TABLE `recipient_list`
  ADD CONSTRAINT `recipient_list_ibfk_1` FOREIGN KEY (`recipient_list_id`) REFERENCES `user_group` (`group_recipient_list_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sent_list`
--
ALTER TABLE `sent_list`
  ADD CONSTRAINT `sent_list_ibfk_1` FOREIGN KEY (`sent_list_id`) REFERENCES `message_history` (`message_sent_list`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_group`
--
ALTER TABLE `user_group`
  ADD CONSTRAINT `user_group_and_owner` FOREIGN KEY (`group_owner_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_group_and_owner_id` FOREIGN KEY (`group_owner_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
