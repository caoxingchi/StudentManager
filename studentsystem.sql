/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : localhost:3306
 Source Schema         : studentsystem

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 25/08/2020 20:53:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for classes
-- ----------------------------
DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes`  (
  `cl_id` int(11) NOT NULL AUTO_INCREMENT,
  `cl_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cl_teacher` int(11) NOT NULL,
  `cl_major` int(11) NOT NULL,
  PRIMARY KEY (`cl_id`) USING BTREE,
  INDEX `cl_teacher`(`cl_teacher`) USING BTREE,
  INDEX `cl_major`(`cl_major`) USING BTREE,
  CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`cl_teacher`) REFERENCES `teacher` (`t_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `classes_ibfk_2` FOREIGN KEY (`cl_major`) REFERENCES `major` (`m_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `t_id` int(11) NOT NULL,
  `c_type` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `c_credit` int(11) NOT NULL,
  `c_period` int(11) NOT NULL,
  `c_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `c_unit` int(11) NOT NULL,
  PRIMARY KEY (`c_id`) USING BTREE,
  INDEX `t_id`(`t_id`) USING BTREE,
  INDEX `c_unit`(`c_unit`) USING BTREE,
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`t_id`) REFERENCES `teacher` (`t_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `course_ibfk_2` FOREIGN KEY (`c_unit`) REFERENCES `department` (`d_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10001 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `d_id` int(11) NOT NULL AUTO_INCREMENT,
  `d_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`d_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, '计算机工程学院');
INSERT INTO `department` VALUES (2, '音乐与舞蹈学院');
INSERT INTO `department` VALUES (3, '文学与传媒学');
INSERT INTO `department` VALUES (4, '物理与电子工程学院');
INSERT INTO `department` VALUES (5, '数学与统计学院');
INSERT INTO `department` VALUES (6, '化学与食品科学学院');
INSERT INTO `department` VALUES (7, '外国语学院');
INSERT INTO `department` VALUES (8, '体育学院');

-- ----------------------------
-- Table structure for grades
-- ----------------------------
DROP TABLE IF EXISTS `grades`;
CREATE TABLE `grades`  (
  `c_id` int(11) NOT NULL,
  `s_id` int(11) NOT NULL,
  `grade` double NOT NULL,
  PRIMARY KEY (`c_id`, `s_id`) USING BTREE,
  INDEX `s_id`(`s_id`) USING BTREE,
  CONSTRAINT `grades_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `course` (`c_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `grades_ibfk_2` FOREIGN KEY (`s_id`) REFERENCES `student` (`s_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major`  (
  `m_id` int(11) NOT NULL AUTO_INCREMENT,
  `m_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `m_teacher` int(11) NOT NULL,
  `m_dep` int(11) NOT NULL,
  PRIMARY KEY (`m_id`) USING BTREE,
  INDEX `m_teacher`(`m_teacher`) USING BTREE,
  INDEX `m_dep`(`m_dep`) USING BTREE,
  CONSTRAINT `major_ibfk_1` FOREIGN KEY (`m_teacher`) REFERENCES `teacher` (`t_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `major_ibfk_2` FOREIGN KEY (`m_dep`) REFERENCES `department` (`d_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `s_id` int(11) NOT NULL,
  `s_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `s_gender` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `s_dep` int(11) NOT NULL,
  `s_major` int(11) NOT NULL,
  `s_class` int(11) NOT NULL,
  `s_birthday` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`s_id`) USING BTREE,
  INDEX `s_dep`(`s_dep`) USING BTREE,
  INDEX `s_major`(`s_major`) USING BTREE,
  INDEX `s_class`(`s_class`) USING BTREE,
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`s_dep`) REFERENCES `department` (`d_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_ibfk_2` FOREIGN KEY (`s_major`) REFERENCES `major` (`m_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_ibfk_3` FOREIGN KEY (`s_class`) REFERENCES `classes` (`cl_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `t_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `t_gender` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `t_dep` int(11) NOT NULL,
  `t_tel` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `t_birthday` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`t_id`) USING BTREE,
  INDEX `t_dep`(`t_dep`) USING BTREE,
  CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`t_dep`) REFERENCES `department` (`d_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2098777384 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (1236456352, '皮卡丘', '女', 4, '15678909876', '2020-08-17 00:00:00');
INSERT INTO `teacher` VALUES (1298345334, '星老师', '男', 4, '15483967393', '1984-08-16 00:00:00');
INSERT INTO `teacher` VALUES (1749098765, '张老师', '男', 1, '15587400984', '1980-07-10 00:00:00');
INSERT INTO `teacher` VALUES (2009220223, 'miss you', '女', 4, '18347569483', '2020-04-01 00:00:00');
INSERT INTO `teacher` VALUES (2017117106, '幸会', '女', 3, '15342532089', '2020-08-09 00:00:00');
INSERT INTO `teacher` VALUES (2017117123, '张锦涛', '男', 1, '18346573829', '1999-10-14 00:00:00');
INSERT INTO `teacher` VALUES (2017117132, '刘韦佳', '男', 1, '15782324567', '2020-08-10 00:00:00');
INSERT INTO `teacher` VALUES (2091888293, '婷姐', '女', 3, '18743456798', '2020-08-10 00:00:00');
INSERT INTO `teacher` VALUES (2098777383, '鄂西北大老板', '男', 1, '18739202374', '1999-08-05 00:00:00');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `username` int(11) NOT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (12345, '20222e286a46a4a642884a0e4a800ec2');

SET FOREIGN_KEY_CHECKS = 1;
