-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 21, 2022 at 03:38 PM
-- Server version: 8.0.27
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spec`
--

-- --------------------------------------------------------

--
-- Table structure for table `address_company`
--

CREATE TABLE `address_company` (
  `id` int NOT NULL,
  `address_school` varchar(65) NOT NULL,
  `id_company` int NOT NULL,
  `deleted` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `address_company`
--

INSERT INTO `address_company` (`id`, `address_school`, `id_company`, `deleted`) VALUES
(1, 'Đại học Xây Dựng - Hà Nội', 1, b'1'),
(2, 'Đại học Giao Thông Vân Tải - Hà Nội', 1, b'1'),
(3, 'Đại học Kiến Trúc - Hà Nội', 1, b'1');

-- --------------------------------------------------------

--
-- Table structure for table `address_company_has_course`
--

CREATE TABLE `address_company_has_course` (
  `id_addr` int NOT NULL,
  `id_course` int NOT NULL,
  `openning_day` date NOT NULL COMMENT 'ngày khai giảng',
  `study_time` varchar(100) NOT NULL COMMENT 'thời gian học',
  `code_study` varchar(45) NOT NULL COMMENT 'mã lớp',
  `deleted` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `advisory_infor`
--

CREATE TABLE `advisory_infor` (
  `id` int NOT NULL COMMENT 'bang nhan thong tin yeu cau tu van cua phu huynh',
  `name_parents` varchar(60) NOT NULL COMMENT 'ten phu huynh can tu van',
  `email` varchar(45) NOT NULL,
  `phone_number` varchar(45) NOT NULL,
  `name_student` varchar(60) NOT NULL COMMENT 'ten hoc sinh',
  `date_of_birth_student` date NOT NULL,
  `id_course` int NOT NULL,
  `id_address_company` int NOT NULL,
  `deleted` bit(1) NOT NULL,
  `check_advi` bit(1) NOT NULL COMMENT 'kt xem da tu van hay chua'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `advisory_infor`
--

INSERT INTO `advisory_infor` (`id`, `name_parents`, `email`, `phone_number`, `name_student`, `date_of_birth_student`, `id_course`, `id_address_company`, `deleted`, `check_advi`) VALUES
(10, '123', 'hcb', '09856', 'Tra ', '2021-03-31', 6, 1, b'0', b'0'),
(11, '123', 'hcb', '09856', 'Tra ', '2021-03-31', 6, 1, b'1', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `big_category`
--

CREATE TABLE `big_category` (
  `id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `deleted` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `big_category`
--

INSERT INTO `big_category` (`id`, `name`, `deleted`) VALUES
(1, 'sản phẩm', b'1'),
(2, 'học sinh', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `number_dkdn` varchar(45) NOT NULL COMMENT 'số đăng ký doanh nghiệp',
  `date_range` date NOT NULL COMMENT 'ngày cấp',
  `noi_cap` varchar(45) NOT NULL COMMENT 'nơi cấp',
  `name_representative` varchar(45) NOT NULL COMMENT 'ten nguoi dai dien',
  `deleted` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `name`, `number_dkdn`, `date_range`, `noi_cap`, `name_representative`, `deleted`) VALUES
(1, 'Viện tin học xây dựng', '007', '2020-02-22', 'Hà nội', 'Thầy Hoàng', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `id` int NOT NULL,
  `image` varchar(165) NOT NULL COMMENT 'link anh khoa hoc',
  `student_fees` double NOT NULL COMMENT 'giá sinh viên',
  `tuition_fee_after_reduction` double NOT NULL COMMENT 'học phí sau khi giảm',
  `name` varchar(125) NOT NULL COMMENT 'ten khoa hoc',
  `deleted` bit(1) NOT NULL,
  `id_small_category` int NOT NULL,
  `url_view` varchar(100) NOT NULL COMMENT 'nội dung chính ( để dạng html cho dễ)',
  `obj_students` varchar(55) NOT NULL COMMENT 'đối tượng hướng đến',
  `id_user` int NOT NULL COMMENT 'id cua nguoi dang khoa hoc',
  `theme_id` int NOT NULL,
  `promotion` bit(1) NOT NULL COMMENT 'Dang giam gia hay k giam',
  `sub_content` varchar(255) NOT NULL,
  `create_date` date NOT NULL,
  `age` varchar(45) NOT NULL COMMENT 'do tuoi hoc sinh',
  `number_of_student` int NOT NULL COMMENT 'so hoc sinh 1 lop',
  `teacher_id` int NOT NULL,
  `main_content` mediumtext NOT NULL COMMENT 'url của từng khóa học ',
  `duration_of_study` varchar(255) NOT NULL COMMENT 'Thời lượng học của 1 khóa',
  `section` varchar(255) NOT NULL COMMENT 'Học phần',
  `document` varchar(255) NOT NULL COMMENT 'Tài liệu của môn học ',
  `opening_day` varchar(75) DEFAULT NULL COMMENT 'Ngày khai giảng',
  `study_time` varchar(75) DEFAULT NULL COMMENT 'thời gian học',
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `meta_robot` varchar(255) NOT NULL,
  `percent_of_promotion` int NOT NULL,
  `classify` bit(1) NOT NULL COMMENT 'true: khoa hoc tre em, false la khoa hoc sinh vien'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`id`, `image`, `student_fees`, `tuition_fee_after_reduction`, `name`, `deleted`, `id_small_category`, `url_view`, `obj_students`, `id_user`, `theme_id`, `promotion`, `sub_content`, `create_date`, `age`, `number_of_student`, `teacher_id`, `main_content`, `duration_of_study`, `section`, `document`, `opening_day`, `study_time`, `meta_title`, `meta_description`, `meta_keyword`, `meta_robot`, `percent_of_promotion`, `classify`) VALUES
(6, 'https://spec.edu.vn/client/image/images_Trang_Chu/30.jpg', 2200000, 1980000, 'Khóa học Java Mobile', b'1', 1, 'khoa-hoc-java-for-kid', 'Thiếu nhi', 8, 3, b'1', 'Rèn luyện kỹ năng và kinh nghiệm xây dựng ứng dụng Android với ngôn ngữ lập trình Java', '2021-07-11', '7-12', 20, 13, '<h2 style=\"text-align:left\"><strong><span style=\"color:#003163\">Dạy lập tr&igrave;nh Java cho trẻ v&agrave; những điều bạn cần biết</span></strong></h2>\n\n<div>12 th&aacute;ng 03, 2021</div>\n\n<div>\n<h2>Dạy cho trẻ về ng&ocirc;n ngữ lập tr&igrave;nh n&oacute;i chung v&agrave; lập tr&igrave;nh Java</h2>\n\n<p>Trong thời đại c&ocirc;ng nghệ 4.0 b&ecirc;n cạnh việc gi&aacute;o dục trẻ những kiến thức v&agrave; kỹ năng cơ bản th&igrave; nhiều phụ huynh hướng tới việc dạy ng&ocirc;n ngữ lập tr&igrave;nh, trong đ&oacute; c&oacute; lập tr&igrave;nh Java cho trẻ c&oacute; độ tuổi từ 12-16 nhằm gi&uacute;p b&eacute; ph&aacute;t triển to&agrave;n diện về tư duy v&agrave; sự s&aacute;ng tạo. H&atilde;y c&ugrave;ng t&igrave;m hiểu vấn đề hữu &iacute;ch n&agrave;y qua b&agrave;i viết dưới đ&acirc;y nh&eacute;!&nbsp;</p>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"315\" src=\"http://yfain.github.io/Java4Kids/images/Cover.png\" width=\"230\" /></p>\n\n<p style=\"text-align:center\">Dạy lập tr&igrave;nh Java cho trẻ đang l&agrave; xu hướng tại c&aacute;c quốc gia ti&ecirc;n tiến tr&ecirc;n thế giới</p>\n\n<h2><span style=\"color:#2980b9\"><strong>Lập tr&igrave;nh Java l&agrave; g&igrave;?</strong></span></h2>\n\n<p>Ng&ocirc;n ngữ lập tr&igrave;nh Java l&agrave; một ng&ocirc;n ngữ lập tr&igrave;nh bậc cao, sinh ra với mục ti&ecirc;u &ldquo;Viết một lần, thực thi mọi nơi&rdquo; hiện đang được ứng dụng trong nhiều lĩnh vực kh&aacute;c nhau. Chương tr&igrave;nh viết bằng phần mềm Java c&oacute; thể chạy tr&ecirc;n nhiều nền tảng kh&aacute;c nhau, đ&acirc;y ch&iacute;nh l&agrave; điểm mạnh vượt trội của Java so với những ng&ocirc;n ngữ cũ. V&igrave; vậy m&agrave; khiến cho ng&ocirc;n ngữ lập tr&igrave;nh Java ng&agrave;y c&agrave;ng trở n&ecirc;n phổ biến v&agrave; được y&ecirc;u th&iacute;ch đối với mọi lập tr&igrave;nh vi&ecirc;n tr&ecirc;n to&agrave;n thế giới.</p>\n\n<ul>\n</ul>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"331\" src=\"https://spec.edu.vn/client/image/a4.jpg\" width=\"496\" /></p>\n\n<p style=\"text-align:center\">Java hiện l&agrave; một trong những ng&ocirc;n ngữ lập tr&igrave;nh phổ biến nhất tr&ecirc;n thế giới</p>\n\n<h2><span style=\"color:#2980b9\"><strong>Tại sao n&ecirc;n cho trẻ tiếp cận với ng&ocirc;n ngữ lập tr&igrave;nh Java?</strong></span></h2>\n\n<ul>\n	<li>Trẻ nhỏ được học v&agrave; tiếp cận với Java từ sớm sẽ mở ra rất nhiều cơ hội tiếp x&uacute;c với c&aacute;c c&ocirc;ng nghệ ti&ecirc;n tiến v&agrave; xu thế của thế giới hiện nay.&nbsp;</li>\n	<li>K&iacute;ch th&iacute;ch sự ph&aacute;t triển tư duy, t&iacute;nh logic ở trẻ. V&igrave; vậy m&agrave; hỗ trợ tốt trong việc học tập v&agrave; giải quyết c&aacute;c b&agrave;i tập tr&ecirc;n lớp của trẻ&nbsp;</li>\n	<li>Ph&aacute;t huy sự s&aacute;ng tạo kh&ocirc;ng ngừng ở trẻ. Trẻ sẽ lu&ocirc;n mong muốn được kh&aacute;m ph&aacute; v&agrave; t&igrave;m t&ograve;i những kiến thức v&agrave; điều mới mẻ trong cuộc sống.</li>\n	<li>R&egrave;n luyện sự nhanh nhẹn, tỉ mỉ v&agrave; nhạy b&eacute;n</li>\n</ul>\n\n<h2><span style=\"color:#2980b9\"><strong>Trẻ học lập tr&igrave;nh Java c&oacute; kh&oacute; hay dễ</strong></span></h2>\n\n<p>Lập tr&igrave;nh Java l&agrave; kiến thức c&ocirc;ng nghệ v&ocirc; c&ugrave;ng hữu &iacute;ch, mang đến nhiều c&ocirc;ng dụng tuyệt vời cho sự ph&aacute;t triển to&agrave;n diện của trẻ. Tuy nhi&ecirc;n trẻ học lập tr&igrave;nh Java kh&oacute; hay dễ? L&agrave; thắc mắc của rất nhiều người, đặc biệt l&agrave; c&aacute;c bậc phụ huynh.</p>\n\n<p><strong>Học lập tr&igrave;nh Java kh&oacute; hay dễ?</strong></p>\n\n<p>Ng&ocirc;n ngữ lập tr&igrave;nh Java l&agrave; một ng&ocirc;n ngữ lập tr&igrave;nh bậc cao, sinh ra với mục ti&ecirc;u &ldquo;Viết một lần, thực thi mọi nơi&rdquo; hiện đang được ứng dụng trong nhiều lĩnh vực kh&aacute;c nhau. Chương tr&igrave;nh viết bằng phần mềm Java c&oacute; thể chạy tr&ecirc;n nhiều nền tảng kh&aacute;c nhau, đ&acirc;y ch&iacute;nh l&agrave; điểm mạnh vượt trội của Java so với những ng&ocirc;n ngữ cũ. V&igrave; vậy m&agrave; khiến cho ng&ocirc;n ngữ lập tr&igrave;nh Java ng&agrave;y c&agrave;ng trở n&ecirc;n phổ biến v&agrave; được y&ecirc;u th&iacute;ch đối với mọi lập tr&igrave;nh vi&ecirc;n tr&ecirc;n to&agrave;n thế giới.</p>\n\n<p>Theo c&aacute;c chuy&ecirc;n gia, Java l&agrave; một loại ng&ocirc;n ngữ lập tr&igrave;nh bậc cao với sự kế thừa v&agrave; ho&agrave;n thiện hơn so với những đ&agrave;n anh đi trước. V&igrave; vậy tuy c&oacute; c&uacute; ph&aacute;p dễ hiểu, khoa học nhưng được đ&aacute;nh gi&aacute; hơi kh&oacute; học so với Ruby hay Python. Nhưng chắc chắn rằng khi nắm được những kiến thức căn bản nhất của ng&ocirc;n ngữ lập tr&igrave;nh n&agrave;y chắc chắn việc ứng dụng của ch&uacute;ng v&agrave;o việc tạo ra c&aacute;c ứng dụng v&agrave; trang web trở n&ecirc;n v&ocirc; c&ugrave;ng nhanh ch&oacute;ng v&agrave; chắc chắn rằng việc chọn Java như một ng&ocirc;n ngữ lập tr&igrave;nh lần đầu để chinh phục sẽ l&agrave;m cho việc học bất kỳ ng&ocirc;n ngữ lập tr&igrave;nh n&agrave;o tiếp theo sẽ trở n&ecirc;n dễ d&agrave;ng hơn rất nhiều đối với cho trẻ.</p>\n\n<ul>\n</ul>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"602\" src=\"https://spec.edu.vn/client/image/a2.jpg\" width=\"500\" /></p>\n\n<p style=\"text-align:center\">Phương ph&aacute;p học tập l&agrave; yếu tố quyết định hiệu quả việc dạy lập tr&igrave;nh Java cho trẻ</p>\n\n<p><strong>B&iacute; quyết để trẻ học Java cơ bản được dễ d&agrave;ng hơn</strong></p>\n\n<p>Hiện nay, việc tự học Java l&agrave; điều kh&ocirc;ng hề xa lạ với nhiều người. Bởi với hệ thống kho t&agrave;ng tri thức rộng lớn th&igrave; bạn sẽ nhanh ch&oacute;ng t&igrave;m kiếm được c&aacute;c th&ocirc;ng tin cần thiết cho m&igrave;nh. Việc học lập tr&igrave;nh Java trở n&ecirc;n dễ d&agrave;ng với c&aacute;c loại gi&aacute;o tr&igrave;nh được b&agrave;y b&aacute;n rộng r&atilde;i, hay những blog tr&ecirc;n mạng x&atilde; hội hoặc học trực tuyến từ website của Java.</p>\n\n<p>Tuy nhi&ecirc;n, đối với đối tượng l&agrave; c&aacute;c bạn nhỏ trong độ tuổi từ 12-16 tuổi th&igrave; b&ecirc;n cạnh việc truyền đạt tri thức th&ocirc;ng qua c&aacute;c phương ph&aacute;p truyền thống th&igrave; để truyền niềm đam m&ecirc; v&agrave; sự hứng th&uacute; cho trẻ đối với bộ m&ocirc;n n&agrave;y cần c&oacute; những phương ph&aacute;p gi&aacute;o dục đặc biệt hơn. Cụ thể như:</p>\n\n<h2><span style=\"color:#2980b9\"><strong>SPEC- trung t&acirc;m dạy lập tr&igrave;nh Java uy t&iacute;n v&agrave; chuy&ecirc;n nghiệp cho trẻ em</strong></span></h2>\n\n<p>Học lập tr&igrave;nh Java ở đ&acirc;u uy t&iacute;n? l&agrave; điều m&agrave; c&aacute;c bậc phụ huynh v&agrave; đ&ocirc;ng đảo c&aacute;c bạn nhỏ v&ocirc; c&ugrave;ng quan t&acirc;m. Bởi hiện nay, sự xuất hiện tr&agrave;n lan của c&aacute;c trung t&acirc;m gi&aacute;o dục khiến cho kh&ocirc;ng &iacute;t kh&aacute;ch h&agrave;ng băn khoăn v&agrave; lo lắng. Đ&aacute;p ứng tất cả c&aacute;c ti&ecirc;u ch&iacute; về một đơn vị gi&aacute;o dục uy t&iacute;n với nhiều năm kinh nghiệm, SPEC thực sự l&agrave; trường dạy lập tr&igrave;nh cho b&eacute; uy t&iacute;n v&agrave; chuy&ecirc;n nghiệp. Chắc chắn rằng việc lựa chọn SPEC sẽ mang đến sự h&agrave;i l&ograve;ng tuyệt đối với mọi kh&aacute;ch h&agrave;ng.</p>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"400\" src=\"https://spec.edu.vn/client/image/a3.jpg\" width=\"600\" /></p>\n\n<p style=\"text-align:center\"><i>SPEC tự h&agrave;o l&agrave; địa chỉ dạy lập tr&igrave;nh cho trẻ tốt nhất Việt Nam</i></p>\n\n<p><strong>Phương ph&aacute;p gi&aacute;o dục ho&agrave;n hảo</strong></p>\n\n<p>Thực tế, phương ph&aacute;p gi&aacute;o dục được xem l&agrave; một trong những yếu tố h&agrave;ng đầu quyết định sự th&agrave;nh bại trong việc truyền đạt v&agrave; tiếp nhận kiến thức đến với người học. Đặc biệt l&agrave; với đối tượng đặc biệt l&agrave; trẻ em trong độ tuổi từ 12-16 th&igrave; cần c&oacute; những phương ph&aacute;p gi&aacute;o dục đặc biệt v&agrave; ph&ugrave; hợp với t&acirc;m sinh l&yacute;, nhận thức của trẻ.</p>\n\n<p>Thấu hiểu điều đ&oacute;, SPEC lu&ocirc;n kh&ocirc;ng ngừng cải tiến v&agrave; n&acirc;ng cao chất lượng giảng dạy ph&ugrave; hợp với đối tượng học tập kh&aacute;c nhau. SPEC kh&ocirc;ng chỉ dạy những kiến thức cơ bản v&agrave; n&acirc;ng cao về lập tr&igrave;nh Java m&agrave; c&ograve;n dẫn dắt, truyền cảm hứng cho trẻ để tạo ra những sản phẩm c&ocirc;ng nghệ chuy&ecirc;n nghiệp. H&agrave;nh tr&igrave;nh học Java cơ bản ở SPEC chắc chắn sẽ để lại ấn tượng s&acirc;u sắc với c&aacute;c bạn nhỏ bởi sẽ mang đến nhiều cung bậc cảm x&uacute;c kh&aacute;c nhau cho trẻ.</p>\n\n<p><strong>Đội ngũ gi&aacute;o vi&ecirc;n chuy&ecirc;n nghiệp</strong></p>\n\n<p>SPEC sở hữu đội ngũ gi&aacute;o vi&ecirc;n c&oacute; nhiều kinh nghiệm giảng dạy cũng như trong lĩnh vực c&ocirc;ng nghệ phần mềm, gi&agrave;u năng lượng v&agrave; rất t&acirc;m huyết với trẻ nhỏ. C&ugrave;ng với sự kết hợp giảng dạy tr&ecirc;n m&ocirc;i trường trực tuyến v&agrave; ngoại tuyến linh hoạt v&agrave; hiệu quả. Trung t&acirc;m cam kết sẽ đem đến những buổi học chất lượng nhưng kh&ocirc;ng hề nh&agrave;m ch&aacute;n, khơi dậy đam m&ecirc; lập tr&igrave;nh v&agrave; hứng th&uacute; b&ecirc;n trong c&aacute;c em nhỏ. Mỗi buổi học c&aacute;c em sẽ kh&ocirc;ng chỉ học những kiến thức l&yacute; thuyết kh&ocirc; khan m&agrave; c&ograve;n được c&aacute;c gi&aacute;o vi&ecirc;n giải đ&aacute;p thắc mắc, hướng dẫn cụ thể để &aacute;p dụng v&agrave;o thực tiễn.</p>\n\n<p><strong>Dịch vụ ho&agrave;n hảo</strong></p>\n\n<ul>\n	<li style=\"list-style-type:initial\">Dạy lập tr&igrave;nh Java cho trẻ em th&ocirc;ng qua c&aacute;c tr&ograve; chơi về khoa học. Từ đ&oacute;, k&iacute;ch th&iacute;ch sự đam m&ecirc; v&agrave; t&igrave;m t&ograve;i ở trẻ.</li>\n	<li style=\"list-style-type:initial\">Lu&ocirc;n động vi&ecirc;n, kh&iacute;ch lệ trẻ để b&eacute; c&oacute; động lực để học tập</li>\n	<li style=\"list-style-type:initial\">Tạo m&ocirc;i trường học tập l&agrave;nh mạnh để trẻ c&oacute; điều kiện giao lưu, học hỏi với những bạn c&oacute; c&ugrave;ng niềm đam m&ecirc;. Từ đ&oacute; gi&uacute;p trẻ lu&ocirc;n c&oacute; hứng th&uacute; trong việc học tập</li>\n	<li style=\"list-style-type:initial\">Mức học ph&iacute; phải chăng, ph&ugrave; hợp với mọi học sinh</li>\n	<li style=\"list-style-type:initial\">Trẻ được học thử miễn ph&iacute; 3 buổi đầu ti&ecirc;n, trước khi đăng k&yacute; c&aacute;c kh&oacute;a học ch&iacute;nh thức</li>\n	<li style=\"list-style-type:initial\">Thời gian học tập linh hoạt.</li>\n	<li style=\"list-style-type:initial\">Trung t&acirc;m c&oacute; h&igrave;nh thức học bảo lưu &ldquo;miễn ph&iacute;&rdquo; trong v&ograve;ng 1 năm cho đến khi trẻ nắm vững về Java.</li>\n</ul>\n\n<h2><strong>LỘ TR&Igrave;NH HỌC TẬP</strong></h2>\n\n<h3><strong><span style=\"color:#003163\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Học kỳ 1: L&agrave;m quen với java.</span></strong></h3>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"300\" src=\"https://spec.edu.vn/uploadfileimage/spec/giangvien/773408500java_ky1.svg\" width=\"600\" /></p>\n\n<h3><strong><span style=\"color:#003163\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Học kỳ 2: Lập tr&igrave;nh ứng dụng.</span></strong></h3>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"278\" src=\"https://spec.edu.vn/uploadfileimage/spec/giangvien/961420400java_ky2.svg\" width=\"600\" /></p>\n\n<h3 style=\"text-align:center\">&nbsp;</h3>\n</div>\n', '144 giờ (2 học kỳ ~ 24 tháng), 90\' mỗi buổi', '8 học phần từ thấp đến cao', 'java-core, java-tutorial,..', ' 14/7/2021', ' 14/7/2021', 'Khóa học lập trình Java Mobile SPEC', 'Lập trình Java Mobile là gì? Tại sao nên dạy lập trình Java Mobile cho trẻ ngay hôm nay? Hãy cùng tìm hiểu những thông tin hữu ích ngay sau đây nhé!', 'Lập trình Java Mobile, Java Mobile cơ bản, Java Mobile cho trẻ em, học lập trình Java Mobile, Java Mobile, game Java Mobile', 'index,follow', 10, b'1'),
(8, 'https://spec.edu.vn/client/image/images_Trang_Chu/31.jpg', 2000000, 2000000, 'Khóa học Python FullStack', b'1', 1, 'python', 'Thiếu Nhi', 8, 4, b'1', 'Quản lý version với Git, Configuration Management sử dụng Ansible + Terraform, Monitoring ứng dụng với Prometheus + Grafana', '2021-05-06', '7-12', 20, 1, '<h1><strong><span style=\"color:#003163\">Lập tr&igrave;nh Python l&agrave; g&igrave;? Tại sao n&ecirc;n dạy lập tr&igrave;nh cho trẻ ngay h&ocirc;m nay</span></strong></h1>\n\n<p>&emsp;Lập tr&igrave;nh Python l&agrave; g&igrave;? Tại sao n&ecirc;n dạy lập tr&igrave;nh Python cho trẻ ngay h&ocirc;m nay? H&atilde;y c&ugrave;ng t&igrave;m hiểu những th&ocirc;ng tin hữu &iacute;ch ngay sau đ&acirc;y nh&eacute;!</p>\n\n<div>12 th&aacute;ng 03, 2021</div>\n\n<div>\n<h2>Dạy cho trẻ về ng&ocirc;n ngữ lập tr&igrave;nh Python</h2>\n\n<p style=\"text-align:center\">&emsp;Python l&agrave; ng&ocirc;n ngữ lập tr&igrave;nh quen thuộc d&ugrave;ng để ph&aacute;t triển website v&agrave; c&aacute;c ứng dụng c&ocirc;ng nghệ kh&aacute;c. Vậy Lập tr&igrave;nh Python l&agrave; g&igrave;? Tại sao n&ecirc;n dạy lập tr&igrave;nh Python cho trẻ ngay h&ocirc;m nay? H&atilde;y c&ugrave;ng kh&aacute;m ph&aacute; những th&ocirc;ng tin hữu &iacute;ch qua b&agrave;i viết sau đ&acirc;y nh&eacute;&nbsp;<img alt=\"\" height=\"311\" src=\"https://itrainkids.vn/wp-content/uploads/2020/05/khoa-hoc-lap-trinh-python-cho-tre-em.jpg\" width=\"627\" /></p>\n\n<p>&nbsp;</p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:center\">Dạy lập tr&igrave;nh Python cho trẻ đang l&agrave; xu hướng tại c&aacute;c quốc gia ti&ecirc;n tiến tr&ecirc;n thế giới</p>\n\n<h2>Lập tr&igrave;nh Python l&agrave; g&igrave;?</h2>\n\n<p>&emsp;Python l&agrave; một ng&ocirc;n ngữ lập tr&igrave;nh bậc cao v&agrave; v&ocirc; c&ugrave;ng quen thuộc đối với những người y&ecirc;u c&ocirc;ng nghệ. Ng&ocirc;n ngữ n&agrave;y được s&aacute;ng tạo bởi Guido van Rossum v&agrave; lần đầu c&ocirc;ng bố v&agrave;o năm 1991.</p>\n\n<ul>\n</ul>\n\n<p style=\"text-align:center\"><img alt=\"\" height=\"602\" src=\"http://spec.edu.vn/client/image/a7.jpg\" width=\"500\" /></p>\n\n<p style=\"text-align:center\">Python l&agrave; ng&ocirc;n ngữ lập tr&igrave;nh bậc cao được sử dụng rộng r&atilde;i tr&ecirc;n thế giới</p>\n\n<h2>L&yacute; do ng&ocirc;n ngữ lập tr&igrave;nh Python được y&ecirc;u th&iacute;ch tr&ecirc;n to&agrave;n thế giới</h2>\n\n<p>&emsp;L&agrave; một trong những ng&ocirc;n ngữ lập tr&igrave;nh được y&ecirc;u th&iacute;ch nhất tr&ecirc;n thế giới hiện nay, lập tr&igrave;nh Python chiếm được cảm t&igrave;nh của đ&ocirc;ng đảo kh&aacute;ch h&agrave;ng bởi những ưu điểm như:</p>\n\n<ul>\n	<li>Đơn giản, dễ học. Bởi vậy lập tr&igrave;nh Python ho&agrave;n to&agrave;n ph&ugrave; hợp với tất cả mọi người kể cả những người mới bắt đầu v&agrave; việc tự học Python thực sự l&agrave; điều kh&ocirc;ng qu&aacute; kh&oacute; khăn.&nbsp;</li>\n	<li>K&iacute;ch th&iacute;ch sự ph&aacute;t triển tư duy, t&iacute;nh logic ở trẻ. V&igrave; vậy m&agrave; hỗ trợ tốt trong việc học tập v&agrave; giải quyết c&aacute;c b&agrave;i tập tr&ecirc;n lớp của trẻ&nbsp;</li>\n	<li>Python l&agrave; ng&ocirc;n ngữ m&atilde; nguồn mở ho&agrave;n to&agrave;n miễn ph&iacute; mang đến nhiều tiện &iacute;ch cho người sử dụng</li>\n	<li>Ứng dụng rộng r&atilde;i trong cuộc sống. Thực tế, lập tr&igrave;nh Python đ&atilde; v&agrave; đang v&ocirc; c&ugrave;ng phổ biến tr&ecirc;n khắp thế giới với những ứng dụng hữu &iacute;ch như: ph&aacute;t triển c&aacute;c website v&agrave; c&aacute;c nền tảng c&ocirc;ng nghệ kh&aacute;c; ứng dụng trong machine learning; ứng dụng trong giảng dạy; ph&acirc;n t&iacute;ch dữ liệu; ph&aacute;t triển game,&hellip;.</li>\n	<li style=\"text-align:center\">&nbsp;</li>\n</ul>\n\n<h2>L&yacute; do n&ecirc;n học lập tr&igrave;nh Python ngay h&ocirc;m nay</h2>\n\n<p>&emsp;Việc học c&aacute;c ng&ocirc;n ngữ lập tr&igrave;nh đ&atilde; v&agrave; đang trở n&ecirc;n ng&agrave;y c&agrave;ng phổ biến tr&ecirc;n thế giới. Đặc biệt tại c&aacute;c quốc gia ph&aacute;t triển tr&ecirc;n thế giới, học Python đ&atilde; được đưa v&agrave;o chương tr&igrave;nh gi&aacute;o dục phổ th&ocirc;ng. V&agrave; tại Việt Nam trong những năm gần đ&acirc;y, việc dạy lập tr&igrave;nh cho trẻ n&oacute;i chung v&agrave; dạy Python n&oacute;i ri&ecirc;ng cũng nhận được quan t&acirc;m của đ&ocirc;ng đảo mọi người v&agrave; đang l&agrave; xu hướng tất yếu. Bởi c&aacute;c nh&agrave; khoa học đ&atilde; chứng minh được những lợi &iacute;ch tuyệt vời của bộ m&ocirc;n n&agrave;y đối với sự ph&aacute;t triển to&agrave;n diện của trẻ</p>\n\n<ul>\n	<li style=\"list-style-type:initial\">Ph&aacute;t triển tư duy logic, sự s&aacute;ng tạo ở trẻ</li>\n	<li style=\"list-style-type:initial\">R&egrave;n luyện t&iacute;nh ki&ecirc;n tr&igrave; v&agrave; tỉ mỉ trong cuộc sống</li>\n	<li style=\"list-style-type:initial\">Tăng khả năng l&agrave;m việc hiệu quả, đặc biệt l&agrave; l&agrave;m việc nh&oacute;m</li>\n	<li style=\"list-style-type:initial\">R&egrave;n luyện khả năng thuyết tr&igrave;nh, giải th&iacute;ch dễ hiểu, khoa học</li>\n</ul>\n\n<p style=\"text-align:center\"><img alt=\"\" height=\"358\" src=\"https://process.filepicker.io/APHE465sSbqvbOIStdwTyz/rotate=deg:exif/resize=fit:crop,height:566,width:944/output=quality:80,compress:true,strip:true,format:jpg/cache=expiry:max/https://cdn.filestackcontent.com/MLxm2QepS86On3dKzo8v\" width=\"598\" /></p>\n\n<p style=\"text-align:center\">Phương ph&aacute;p học tập l&agrave; yếu tố quyết định hiệu quả việc dạy lập tr&igrave;nh cho trẻ</p>\n\n<h2>Học lập tr&igrave;nh Python như thế n&agrave;o để đem lại hiệu quả tối ưu?</h2>\n\n<p style=\"text-align:center\">&emsp;Ch&iacute;nh v&igrave; sự phổ biến của ng&ocirc;n ngữ lập tr&igrave;nh Python trong cuộc sống m&agrave; hiện nay việc học Python đang l&agrave; chủ đề được rất nhiều người quan t&acirc;m. Tuy được c&aacute;c chuy&ecirc;n gia đ&aacute;nh gi&aacute; l&agrave; ng&ocirc;n ngữ lập tr&igrave;nh đơn giản, dễ học, dễ nhớ nhưng để c&oacute; thể nhanh ch&oacute;ng tiếp cận với những kiến thức cơ bản v&agrave; sử dụng th&agrave;nh thạo Python bạn vẫn cần c&oacute; những phương ph&aacute;p học tập khoa học v&agrave; hiệu quả</p>\n\n<p>Tự học Python cơ bản ngay tại nh&agrave;</p>\n\n<p>&emsp;Với sự ph&aacute;t triển mạnh mẽ của c&ocirc;ng nghệ 4.0 th&igrave; hiện nay việc t&igrave;m kiếm kho t&agrave;ng tri thức trở n&ecirc;n đơn giản v&agrave; dễ d&agrave;ng hơn đối với tất cả mọi người. Ch&iacute;nh v&igrave; vậy, bạn ho&agrave;n to&agrave;n c&oacute; thể tự học Python cơ bản ngay tại nh&agrave;. Nguồn t&agrave;i liệu phong ph&uacute; đa dạng từ s&aacute;ch, b&aacute;o, internet hay c&aacute;c clip được chia sẻ rộng r&atilde;i tr&ecirc;n c&aacute;c trang mạng x&atilde; hội thực sự l&agrave; th&ocirc;ng tin hữu &iacute;ch d&agrave;nh cho bạn. Tuy nhi&ecirc;n, việc tự học cũng sẽ c&oacute; khiến bạn gặp kh&aacute; nhiều kh&oacute; khăn trong việc lựa chọn v&agrave; chắt lọc th&ocirc;ng tin ch&iacute;nh x&aacute;c nhất phục vụ việc học tập được hiệu quả v&agrave; nhanh ch&oacute;ng hơn</p>\n\n<p style=\"text-align:center\"><img alt=\"\" height=\"439\" src=\"http://spec.edu.vn/client/image/a8.jpg\" width=\"780\" /></p>\n\n<p style=\"text-align:center\">Học lập tr&igrave;nh Python từ cơ bản đến n&acirc;ng cao l&agrave; điều được kh&aacute;ch h&agrave;ng quan t&acirc;m</p>\n\n<p>Tự học Python với người kh&aacute;c</p>\n\n<p>&emsp;Để tạo n&ecirc;n kh&ocirc;ng kh&iacute; học tập s&ocirc;i nổi v&agrave; cởi mở bạn ho&agrave;n to&agrave;n c&oacute; thể học Python với bạn b&egrave;, người th&acirc;n. Những kiến thức được chia sẻ li&ecirc;n tục gi&uacute;p việc học tập được hiệu quả hơn bao giờ hết. Đồng thời, bạn ho&agrave;n to&agrave;n c&oacute; thể biết được những lỗ hổng kiến thức của bạn th&acirc;n để kịp thời bổ sung v&agrave; điều chỉnh ph&ugrave; hợp. Tuy nhi&ecirc;n, phương ph&aacute;p n&agrave;y được đ&aacute;nh gi&aacute; ph&ugrave; hợp hơn cả đối với những người đ&atilde; c&oacute; những kiến thức lập tr&igrave;nh Python cơ bản m&agrave; th&ocirc;i.</p>\n\n<p>Kh&oacute;a học Python chuy&ecirc;n nghiệp</p>\n\n<p>&emsp;Khắc phục ho&agrave;n to&agrave;n những kh&oacute; khăn trong việc tự học python cơ bản, hiện nay nhiều kh&oacute;a học Python chuy&ecirc;n nghiệp đ&atilde; mang đến cho người học phương ph&aacute;p học tập khoa học v&agrave; hiệu quả nhất. Đến với c&aacute;c trung t&acirc;m bạn sẽ được trang bị những kiến thức về ng&ocirc;n ngữ lập tr&igrave;nh Python từ cơ bản đến n&acirc;ng cao. C&aacute;c b&agrave;i giảng được thiết kế đảm bảo mang đến cho người học, kể cả c&aacute;c bạn thanh thiếu nhi c&oacute; thể dễ d&agrave;ng tiếp thu những kiến thức cần thiết v&agrave; ch&iacute;nh x&aacute;c nhất. Đồng thời tại c&aacute;c trung t&acirc;m cũng tạo n&ecirc;n m&ocirc;i trường học tập năng động, l&agrave;nh mạnh để c&aacute;c bạn c&oacute; thể cởi mở học hỏi v&agrave; khẳng định bản th&acirc;n. Ch&iacute;nh v&igrave; vậy, tất cả mọi người, kể cả trẻ em từ 12-16 tuổi đều c&oacute; thể dễ d&agrave;ng nắm chắc được những kiến thức về Python nhanh ch&oacute;ng với sự hướng dẫn của c&aacute;c trung t&acirc;m chuy&ecirc;n nghiệp c&ugrave;ng sự đồng h&agrave;nh của c&aacute;c bậc phụ huynh.</p>\n\n<h2>Lựa chọn học Python tại SPEC</h2>\n\n<p>&emsp;Hiện nay, việc t&igrave;m kiếm một kh&oacute;a học Python kh&aacute; đơn giản. Bởi kh&aacute; nhiều trung t&acirc;m tr&ecirc;n khắp cả nước cung cấp dịch vụ hữu &iacute;ch n&agrave;y. Tuy nhi&ecirc;n, với kinh nghiệm v&agrave; uy t&iacute;n l&acirc;u năm trong lĩnh vực gi&aacute;o dục hiện nay, SPEC thực sự l&agrave; một trong những địa chỉ m&agrave; c&aacute;c bậc phụ huynh v&agrave; c&aacute;c em học sinh kh&ocirc;ng n&ecirc;n bỏ qua bởi những điểm nổi bật như:</p>\n\n<p>Đội ngũ giảng vi&ecirc;n chuy&ecirc;n nghiệp</p>\n\n<p>&emsp;Trung t&acirc;m SPEC với đội ngũ gi&aacute;o vi&ecirc;n nhiệt t&igrave;nh, trẻ trung, v&agrave; t&acirc;m huyết với trẻ, c&oacute; nhiều năm kinh nghiệm giảng dạy. Mỗi buổi học c&oacute; &iacute;t nhất 2 gi&aacute;o vi&ecirc;n v&agrave; trợ giảng, giải đ&aacute;p c&aacute;c thắc mắc, đảm bảo hướng dẫn tỉ mỉ từng thao t&aacute;c cho trẻ. V&igrave; vậy m&agrave; gi&uacute;p c&aacute;c bạn nhanh ch&oacute;ng lĩnh hội được c&aacute;c kiến thức cần thiết trong việc học v&agrave; ứng dụng ng&ocirc;n ngữ lập tr&igrave;nh Python v&agrave;o cuộc sống.</p>\n\n<p style=\"text-align:center\"><img alt=\"\" height=\"335\" src=\"http://spec.edu.vn/client/image/a9.jpg\" width=\"640\" /></p>\n\n<p style=\"text-align:center\">SPEC tự h&agrave;o l&agrave; địa chỉ dạy lập tr&igrave;nh cho trẻ tốt nhất Việt Nam</p>\n\n<p>Đội ngũ giảng vi&ecirc;n chuy&ecirc;n nghiệp</p>\n\n<p>&emsp;Với mỗi đối tượng học kh&aacute;c nhau, c&aacute;c giảng vi&ecirc;n chuy&ecirc;n nghiệp tại SPEC lại c&oacute; những phương ph&aacute;p giảng dạy ph&ugrave; hợp để đem lại được hiệu quả cao nhất. Đặc biệt với kh&oacute;a học ng&ocirc;n ngữ lập tr&igrave;nh Python, c&aacute;c giảng vi&ecirc;n sẽ kết hợp việc vừa học vừa chơi v&ocirc; c&ugrave;ng bổ &iacute;ch. C&aacute;c kiến thức lập tr&igrave;nh sẽ được kh&eacute;o l&eacute;o đưa v&agrave;o c&aacute;c v&iacute; dụ gần gũi v&agrave; quen thuộc. Từ đ&oacute; gi&uacute;p c&aacute;c b&eacute; nhanh ch&oacute;ng tiếp thu được những kiến thức cần thiết nhất.Việc học ng&ocirc;n ngữ lập tr&igrave;nh tại SPEC thực sự c&ograve;n c&oacute; t&iacute;nh ứng dụng rất cao, gi&uacute;p ph&aacute;t triển tư duy logic, sự s&aacute;ng tạo ho&agrave;n hảo. Từ đ&oacute; m&agrave; b&eacute; c&oacute; thể giải quyết nhanh ch&oacute;ng hơn c&aacute;c b&agrave;i tập tr&ecirc;n lớp, đồng thời c&oacute; những kỹ năng mềm cần thiết trong học tập v&agrave; cuộc sống.</p>\n\n<p>Dịch vụ ho&agrave;n hảo</p>\n\n<ul>\n	<li style=\"list-style-type:initial\">Mức học ph&iacute; phải chăng, ph&ugrave; hợp với mọi học sinh</li>\n	<li style=\"list-style-type:initial\">Trẻ được học thử miễn ph&iacute; 3 buổi đầu ti&ecirc;n, trước khi đăng k&yacute; c&aacute;c kh&oacute;a học ch&iacute;nh thức</li>\n	<li style=\"list-style-type:initial\">Thời gian học tập linh hoạt.</li>\n	<li style=\"list-style-type:initial\">Trung t&acirc;m c&oacute; h&igrave;nh thức học bảo lưu &ldquo;miễn ph&iacute;&rdquo; trong v&ograve;ng 1 năm cho đến khi trẻ nắm vững về Java.</li>\n</ul>\n\n<p>&nbsp;</p>\n\n<h2><strong>LỘ TR&Igrave;NH HỌC TẬP</strong></h2>\n\n<h2>&nbsp;</h2>\n\n<h2 style=\"text-align:center\"><img alt=\"\" height=\"698\" src=\"https://spec.edu.vn/uploadfileimage/spec/giangvien/78795100python.svg\" width=\"865\" /></h2>\n\n<p>&nbsp;</p>\n</div>\n', '144 giờ (2 học kỳ ~ 24 tháng), 90\' mỗi buổi', '8 học phần từ thấp đến cao', 'java-core, java-tutorial,..', ' 14/7/2021', ' 14/7/2021', 'Khóa học lập trình Python FullStack SPEC', 'Lập trình Python FullStack là gì? Tại sao nên dạy lập trình Python FullStack cho trẻ ngay hôm nay? Hãy cùng tìm hiểu những thông tin hữu ích ngay sau đây nhé!', 'Lập trình Python FullStack, Python FullStack, Python FullStack cho trẻ em, học lập trình Python FullStack, Python FullStack', 'index,follow', 0, b'1'),
(9, 'https://spec.edu.vn/client/image/images_Trang_Chu/11.jpg', 2000000, 2000000, 'Khóa học Web Fontend + ReactJS', b'1', 1, 'khoa-hoc-lap-trinh-web', 'Doanh Nghiệp', 8, 1, b'1', 'Đào tạo học viên  kỹ năng và kinh nghiệm xây giao diện Web và sử dụng framework ReactJS + jQuery kết hợp CSS, Bootstrap', '2021-05-06', '7-12', 20, 1, '<h1><span style=\"font-family:&quot;Open Sans&quot;,sans-serif; font-size:2rem\">Dạy cho trẻ về ng&ocirc;n ngữ lập tr&igrave;nh Web FullStack</span></h1>\n\n<h1>&nbsp;</h1>\n\n<div>\n<p>Dạy lập tr&igrave;nh cho trẻ đang l&agrave; xu hướng tất yếu trong thời đại c&ocirc;ng nghệ 4.0 hiện nay. Tuy nhi&ecirc;n lập tr&igrave;nh web l&agrave; g&igrave;? Dạy lập tr&igrave;nh cho trẻ n&ecirc;n bắt đầu từ đ&acirc;u?...Mọi thắc mắc về vấn đề n&oacute;ng bỏng n&agrave;y sẽ được giải đ&aacute;p chi tiết qua b&agrave;i viết dưới đ&acirc;y.&nbsp;</p>\n</div>\n\n<h2>Lập tr&igrave;nh web l&agrave; g&igrave;?</h2>\n\n<h1>&nbsp;</h1>\n\n<div>\n<p>Lập tr&igrave;nh web l&agrave; một c&ocirc;ng đoạn v&ocirc; c&ugrave;ng quan trọng trong việc x&acirc;y dựng n&ecirc;n một website. Lập tr&igrave;nh web l&agrave; việc chuyển to&agrave;n bộ dữ liệu do bộ phận thiết kế web l&agrave;m th&agrave;nh một hệ thống website ho&agrave;n chỉnh.</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"https://topdev.vn/blog/wp-content/uploads/2019/08/the-nao-la-mot-lap-trinh-vien-full-stack.png\" width=\"660\" /></p>\n\n<ul>\n</ul>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:center\">Lập tr&igrave;nh web l&agrave; c&ocirc;ng việc kh&ocirc;ng c&ograve;n xa lạ trong thời đại c&ocirc;ng nghệ 4.0</p>\n\n<p>Nhiều người thường nhầm lẫn kh&aacute;i niệm lập tr&igrave;nh web với thiết kế web. Tuy nhi&ecirc;n c&oacute; thể n&oacute;i đ&acirc;y l&agrave; hai c&ocirc;ng việc kh&aacute;c biệt nhưng c&oacute; mối quan hệ v&ocirc; c&ugrave;ng gắn b&oacute; v&agrave; gần gũi để tạo n&ecirc;n một website. Hiện nay, việc lập tr&igrave;nh đ&atilde; kh&ocirc;ng c&ograve;n l&agrave; điều xa lạ đối với mọi người. Đặc biệt h&igrave;nh ảnh một bạn nhỏ say sưa viết code l&agrave; điều kh&ocirc;ng qu&aacute; mới mẻ trong cuộc sống hiện đại. V&agrave; một trong những nội dung được c&aacute;c b&eacute; y&ecirc;u th&iacute;ch nhất l&agrave; l&agrave; lập tr&igrave;nh web, lập tr&igrave;nh Java web,...</p>\n</div>\n\n<h2>Học lập tr&igrave;nh web v&agrave; những lợi &iacute;ch d&agrave;nh cho trẻ</h2>\n\n<h1>&nbsp;</h1>\n\n<div>\n<p>Thực tế, học lập tr&igrave;nh web c&oacute; thực sự chỉ đ&aacute;p ứng nhu cầu giải tr&iacute; của trẻ. Thực tế đ&atilde; chứng minh, việc học c&aacute;c ng&ocirc;n ngữ lập tr&igrave;nh mang đến rất nhiều lợi &iacute;ch tuyệt vời</p>\n</div>\n\n<p>Th&uacute;c đẩy khả năng tư duy v&agrave; tr&iacute; s&aacute;ng tạo ở trẻ</p>\n\n<h1>&nbsp;</h1>\n\n<div>\n<p>L&agrave; một m&ocirc;n khoa học, việc học ng&ocirc;n ngữ lập tr&igrave;nh gi&uacute;p trẻ r&egrave;n luyện tư duy logic, sự s&aacute;ng tạo kh&ocirc;ng ngừng trong học tập v&agrave; cuộc sống. B&eacute; sẽ lu&ocirc;n mong muốn được t&igrave;m hiểu v&agrave; kh&ocirc;ng ngừng kh&aacute;m ph&aacute; những điều mới mẻ. Ch&iacute;nh v&igrave; vậy m&agrave; trẻ kh&ocirc;ng chỉ n&acirc;ng cao khả năng giải quyết c&aacute;c b&agrave;i tập tr&ecirc;n lớp, đồng thời c&ograve;n v&ocirc; c&ugrave;ng nhạy b&eacute;n v&agrave; linh hoạt trong mọi vấn đề.</p>\n\n<p style=\"text-align:center\"><img alt=\"\" height=\"398\" src=\"https://nguyenvanhieu.vn/wp-content/uploads/2018/08/hoc-lap-trinh-web-thi-phai-bat-%C4%91au-tu-dau.jpg\" width=\"664\" /></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:center\">Dạy lập tr&igrave;nh web cho trẻ l&agrave; xu hướng tại c&aacute;c quốc gia ph&aacute;t triển</p>\n</div>\n\n<p>C&oacute; cơ hội được kh&aacute;m ph&aacute; thế giới rộng lớn xung quanh</p>\n\n<h1>&nbsp;</h1>\n\n<div>\n<p>Kh&ocirc;ng thể phủ nhận được những lợi &iacute;ch tuyệt vời của internet khi mang đến cho con người kho t&agrave;ng tri thức rộng lớn. D&ugrave; ở bất cứ nơi đ&acirc;u bạn cũng c&oacute; thể dễ d&agrave;ng tiếp cận được. Đối với những bạn nhỏ sớm được học lập tr&igrave;nh web th&igrave; sẽ l&agrave;m gia tăng cơ hội được tiếp thu những tinh hoa nh&acirc;n loại nhanh ch&oacute;ng hơn bao giờ hết</p>\n</div>\n\n<p>Gi&uacute;p trẻ tự tin trong m&ocirc;i trường học tập tại nước ngo&agrave;i</p>\n\n<h1>&nbsp;</h1>\n\n<div>\n<p>Thực tế, việc tiếp cận sớm với ng&ocirc;n ngữ lập tr&igrave;nh thực sự mang đến cho trẻ nền tảng cơ bản, gi&uacute;p trẻ vươn cao, vươn xa hơn trong cuộc sống. Đặc biệt sẽ mang lại sự tự tin hơn cho c&aacute;c bạn khi đi du học tại c&aacute;c quốc gia ph&aacute;t triển tr&ecirc;n thế giới.</p>\n</div>\n\n<p>Tạo ra cơ hội việc l&agrave;m triển vọng trong tương lai</p>\n\n<h1>&nbsp;</h1>\n\n<div>\n<p>Trong thời đại khoa học c&ocirc;ng nghệ ph&aacute;t triển vượt bậc như hiện nay th&igrave; việc cho trẻ tiếp cận sớm với c&ocirc;ng nghệ th&ocirc;ng tin n&oacute;i chung v&agrave; lập tr&igrave;nh web n&oacute;i ri&ecirc;ng sẽ g&oacute;p phần tạo n&ecirc;n nguồn nh&acirc;n lực chất lượng cao trong tương lai, đ&aacute;p ứng y&ecirc;u cầu ng&agrave;y c&agrave;ng khắt khe của cuộc sống hiện đại. Ch&iacute;nh v&igrave; những lợi &iacute;ch tuyệt vời tr&ecirc;n m&agrave; ng&agrave;y c&agrave;ng c&oacute; nhiều bậc phụ huynh quan t&acirc;m nhiều hơn đến việc dạy lập tr&igrave;nh cho trẻ. V&agrave; xu hướng n&agrave;y tại Việt Nam cũng kh&ocirc;ng phải l&agrave; điều ngoại lệ</p>\n</div>\n\n<h2>Những điều cần lưu &yacute; trong việc dạy lập tr&igrave;nh cho b&eacute;</h2>\n\n<h1>&nbsp;</h1>\n\n<div>\n<p>Việc dạy lập tr&igrave;nh cho trẻ n&oacute;i chung v&agrave; dạy lập tr&igrave;nh web n&oacute;i ri&ecirc;ng l&agrave; vấn đề đang thu h&uacute;t nhiều sự quan t&acirc;m của đ&ocirc;ng đảo c&aacute;c bậc phụ huynh. Tuy nhi&ecirc;n, l&agrave;m sao để việc dạy v&agrave; học thực sự đem lại hiệu quả tối ưu.</p>\n\n<ul>\n</ul>\n</div>\n\n<p>Độ tuổi dạy lập tr&igrave;nh cho trẻ th&iacute;ch hợp nhất</p>\n\n<h1>&nbsp;</h1>\n\n<div>\n<p>Việc học lập tr&igrave;nh web ngay từ nhỏ l&agrave; vấn đề được nhiều phụ huynh quan t&acirc;m. Tuy nhi&ecirc;n độ tuổi th&iacute;ch hợp nhất l&agrave; bao nhi&ecirc;u? Thực tế, c&aacute;c chuy&ecirc;n gia khuy&ecirc;n bạn n&ecirc;n cho trẻ tiếp cận với ng&ocirc;n ngữ lập tr&igrave;nh khi trẻ đ&atilde; biết đọc. Đặc biệt độ tuổi từ 12-16 được xem l&agrave; thời điểm v&agrave;ng m&agrave; những bậc l&agrave;m cha mẹ kh&ocirc;ng n&ecirc;n bỏ qua. Bởi đ&acirc;y ch&iacute;nh l&agrave; giai đoạn m&agrave; bộ n&atilde;o của b&eacute; ph&aacute;t triển ho&agrave;n thiện, đồng thời trẻ sẽ c&oacute; khả năng tiếp thu kiến thức nhanh nhạy nhất.</p>\n\n<p style=\"text-align:center\"><img alt=\"\" height=\"427\" src=\"https://spec.edu.vn/uploadfileimage/spec/baiviet/910908000a12.png\" width=\"641\" /></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:center\">Học lập tr&igrave;nh web sớm mang lại nhiều lợi &iacute;ch đối với trẻ</p>\n\n<ul>\n</ul>\n</div>\n\n<p>Dạy lập tr&igrave;nh cho trẻ v&agrave; những điều cần biết</p>\n\n<h1>&nbsp;</h1>\n\n<div>\n<p>L&agrave; đối tượng học tập đặc biệt với những đặc điểm t&acirc;m sinh l&yacute; ri&ecirc;ng biệt, ch&iacute;nh v&igrave; vậy m&agrave; để trẻ c&oacute; học tập hiệu quả nhất, c&aacute;c bậc phụ huynh n&ecirc;n lưu &yacute;:</p>\n\n<ul>\n	<li style=\"list-style-type:initial\">Trang bị những kiến thức về to&aacute;n học v&agrave; tiếng anh cho b&eacute; trước khi học lập tr&igrave;nh web để b&eacute; nhanh ch&oacute;ng tiếp thu v&agrave; nắm bắt được những kiến thức cơ bản v&agrave; dễ d&agrave;ng &aacute;p dụng ch&uacute;ng trong thực tế</li>\n	<li style=\"list-style-type:initial\">Lu&ocirc;n động vi&ecirc;n, kh&iacute;ch lệ trẻ lu&ocirc;n tự tin v&agrave; chủ động trong qu&aacute; tr&igrave;nh học tập</li>\n	<li style=\"list-style-type:initial\">C&oacute; phương ph&aacute;p học tập khoa học, những vẫn đảm bảo c&oacute; được những giờ học tập vui vẻ v&agrave; thoải m&aacute;i nhất</li>\n	<li style=\"list-style-type:initial\">Tạo m&ocirc;i trường học tập l&agrave;nh mạnh v&agrave; s&ocirc;i nổi để trẻ c&oacute; thể thoải m&aacute;i s&aacute;ng tạo v&agrave; kh&aacute;m ph&aacute;</li>\n	<li style=\"list-style-type:initial\">B&ecirc;n cạnh việc hướng dẫn trẻ tự học ở nh&agrave; th&ocirc;ng qua s&aacute;ch vở, clip tr&ecirc;n mạng,...n&ecirc;n đăng k&yacute; những kh&oacute;a học lập tr&igrave;nh web, lập tr&igrave;nh web Java,...cho trẻ. Với sự chuy&ecirc;n nghiệp trong giảng dạy đ&acirc;y sẽ l&agrave; m&ocirc;i trường gi&uacute;p trẻ tiếp cận được với những kiến thức b&agrave;i bản v&agrave; khoa học nhất. Từ đ&oacute; gi&uacute;p việc học tập trở n&ecirc;n dễ d&agrave;ng v&agrave; hiệu quả hơn</li>\n</ul>\n</div>\n\n<h2>Địa chỉ trường dạy lập tr&igrave;nh web tốt nhất cho trẻ tại Việt Nam</h2>\n\n<h1>&nbsp;</h1>\n\n<div>\n<p>Học lập tr&igrave;nh web ở đ&acirc;u tốt nhất l&agrave; c&acirc;u hỏi kh&ocirc;ng hề đơn giản. Bởi hiện nay, c&aacute;c trung t&acirc;m, trường dạy về lĩnh vực n&agrave;y đang ph&aacute;t triển nhanh ch&oacute;ng, đem đến nhiều lựa chọn cho phụ huynh v&agrave; c&aacute;c em học sinh. Tuy nhi&ecirc;n, để gi&uacute;p b&eacute; c&oacute; thể tiếp cận được với những kiến thức về lập tr&igrave;nh Web b&agrave;i bản nhất, cha mẹ n&ecirc;n lựa chọn cho con em m&igrave;nh những địa chỉ uy t&iacute;n, được đ&ocirc;ng đảo c&aacute;c bạn học vi&ecirc;n y&ecirc;u th&iacute;ch v&agrave; đ&aacute;nh gi&aacute; cao. V&agrave; SPEC l&agrave; một trong những c&aacute;i t&ecirc;n quen thuộc m&agrave; c&aacute;c bạn kh&ocirc;ng n&ecirc;n bỏ qua</p>\n\n<ul>\n</ul>\n</div>\n\n<p>Đội ngũ giảng vi&ecirc;n chuy&ecirc;n nghiệp</p>\n\n<h1>&nbsp;</h1>\n\n<div>\n<p>Trung t&acirc;m SPEC với đội ngũ gi&aacute;o vi&ecirc;n nhiệt t&igrave;nh, trẻ trung, v&agrave; t&acirc;m huyết với trẻ, c&oacute; nhiều năm kinh nghiệm giảng dạy. Mỗi buổi học c&oacute; &iacute;t nhất 2 gi&aacute;o vi&ecirc;n v&agrave; trợ giảng, giải đ&aacute;p c&aacute;c thắc mắc, đảm bảo hướng dẫn tỉ mỉ từng thao t&aacute;c cho trẻ. V&igrave; vậy m&agrave; gi&uacute;p c&aacute;c bạn nhanh ch&oacute;ng lĩnh hội được c&aacute;c kiến thức cần thiết trong việc học v&agrave; ứng dụng ng&ocirc;n ngữ lập tr&igrave;nh Python v&agrave;o cuộc sống.</p>\n\n<p style=\"text-align:center\"><img alt=\"\" height=\"442\" src=\"https://resources.mindx.edu.vn/uploads/images/30546210477_ae6e29cdbe_o.jpg\" width=\"664\" /></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:center\">Chọn những địa chỉ uy t&iacute;n để trang bị cho trẻ kiến thức nền tảng vững chắc</p>\n\n<ul>\n</ul>\n</div>\n\n<p>Gi&aacute;o tr&igrave;nh đạt chuẩn quốc tế</p>\n\n<h1>&nbsp;</h1>\n\n<div>\n<p>SPEC tự h&agrave;o khi c&oacute; chương tr&igrave;nh giảng dạy đạt ti&ecirc;u chuẩn quốc tế. C&aacute;c nội dung học về lập tr&igrave;nh web từ cơ bản đến n&acirc;ng cao được lựa chọn cẩn thận v&agrave; tỉ mỉ nhất. Từ đ&oacute; gi&uacute;p c&aacute;c bạn nhỏ lu&ocirc;n nắm được c&aacute;c kiến thức nền tảng chuẩn mực. Đ&acirc;y l&agrave; điều m&agrave; kh&ocirc;ng phải trung t&acirc;m c&ocirc;ng nghệ th&ocirc;ng tin n&agrave;o tại Việt Nam cũng c&oacute; thể l&agrave;m được</p>\n\n<ul>\n</ul>\n</div>\n\n<p>Phương ph&aacute;p học tập khoa học, hiệu quả</p>\n\n<h1>&nbsp;</h1>\n\n<div>\n<p>Đối với mỗi đối tượng học vi&ecirc;n, SPEC sẽ &aacute;p dụng những phương ph&aacute;p học tập th&iacute;ch hợp nhất. Đặc biệt đối với kh&oacute;a học lập tr&igrave;nh web cho đối tượng học vi&ecirc;n từ 12-16 tuổi, c&aacute;c gi&aacute;o vi&ecirc;n chuy&ecirc;n nghiệp tại trung t&acirc;m sẽ mang đến cho c&aacute;c em h&agrave;nh tr&igrave;nh học tập ấn tượng. Kh&ocirc;ng chỉ học tập, trau dồi tri thức m&agrave; c&ograve;n c&oacute; những ph&uacute;t gi&acirc;y vừa học vừa chơi vui vẻ. Với c&aacute;c v&iacute; dụ vui nhộn, gần gũi, c&aacute;c b&agrave;i tập thực h&agrave;nh s&aacute;ng tạo, cuốn h&uacute;t,..chắc chắn sẽ truyền cảm hứng, gi&uacute;p c&aacute;c bạn nhỏ ng&agrave;y c&agrave;ng y&ecirc;u th&iacute;ch v&agrave; say m&ecirc; với bộ m&ocirc;n khoa học n&agrave;y hơn bao giờ hết.</p>\n\n<ul>\n</ul>\n</div>\n\n<p>Dịch vụ chu đ&aacute;o, tận t&acirc;m</p>\n\n<h1>&nbsp;</h1>\n\n<div>\n<ul>\n	<li style=\"list-style-type:initial\">Mức học ph&iacute; phải chăng, ph&ugrave; hợp với mọi học sinh</li>\n	<li style=\"list-style-type:initial\">Trẻ được học thử miễn ph&iacute; 3 buổi đầu ti&ecirc;n, trước khi đăng k&yacute; c&aacute;c kh&oacute;a học ch&iacute;nh thức</li>\n	<li style=\"list-style-type:initial\">Thời gian học tập linh hoạt.</li>\n	<li style=\"list-style-type:initial\">Trung t&acirc;m c&oacute; h&igrave;nh thức học bảo lưu &ldquo;miễn ph&iacute;&rdquo; trong v&ograve;ng 1 năm cho đến khi trẻ nắm vững về Java.</li>\n	<li>&nbsp;</li>\n</ul>\n</div>\n\n<h2 style=\"font-style:normal; text-align:left\"><strong>LỘ TR&Igrave;NH HỌC TẬP</strong></h2>\n\n<div>\n<h2>&nbsp;</h2>\n\n<p class=\"image-align-center\"><img alt=\"\" src=\"https://spec.edu.vn/uploadfileimage/spec/giangvien/46353900web.svg\" /></p>\n\n<p>&nbsp;</p>\n</div>\n', '144 giờ (2 học kỳ ~ 24 tháng), 90\' mỗi buổi', '8 học phần từ thấp đến cao', 'java-core, java-tutorial,..', ' 14/7/2021', ' 14/7/2021', 'Khóa học lập trình Python FullStack SPEC', 'Lập trình Python FullStack là gì? Tại sao nên dạy lập trình Python FullStack cho trẻ ngay hôm nay? Hãy cùng tìm hiểu những thông tin hữu ích ngay sau đây nhé!', 'Lập trình Python FullStack, Python FullStack, Python FullStack cho trẻ em, học lập trình Python FullStack, Python FullStack', 'index,follow', 0, b'1');
INSERT INTO `course` (`id`, `image`, `student_fees`, `tuition_fee_after_reduction`, `name`, `deleted`, `id_small_category`, `url_view`, `obj_students`, `id_user`, `theme_id`, `promotion`, `sub_content`, `create_date`, `age`, `number_of_student`, `teacher_id`, `main_content`, `duration_of_study`, `section`, `document`, `opening_day`, `study_time`, `meta_title`, `meta_description`, `meta_keyword`, `meta_robot`, `percent_of_promotion`, `classify`) VALUES
(10, 'https://spec.edu.vn/client/image/images_Trang_Chu/a15.jpg', 1600000, 1600000, 'Khóa học lập trình Minecraft ', b'1', 1, 'minecraft', 'Thiếu nhi', 8, 3, b'1', 'Đào tạo học viênkhái niệm tư duy thiết kế tổng thể & khái niệm cơ bản của Sản xuất Game, hoàn thiện đóng gói sản phẩm', '2021-06-10', '7-12', 20, 13, '<h1><strong><span style=\"color:#003163\">Học lập tr&igrave;nh Minecraft- trải nghiệm l&yacute; th&uacute; cho b&eacute; kh&ocirc;ng n&ecirc;n bỏ qua dsdsds</span></strong></h1>\n\n<p>Minecraft l&agrave; một ng&ocirc;n ngữ lập tr&igrave;nh nổi tiếng thế giới. Đặc biệt c&aacute;c chuy&ecirc;n gia đ&atilde; nhận định rằng việc cho b&eacute; tiếp cận sớm với bộ m&ocirc;n n&agrave;y thực sự l&agrave; điều v&ocirc; c&ugrave;ng hữu &iacute;ch m&agrave; cha mẹ kh&ocirc;ng n&ecirc;n bỏ qua.</p>\n\n<div>12 th&aacute;ng 03, 2021</div>\n\n<div><a href=\"https://spec.edu.vn/minecraft?minecraft=10\"><span style=\"background-color:#e5e5e5; color:grey\">Minecraft Game</span>&nbsp;</a><a href=\"https://spec.edu.vn/minecraft?minecraft=10\"><span style=\"background-color:#e5e5e5; color:grey\">Minecraft</span></a></div>\n\n<div>\n<h2>Dạy cho trẻ về ng&ocirc;n ngữ lập tr&igrave;nh Minecraft</h2>\n\n<p>Minecraft từ l&acirc;u đ&atilde; l&agrave; c&aacute;i t&ecirc;n quen thuộc đối với những người y&ecirc;u th&iacute;ch lập tr&igrave;nh tr&ecirc;n to&agrave;n thế giới. Đặc biệt ng&ocirc;n ngữ lập tr&igrave;nh n&agrave;y kh&ocirc;ng chỉ ph&ugrave; hợp với người lớn m&agrave; c&ograve;n được c&aacute;c bạn nhỏ v&ocirc; c&ugrave;ng y&ecirc;u th&iacute;ch, gi&uacute;p c&aacute;c b&eacute; ph&aacute;t triển to&agrave;n diện. H&atilde;y c&ugrave;ng ch&uacute;ng t&ocirc;i t&igrave;m hiểu vấn đề n&agrave;y qua b&agrave;i viết sau đ&acirc;y&nbsp;</p>\n\n<h2>Những điều cần biết về lập tr&igrave;nh Minecraft</h2>\n\n<p>Minecraft l&agrave; một sản phẩm của Microsoft - tập đo&agrave;n c&ocirc;ng nghệ lớn nhất thế giới. Ngay từ khi ra đời c&ocirc;ng cụ thu h&uacute;t sự quan t&acirc;m v&agrave; trải nghiệm của 75 triệu người tham gia tr&ecirc;n to&agrave;n cầu.</p>\n\n<ul>\n</ul>\n\n<p style=\"text-align:center\"><img alt=\"\" height=\"602\" src=\"https://spec.edu.vn/client/image/a15.jpg\" width=\"500\" /></p>\n\n<p style=\"text-align:center\">Minecraft l&agrave; c&ocirc;ng cụ được s&aacute;ng tạo bởi tập đo&agrave;n c&ocirc;ng nghệ h&agrave;ng đầu thế giới</p>\n\n<p>Sử dụng Minecraft người d&ugrave;ng sẽ được trải nghiệm việc x&acirc;y dựng thế giới ri&ecirc;ng đa dạng m&agrave;u sắc theo &yacute; tưởng của bạn. Từ đ&oacute; những kiến thức cơ bản về lập tr&igrave;nh sẽ được người sử dụng tiếp thu nhanh ch&oacute;ng v&agrave; ho&agrave;n hảo nhất. Ch&iacute;nh v&igrave; vậy, m&agrave; Minecraft ng&agrave;y c&agrave;ng trở n&ecirc;n th&ocirc;ng dụng. Thậm ch&iacute; tại nhiều quốc gia tr&ecirc;n thế giới ng&ocirc;n ngữ lập tr&igrave;nh n&agrave;y c&ograve;n được đưa v&agrave;o chương tr&igrave;nh gi&aacute;o dục phổ th&ocirc;ng v&agrave; nhận được những phản hồi t&iacute;ch cực.</p>\n\n<h2>Tại sao lập tr&igrave;nh Minecraft lại cuốn h&uacute;t trẻ em? v&agrave; đ&aacute;p &aacute;n ch&iacute;nh x&aacute;c nhất</h2>\n\n<p>Nhiều người quan niệm rằng, lập tr&igrave;nh l&agrave; c&ocirc;ng việc chỉ d&agrave;nh cho người lớn m&agrave; th&ocirc;i. Thực tế, trong thời đại c&ocirc;ng nghệ 4.0 việc những bạn nhỏ say sưa viết code lập tr&igrave;nh b&ecirc;n những chiếc m&aacute;y vi t&iacute;nh dần trở th&agrave;nh điều gần gũi v&agrave; quen thuộc.</p>\n\n<p style=\"text-align:center\"><img alt=\"\" height=\"602\" src=\"https://spec.edu.vn/client/image/a16.jpg\" width=\"500\" /></p>\n\n<p style=\"text-align:center\">Giao diện đẹp, c&aacute;c lệnh dễ sử dụng l&agrave; điều cuốn h&uacute;t c&aacute;c bạn nhỏ đến với Minecraft</p>\n\n<p>Đặc biệt với t&iacute;nh năng ưu việt của Minecraft, c&aacute;c bạn nhỏ c&oacute; thể học c&aacute;ch sử dụng c&aacute;c lệnh một c&aacute;ch dễ d&agrave;ng, dễ nhớ. Việc học lập tr&igrave;nh v&igrave; vậy m&agrave; kh&ocirc;ng c&ograve;n qu&aacute; kh&oacute; khăn với cả những người mới bắt đầu hay những bạn nhỏ. Ngo&agrave;i ra, Minecraft c&ograve;n được c&aacute;c bạn nhỏ y&ecirc;u th&iacute;ch bởi khả năng lập tr&igrave;nh thế giới của ri&ecirc;ng m&igrave;nh. C&aacute;c b&eacute; sẽ được thỏa sức s&aacute;ng tạo theo sở th&iacute;ch của bản th&acirc;n. Việc học kh&ocirc;ng c&ograve;n kh&ocirc; khan v&agrave; kh&oacute; hiểu như nhiều người tưởng tượng m&agrave; v&ocirc; c&ugrave;ng cuốn h&uacute;t v&agrave; th&uacute; vị.</p>\n\n<p>B&ecirc;n cạnh đ&oacute;, rất nhiều bậc phụ huynh đ&atilde; phản hồi t&iacute;ch cực về việc nhận thấy những thay đổi t&iacute;ch cực ở trẻ khi được tiếp cận với bộ m&ocirc;n n&agrave;y như:</p>\n\n<p>Ch&iacute;nh v&igrave; những l&yacute; do tr&ecirc;n m&agrave; Minecraft thực sự l&agrave; c&ocirc;ng cụ hữu &iacute;ch đối với trẻ m&agrave; c&aacute;c bậc phụ huynh kh&ocirc;ng n&ecirc;n bỏ qua để tạo n&ecirc;n nền tảng vững chắc cho b&eacute; để vững bước trong tương lai.</p>\n\n<h3 style=\"text-align:center\"><strong><span style=\"color:#003163\">Video giới thiệu về nền tảng tynker</span></strong></h3>\n\n<div data-oembed-url=\"https://www.youtube.com/watch?v=MBOG75HwfFo\">\n<div style=\"max-width:320px;margin:auto;\"><!-- You\'re using demo endpoint of Iframely API commercially. Max-width is limited to 320px. Please get your own API key at https://iframely.com. -->\n<div style=\"left: 0; width: 100%; height: 0; position: relative; padding-bottom: 56.25%;\"><iframe allow=\"encrypted-media; accelerometer; clipboard-write; gyroscope; picture-in-picture\" allowfullscreen=\"\" scrolling=\"no\" src=\"https://www.youtube.com/embed/MBOG75HwfFo?rel=0\" style=\"border: 0; top: 0; left: 0; width: 100%; height: 100%; position: absolute;\" tabindex=\"-1\"></iframe></div>\n</div>\n</div>\n\n<p>&nbsp;</p>\n\n<ul>\n	<li>B&eacute; tăng khả năng tư duy khoa học. V&igrave; vậy m&agrave; việc học tr&ecirc;n lớp, đặc biệt đối với c&aacute;c m&ocirc;n tự nhi&ecirc;n trở n&ecirc;n tiến bộ hơn rất niều.</li>\n	<li>K&iacute;ch th&iacute;ch sự t&igrave;m hiểu về thế giới xung quanh hơn ở trẻ. Thay v&igrave; mải m&ecirc; với những clip giải tr&iacute;, game,...B&eacute; sẽ t&iacute;ch cực t&igrave;m hiểu những điều mới mẻ v&agrave; th&uacute; vị hơn quanh m&igrave;nh.</li>\n	<li>Tăng khả năng l&agrave;m việc nh&oacute;m - kỹ năng kh&ocirc;ng thể thiếu đối với những c&ocirc;ng d&acirc;n hiện đại của thế kỷ 21</li>\n</ul>\n\n<p>Video giới thiệu nền tảng MineCraft của Microsoft</p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p>Giới thiệu về kh&oacute;a học lập tr&igrave;nh cho b&eacute;</p>\n\n<p>Thực tế hiện nay nhiều người y&ecirc;u th&iacute;ch lập tr&igrave;nh c&oacute; thể tự học về bộ m&ocirc;n n&agrave;y với nguồn t&agrave;i liệu v&ocirc; c&ugrave;ng từ c&aacute;c loại s&aacute;ch hay c&aacute;c clip tr&ecirc;n mạng,....Tuy nhi&ecirc;n, đối với c&aacute;c bạn nhỏ việc tự học sẽ khiến việc tiếp cận với lập tr&igrave;nh n&oacute;i chung v&agrave; lập tr&igrave;nh Minecraft gặp rất nhiều kh&oacute; khăn. Ch&iacute;nh v&igrave; vậy, c&aacute;c bậc phụ huynh cần t&igrave;m kiếm cho con em m&igrave;nh ngay những kh&oacute;a học uy t&iacute;n, nhằm:</p>\n\n<p style=\"text-align:center\"><img alt=\"\" height=\"602\" src=\"https://spec.edu.vn/client/image/a17.jpg\" width=\"500\" /></p>\n\n<p style=\"text-align:center\">Kh&oacute;a học lập tr&igrave;nh Minecraft được c&aacute;c b&eacute; v&ocirc; c&ugrave;ng y&ecirc;u th&iacute;ch</p>\n\n<p>Ch&iacute;nh v&igrave; vậy m&agrave; việc đăng k&yacute; những kh&oacute;a học lập tr&igrave;nh cho b&eacute; l&agrave; điều v&ocirc; c&ugrave;ng quan trọng. Qua đ&oacute; gi&uacute;p n&acirc;ng cao chất lượng học tập, gi&uacute;p b&eacute; học hiệu quả hơn m&agrave; kh&ocirc;ng hề cảm thấy nh&agrave;m ch&aacute;n hay căng thẳng. Tuy nhi&ecirc;n, hiện nay tr&ecirc;n khắp cả nước c&oacute; rất nhiều trung t&acirc;m, trường dạy lập tr&igrave;nh với chất lượng gi&aacute;o dục kh&aacute;c nhau. Ch&iacute;nh v&igrave; vậy, để c&oacute; thể đạt được hiệu quả gi&aacute;o dục tốt nhất c&aacute;c bậc phụ huynh v&agrave; c&aacute;c em học sinh n&ecirc;n t&igrave;m hiểu kỹ lưỡng để lựa chọn cho m&igrave;nh địa chỉ uy t&iacute;n, chất lượng để tr&aacute;nh &ldquo;tiền mất tật mang&rdquo;.</p>\n\n<ul>\n	<li style=\"list-style-type:initial\">Mang đến cho b&eacute; cơ hội học tập những kiến thức ch&iacute;nh x&aacute;c v&agrave; ho&agrave;n hảo nhất</li>\n	<li style=\"list-style-type:initial\">Mọi thắc mắc của b&eacute; đều lu&ocirc;n được giải đ&aacute;p nhanh ch&oacute;ng</li>\n	<li style=\"list-style-type:initial\">B&ecirc;n cạnh những kiến thức l&yacute; thuyết c&aacute;c bạn nhỏ sẽ được tận t&igrave;nh chỉ bảo việc &aacute;p dụng v&agrave;o thực tiễn hiệu quả.</li>\n	<li style=\"list-style-type:initial\">C&oacute; m&ocirc;i trường học tập l&agrave;nh mạnh, với sự giao lưu v&agrave; tương t&aacute;c nhiều hơn với thầy c&ocirc; v&agrave; những bạn c&ugrave;ng sở th&iacute;ch.</li>\n</ul>\n\n<h2><span style=\"color:#003163\">SPEC- địa chỉ học lập tr&igrave;nh Minecraft uy t&iacute;n tại Việt Nam</span></h2>\n\n<p>Học lập tr&igrave;nh web ở đ&acirc;u tốt nhất l&agrave; c&acirc;u hỏi kh&ocirc;ng hề đơn giản. Bởi hiện nay, c&aacute;c trung t&acirc;m, trường dạy về lĩnh vực n&agrave;y đang ph&aacute;t triển nhanh ch&oacute;ng, đem đến nhiều lựa chọn cho phụ huynh v&agrave; c&aacute;c em học sinh. Tuy nhi&ecirc;n, để gi&uacute;p b&eacute; c&oacute; thể tiếp cận được với những kiến thức về lập tr&igrave;nh Web b&agrave;i bản nhất, cha mẹ n&ecirc;n lựa chọn cho con em m&igrave;nh những địa chỉ uy t&iacute;n, được đ&ocirc;ng đảo c&aacute;c bạn học vi&ecirc;n y&ecirc;u th&iacute;ch v&agrave; đ&aacute;nh gi&aacute; cao. V&agrave; SPEC l&agrave; một trong những c&aacute;i t&ecirc;n quen thuộc m&agrave; c&aacute;c bạn kh&ocirc;ng n&ecirc;n bỏ qua</p>\n\n<p>Mục ti&ecirc;u ph&aacute;t triển của SPEC</p>\n\n<p>Kh&ocirc;ng đặt vấn đề lợi nhuận l&ecirc;n h&agrave;ng đầu. Tr&aacute;i lại, SPEC lu&ocirc;n hướng đến mục ti&ecirc;u cao cả l&agrave; tạo cho ng&agrave;y c&agrave;ng nhiều trẻ em tại Việt Nam được tiếp cận với ng&ocirc;n ngữ lập tr&igrave;nh - bộ m&ocirc;n khoa học hữu &iacute;ch cho sự ph&aacute;t triển của trẻ. Ch&iacute;nh v&igrave; vậy m&agrave; trung t&acirc;m đ&atilde; kh&ocirc;ng ngừng nỗ lực để cải tiến chất lượng gi&aacute;o dục, mang đến những kh&oacute;a học lập tr&igrave;nh cho trẻ uy t&iacute;n, hiệu quả với chi ph&iacute; ph&ugrave; hợp. Đ&acirc;y ch&iacute;nh l&agrave; một trong những l&yacute; do khiến cho trung t&acirc;m ng&agrave;y c&agrave;ng được nhiều phụ huynh v&agrave; c&aacute;c học vi&ecirc;n biết đến v&agrave; tin tưởng lựa chọn trong suốt thời gian qua.</p>\n\n<p style=\"text-align:center\"><img alt=\"\" height=\"602\" src=\"https://spec.edu.vn/client/image/a18.jpg\" width=\"500\" /></p>\n\n<p style=\"text-align:center\">SPEC tự h&agrave;o l&agrave; người bạn đồng h&agrave;nh với b&eacute; trong việc tiếp cận kiến thức về ng&ocirc;n ngữ lập tr&igrave;nh</p>\n\n<p>Lợi &iacute;ch tuyệt vời từ c&aacute;c kh&oacute;a học lập tr&igrave;nh cho b&eacute; tại SPEC</p>\n\n<p>Kết quả nhận được l&agrave; g&igrave; sau những kh&oacute;a học lập tr&igrave;nh tại trung t&acirc;m? l&agrave; điều m&agrave; c&aacute;c bậc phụ huynh lu&ocirc;n v&ocirc; c&ugrave;ng quan t&acirc;m. Tuy nhi&ecirc;n, khi lựa chọn SPEC c&aacute;c bạn sẽ ho&agrave;n to&agrave;n y&ecirc;n t&acirc;m bởi chỉ sau một thời gian ngắn học tập v&agrave; r&egrave;n luyện tại đ&acirc;y, c&aacute;c b&eacute; sẽ dần tiến bộ hơn với những kỹ năng như:</p>\n\n<p>Chất lượng h&agrave;ng đầu - điểm nhấn trong việc gi&aacute;o dục tại SPEC</p>\n\n<p>Để c&oacute; thể mang đến cho trẻ rất nhiều lợi &iacute;ch tuyệt vời như vậy chỉ với những kh&oacute;a học lập tr&igrave;nh kh&ocirc;ng hề d&agrave;i tại SPEC th&igrave; chất lượng gi&aacute;o dục tại đ&acirc;y ch&iacute;nh l&agrave; điểm nhấn kh&ocirc;ng thể bỏ qua với những ưu điểm như:</p>\n\n<p>Minecraft l&agrave; ng&ocirc;n ngữ lập tr&igrave;nh kh&aacute; dễ học, đặc biệt với thiết kế l&agrave; những game cuốn h&uacute;t v&igrave; vậy m&agrave; thu h&uacute;t được sự quan t&acirc;m của mọi người, đặc biệt l&agrave; c&aacute;c bạn nhỏ. Th&ocirc;ng qua việc vừa học vừa chơi b&eacute; sẽ được trang bị những kiến thức lập tr&igrave;nh chuy&ecirc;n nghiệp c&ugrave;ng cơ hội ph&aacute;t triển những kỹ năng mềm kh&aacute;c trong cuộc sống. Để c&aacute;c b&eacute; được trải nghiệm những điều l&yacute; th&uacute; đ&oacute;, c&aacute;c bậc phụ huynh n&ecirc;n đăng k&yacute; những kh&oacute;a dạy lập tr&igrave;nh cho trẻ tại những trung t&acirc;m uy t&iacute;n như SPEC ngay h&ocirc;m nay nh&eacute;.</p>\n\n<h2><strong><span style=\"color:#003163\">C&Ocirc;NG CỤ HỌC TẬP</span></strong></h2>\n\n<ul>\n	<li style=\"list-style-type:initial\">L&agrave;m quen v&agrave; sử dụng th&agrave;nh thạo m&aacute;y vi t&iacute;nh</li>\n	<li style=\"list-style-type:initial\">H&igrave;nh th&agrave;nh tư duy lập tr&igrave;nh từ căn bản đến n&acirc;ng cao</li>\n	<li style=\"list-style-type:initial\">R&egrave;n luyện t&iacute;nh ki&ecirc;n tr&igrave; v&agrave; tỉ mỉ trong giải quyết mọi c&ocirc;ng việc cũng như trong cuộc sống</li>\n	<li style=\"list-style-type:initial\">Học c&aacute;ch vượt qua mọi thử th&aacute;ch v&agrave; lu&ocirc;n c&oacute; nhiều giải ph&aacute;p thay thế trong mọi t&igrave;nh huống.</li>\n	<li style=\"list-style-type:initial\">Tạo dựng khả năng tư duy v&agrave; sự s&aacute;ng tạo, kh&ocirc;ng c&ograve;n sự dập khu&ocirc;n, m&aacute;y m&oacute;c trong l&agrave;m việc v&agrave; cuộc sống</li>\n	<li style=\"list-style-type:initial\">Gi&aacute;o tr&igrave;nh dạy lập tr&igrave;nh Minecraft được x&acirc;y dựng b&agrave;i bản. Thay v&igrave; đưa qu&aacute; nhiều c&aacute;c kiến thức v&agrave;o chương tr&igrave;nh. Đối với đối tượng học sinh nhỏ tuổi từ 7-12 tuổi th&igrave; c&aacute;c gi&aacute;o vi&ecirc;n tại SPEC đ&atilde; bi&ecirc;n soạn ra nội dung giảng dạy ph&ugrave; hợp, gi&uacute;p c&aacute;c b&eacute; nhanh ch&oacute;ng l&agrave;m quen với khoa học m&aacute;y t&iacute;nh v&agrave; tạo dựng được tư duy lập tr&igrave;nh ho&agrave;n hảo.</li>\n	<li style=\"list-style-type:initial\">Đội ngũ giảng vi&ecirc;n tại trung t&acirc;m đều l&agrave; những người được đ&agrave;o tạo b&agrave;i bản về c&ocirc;ng nghệ th&ocirc;ng tin, đồng thời c&oacute; nhiều năm trong c&ocirc;ng t&aacute;c v&agrave; giảng dạy. Bởi vậy m&agrave; c&oacute; thể truyền đạt cho c&aacute;c bạn học vi&ecirc;n những kiến thức khoa học hữu &iacute;ch nhất.</li>\n	<li style=\"list-style-type:initial\">Phương ph&aacute;p giảng dạy khoa học, hiệu quả. Cam kết lu&ocirc;n tạo n&ecirc;n những giờ học hữu &iacute;ch v&agrave; cuốn h&uacute;t c&aacute;c em th&ocirc;ng qua qu&aacute; tr&igrave;nh tương t&aacute;c giữa thầy v&agrave; tr&ograve;. Đặc biệt kết th&uacute;c kh&oacute;a học c&aacute;c b&eacute; sẽ nắm được kiến thức lập tr&igrave;nh cơ bản v&agrave; c&oacute; thể tự l&agrave;m ra những sản phẩm game theo sở th&iacute;ch. Đồng thời SPEC sẽ cấp chứng chỉ ho&agrave;n th&agrave;nh kh&oacute;a học d&agrave;nh cho b&eacute;.</li>\n	<li style=\"list-style-type:initial\">Gi&aacute; th&agrave;nh c&aacute;c kh&oacute;a học phải chăng, ph&ugrave; hợp với nhiều học vi&ecirc;n, mang đến cơ hội học tập rộng mở hơn cho c&aacute;c bạn nhỏ.</li>\n</ul>\n</div>\n\n<table>\n	<tbody>\n		<tr>\n			<td>\n			<p><img alt=\"\" src=\"https://teky.online/wp-content/uploads/2020/03/tynker-logo-tagline-300x111.png\" width=\"300\" /><img alt=\"\" src=\"https://teky.online/wp-content/uploads/2020/03/b9ecde0c717f0ac4c0a7925a2bc27362-300x109.png\" width=\"300\" /></p>\n			</td>\n		</tr>\n	</tbody>\n</table>\n\n<div>\n<h2 style=\"text-align:left\"><strong><span style=\"color:#003163\">LỘ TR&Igrave;NH HỌC TẬP</span></strong></h2>\n\n<h2 style=\"text-align:center\"><img alt=\"\" src=\"data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iOTc0IiBoZWlnaHQ9Ijc2NCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgb3ZlcmZsb3c9ImhpZGRlbiI+PGRlZnM+PGNsaXBQYXRoIGlkPSJjbGlwMCI+PHJlY3QgeD0iMTg2IiB5PSI4OSIgd2lkdGg9Ijk3NCIgaGVpZ2h0PSI3NjQiLz48L2NsaXBQYXRoPjwvZGVmcz48ZyBjbGlwLXBhdGg9InVybCgjY2xpcDApIiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgtMTg2IC04OSkiPjxwYXRoIGQ9Ik0xOTcuNSAxMTdDMTk3LjUgMTAyLjkxNyAyMDguOTE3IDkxLjUwMDEgMjIzIDkxLjUwMDEgMjM3LjA4MyA5MS41MDAxIDI0OC41IDEwMi45MTcgMjQ4LjUgMTE3IDI0OC41IDEzMS4wODMgMjM3LjA4MyAxNDIuNSAyMjMgMTQyLjUgMjA4LjkxNyAxNDIuNSAxOTcuNSAxMzEuMDgzIDE5Ny41IDExN1oiIHN0cm9rZT0iI0YxOTAzMSIgc3Ryb2tlLXdpZHRoPSIxLjMzMzMzIiBzdHJva2UtbWl0ZXJsaW1pdD0iOCIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIi8+PHBhdGggZD0iTTI4Ny41IDk5LjgzMzRDMjg3LjUgOTUuMjMxIDI5MS4yMzEgOTEuNTAwMSAyOTUuODMzIDkxLjUwMDFMMTE0NS4xNyA5MS41MDAxQzExNDkuNzcgOTEuNTAwMSAxMTUzLjUgOTUuMjMxIDExNTMuNSA5OS44MzM0TDExNTMuNSAxMzMuMTY3QzExNTMuNSAxMzcuNzY5IDExNDkuNzcgMTQxLjUgMTE0NS4xNyAxNDEuNUwyOTUuODMzIDE0MS41QzI5MS4yMzEgMTQxLjUgMjg3LjUgMTM3Ljc2OSAyODcuNSAxMzMuMTY3WiIgc3Ryb2tlPSIjRjE5MDMxIiBzdHJva2Utd2lkdGg9IjEuMzMzMzMiIHN0cm9rZS1taXRlcmxpbWl0PSI4IiBmaWxsPSIjRkZGRkZGIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48dGV4dCBmb250LWZhbWlseT0iQXJpYWwsQXJpYWxfTVNGb250U2VydmljZSxzYW5zLXNlcmlmIiBmb250LXdlaWdodD0iNzAwIiBmb250LXNpemU9IjE5IiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgzMDUuNDQ0IDEyMykiPkLDgEkgMSA8dHNwYW4gZm9udC1zaXplPSIxOSIgeD0iNTIuODMzMyIgeT0iMCI+4oCTPC90c3Bhbj48dHNwYW4gZm9udC1zaXplPSIxOSIgeD0iNjguMzMzMyIgeT0iMCI+VEjhur4gR0nhu5pJIE1JTkVDUkFGVCBD4bumQSBUw5RJPC90c3Bhbj48dHNwYW4gZm9udC1mYW1pbHk9IlNhbnNTZXJpZixTYW5zU2VyaWZfTVNGb250U2VydmljZSxzYW5zLXNlcmlmIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjMwIiB4PSItOTAuNjkxNSIgeT0iNiI+MTwvdHNwYW4+PHRzcGFuIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zaXplPSIyMCIgeD0iNzAzLjg0NyIgeT0iMCI+MSBnaeG7nSAzMCBwaMO6dDwvdHNwYW4+PC90ZXh0PjxwYXRoIGQ9Ik0xOTcuNSAxODBDMTk3LjUgMTY1LjkxNyAyMDguOTE3IDE1NC41IDIyMyAxNTQuNSAyMzcuMDgzIDE1NC41IDI0OC41IDE2NS45MTcgMjQ4LjUgMTgwIDI0OC41IDE5NC4wODMgMjM3LjA4MyAyMDUuNSAyMjMgMjA1LjUgMjA4LjkxNyAyMDUuNSAxOTcuNSAxOTQuMDgzIDE5Ny41IDE4MFoiIHN0cm9rZT0iI0YxOTAzMSIgc3Ryb2tlLXdpZHRoPSIxLjMzMzMzIiBzdHJva2UtbWl0ZXJsaW1pdD0iOCIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIi8+PHBhdGggZD0iTTI4Ny41IDE2Mi44MzNDMjg3LjUgMTU4LjIzMSAyOTEuMjMxIDE1NC41IDI5NS44MzMgMTU0LjVMMTE0NS4xNyAxNTQuNUMxMTQ5Ljc3IDE1NC41IDExNTMuNSAxNTguMjMxIDExNTMuNSAxNjIuODMzTDExNTMuNSAxOTYuMTY3QzExNTMuNSAyMDAuNzY5IDExNDkuNzcgMjA0LjUgMTE0NS4xNyAyMDQuNUwyOTUuODMzIDIwNC41QzI5MS4yMzEgMjA0LjUgMjg3LjUgMjAwLjc2OSAyODcuNSAxOTYuMTY3WiIgc3Ryb2tlPSIjRjE5MDMxIiBzdHJva2Utd2lkdGg9IjEuMzMzMzMiIHN0cm9rZS1taXRlcmxpbWl0PSI4IiBmaWxsPSIjRkZGRkZGIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48dGV4dCBmb250LWZhbWlseT0iQXJpYWwsQXJpYWxfTVNGb250U2VydmljZSxzYW5zLXNlcmlmIiBmb250LXdlaWdodD0iNzAwIiBmb250LXNpemU9IjE5IiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgzMDUuNDQ0IDE4MSkiPkLDgEkgMiA8dHNwYW4gZm9udC1zaXplPSIxOSIgeD0iNTIuODMzMyIgeT0iMCI+4oCTPC90c3Bhbj48dHNwYW4gZm9udC1zaXplPSIxOSIgeD0iNjguMzMzMyIgeT0iMCI+Q8OBTkggQ+G7rEEgROG7ikNIIENIVVnhu4JOIFRI4bqmTiBL4buyPC90c3Bhbj48dHNwYW4gZm9udC1mYW1pbHk9IlNhbnNTZXJpZixTYW5zU2VyaWZfTVNGb250U2VydmljZSxzYW5zLXNlcmlmIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjMwIiB4PSItOTAuNjkxNSIgeT0iMTEiPjI8L3RzcGFuPjx0c3BhbiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMjAiIHg9IjcwMy44NDciIHk9IjMiPjEgZ2nhu50gMzAgcGjDunQ8L3RzcGFuPjwvdGV4dD48cGF0aCBkPSJNMjIyIDE0MiAyMjIgMTU0LjYiIHN0cm9rZT0iI0YxOTAzMSIgc3Ryb2tlLXdpZHRoPSIyIiBzdHJva2UtbWl0ZXJsaW1pdD0iOCIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIi8+PHBhdGggZD0iTTE5Ny41IDI0My41QzE5Ny41IDIyOS42OTMgMjA4LjkxNyAyMTguNSAyMjMgMjE4LjUgMjM3LjA4MyAyMTguNSAyNDguNSAyMjkuNjkzIDI0OC41IDI0My41IDI0OC41IDI1Ny4zMDcgMjM3LjA4MyAyNjguNSAyMjMgMjY4LjUgMjA4LjkxNyAyNjguNSAxOTcuNSAyNTcuMzA3IDE5Ny41IDI0My41WiIgc3Ryb2tlPSIjRjE5MDMxIiBzdHJva2Utd2lkdGg9IjEuMzMzMzMiIHN0cm9rZS1taXRlcmxpbWl0PSI4IiBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48cGF0aCBkPSJNMjg3LjUgMjI2QzI4Ny41IDIyMS4zMDYgMjkxLjMwNiAyMTcuNSAyOTYgMjE3LjVMMTE0NSAyMTcuNUMxMTQ5LjY5IDIxNy41IDExNTMuNSAyMjEuMzA2IDExNTMuNSAyMjZMMTE1My41IDI2MEMxMTUzLjUgMjY0LjY5NCAxMTQ5LjY5IDI2OC41IDExNDUgMjY4LjVMMjk2IDI2OC41QzI5MS4zMDYgMjY4LjUgMjg3LjUgMjY0LjY5NCAyODcuNSAyNjBaIiBzdHJva2U9IiNGMTkwMzEiIHN0cm9rZS13aWR0aD0iMS4zMzMzMyIgc3Ryb2tlLW1pdGVybGltaXQ9IjgiIGZpbGw9IiNGRkZGRkYiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjx0ZXh0IGZvbnQtZmFtaWx5PSJBcmlhbCxBcmlhbF9NU0ZvbnRTZXJ2aWNlLHNhbnMtc2VyaWYiIGZvbnQtd2VpZ2h0PSI3MDAiIGZvbnQtc2l6ZT0iMTkiIHRyYW5zZm9ybT0idHJhbnNsYXRlKDMwNS40NDQgMjQ1KSI+QsOASSAzIDx0c3BhbiBmb250LXNpemU9IjE5IiB4PSI1Mi44MzMzIiB5PSIwIj7igJM8L3RzcGFuPjx0c3BhbiBmb250LXNpemU9IjE5IiB4PSI2OC4zMzMzIiB5PSIwIj5DxIJOIE5Iw4AgTkdI4buIIETGr+G7oE5HIFLhu7BDIFLhu6A8L3RzcGFuPjx0c3BhbiBmb250LWZhbWlseT0iU2Fuc1NlcmlmLFNhbnNTZXJpZl9NU0ZvbnRTZXJ2aWNlLHNhbnMtc2VyaWYiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMzAiIHg9Ii05MC42OTE1IiB5PSIxMSI+MzwvdHNwYW4+PHRzcGFuIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zaXplPSIyMCIgeD0iNzAzLjg0NyIgeT0iMyI+MSBnaeG7nSAzMCBwaMO6dDwvdHNwYW4+PC90ZXh0PjxwYXRoIGQ9Ik0yMjIgMjA1IDIyMiAyMTcuNiIgc3Ryb2tlPSIjRjE5MDMxIiBzdHJva2Utd2lkdGg9IjIiIHN0cm9rZS1taXRlcmxpbWl0PSI4IiBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48cGF0aCBkPSJNMTk3LjUgMzA3QzE5Ny41IDI5Mi45MTcgMjA4LjkxNyAyODEuNSAyMjMgMjgxLjUgMjM3LjA4MyAyODEuNSAyNDguNSAyOTIuOTE3IDI0OC41IDMwNyAyNDguNSAzMjEuMDgzIDIzNy4wODMgMzMyLjUgMjIzIDMzMi41IDIwOC45MTcgMzMyLjUgMTk3LjUgMzIxLjA4MyAxOTcuNSAzMDdaIiBzdHJva2U9IiNGMTkwMzEiIHN0cm9rZS13aWR0aD0iMS4zMzMzMyIgc3Ryb2tlLW1pdGVybGltaXQ9IjgiIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjxwYXRoIGQ9Ik0yODcuNSAyODkuODMzQzI4Ny41IDI4NS4yMzEgMjkxLjIzMSAyODEuNSAyOTUuODMzIDI4MS41TDExNDUuMTcgMjgxLjVDMTE0OS43NyAyODEuNSAxMTUzLjUgMjg1LjIzMSAxMTUzLjUgMjg5LjgzM0wxMTUzLjUgMzIzLjE2N0MxMTUzLjUgMzI3Ljc2OSAxMTQ5Ljc3IDMzMS41IDExNDUuMTcgMzMxLjVMMjk1LjgzMyAzMzEuNUMyOTEuMjMxIDMzMS41IDI4Ny41IDMyNy43NjkgMjg3LjUgMzIzLjE2N1oiIHN0cm9rZT0iI0YxOTAzMSIgc3Ryb2tlLXdpZHRoPSIxLjMzMzMzIiBzdHJva2UtbWl0ZXJsaW1pdD0iOCIgZmlsbD0iI0ZGRkZGRiIgZmlsbC1ydWxlPSJldmVub2RkIi8+PHRleHQgZm9udC1mYW1pbHk9IkFyaWFsLEFyaWFsX01TRm9udFNlcnZpY2Usc2Fucy1zZXJpZiIgZm9udC13ZWlnaHQ9IjcwMCIgZm9udC1zaXplPSIxOSIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMzA1LjQ0NCAzMDgpIj5Cw4BJIDQgPHRzcGFuIGZvbnQtc2l6ZT0iMTkiIHg9IjUyLjgzMzMiIHk9IjAiPuKAkzwvdHNwYW4+PHRzcGFuIGZvbnQtc2l6ZT0iMTkiIHg9IjY4LjMzMzMiIHk9IjAiPktIw4FNIFBIw4EgTkjhu65ORyBIw4BOSCBUSU5IIFRST05HIEjhu4YgTeG6tlQgVFLhu5xJPC90c3Bhbj48dHNwYW4gZm9udC1mYW1pbHk9IlNhbnNTZXJpZixTYW5zU2VyaWZfTVNGb250U2VydmljZSxzYW5zLXNlcmlmIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjMwIiB4PSItOTAuNjkxNSIgeT0iMTEiPjQ8L3RzcGFuPjx0c3BhbiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMjAiIHg9IjcwMy44NDciIHk9IjMiPjEgZ2nhu50gMzAgcGjDunQ8L3RzcGFuPjwvdGV4dD48cGF0aCBkPSJNMjIyIDI2OCAyMjIgMjgwLjYiIHN0cm9rZT0iI0YxOTAzMSIgc3Ryb2tlLXdpZHRoPSIyIiBzdHJva2UtbWl0ZXJsaW1pdD0iOCIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIi8+PHBhdGggZD0iTTE5Ny41IDM3MC41QzE5Ny41IDM1Ni42OTMgMjA4LjkxNyAzNDUuNSAyMjMgMzQ1LjUgMjM3LjA4MyAzNDUuNSAyNDguNSAzNTYuNjkzIDI0OC41IDM3MC41IDI0OC41IDM4NC4zMDcgMjM3LjA4MyAzOTUuNSAyMjMgMzk1LjUgMjA4LjkxNyAzOTUuNSAxOTcuNSAzODQuMzA3IDE5Ny41IDM3MC41WiIgc3Ryb2tlPSIjRjE5MDMxIiBzdHJva2Utd2lkdGg9IjEuMzMzMzMiIHN0cm9rZS1taXRlcmxpbWl0PSI4IiBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48cGF0aCBkPSJNMjg3LjUgMzUzQzI4Ny41IDM0OC4zMDYgMjkxLjMwNiAzNDQuNSAyOTYgMzQ0LjVMMTE0NSAzNDQuNUMxMTQ5LjY5IDM0NC41IDExNTMuNSAzNDguMzA2IDExNTMuNSAzNTNMMTE1My41IDM4N0MxMTUzLjUgMzkxLjY5NCAxMTQ5LjY5IDM5NS41IDExNDUgMzk1LjVMMjk2IDM5NS41QzI5MS4zMDYgMzk1LjUgMjg3LjUgMzkxLjY5NCAyODcuNSAzODdaIiBzdHJva2U9IiNGMTkwMzEiIHN0cm9rZS13aWR0aD0iMS4zMzMzMyIgc3Ryb2tlLW1pdGVybGltaXQ9IjgiIGZpbGw9IiNGRkZGRkYiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjx0ZXh0IGZvbnQtZmFtaWx5PSJBcmlhbCxBcmlhbF9NU0ZvbnRTZXJ2aWNlLHNhbnMtc2VyaWYiIGZvbnQtd2VpZ2h0PSI3MDAiIGZvbnQtc2l6ZT0iMTkiIHRyYW5zZm9ybT0idHJhbnNsYXRlKDMwNS40NDQgMzcyKSI+QsOASSA1IDx0c3BhbiBmb250LXNpemU9IjE5IiB4PSI1Mi44MzMzIiB5PSIwIj7igJM8L3RzcGFuPjx0c3BhbiBmb250LXNpemU9IjE5IiB4PSI2OC4zMzMzIiB5PSIwIj5Cw4kgTMOATSBQSElNIEhP4bqgVCBIw4xOSDwvdHNwYW4+PHRzcGFuIGZvbnQtZmFtaWx5PSJTYW5zU2VyaWYsU2Fuc1NlcmlmX01TRm9udFNlcnZpY2Usc2Fucy1zZXJpZiIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zaXplPSIzMCIgeD0iLTkwLjY5MTUiIHk9IjExIj41PC90c3Bhbj48dHNwYW4gZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjIwIiB4PSI3MDMuODQ3IiB5PSIzIj4xIGdp4budIDMwIHBow7p0PC90c3Bhbj48L3RleHQ+PHBhdGggZD0iTTIyMiAzMzIgMjIyIDM0NC42IiBzdHJva2U9IiNGMTkwMzEiIHN0cm9rZS13aWR0aD0iMiIgc3Ryb2tlLW1pdGVybGltaXQ9IjgiIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjxwYXRoIGQ9Ik0xOTcuNSA0MzQuNUMxOTcuNSA0MjAuNjkzIDIwOC45MTcgNDA5LjUgMjIzIDQwOS41IDIzNy4wODMgNDA5LjUgMjQ4LjUgNDIwLjY5MyAyNDguNSA0MzQuNSAyNDguNSA0NDguMzA3IDIzNy4wODMgNDU5LjUgMjIzIDQ1OS41IDIwOC45MTcgNDU5LjUgMTk3LjUgNDQ4LjMwNyAxOTcuNSA0MzQuNVoiIHN0cm9rZT0iI0YxOTAzMSIgc3Ryb2tlLXdpZHRoPSIxLjMzMzMzIiBzdHJva2UtbWl0ZXJsaW1pdD0iOCIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIi8+PHBhdGggZD0iTTI4Ny41IDQxN0MyODcuNSA0MTIuMzA2IDI5MS4zMDYgNDA4LjUgMjk2IDQwOC41TDExNDUgNDA4LjVDMTE0OS42OSA0MDguNSAxMTUzLjUgNDEyLjMwNiAxMTUzLjUgNDE3TDExNTMuNSA0NTFDMTE1My41IDQ1NS42OTQgMTE0OS42OSA0NTkuNSAxMTQ1IDQ1OS41TDI5NiA0NTkuNUMyOTEuMzA2IDQ1OS41IDI4Ny41IDQ1NS42OTQgMjg3LjUgNDUxWiIgc3Ryb2tlPSIjRjE5MDMxIiBzdHJva2Utd2lkdGg9IjEuMzMzMzMiIHN0cm9rZS1taXRlcmxpbWl0PSI4IiBmaWxsPSIjRkZGRkZGIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48dGV4dCBmb250LWZhbWlseT0iQXJpYWwsQXJpYWxfTVNGb250U2VydmljZSxzYW5zLXNlcmlmIiBmb250LXdlaWdodD0iNzAwIiBmb250LXNpemU9IjE5IiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgzMDUuNDQ0IDQzNikiPkLDgEkgNiA8dHNwYW4gZm9udC1zaXplPSIxOSIgeD0iNTIuODMzMyIgeT0iMCI+4oCTPC90c3Bhbj48dHNwYW4gZm9udC1zaXplPSIxOSIgeD0iNjguMzMzMyIgeT0iMCI+xJDhu5AgVlVJIEPDkyBUSMav4bueTkc8L3RzcGFuPjx0c3BhbiBmb250LWZhbWlseT0iU2Fuc1NlcmlmLFNhbnNTZXJpZl9NU0ZvbnRTZXJ2aWNlLHNhbnMtc2VyaWYiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMzAiIHg9Ii05MC42OTE1IiB5PSIxMSI+NjwvdHNwYW4+PHRzcGFuIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zaXplPSIyMCIgeD0iNzAzLjg0NyIgeT0iMyI+MSBnaeG7nSAzMCBwaMO6dDwvdHNwYW4+PC90ZXh0PjxwYXRoIGQ9Ik0yMjIgMzk2IDIyMiA0MDguNiIgc3Ryb2tlPSIjRjE5MDMxIiBzdHJva2Utd2lkdGg9IjIiIHN0cm9rZS1taXRlcmxpbWl0PSI4IiBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48cGF0aCBkPSJNMTk3LjUgNDk4QzE5Ny41IDQ4My45MTcgMjA4LjkxNyA0NzIuNSAyMjMgNDcyLjUgMjM3LjA4MyA0NzIuNSAyNDguNSA0ODMuOTE3IDI0OC41IDQ5OCAyNDguNSA1MTIuMDgzIDIzNy4wODMgNTIzLjUgMjIzIDUyMy41IDIwOC45MTcgNTIzLjUgMTk3LjUgNTEyLjA4MyAxOTcuNSA0OThaIiBzdHJva2U9IiNGMTkwMzEiIHN0cm9rZS13aWR0aD0iMS4zMzMzMyIgc3Ryb2tlLW1pdGVybGltaXQ9IjgiIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjxwYXRoIGQ9Ik0yODcuNSA0ODAuODMzQzI4Ny41IDQ3Ni4yMzEgMjkxLjIzMSA0NzIuNSAyOTUuODMzIDQ3Mi41TDExNDUuMTcgNDcyLjVDMTE0OS43NyA0NzIuNSAxMTUzLjUgNDc2LjIzMSAxMTUzLjUgNDgwLjgzM0wxMTUzLjUgNTE0LjE2N0MxMTUzLjUgNTE4Ljc2OSAxMTQ5Ljc3IDUyMi41IDExNDUuMTcgNTIyLjVMMjk1LjgzMyA1MjIuNUMyOTEuMjMxIDUyMi41IDI4Ny41IDUxOC43NjkgMjg3LjUgNTE0LjE2N1oiIHN0cm9rZT0iI0YxOTAzMSIgc3Ryb2tlLXdpZHRoPSIxLjMzMzMzIiBzdHJva2UtbWl0ZXJsaW1pdD0iOCIgZmlsbD0iI0ZGRkZGRiIgZmlsbC1ydWxlPSJldmVub2RkIi8+PHRleHQgZm9udC1mYW1pbHk9IkFyaWFsLEFyaWFsX01TRm9udFNlcnZpY2Usc2Fucy1zZXJpZiIgZm9udC13ZWlnaHQ9IjcwMCIgZm9udC1zaXplPSIxOSIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMzA1LjQ0NSA1MDApIj5Cw4BJIDcgPHRzcGFuIGZvbnQtc2l6ZT0iMTkiIHg9IjUyLjgzMzMiIHk9IjAiPuKAkzwvdHNwYW4+PHRzcGFuIGZvbnQtc2l6ZT0iMTkiIHg9IjY4LjMzMzMiIHk9IjAiPk3DiiBDVU5HIEhVWeG7gE4gQsONPC90c3Bhbj48dHNwYW4gZm9udC1mYW1pbHk9IlNhbnNTZXJpZixTYW5zU2VyaWZfTVNGb250U2VydmljZSxzYW5zLXNlcmlmIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjMwIiB4PSItOTAuNjkxOCIgeT0iMTEiPjc8L3RzcGFuPjx0c3BhbiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMjAiIHg9IjcwMy44NDciIHk9IjIiPjEgZ2nhu50gMzAgcGjDunQ8L3RzcGFuPjwvdGV4dD48cGF0aCBkPSJNMjIyIDQ1OSAyMjIgNDcxLjYiIHN0cm9rZT0iI0YxOTAzMSIgc3Ryb2tlLXdpZHRoPSIyIiBzdHJva2UtbWl0ZXJsaW1pdD0iOCIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIi8+PHBhdGggZD0iTTE5Ny41IDU2MkMxOTcuNSA1NDcuOTE3IDIwOC45MTcgNTM2LjUgMjIzIDUzNi41IDIzNy4wODMgNTM2LjUgMjQ4LjUgNTQ3LjkxNyAyNDguNSA1NjIgMjQ4LjUgNTc2LjA4MyAyMzcuMDgzIDU4Ny41IDIyMyA1ODcuNSAyMDguOTE3IDU4Ny41IDE5Ny41IDU3Ni4wODMgMTk3LjUgNTYyWiIgc3Ryb2tlPSIjRjE5MDMxIiBzdHJva2Utd2lkdGg9IjEuMzMzMzMiIHN0cm9rZS1taXRlcmxpbWl0PSI4IiBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48cGF0aCBkPSJNMjg3LjUgNTQ0LjgzM0MyODcuNSA1NDAuMjMxIDI5MS4yMzEgNTM2LjUgMjk1LjgzMyA1MzYuNUwxMTQ1LjE3IDUzNi41QzExNDkuNzcgNTM2LjUgMTE1My41IDU0MC4yMzEgMTE1My41IDU0NC44MzNMMTE1My41IDU3OC4xNjdDMTE1My41IDU4Mi43NjkgMTE0OS43NyA1ODYuNSAxMTQ1LjE3IDU4Ni41TDI5NS44MzMgNTg2LjVDMjkxLjIzMSA1ODYuNSAyODcuNSA1ODIuNzY5IDI4Ny41IDU3OC4xNjdaIiBzdHJva2U9IiNGMTkwMzEiIHN0cm9rZS13aWR0aD0iMS4zMzMzMyIgc3Ryb2tlLW1pdGVybGltaXQ9IjgiIGZpbGw9IiNGRkZGRkYiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjx0ZXh0IGZvbnQtZmFtaWx5PSJBcmlhbCxBcmlhbF9NU0ZvbnRTZXJ2aWNlLHNhbnMtc2VyaWYiIGZvbnQtd2VpZ2h0PSI3MDAiIGZvbnQtc2l6ZT0iMTkiIHRyYW5zZm9ybT0idHJhbnNsYXRlKDMwNS40NDUgNTYzKSI+QsOASSA4IDx0c3BhbiBmb250LXNpemU9IjE5IiB4PSI1Mi44MzMzIiB5PSIwIj7igJM8L3RzcGFuPjx0c3BhbiBmb250LXNpemU9IjE5IiB4PSI2OC4zMzMzIiB5PSIwIj5Cw4kgTMOATSBIT+G6oCBTxKg8L3RzcGFuPjx0c3BhbiBmb250LWZhbWlseT0iU2Fuc1NlcmlmLFNhbnNTZXJpZl9NU0ZvbnRTZXJ2aWNlLHNhbnMtc2VyaWYiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMzAiIHg9Ii05MC42OTE4IiB5PSIxMSI+ODwvdHNwYW4+PHRzcGFuIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zaXplPSIyMCIgeD0iNzAzLjg0NyIgeT0iMyI+MSBnaeG7nSAzMCBwaMO6dDwvdHNwYW4+PC90ZXh0PjxwYXRoIGQ9Ik0yMjIgNTIzIDIyMiA1MzUuNiIgc3Ryb2tlPSIjRjE5MDMxIiBzdHJva2Utd2lkdGg9IjIiIHN0cm9rZS1taXRlcmxpbWl0PSI4IiBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48cGF0aCBkPSJNMTk3LjUgNjI2QzE5Ny41IDYxMS45MTcgMjA4LjkxNyA2MDAuNSAyMjMgNjAwLjUgMjM3LjA4MyA2MDAuNSAyNDguNSA2MTEuOTE3IDI0OC41IDYyNiAyNDguNSA2NDAuMDgzIDIzNy4wODMgNjUxLjUgMjIzIDY1MS41IDIwOC45MTcgNjUxLjUgMTk3LjUgNjQwLjA4MyAxOTcuNSA2MjZaIiBzdHJva2U9IiNGMTkwMzEiIHN0cm9rZS13aWR0aD0iMS4zMzMzMyIgc3Ryb2tlLW1pdGVybGltaXQ9IjgiIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjxwYXRoIGQ9Ik0yODcuNSA2MDguODMzQzI4Ny41IDYwNC4yMzEgMjkxLjIzMSA2MDAuNSAyOTUuODMzIDYwMC41TDExNDUuMTcgNjAwLjVDMTE0OS43NyA2MDAuNSAxMTUzLjUgNjA0LjIzMSAxMTUzLjUgNjA4LjgzM0wxMTUzLjUgNjQyLjE2N0MxMTUzLjUgNjQ2Ljc2OSAxMTQ5Ljc3IDY1MC41IDExNDUuMTcgNjUwLjVMMjk1LjgzMyA2NTAuNUMyOTEuMjMxIDY1MC41IDI4Ny41IDY0Ni43NjkgMjg3LjUgNjQyLjE2N1oiIHN0cm9rZT0iI0YxOTAzMSIgc3Ryb2tlLXdpZHRoPSIxLjMzMzMzIiBzdHJva2UtbWl0ZXJsaW1pdD0iOCIgZmlsbD0iI0ZGRkZGRiIgZmlsbC1ydWxlPSJldmVub2RkIi8+PHRleHQgZm9udC1mYW1pbHk9IkFyaWFsLEFyaWFsX01TRm9udFNlcnZpY2Usc2Fucy1zZXJpZiIgZm9udC13ZWlnaHQ9IjcwMCIgZm9udC1zaXplPSIxOSIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMzA1LjQ0NCA2MjgpIj5Cw4BJIDkgPHRzcGFuIGZvbnQtc2l6ZT0iMTkiIHg9IjUyLjgzMzMiIHk9IjAiPuKAkzwvdHNwYW4+PHRzcGFuIGZvbnQtc2l6ZT0iMTkiIHg9IjY4LjMzMzMiIHk9IjAiPktIw4FNIFBIw4EgxJDhuqBJIETGr8agTkc8L3RzcGFuPjx0c3BhbiBmb250LWZhbWlseT0iU2Fuc1NlcmlmLFNhbnNTZXJpZl9NU0ZvbnRTZXJ2aWNlLHNhbnMtc2VyaWYiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMzAiIHg9Ii05MC42OTE2IiB5PSIxMSI+OTwvdHNwYW4+PHRzcGFuIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zaXplPSIyMCIgeD0iNzAzLjg0NyIgeT0iMiI+MSBnaeG7nSAzMCBwaMO6dDwvdHNwYW4+PC90ZXh0PjxwYXRoIGQ9Ik0yMjIgNTg3IDIyMiA1OTkuNiIgc3Ryb2tlPSIjRjE5MDMxIiBzdHJva2Utd2lkdGg9IjIiIHN0cm9rZS1taXRlcmxpbWl0PSI4IiBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48cGF0aCBkPSJNMTk3LjUgNjg5QzE5Ny41IDY3NC45MTcgMjA4LjkxNyA2NjMuNSAyMjMgNjYzLjUgMjM3LjA4MyA2NjMuNSAyNDguNSA2NzQuOTE3IDI0OC41IDY4OSAyNDguNSA3MDMuMDgzIDIzNy4wODMgNzE0LjUgMjIzIDcxNC41IDIwOC45MTcgNzE0LjUgMTk3LjUgNzAzLjA4MyAxOTcuNSA2ODlaIiBzdHJva2U9IiNGMTkwMzEiIHN0cm9rZS13aWR0aD0iMS4zMzMzMyIgc3Ryb2tlLW1pdGVybGltaXQ9IjgiIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjxwYXRoIGQ9Ik0yODcuNSA2NzEuODMzQzI4Ny41IDY2Ny4yMzEgMjkxLjIzMSA2NjMuNSAyOTUuODMzIDY2My41TDExNDUuMTcgNjYzLjVDMTE0OS43NyA2NjMuNSAxMTUzLjUgNjY3LjIzMSAxMTUzLjUgNjcxLjgzM0wxMTUzLjUgNzA1LjE2N0MxMTUzLjUgNzA5Ljc2OSAxMTQ5Ljc3IDcxMy41IDExNDUuMTcgNzEzLjVMMjk1LjgzMyA3MTMuNUMyOTEuMjMxIDcxMy41IDI4Ny41IDcwOS43NjkgMjg3LjUgNzA1LjE2N1oiIHN0cm9rZT0iI0YxOTAzMSIgc3Ryb2tlLXdpZHRoPSIxLjMzMzMzIiBzdHJva2UtbWl0ZXJsaW1pdD0iOCIgZmlsbD0iI0ZGRkZGRiIgZmlsbC1ydWxlPSJldmVub2RkIi8+PHRleHQgZm9udC1mYW1pbHk9IkFyaWFsLEFyaWFsX01TRm9udFNlcnZpY2Usc2Fucy1zZXJpZiIgZm9udC13ZWlnaHQ9IjcwMCIgZm9udC1zaXplPSIxOSIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMzA1LjQ0NSA2OTApIj5Cw4BJIDEwIDx0c3BhbiBmb250LXNpemU9IjE5IiB4PSI2My4xNjY3IiB5PSIwIj7igJM8L3RzcGFuPjx0c3BhbiBmb250LXNpemU9IjE5IiB4PSI3OC42NjY3IiB5PSIwIj7DnSBUxq/hu55ORyBE4buwIMOBTiBDVeG7kEkgS0hPw4E8L3RzcGFuPjx0c3BhbiBmb250LWZhbWlseT0iU2Fuc1NlcmlmLFNhbnNTZXJpZl9NU0ZvbnRTZXJ2aWNlLHNhbnMtc2VyaWYiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMzAiIHg9Ii0xMDAuODI1IiB5PSIxMCI+MTA8L3RzcGFuPjx0c3BhbiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMjAiIHg9IjcwMy44NDciIHk9IjMiPjEgZ2nhu50gMzAgcGjDunQ8L3RzcGFuPjwvdGV4dD48cGF0aCBkPSJNMjIyIDY1MCAyMjIgNjYyLjYiIHN0cm9rZT0iI0YxOTAzMSIgc3Ryb2tlLXdpZHRoPSIyIiBzdHJva2UtbWl0ZXJsaW1pdD0iOCIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIi8+PHBhdGggZD0iTTE5Ny41IDc1MkMxOTcuNSA3MzcuOTE3IDIwOC45MTcgNzI2LjUgMjIzIDcyNi41IDIzNy4wODMgNzI2LjUgMjQ4LjUgNzM3LjkxNyAyNDguNSA3NTIgMjQ4LjUgNzY2LjA4MyAyMzcuMDgzIDc3Ny41IDIyMyA3NzcuNSAyMDguOTE3IDc3Ny41IDE5Ny41IDc2Ni4wODMgMTk3LjUgNzUyWiIgc3Ryb2tlPSIjRjE5MDMxIiBzdHJva2Utd2lkdGg9IjEuMzMzMzMiIHN0cm9rZS1taXRlcmxpbWl0PSI4IiBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48cGF0aCBkPSJNMjg3LjUgNzM0LjgzM0MyODcuNSA3MzAuMjMxIDI5MS4yMzEgNzI2LjUgMjk1LjgzMyA3MjYuNUwxMTQ1LjE3IDcyNi41QzExNDkuNzcgNzI2LjUgMTE1My41IDczMC4yMzEgMTE1My41IDczNC44MzNMMTE1My41IDc2OC4xNjdDMTE1My41IDc3Mi43NjkgMTE0OS43NyA3NzYuNSAxMTQ1LjE3IDc3Ni41TDI5NS44MzMgNzc2LjVDMjkxLjIzMSA3NzYuNSAyODcuNSA3NzIuNzY5IDI4Ny41IDc2OC4xNjdaIiBzdHJva2U9IiNGMTkwMzEiIHN0cm9rZS13aWR0aD0iMS4zMzMzMyIgc3Ryb2tlLW1pdGVybGltaXQ9IjgiIGZpbGw9IiNGRkZGRkYiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjx0ZXh0IGZvbnQtZmFtaWx5PSJBcmlhbCxBcmlhbF9NU0ZvbnRTZXJ2aWNlLHNhbnMtc2VyaWYiIGZvbnQtd2VpZ2h0PSI3MDAiIGZvbnQtc2l6ZT0iMTkiIHRyYW5zZm9ybT0idHJhbnNsYXRlKDMwNS40NDQgNzU0KSI+QsOASSAxMSA8dHNwYW4gZm9udC1zaXplPSIxOSIgeD0iNjIuMTQiIHk9IjAiPuKAkzwvdHNwYW4+PHRzcGFuIGZvbnQtc2l6ZT0iMTkiIHg9Ijc3LjY0IiB5PSIwIj5M4bqsUCBUUsOMTkggROG7sCDDgU4gQ1Xhu5BJIEtIw5NBPC90c3Bhbj48dHNwYW4gZm9udC1mYW1pbHk9IlNhbnNTZXJpZixTYW5zU2VyaWZfTVNGb250U2VydmljZSxzYW5zLXNlcmlmIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjMwIiB4PSItOTguNjQ0NyIgeT0iMTEiPjExPC90c3Bhbj48dHNwYW4gZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjIwIiB4PSI3MDMuODQ3IiB5PSIyIj4xIGdp4budIDMwIHBow7p0PC90c3Bhbj48L3RleHQ+PHBhdGggZD0iTTIyMiA3MTMgMjIyIDcyNS42IiBzdHJva2U9IiNGMTkwMzEiIHN0cm9rZS13aWR0aD0iMiIgc3Ryb2tlLW1pdGVybGltaXQ9IjgiIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjxwYXRoIGQ9Ik0xOTcuNSA4MTUuNUMxOTcuNSA4MDEuNjkzIDIwOC45MTcgNzkwLjUgMjIzIDc5MC41IDIzNy4wODMgNzkwLjUgMjQ4LjUgODAxLjY5MyAyNDguNSA4MTUuNSAyNDguNSA4MjkuMzA3IDIzNy4wODMgODQwLjUgMjIzIDg0MC41IDIwOC45MTcgODQwLjUgMTk3LjUgODI5LjMwNyAxOTcuNSA4MTUuNVoiIHN0cm9rZT0iI0YxOTAzMSIgc3Ryb2tlLXdpZHRoPSIxLjMzMzMzIiBzdHJva2UtbWl0ZXJsaW1pdD0iOCIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIi8+PHBhdGggZD0iTTI4Ny41IDc5OEMyODcuNSA3OTMuMzA2IDI5MS4zMDYgNzg5LjUgMjk2IDc4OS41TDExNDUgNzg5LjVDMTE0OS42OSA3ODkuNSAxMTUzLjUgNzkzLjMwNiAxMTUzLjUgNzk4TDExNTMuNSA4MzJDMTE1My41IDgzNi42OTQgMTE0OS42OSA4NDAuNSAxMTQ1IDg0MC41TDI5NiA4NDAuNUMyOTEuMzA2IDg0MC41IDI4Ny41IDgzNi42OTQgMjg3LjUgODMyWiIgc3Ryb2tlPSIjRjE5MDMxIiBzdHJva2Utd2lkdGg9IjEuMzMzMzMiIHN0cm9rZS1taXRlcmxpbWl0PSI4IiBmaWxsPSIjRkZGRkZGIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48dGV4dCBmb250LWZhbWlseT0iQXJpYWwsQXJpYWxfTVNGb250U2VydmljZSxzYW5zLXNlcmlmIiBmb250LXdlaWdodD0iNzAwIiBmb250LXNpemU9IjE5IiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgzMDUuNDQ1IDgxNykiPkLDgEkgMTIgPHRzcGFuIGZvbnQtc2l6ZT0iMTkiIHg9IjYzLjE2NjciIHk9IjAiPuKAkzwvdHNwYW4+PHRzcGFuIGZvbnQtc2l6ZT0iMTkiIHg9Ijc4LjY2NjciIHk9IjAiPkLhuqJPIFbhu4YgROG7sCDDgU48L3RzcGFuPjx0c3BhbiBmb250LWZhbWlseT0iU2Fuc1NlcmlmLFNhbnNTZXJpZl9NU0ZvbnRTZXJ2aWNlLHNhbnMtc2VyaWYiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMzAiIHg9Ii05OC4xNTY0IiB5PSIxMSI+MTI8L3RzcGFuPjx0c3BhbiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMjAiIHg9IjcwMy44NDciIHk9IjMiPjEgZ2nhu50gMzAgcGjDunQ8L3RzcGFuPjwvdGV4dD48cGF0aCBkPSJNMjIyIDc3NyAyMjIgNzg5LjYiIHN0cm9rZT0iI0YxOTAzMSIgc3Ryb2tlLXdpZHRoPSIyIiBzdHJva2UtbWl0ZXJsaW1pdD0iOCIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIi8+PC9nPjwvc3ZnPg==\" width=\"974\" /></h2>\n\n<ul>\n</ul>\n</div>\n', '144 giờ (2 học kỳ ~ 24 tháng), 90\' mỗi buổi', '8 học phần từ thấp đến cao', 'java-core, java-tutorial,..', ' 14/7/2021', ' 14/7/2021', 'Khóa học lập trình Minecraft SPEC', 'Lập trình Minecraft là gì? Tại sao nên dạy lập trình Minecraft cho trẻ ngay hôm nay? Hãy cùng tìm hiểu những thông tin hữu ích ngay sau đây nhé!', 'Lập trình Minecraft, Minecraft cơ bản, Minecraft cho trẻ em, học lập trình Minecraft, Minecraft, game Minecraft', 'index,follow', 0, b'1');
INSERT INTO `course` (`id`, `image`, `student_fees`, `tuition_fee_after_reduction`, `name`, `deleted`, `id_small_category`, `url_view`, `obj_students`, `id_user`, `theme_id`, `promotion`, `sub_content`, `create_date`, `age`, `number_of_student`, `teacher_id`, `main_content`, `duration_of_study`, `section`, `document`, `opening_day`, `study_time`, `meta_title`, `meta_description`, `meta_keyword`, `meta_robot`, `percent_of_promotion`, `classify`) VALUES
(11, 'client/image/images_Trang_Chu/picture1.jpg', 2000000, 2000000, 'Khóa học lập trình Robot', b'0', 1, 'robot', 'Thiếu nhi', 8, 5, b'1', 'Xây dựng trò chơi trên Rolot và Robot Studio. Ứng dụng ngôn ngữ lập trình để xây dựng hiệu ứng và chuyển động.', '2021-04-17', '7-12', 20, 1, '<h1 class=\"margin-bottom-15\" style=\"margin-top: 0px; margin-bottom: 15px; padding: 10px 0px 0px; line-height: 1.2; font-size: 2.5rem; font-family: Exo, sans-serif; color: rgb(9, 49, 102);\"><b>Lập trình robot- ngành học hứa hẹn tương lai tươi sáng cho bé</b></h1><p style=\"margin-bottom: 1rem; padding: 0px; color: rgb(33, 37, 41); font-family: Exo, sans-serif;\">Lập trình Robot đang là môn học vô cùng thú vị, cuốn hút tất cả mọi người đặc biệt là các bạn nhỏ. Quá trình học mang đến cho các em niềm vui và nền tảng tri thức vững chắc cho tương lai</p><div class=\"margin-bottom-15\" style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(33, 37, 41); font-family: Exo, sans-serif;\">12 tháng 03, 2021</div><div class=\"techmaster-font-open-sans post-content\" style=\"margin: 0px; padding: 1.5rem 0px 1rem; overflow-x: auto; border-top: 0.5px solid rgba(0, 0, 0, 0.125); line-height: 1.75rem; letter-spacing: -0.003em; overflow-wrap: break-word; font-family: &quot;Open Sans&quot;, sans-serif;\"><font color=\"#212529\"><span id=\"zone1\" style=\"margin: 0px; padding: 0px;\"></span></font><h2 style=\"color: rgb(9, 49, 102); margin: 0px 0px 0.5rem; padding: 0px; font-weight: 600; line-height: 1.2; font-size: 2rem;\">Dạy cho trẻ về lập trình Robot</h2><p style=\"color: rgb(33, 37, 41); margin-bottom: 1rem; padding: 0px;\">Sự tuyệt vời và thú vị từ những con robot đã tạo nên sức hút mạnh mẽ đối với bộ môn lập trình robot của rất nhiều người. Đặc biệt các bạn nhỏ hoàn toàn có thể tiếp cận sớm với môn học này để thỏa mãn đam mê và sự sáng tạo không ngừng cùng các khóa học lập trình cho bé chuyên nghiệp.&nbsp;</p><font color=\"#212529\"><span style=\"margin: 0px; padding: 0px;\"></span></font><h2 style=\"color: rgb(9, 49, 102); margin: 0px 0px 0.5rem; padding: 0px; font-weight: 600; line-height: 1.2; font-size: 2rem;\">Lập trình robot là gì ? Và những ứng dụng trong cuộc sống con người?</h2><ul style=\"color: rgb(33, 37, 41); margin-right: 0px; margin-bottom: 1rem; margin-left: 0px; padding: 0px; list-style: none;\"><p style=\"margin-bottom: 1rem; padding: 0px;\">Lập trình Robot là ngành khoa học kỹ thuật cao nổi tiếng tại các quốc gia phát triển trên thế giới như: Nhật Bản, Mỹ, châu Âu,...Sự ra đời của robot được xem như bước ngoặt trong sự phát triển của nhân loại. Bởi các công nghệ robot đã góp phần không nhỏ giúp thay thế sức lực con người trong những môi trường làm việc nguy hiểm, độc hại. Thậm chí trong một số công việc mà con người không thể làm được thì robot là công cụ hỗ trợ tuyệt vời, được lựa chọn hàng đầu. Bên cạnh đó, robot còn giúp con người nâng cao năng suất lao động, giảm chi phí sản xuất,....hiệu quả</p></ul><p style=\"color: rgb(33, 37, 41); margin-bottom: 1rem; padding: 0px; text-align: center;\"><img alt=\"\" height=\"602\" src=\"https://spec.edu.vn/client/image/a20.png\" width=\"500\" style=\"margin: auto; padding: 0px; border-style: none; max-width: 100%; height: auto;\"></p><font color=\"#212529\"><span style=\"margin: 0px; padding: 0px;\"></span></font><p style=\"color: rgb(33, 37, 41); margin-bottom: 1rem; margin-left: 15px; padding: 0px; font-style: italic; text-align: center;\">Công nghệ robot vô cùng phát triển trong cuộc sống hiện đại</p><p style=\"color: rgb(33, 37, 41); margin-bottom: 1rem; padding: 0px;\">Chính vì vậy, hiện nay robot được ứng dụng rộng rãi trong nhiều ngành nghề, lĩnh vực như công nghiệp, y tế, giáo dục, quân sự,…Trong đó việc chiếm lĩnh công nghệ robot được xem là mục tiêu đối với sự phát triển toàn diện của mọi quốc gia trong thế kỷ 21. Tại Việt Nam, lĩnh vực này cũng đang được các đặc biệt quan tâm và phát triển trong thời gian gần đây và đã đạt được nhiều kết quả đáng tự hào.</p><font color=\"#212529\"><span style=\"margin: 0px; padding: 0px;\"></span></font><h2 id=\"zone3\" style=\"color: rgb(9, 49, 102); margin: 0px 0px 0.5rem; padding: 0px; font-weight: 600; line-height: 1.2; font-size: 2rem;\">Học lập trình robot có phù hợp với trẻ em không?</h2><p style=\"color: rgb(33, 37, 41); margin-bottom: 1rem; padding: 0px;\">Nhiều người cho rằng đối với môn khoa học kỹ thuật cao này phù hợp với người trưởng thành hơn. Tuy nhiên, các nhà khoa học đã chứng minh rằng, những đứa trẻ sinh ra trong thời đại công nghệ 4.0 có trí tuệ phát triển và sự nhạy bén hoàn toàn có thể tiếp thu những kiến thức khoa học hiện đại này nhanh chóng và hiệu quả.</p><p style=\"color: rgb(33, 37, 41); margin-bottom: 1rem; padding: 0px;\">Các bé từ 5-6 tuổi hoàn toàn có thể bắt đầu trải nghiệm và tiếp cận với bộ môn này. Đặc biệt độ tuổi từ 7-12 được xem là giai đoạn vàng, khi đó trí tuệ và nhận thức của bé phát triển khá đầy đủ. Bên cạnh đó với ham học học, khám phá của bé sẽ giúp quá trình đào tạo trở nên hiệu quả hơn rất nhiều.</p><ul style=\"color: rgb(33, 37, 41); margin-right: 0px; margin-bottom: 1rem; margin-left: 0px; padding: 0px; list-style: none;\"><p style=\"margin-bottom: 1rem; padding: 0px; text-align: center;\"><img alt=\"\" height=\"602\" src=\"https://spec.edu.vn/client/image/a21.png\" width=\"500\" style=\"margin: auto; padding: 0px; border-style: none; max-width: 100%; height: auto;\"></p><span style=\"margin: 0px; padding: 0px;\"></span><p style=\"margin-bottom: 1rem; margin-left: 15px; padding: 0px; font-style: italic; text-align: center;\">Lập trình robot là môn học hấp dẫn với trẻ em</p></ul><font color=\"#212529\"><span id=\"zone4\" style=\"margin: 0px; padding: 0px;\"></span></font><h4 style=\"color: rgb(9, 49, 102); margin-right: 0px; margin-bottom: 0.5rem; margin-left: 0px; padding: 0px; font-weight: 600; line-height: 1.2; font-size: 1.5rem;\">Những lợi ích khi dạy lập trình cho trẻ ngay hôm nay</h4><ul style=\"color: rgb(33, 37, 41); margin-right: 0px; margin-bottom: 1rem; margin-left: 0px; padding: 0px; list-style: none;\"><p style=\"margin-bottom: 1rem; padding: 0px;\">Sự ra đời của robot đã đánh dấu bước ngoặt lớn đối với loài người, khi ước mơ từ ngàn đời về những cỗ máy có thể thay thế sức lực của con người đã ra đời. Lập trình robot đã mang đến những thành tựu nổi bật để phát triển khoa học, kỹ thuật, kinh tế,....</p><p style=\"margin-bottom: 1rem; padding: 0px;\">Nhận thấy được sự quan trọng của bộ môn này, hiện nay tại nhiều quốc gia trên thế giới đã đưa chương trình học lập trình robot cho trẻ vào giảng dạy tại các nhà trường. Qua đó để trẻ em có thể tiếp cận với kiến thức lập trình ngay từ nhỏ, bồi đắp niềm đam mê cho các bé. Đồng thời mang đến nhiều lợi ích tuyệt vời cho sự phát triển toàn diện của trẻ</p><span style=\"margin: 0px; padding: 0px;\"></span><h5 style=\"margin: 0px 0px 0.5rem; padding: 0px; font-weight: 600; line-height: 1.2; font-size: 1.25rem;\">Kích thích sự sáng tạo của trẻ</h5><p style=\"margin-bottom: 1rem; padding: 0px;\">Trí tưởng tượng và sáng tạo của bé là điều không giới hạn. Khi bé được tiếp cận sớm với lập trình sẽ giúp cho năng lực đó được phát huy tối đa, mang đến những ứng dụng mới mẻ và độc đáo.</p><p style=\"margin-bottom: 1rem; padding: 0px; text-align: center;\"><img alt=\"\" height=\"602\" src=\"https://spec.edu.vn/client/image/a22.png\" width=\"500\" style=\"margin: auto; padding: 0px; border-style: none; max-width: 100%; height: auto;\"></p><span style=\"margin: 0px; padding: 0px;\"></span><p style=\"margin-bottom: 1rem; margin-left: 15px; padding: 0px; font-style: italic; text-align: center;\">Học lập trình robot ngay từ nhỏ giúp trẻ phát triển toàn diện</p><span style=\"margin: 0px; padding: 0px;\"></span><h5 style=\"margin: 0px 0px 0.5rem; padding: 0px; font-weight: 600; line-height: 1.2; font-size: 1.25rem;\">Rèn luyện khả năng làm việc, giải quyết vấn đề linh hoạt</h5><p style=\"margin-bottom: 1rem; padding: 0px;\">Khi bắt tay vào nghiên cứu và thực hành về lập trình yêu cầu đặt ra đối với trẻ luôn phải chủ động, sáng tạo để có giải pháp phù hợp trong giải quyết mọi vấn đề phát sinh. Từ đó, giúp bé trưởng thành, nhạy bén hơn trong học tập cũng như cuộc sống</p><span style=\"margin: 0px; padding: 0px;\"></span><h5 style=\"margin: 0px 0px 0.5rem; padding: 0px; font-weight: 600; line-height: 1.2; font-size: 1.25rem;\">Phát triển trí tuệ hoàn hảo</h5><p style=\"margin-bottom: 1rem; padding: 0px;\">Khi bé được tiếp cận sớm với môn khoa học kỹ thuật cao như lập trình ngay từ nhỏ thì sẽ kích thích sự phát triển toàn diện về tư duy hiệu quả và nhanh chóng. Từ đó hỗ trợ tối đa cho việc học tập và giải quyết bài tập trên lớp của trẻ. Đồng thời chuẩn bị hành trang vững chắc trong tương lai</p><span style=\"margin: 0px; padding: 0px;\"></span><h5 style=\"margin: 0px 0px 0.5rem; padding: 0px; font-weight: 600; line-height: 1.2; font-size: 1.25rem;\">Phát triển kỹ năng mềm</h5><p style=\"margin-bottom: 1rem; padding: 0px;\">Thực tế, việc học lập trình nói chung, và học lập trình robot nói riêng thực sự không chỉ mang lại tri thức cho trẻ. Bên cạnh đó, còn rèn luyện những kỹ năng mềm cần thiết cho cuộc sống như: khả năng thuyết trình, khả năng làm việc nhóm,.... Chính vì những lợi ích tuyệt vời trên, không có lý do gì mà các bậc phụ huynh không cho trẻ tiếp cận sớm với bộ môn khoa học tuyệt vời này ngay từ hôm nay</p></ul><font color=\"#212529\"><span id=\"zone5\" style=\"margin: 0px; padding: 0px;\"></span></font><h2 style=\"color: rgb(9, 49, 102); margin: 0px 0px 0.5rem; padding: 0px; font-weight: 600; line-height: 1.2; font-size: 2rem;\">Những cơ hội phát triển của trẻ với lập trình robot</h2><ul style=\"color: rgb(33, 37, 41); margin-right: 0px; margin-bottom: 1rem; margin-left: 0px; padding: 0px; list-style: none;\"><p style=\"margin-bottom: 1rem; padding: 0px;\">Cũng giống như các ngôn ngữ thông dụng trên thế giới, lập trình robot hứa hẹn là ngôn ngữ phổ biến trên thế giới trong thời gian tới. Bởi thực tế ngày nay công nghệ robot đang được xem là tiêu chuẩn đánh giá sự phát triển của một quốc gia. Mọi quốc gia phát triển nhất thế giới như: Nhật bản, Singapore, Mỹ,...đều sở hữu công nghệ robot bậc cao. Và tại Việt Nam ngành khoa học này cũng đang là một trong những lĩnh vực rất được quan tâm và đầu tư.</p><p style=\"margin-bottom: 1rem; padding: 0px;\">Chính vì tất cả những lý do trên mà việc trang bị những kiến thức về lập trình robot cho bé ngay từ khi còn nhỏ (đặc biệt trong giai đoạn từ 7-12 tuổi) được xem là điều vô cùng quan trọng. Với nền tảng kiến thức vững chắc đó, cùng niềm đam mê với khoa học chắc chắn sẽ giúp các bé có động lực để học tập và làm việc trong lĩnh vực công nghệ thông tin, khoa học kỹ thuật cao trong tương lai. Đồng thời cơ hội làm việc không chỉ tại Việt Nam mà còn mở rộng ra nhiều quốc gia phát triển khác trên khắp thế giới. Hứa hẹn một tương lai rộng mở cho bé.</p></ul><ul style=\"margin-right: 0px; margin-bottom: 1rem; margin-left: 0px; padding: 0px; list-style: none;\"><font color=\"#212529\"><span id=\"zone6\" style=\"margin: 0px; padding: 0px;\"></span></font><h2 style=\"color: rgb(9, 49, 102); margin: 0px 0px 0.5rem; padding: 0px; font-weight: 600; line-height: 1.2; font-size: 2rem;\">Địa chỉ dạy lập trình cho bé uy tín tại Việt Nam</h2><p style=\"color: rgb(33, 37, 41); margin-bottom: 1rem; padding: 0px;\">Học lập trình web ở đâu tốt nhất là câu hỏi không hề đơn giản. Bởi hiện nay, các trung tâm, trường dạy về lĩnh vực này đang phát triển nhanh chóng, đem đến nhiều lựa chọn cho phụ huynh và các em học sinh. Tuy nhiên, để giúp bé có thể tiếp cận được với những kiến thức về lập trình Web bài bản nhất, cha mẹ nên lựa chọn cho con em mình những địa chỉ uy tín, được đông đảo các bạn học viên yêu thích và đánh giá cao. Và SPEC là một trong những cái tên quen thuộc mà các bạn không nên bỏ qua</p><h6 style=\"color: rgb(0, 0, 0); margin: 0px 0px 0.5rem; padding: 0px; font-weight: 600; line-height: 1.2; font-size: 1rem;\">Uy tín đã được khẳng định</h6><p style=\"color: rgb(33, 37, 41); margin-bottom: 1rem; padding: 0px;\">Với nhiều năm kinh nghiệm trong lĩnh vực giáo dục, SPEC tự hào là địa chỉ đào tạo công nghệ lập trình hàng đầu Việt Nam hiện nay. Mỗi năm trung tâm giúp cho hàng ngàn trẻ em trên khắp cả nước được tiếp cận với bộ môn khoa học kỹ thuật cao hấp dẫn này.</p><p style=\"color: rgb(33, 37, 41); margin-bottom: 1rem; padding: 0px; text-align: center;\"><img alt=\"\" height=\"602\" src=\"https://spec.edu.vn/client/image/a23.png\" width=\"500\" style=\"margin: auto; padding: 0px; border-style: none; max-width: 100%; height: auto;\"></p><p style=\"color: rgb(33, 37, 41); margin-bottom: 1rem; margin-left: 15px; padding: 0px; font-style: italic; text-align: center;\">SPEC tự hào là địa chỉ ươm mầm các tài năng công nghệ robot trong tương lai</p><h6 style=\"color: rgb(0, 0, 0); margin: 0px 0px 0.5rem; padding: 0px; font-weight: 600; line-height: 1.2; font-size: 1rem;\">Đội ngũ giảng viên uy tín.</h6><p style=\"color: rgb(33, 37, 41); margin-bottom: 1rem; padding: 0px;\">Giảng viên tại trung tâm đều là những người được đào tạo bài bản, có kinh nghiệm lâu năm trong nghề. Vì vậy mà luôn mang đến cho các bạn học viên những bài học, kiến thức hữu ích nhất về lập trình robot. Với phương pháp giảng dạy sư phạm, phù hợp với từng đối tượng học viên chắc chắn rằng mỗi giờ học tập tại SPEC luôn giúp các bé cảm thấy vui vẻ và hào hứng.</p><h6 style=\"color: rgb(0, 0, 0); margin: 0px 0px 0.5rem; padding: 0px; font-weight: 600; line-height: 1.2; font-size: 1rem;\">Hệ thống cơ sở vật chất phục vụ giảng dạy hiện đại</h6><p style=\"color: rgb(33, 37, 41); margin-bottom: 1rem; padding: 0px;\">Đáp ứng nhu cầu của học viên khi tham gia học tập bộ môn khoa học kỹ thuật cao như lập trình robot, SPEC đầu tư hệ thống trang thiết bị, cơ sở vật chất hiện đại. Học viên được học trong môi trường vô cùng chuyên nghiệp, từ đó giúp bé nắm bắt và tiếp cận kiến thức nhanh chóng và hiệu quả hơn.</p><h6 style=\"color: rgb(0, 0, 0); margin: 0px 0px 0.5rem; padding: 0px; font-weight: 600; line-height: 1.2; font-size: 1rem;\">Chi phí phù hợp</h6><p style=\"color: rgb(33, 37, 41); margin-bottom: 1rem; padding: 0px;\">SPEC cam kết mang đến cho các bạn nhỏ khóa học lập trình robot chuyên nghiệp với mức giá phải chăng. Đặc biệt, trung tâm cam kết giúp bé sau khi hoàn thành khóa học sẽ nắm vững những kiến thức cơ bản và có thể thực hành hiệu quả trong thực tiễn.</p><p style=\"color: rgb(33, 37, 41); margin-bottom: 1rem; padding: 0px;\">Lập trình robot chính là ngôn ngữ lập trình phổ biến trong xã hội hiện đại. Việc dạy lập trình cho bé ngay từ nhỏ sẽ mang đến cho bé nền tảng vững chắc để có thể vững bước trong thế kỷ 21 với tương lai rộng mở và cơ hội nghề nghiệp hấp dẫn với thu nhập cao. Để biết thêm thông tin chi tiết và đăng ký các khóa học hấp dẫn hãy liên hệ với SPEC ngay hôm nay nhé.</p><h2 style=\"text-align: left; margin-bottom: 1rem; font-family: &quot;Open Sans&quot;, sans-serif; letter-spacing: -0.048px; padding: 0px;\"><span style=\"font-weight: 700;\"><font color=\"#003163\">LỘ TRÌNH KHÓA HỌC</font></span></h2><h2 style=\"text-align: center; margin-bottom: 1rem; font-family: &quot;Open Sans&quot;, sans-serif; letter-spacing: -0.048px; padding: 0px;\"><img src=\"data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iOTc0IiBoZWlnaHQ9Ijc2NCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgb3ZlcmZsb3c9ImhpZGRlbiI+PGRlZnM+PGNsaXBQYXRoIGlkPSJjbGlwMCI+PHJlY3QgeD0iMTg2IiB5PSI4OSIgd2lkdGg9Ijk3NCIgaGVpZ2h0PSI3NjQiLz48L2NsaXBQYXRoPjwvZGVmcz48ZyBjbGlwLXBhdGg9InVybCgjY2xpcDApIiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgtMTg2IC04OSkiPjxwYXRoIGQ9Ik0xOTcuNSAxMTdDMTk3LjUgMTAyLjkxNyAyMDguOTE3IDkxLjUwMDEgMjIzIDkxLjUwMDEgMjM3LjA4MyA5MS41MDAxIDI0OC41IDEwMi45MTcgMjQ4LjUgMTE3IDI0OC41IDEzMS4wODMgMjM3LjA4MyAxNDIuNSAyMjMgMTQyLjUgMjA4LjkxNyAxNDIuNSAxOTcuNSAxMzEuMDgzIDE5Ny41IDExN1oiIHN0cm9rZT0iI0YxOTAzMSIgc3Ryb2tlLXdpZHRoPSIxLjMzMzMzIiBzdHJva2UtbWl0ZXJsaW1pdD0iOCIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIi8+PHBhdGggZD0iTTI4Ny41IDk5LjgzMzRDMjg3LjUgOTUuMjMxIDI5MS4yMzEgOTEuNTAwMSAyOTUuODMzIDkxLjUwMDFMMTE0NS4xNyA5MS41MDAxQzExNDkuNzcgOTEuNTAwMSAxMTUzLjUgOTUuMjMxIDExNTMuNSA5OS44MzM0TDExNTMuNSAxMzMuMTY3QzExNTMuNSAxMzcuNzY5IDExNDkuNzcgMTQxLjUgMTE0NS4xNyAxNDEuNUwyOTUuODMzIDE0MS41QzI5MS4yMzEgMTQxLjUgMjg3LjUgMTM3Ljc2OSAyODcuNSAxMzMuMTY3WiIgc3Ryb2tlPSIjRjE5MDMxIiBzdHJva2Utd2lkdGg9IjEuMzMzMzMiIHN0cm9rZS1taXRlcmxpbWl0PSI4IiBmaWxsPSIjRkZGRkZGIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48dGV4dCBmb250LWZhbWlseT0iQXJpYWwsQXJpYWxfTVNGb250U2VydmljZSxzYW5zLXNlcmlmIiBmb250LXdlaWdodD0iNzAwIiBmb250LXNpemU9IjE5IiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgzMDUuNDQ0IDEyMykiPkjhu41jIHBo4bqnbiAxIC08dHNwYW4gZm9udC1zaXplPSIxOSIgeD0iMTE2LjY2NyIgeT0iMCI+TOG6rlAgUsOBUCBWw4AgTOG6rFAgVFLDjE5IIFJPQk9UIEPGoCBC4bqiTiBW4buaSSBMRUdPIFdFRE88L3RzcGFuPjx0c3BhbiBmb250LWZhbWlseT0iU2Fuc1NlcmlmLFNhbnNTZXJpZl9NU0ZvbnRTZXJ2aWNlLHNhbnMtc2VyaWYiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMzAiIHg9Ii05MC42OTE1IiB5PSI2Ij4xPC90c3Bhbj48dHNwYW4gZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjIwIiB4PSI3MDMuODQ3IiB5PSIwIj4xMiA8L3RzcGFuPjx0c3BhbiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMjAiIHg9IjczMS4wMTQiIHk9IjAiPmLDoGk8L3RzcGFuPjx0c3BhbiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMjAiIHg9Ijc2Mi41MTQiIHk9IjAiPi08L3RzcGFuPjx0c3BhbiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMjAiIHg9Ijc3NC41MTQiIHk9IjAiPjE4IDwvdHNwYW4+PHRzcGFuIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zaXplPSIyMCIgeD0iODAxLjY4IiB5PSIwIj5naeG7nTwvdHNwYW4+PC90ZXh0PjxwYXRoIGQ9Ik0xOTcuNSAxODBDMTk3LjUgMTY1LjkxNyAyMDguOTE3IDE1NC41IDIyMyAxNTQuNSAyMzcuMDgzIDE1NC41IDI0OC41IDE2NS45MTcgMjQ4LjUgMTgwIDI0OC41IDE5NC4wODMgMjM3LjA4MyAyMDUuNSAyMjMgMjA1LjUgMjA4LjkxNyAyMDUuNSAxOTcuNSAxOTQuMDgzIDE5Ny41IDE4MFoiIHN0cm9rZT0iI0YxOTAzMSIgc3Ryb2tlLXdpZHRoPSIxLjMzMzMzIiBzdHJva2UtbWl0ZXJsaW1pdD0iOCIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIi8+PHBhdGggZD0iTTI4Ny41IDE2Mi44MzNDMjg3LjUgMTU4LjIzMSAyOTEuMjMxIDE1NC41IDI5NS44MzMgMTU0LjVMMTE0NS4xNyAxNTQuNUMxMTQ5Ljc3IDE1NC41IDExNTMuNSAxNTguMjMxIDExNTMuNSAxNjIuODMzTDExNTMuNSAxOTYuMTY3QzExNTMuNSAyMDAuNzY5IDExNDkuNzcgMjA0LjUgMTE0NS4xNyAyMDQuNUwyOTUuODMzIDIwNC41QzI5MS4yMzEgMjA0LjUgMjg3LjUgMjAwLjc2OSAyODcuNSAxOTYuMTY3WiIgc3Ryb2tlPSIjRjE5MDMxIiBzdHJva2Utd2lkdGg9IjEuMzMzMzMiIHN0cm9rZS1taXRlcmxpbWl0PSI4IiBmaWxsPSIjRkZGRkZGIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48dGV4dCBmb250LWZhbWlseT0iQXJpYWwsQXJpYWxfTVNGb250U2VydmljZSxzYW5zLXNlcmlmIiBmb250LXdlaWdodD0iNzAwIiBmb250LXNpemU9IjE5IiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgzMDUuNDQ0IDE4MSkiPkjhu41jIHBo4bqnbiAyIC08dHNwYW4gZm9udC1zaXplPSIxOSIgeD0iMTE2LjY2NyIgeT0iMCI+TOG6rlAgUsOBUCBWw4AgTOG6rFAgVFLDjE5IIFJPQk9UIEPGoCBC4bqiTiBW4buaSSBMRUdPIFdFRE88L3RzcGFuPjx0c3BhbiBmb250LWZhbWlseT0iU2Fuc1NlcmlmLFNhbnNTZXJpZl9NU0ZvbnRTZXJ2aWNlLHNhbnMtc2VyaWYiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMzAiIHg9Ii05MC42OTE1IiB5PSIxMSI+MjwvdHNwYW4+PHRzcGFuIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zaXplPSIyMCIgeD0iNzAzLjg0NyIgeT0iMyI+MTIgPC90c3Bhbj48dHNwYW4gZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjIwIiB4PSI3MzEuMDE0IiB5PSIzIj5iw6BpPC90c3Bhbj48dHNwYW4gZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjIwIiB4PSI3NjIuNTE0IiB5PSIzIj4tPC90c3Bhbj48dHNwYW4gZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjIwIiB4PSI3NzQuNTE0IiB5PSIzIj4xOCA8L3RzcGFuPjx0c3BhbiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMjAiIHg9IjgwMS42OCIgeT0iMyI+Z2nhu508L3RzcGFuPjwvdGV4dD48cGF0aCBkPSJNMjIyIDE0MiAyMjIgMTU0LjYiIHN0cm9rZT0iI0YxOTAzMSIgc3Ryb2tlLXdpZHRoPSIyIiBzdHJva2UtbWl0ZXJsaW1pdD0iOCIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIi8+PHBhdGggZD0iTTE5Ny41IDI0My41QzE5Ny41IDIyOS42OTMgMjA4LjkxNyAyMTguNSAyMjMgMjE4LjUgMjM3LjA4MyAyMTguNSAyNDguNSAyMjkuNjkzIDI0OC41IDI0My41IDI0OC41IDI1Ny4zMDcgMjM3LjA4MyAyNjguNSAyMjMgMjY4LjUgMjA4LjkxNyAyNjguNSAxOTcuNSAyNTcuMzA3IDE5Ny41IDI0My41WiIgc3Ryb2tlPSIjRjE5MDMxIiBzdHJva2Utd2lkdGg9IjEuMzMzMzMiIHN0cm9rZS1taXRlcmxpbWl0PSI4IiBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48cGF0aCBkPSJNMjg3LjUgMjI2QzI4Ny41IDIyMS4zMDYgMjkxLjMwNiAyMTcuNSAyOTYgMjE3LjVMMTE0NSAyMTcuNUMxMTQ5LjY5IDIxNy41IDExNTMuNSAyMjEuMzA2IDExNTMuNSAyMjZMMTE1My41IDI2MEMxMTUzLjUgMjY0LjY5NCAxMTQ5LjY5IDI2OC41IDExNDUgMjY4LjVMMjk2IDI2OC41QzI5MS4zMDYgMjY4LjUgMjg3LjUgMjY0LjY5NCAyODcuNSAyNjBaIiBzdHJva2U9IiNGMTkwMzEiIHN0cm9rZS13aWR0aD0iMS4zMzMzMyIgc3Ryb2tlLW1pdGVybGltaXQ9IjgiIGZpbGw9IiNGRkZGRkYiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjx0ZXh0IGZvbnQtZmFtaWx5PSJBcmlhbCxBcmlhbF9NU0ZvbnRTZXJ2aWNlLHNhbnMtc2VyaWYiIGZvbnQtd2VpZ2h0PSI3MDAiIGZvbnQtc2l6ZT0iMTkiIHRyYW5zZm9ybT0idHJhbnNsYXRlKDMwNS40NDQgMjQ1KSI+SOG7jWMgcGjhuqduIDMgLTx0c3BhbiBmb250LXNpemU9IjE5IiB4PSIxMTYuNjY3IiB5PSIwIj5M4bquUCBSw4FQIFbDgCBM4bqsUCBUUsOMTkggUk9CT1QgQ8agIELhuqJOIFbhu5pJIExFR08gV0VETzwvdHNwYW4+PHRzcGFuIGZvbnQtZmFtaWx5PSJTYW5zU2VyaWYsU2Fuc1NlcmlmX01TRm9udFNlcnZpY2Usc2Fucy1zZXJpZiIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zaXplPSIzMCIgeD0iLTkwLjY5MTUiIHk9IjExIj4zPC90c3Bhbj48dHNwYW4gZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjIwIiB4PSI3MDMuODQ3IiB5PSIzIj4xMiA8L3RzcGFuPjx0c3BhbiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMjAiIHg9IjczMS4wMTQiIHk9IjMiPmLDoGk8L3RzcGFuPjx0c3BhbiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMjAiIHg9Ijc2Mi41MTQiIHk9IjMiPi08L3RzcGFuPjx0c3BhbiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMjAiIHg9Ijc3NC41MTQiIHk9IjMiPjE4IDwvdHNwYW4+PHRzcGFuIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zaXplPSIyMCIgeD0iODAxLjY4IiB5PSIzIj5naeG7nTwvdHNwYW4+PC90ZXh0PjxwYXRoIGQ9Ik0yMjIgMjA1IDIyMiAyMTcuNiIgc3Ryb2tlPSIjRjE5MDMxIiBzdHJva2Utd2lkdGg9IjIiIHN0cm9rZS1taXRlcmxpbWl0PSI4IiBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48cGF0aCBkPSJNMTk3LjUgMzA3QzE5Ny41IDI5Mi45MTcgMjA4LjkxNyAyODEuNSAyMjMgMjgxLjUgMjM3LjA4MyAyODEuNSAyNDguNSAyOTIuOTE3IDI0OC41IDMwNyAyNDguNSAzMjEuMDgzIDIzNy4wODMgMzMyLjUgMjIzIDMzMi41IDIwOC45MTcgMzMyLjUgMTk3LjUgMzIxLjA4MyAxOTcuNSAzMDdaIiBzdHJva2U9IiNGMTkwMzEiIHN0cm9rZS13aWR0aD0iMS4zMzMzMyIgc3Ryb2tlLW1pdGVybGltaXQ9IjgiIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjxwYXRoIGQ9Ik0yODcuNSAyODkuODMzQzI4Ny41IDI4NS4yMzEgMjkxLjIzMSAyODEuNSAyOTUuODMzIDI4MS41TDExNDUuMTcgMjgxLjVDMTE0OS43NyAyODEuNSAxMTUzLjUgMjg1LjIzMSAxMTUzLjUgMjg5LjgzM0wxMTUzLjUgMzIzLjE2N0MxMTUzLjUgMzI3Ljc2OSAxMTQ5Ljc3IDMzMS41IDExNDUuMTcgMzMxLjVMMjk1LjgzMyAzMzEuNUMyOTEuMjMxIDMzMS41IDI4Ny41IDMyNy43NjkgMjg3LjUgMzIzLjE2N1oiIHN0cm9rZT0iI0YxOTAzMSIgc3Ryb2tlLXdpZHRoPSIxLjMzMzMzIiBzdHJva2UtbWl0ZXJsaW1pdD0iOCIgZmlsbD0iI0ZGRkZGRiIgZmlsbC1ydWxlPSJldmVub2RkIi8+PHRleHQgZm9udC1mYW1pbHk9IkFyaWFsLEFyaWFsX01TRm9udFNlcnZpY2Usc2Fucy1zZXJpZiIgZm9udC13ZWlnaHQ9IjcwMCIgZm9udC1zaXplPSIxOSIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMzA1LjQ0NCAzMDgpIj5I4buNYyBwaOG6p24gNCAtPHRzcGFuIGZvbnQtc2l6ZT0iMTkiIHg9IjExNi42NjciIHk9IjAiPkzhuq5QIFLDgVAgVsOAIEzhuqxQIFRSw4xOSCBST0JPVCBDxqAgQuG6ok4gVuG7mkkgTEVHTyBXRURPPC90c3Bhbj48dHNwYW4gZm9udC1mYW1pbHk9IlNhbnNTZXJpZixTYW5zU2VyaWZfTVNGb250U2VydmljZSxzYW5zLXNlcmlmIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjMwIiB4PSItOTAuNjkxNSIgeT0iMTEiPjQ8L3RzcGFuPjx0c3BhbiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMjAiIHg9IjcwMy44NDciIHk9IjMiPjEyIDwvdHNwYW4+PHRzcGFuIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zaXplPSIyMCIgeD0iNzMxLjAxNCIgeT0iMyI+YsOgaTwvdHNwYW4+PHRzcGFuIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zaXplPSIyMCIgeD0iNzYyLjUxNCIgeT0iMyI+LTwvdHNwYW4+PHRzcGFuIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zaXplPSIyMCIgeD0iNzc0LjUxNCIgeT0iMyI+MTggPC90c3Bhbj48dHNwYW4gZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjIwIiB4PSI4MDEuNjgiIHk9IjMiPmdp4budPC90c3Bhbj48L3RleHQ+PHBhdGggZD0iTTIyMiAyNjggMjIyIDI4MC42IiBzdHJva2U9IiNGMTkwMzEiIHN0cm9rZS13aWR0aD0iMiIgc3Ryb2tlLW1pdGVybGltaXQ9IjgiIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjxwYXRoIGQ9Ik0xOTcuNSAzNzAuNUMxOTcuNSAzNTYuNjkzIDIwOC45MTcgMzQ1LjUgMjIzIDM0NS41IDIzNy4wODMgMzQ1LjUgMjQ4LjUgMzU2LjY5MyAyNDguNSAzNzAuNSAyNDguNSAzODQuMzA3IDIzNy4wODMgMzk1LjUgMjIzIDM5NS41IDIwOC45MTcgMzk1LjUgMTk3LjUgMzg0LjMwNyAxOTcuNSAzNzAuNVoiIHN0cm9rZT0iI0YxOTAzMSIgc3Ryb2tlLXdpZHRoPSIxLjMzMzMzIiBzdHJva2UtbWl0ZXJsaW1pdD0iOCIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIi8+PHBhdGggZD0iTTI4Ny41IDM1M0MyODcuNSAzNDguMzA2IDI5MS4zMDYgMzQ0LjUgMjk2IDM0NC41TDExNDUgMzQ0LjVDMTE0OS42OSAzNDQuNSAxMTUzLjUgMzQ4LjMwNiAxMTUzLjUgMzUzTDExNTMuNSAzODdDMTE1My41IDM5MS42OTQgMTE0OS42OSAzOTUuNSAxMTQ1IDM5NS41TDI5NiAzOTUuNUMyOTEuMzA2IDM5NS41IDI4Ny41IDM5MS42OTQgMjg3LjUgMzg3WiIgc3Ryb2tlPSIjRjE5MDMxIiBzdHJva2Utd2lkdGg9IjEuMzMzMzMiIHN0cm9rZS1taXRlcmxpbWl0PSI4IiBmaWxsPSIjRkZGRkZGIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48dGV4dCBmb250LWZhbWlseT0iQXJpYWwsQXJpYWxfTVNGb250U2VydmljZSxzYW5zLXNlcmlmIiBmb250LXdlaWdodD0iNzAwIiBmb250LXNpemU9IjE5IiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgzMDUuNDQ0IDM3MikiPkjhu41jPHRzcGFuIGZvbnQtc2l6ZT0iMTkiIHg9IjQwLjMzMzMiIHk9IjAiPnBo4bqnbjwvdHNwYW4+PHRzcGFuIGZvbnQtc2l6ZT0iMTkiIHg9Ijg5LjgzMzMiIHk9IjAiPjUgPC90c3Bhbj4tPHRzcGFuIGZvbnQtc2l6ZT0iMTkiIHg9IjExNi42NjciIHk9IjAiPlPDgU5HIENI4bq+IFbhu5pJIExFR08gV0VETywgU0NSQVRDSDwvdHNwYW4+PHRzcGFuIGZvbnQtZmFtaWx5PSJTYW5zU2VyaWYsU2Fuc1NlcmlmX01TRm9udFNlcnZpY2Usc2Fucy1zZXJpZiIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zaXplPSIzMCIgeD0iLTkwLjY5MTUiIHk9IjExIj41PC90c3Bhbj48dHNwYW4gZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjIwIiB4PSI3MDMuODQ3IiB5PSIzIj4xMiA8L3RzcGFuPjx0c3BhbiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMjAiIHg9IjczMS4wMTQiIHk9IjMiPmLDoGk8L3RzcGFuPjx0c3BhbiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMjAiIHg9Ijc2Mi41MTQiIHk9IjMiPi08L3RzcGFuPjx0c3BhbiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMjAiIHg9Ijc3NC41MTQiIHk9IjMiPjE4IDwvdHNwYW4+PHRzcGFuIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zaXplPSIyMCIgeD0iODAxLjY4IiB5PSIzIj5naeG7nTwvdHNwYW4+PC90ZXh0PjxwYXRoIGQ9Ik0yMjIgMzMyIDIyMiAzNDQuNiIgc3Ryb2tlPSIjRjE5MDMxIiBzdHJva2Utd2lkdGg9IjIiIHN0cm9rZS1taXRlcmxpbWl0PSI4IiBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48cGF0aCBkPSJNMTk3LjUgNDM0LjVDMTk3LjUgNDIwLjY5MyAyMDguOTE3IDQwOS41IDIyMyA0MDkuNSAyMzcuMDgzIDQwOS41IDI0OC41IDQyMC42OTMgMjQ4LjUgNDM0LjUgMjQ4LjUgNDQ4LjMwNyAyMzcuMDgzIDQ1OS41IDIyMyA0NTkuNSAyMDguOTE3IDQ1OS41IDE5Ny41IDQ0OC4zMDcgMTk3LjUgNDM0LjVaIiBzdHJva2U9IiNGMTkwMzEiIHN0cm9rZS13aWR0aD0iMS4zMzMzMyIgc3Ryb2tlLW1pdGVybGltaXQ9IjgiIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjxwYXRoIGQ9Ik0yODcuNSA0MTdDMjg3LjUgNDEyLjMwNiAyOTEuMzA2IDQwOC41IDI5NiA0MDguNUwxMTQ1IDQwOC41QzExNDkuNjkgNDA4LjUgMTE1My41IDQxMi4zMDYgMTE1My41IDQxN0wxMTUzLjUgNDUxQzExNTMuNSA0NTUuNjk0IDExNDkuNjkgNDU5LjUgMTE0NSA0NTkuNUwyOTYgNDU5LjVDMjkxLjMwNiA0NTkuNSAyODcuNSA0NTUuNjk0IDI4Ny41IDQ1MVoiIHN0cm9rZT0iI0YxOTAzMSIgc3Ryb2tlLXdpZHRoPSIxLjMzMzMzIiBzdHJva2UtbWl0ZXJsaW1pdD0iOCIgZmlsbD0iI0ZGRkZGRiIgZmlsbC1ydWxlPSJldmVub2RkIi8+PHRleHQgZm9udC1mYW1pbHk9IkFyaWFsLEFyaWFsX01TRm9udFNlcnZpY2Usc2Fucy1zZXJpZiIgZm9udC13ZWlnaHQ9IjcwMCIgZm9udC1zaXplPSIxOSIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMzA1LjQ0NCA0MzYpIj5I4buNYzx0c3BhbiBmb250LXNpemU9IjE5IiB4PSI0MC4zMzMzIiB5PSIwIj5waOG6p248L3RzcGFuPjx0c3BhbiBmb250LXNpemU9IjE5IiB4PSI4OS44MzMzIiB5PSIwIj42IDwvdHNwYW4+LTx0c3BhbiBmb250LXNpemU9IjE5IiB4PSIxMTYuNjY3IiB5PSIwIj5Tw4FORyBDSOG6viBW4buaSSBMRUdPIFdFRE8sIFNDUkFUQ0g8L3RzcGFuPjx0c3BhbiBmb250LWZhbWlseT0iU2Fuc1NlcmlmLFNhbnNTZXJpZl9NU0ZvbnRTZXJ2aWNlLHNhbnMtc2VyaWYiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMzAiIHg9Ii05MC42OTE1IiB5PSIxMSI+NjwvdHNwYW4+PHRzcGFuIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zaXplPSIyMCIgeD0iNzAzLjg0NyIgeT0iMyI+MTIgPC90c3Bhbj48dHNwYW4gZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjIwIiB4PSI3MzEuMDE0IiB5PSIzIj5iw6BpPC90c3Bhbj48dHNwYW4gZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjIwIiB4PSI3NjIuNTE0IiB5PSIzIj4tPC90c3Bhbj48dHNwYW4gZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjIwIiB4PSI3NzQuNTE0IiB5PSIzIj4xOCA8L3RzcGFuPjx0c3BhbiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMjAiIHg9IjgwMS42OCIgeT0iMyI+Z2nhu508L3RzcGFuPjwvdGV4dD48cGF0aCBkPSJNMjIyIDM5NiAyMjIgNDA4LjYiIHN0cm9rZT0iI0YxOTAzMSIgc3Ryb2tlLXdpZHRoPSIyIiBzdHJva2UtbWl0ZXJsaW1pdD0iOCIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIi8+PHBhdGggZD0iTTE5Ny41IDQ5OEMxOTcuNSA0ODMuOTE3IDIwOC45MTcgNDcyLjUgMjIzIDQ3Mi41IDIzNy4wODMgNDcyLjUgMjQ4LjUgNDgzLjkxNyAyNDguNSA0OTggMjQ4LjUgNTEyLjA4MyAyMzcuMDgzIDUyMy41IDIyMyA1MjMuNSAyMDguOTE3IDUyMy41IDE5Ny41IDUxMi4wODMgMTk3LjUgNDk4WiIgc3Ryb2tlPSIjRjE5MDMxIiBzdHJva2Utd2lkdGg9IjEuMzMzMzMiIHN0cm9rZS1taXRlcmxpbWl0PSI4IiBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48cGF0aCBkPSJNMjg3LjUgNDgwLjgzM0MyODcuNSA0NzYuMjMxIDI5MS4yMzEgNDcyLjUgMjk1LjgzMyA0NzIuNUwxMTQ1LjE3IDQ3Mi41QzExNDkuNzcgNDcyLjUgMTE1My41IDQ3Ni4yMzEgMTE1My41IDQ4MC44MzNMMTE1My41IDUxNC4xNjdDMTE1My41IDUxOC43NjkgMTE0OS43NyA1MjIuNSAxMTQ1LjE3IDUyMi41TDI5NS44MzMgNTIyLjVDMjkxLjIzMSA1MjIuNSAyODcuNSA1MTguNzY5IDI4Ny41IDUxNC4xNjdaIiBzdHJva2U9IiNGMTkwMzEiIHN0cm9rZS13aWR0aD0iMS4zMzMzMyIgc3Ryb2tlLW1pdGVybGltaXQ9IjgiIGZpbGw9IiNGRkZGRkYiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjx0ZXh0IGZvbnQtZmFtaWx5PSJBcmlhbCxBcmlhbF9NU0ZvbnRTZXJ2aWNlLHNhbnMtc2VyaWYiIGZvbnQtd2VpZ2h0PSI3MDAiIGZvbnQtc2l6ZT0iMTkiIHRyYW5zZm9ybT0idHJhbnNsYXRlKDMwNS40NDUgNTAwKSI+SOG7jWM8dHNwYW4gZm9udC1zaXplPSIxOSIgeD0iNDAuMzMzMyIgeT0iMCI+cGjhuqduPC90c3Bhbj48dHNwYW4gZm9udC1zaXplPSIxOSIgeD0iODkuODMzMyIgeT0iMCI+NyA8L3RzcGFuPi08dHNwYW4gZm9udC1zaXplPSIxOSIgeD0iMTE2LjY2NyIgeT0iMCI+U8OBTkcgQ0jhur4gVuG7mkkgTEVHTyBNSU5EU1RPUk1TPC90c3Bhbj48dHNwYW4gZm9udC1mYW1pbHk9IlNhbnNTZXJpZixTYW5zU2VyaWZfTVNGb250U2VydmljZSxzYW5zLXNlcmlmIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjMwIiB4PSItOTAuNjkxOCIgeT0iMTEiPjc8L3RzcGFuPjx0c3BhbiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMjAiIHg9IjcwMy44NDciIHk9IjIiPjEyIDwvdHNwYW4+PHRzcGFuIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zaXplPSIyMCIgeD0iNzMxLjAxMyIgeT0iMiI+YsOgaTwvdHNwYW4+PHRzcGFuIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zaXplPSIyMCIgeD0iNzYyLjUxMyIgeT0iMiI+LTwvdHNwYW4+PHRzcGFuIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zaXplPSIyMCIgeD0iNzc0LjUxMyIgeT0iMiI+MTggPC90c3Bhbj48dHNwYW4gZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjIwIiB4PSI4MDEuNjgiIHk9IjIiPmdp4budPC90c3Bhbj48L3RleHQ+PHBhdGggZD0iTTIyMiA0NTkgMjIyIDQ3MS42IiBzdHJva2U9IiNGMTkwMzEiIHN0cm9rZS13aWR0aD0iMiIgc3Ryb2tlLW1pdGVybGltaXQ9IjgiIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjxwYXRoIGQ9Ik0xOTcuNSA1NjJDMTk3LjUgNTQ3LjkxNyAyMDguOTE3IDUzNi41IDIyMyA1MzYuNSAyMzcuMDgzIDUzNi41IDI0OC41IDU0Ny45MTcgMjQ4LjUgNTYyIDI0OC41IDU3Ni4wODMgMjM3LjA4MyA1ODcuNSAyMjMgNTg3LjUgMjA4LjkxNyA1ODcuNSAxOTcuNSA1NzYuMDgzIDE5Ny41IDU2MloiIHN0cm9rZT0iI0YxOTAzMSIgc3Ryb2tlLXdpZHRoPSIxLjMzMzMzIiBzdHJva2UtbWl0ZXJsaW1pdD0iOCIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIi8+PHBhdGggZD0iTTI4Ny41IDU0NC44MzNDMjg3LjUgNTQwLjIzMSAyOTEuMjMxIDUzNi41IDI5NS44MzMgNTM2LjVMMTE0NS4xNyA1MzYuNUMxMTQ5Ljc3IDUzNi41IDExNTMuNSA1NDAuMjMxIDExNTMuNSA1NDQuODMzTDExNTMuNSA1NzguMTY3QzExNTMuNSA1ODIuNzY5IDExNDkuNzcgNTg2LjUgMTE0NS4xNyA1ODYuNUwyOTUuODMzIDU4Ni41QzI5MS4yMzEgNTg2LjUgMjg3LjUgNTgyLjc2OSAyODcuNSA1NzguMTY3WiIgc3Ryb2tlPSIjRjE5MDMxIiBzdHJva2Utd2lkdGg9IjEuMzMzMzMiIHN0cm9rZS1taXRlcmxpbWl0PSI4IiBmaWxsPSIjRkZGRkZGIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48dGV4dCBmb250LWZhbWlseT0iQXJpYWwsQXJpYWxfTVNGb250U2VydmljZSxzYW5zLXNlcmlmIiBmb250LXdlaWdodD0iNzAwIiBmb250LXNpemU9IjE5IiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgzMDUuNDQ1IDU2MykiPkjhu41jPHRzcGFuIGZvbnQtc2l6ZT0iMTkiIHg9IjQwLjMzMzMiIHk9IjAiPnBo4bqnbjwvdHNwYW4+PHRzcGFuIGZvbnQtc2l6ZT0iMTkiIHg9Ijg5LjgzMzMiIHk9IjAiPjggPC90c3Bhbj4tPHRzcGFuIGZvbnQtc2l6ZT0iMTkiIHg9IjExNi42NjciIHk9IjAiPlPDgU5HIENI4bq+IFbhu5pJIExFR08gTUlORFNUT1JNUzwvdHNwYW4+PHRzcGFuIGZvbnQtZmFtaWx5PSJTYW5zU2VyaWYsU2Fuc1NlcmlmX01TRm9udFNlcnZpY2Usc2Fucy1zZXJpZiIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zaXplPSIzMCIgeD0iLTkwLjY5MTgiIHk9IjExIj44PC90c3Bhbj48dHNwYW4gZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjIwIiB4PSI3MDMuODQ3IiB5PSIzIj4xMiA8L3RzcGFuPjx0c3BhbiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMjAiIHg9IjczMS4wMTMiIHk9IjMiPmLDoGk8L3RzcGFuPjx0c3BhbiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMjAiIHg9Ijc2Mi41MTMiIHk9IjMiPi08L3RzcGFuPjx0c3BhbiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMjAiIHg9Ijc3NC41MTMiIHk9IjMiPjE4IDwvdHNwYW4+PHRzcGFuIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zaXplPSIyMCIgeD0iODAxLjY4IiB5PSIzIj5naeG7nTwvdHNwYW4+PC90ZXh0PjxwYXRoIGQ9Ik0yMjIgNTIzIDIyMiA1MzUuNiIgc3Ryb2tlPSIjRjE5MDMxIiBzdHJva2Utd2lkdGg9IjIiIHN0cm9rZS1taXRlcmxpbWl0PSI4IiBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48cGF0aCBkPSJNMTk3LjUgNjI2QzE5Ny41IDYxMS45MTcgMjA4LjkxNyA2MDAuNSAyMjMgNjAwLjUgMjM3LjA4MyA2MDAuNSAyNDguNSA2MTEuOTE3IDI0OC41IDYyNiAyNDguNSA2NDAuMDgzIDIzNy4wODMgNjUxLjUgMjIzIDY1MS41IDIwOC45MTcgNjUxLjUgMTk3LjUgNjQwLjA4MyAxOTcuNSA2MjZaIiBzdHJva2U9IiNGMTkwMzEiIHN0cm9rZS13aWR0aD0iMS4zMzMzMyIgc3Ryb2tlLW1pdGVybGltaXQ9IjgiIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjxwYXRoIGQ9Ik0yODcuNSA2MDguODMzQzI4Ny41IDYwNC4yMzEgMjkxLjIzMSA2MDAuNSAyOTUuODMzIDYwMC41TDExNDUuMTcgNjAwLjVDMTE0OS43NyA2MDAuNSAxMTUzLjUgNjA0LjIzMSAxMTUzLjUgNjA4LjgzM0wxMTUzLjUgNjQyLjE2N0MxMTUzLjUgNjQ2Ljc2OSAxMTQ5Ljc3IDY1MC41IDExNDUuMTcgNjUwLjVMMjk1LjgzMyA2NTAuNUMyOTEuMjMxIDY1MC41IDI4Ny41IDY0Ni43NjkgMjg3LjUgNjQyLjE2N1oiIHN0cm9rZT0iI0YxOTAzMSIgc3Ryb2tlLXdpZHRoPSIxLjMzMzMzIiBzdHJva2UtbWl0ZXJsaW1pdD0iOCIgZmlsbD0iI0ZGRkZGRiIgZmlsbC1ydWxlPSJldmVub2RkIi8+PHRleHQgZm9udC1mYW1pbHk9IkFyaWFsLEFyaWFsX01TRm9udFNlcnZpY2Usc2Fucy1zZXJpZiIgZm9udC13ZWlnaHQ9IjcwMCIgZm9udC1zaXplPSIxOSIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMzA1LjQ0NCA2MjgpIj5I4buNYzx0c3BhbiBmb250LXNpemU9IjE5IiB4PSI0MC4zMzMzIiB5PSIwIj5waOG6p248L3RzcGFuPjx0c3BhbiBmb250LXNpemU9IjE5IiB4PSI4OS44MzMzIiB5PSIwIj45IDwvdHNwYW4+LTx0c3BhbiBmb250LXNpemU9IjE5IiB4PSIxMTYuNjY3IiB5PSIwIj5Tw4FORyBDSOG6viBW4buaSSBMRUdPIE1JTkRTVE9STVM8L3RzcGFuPjx0c3BhbiBmb250LWZhbWlseT0iU2Fuc1NlcmlmLFNhbnNTZXJpZl9NU0ZvbnRTZXJ2aWNlLHNhbnMtc2VyaWYiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMzAiIHg9Ii05MC42OTE2IiB5PSIxMSI+OTwvdHNwYW4+PHRzcGFuIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zaXplPSIyMCIgeD0iNzAzLjg0NyIgeT0iMiI+MTIgPC90c3Bhbj48dHNwYW4gZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjIwIiB4PSI3MzEuMDEzIiB5PSIyIj5iw6BpPC90c3Bhbj48dHNwYW4gZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjIwIiB4PSI3NjIuNTEzIiB5PSIyIj4tPC90c3Bhbj48dHNwYW4gZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjIwIiB4PSI3NzQuNTEzIiB5PSIyIj4xOCA8L3RzcGFuPjx0c3BhbiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMjAiIHg9IjgwMS42OCIgeT0iMiI+Z2nhu508L3RzcGFuPjwvdGV4dD48cGF0aCBkPSJNMjIyIDU4NyAyMjIgNTk5LjYiIHN0cm9rZT0iI0YxOTAzMSIgc3Ryb2tlLXdpZHRoPSIyIiBzdHJva2UtbWl0ZXJsaW1pdD0iOCIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIi8+PHBhdGggZD0iTTE5Ny41IDY4OUMxOTcuNSA2NzQuOTE3IDIwOC45MTcgNjYzLjUgMjIzIDY2My41IDIzNy4wODMgNjYzLjUgMjQ4LjUgNjc0LjkxNyAyNDguNSA2ODkgMjQ4LjUgNzAzLjA4MyAyMzcuMDgzIDcxNC41IDIyMyA3MTQuNSAyMDguOTE3IDcxNC41IDE5Ny41IDcwMy4wODMgMTk3LjUgNjg5WiIgc3Ryb2tlPSIjRjE5MDMxIiBzdHJva2Utd2lkdGg9IjEuMzMzMzMiIHN0cm9rZS1taXRlcmxpbWl0PSI4IiBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48cGF0aCBkPSJNMjg3LjUgNjcxLjgzM0MyODcuNSA2NjcuMjMxIDI5MS4yMzEgNjYzLjUgMjk1LjgzMyA2NjMuNUwxMTQ1LjE3IDY2My41QzExNDkuNzcgNjYzLjUgMTE1My41IDY2Ny4yMzEgMTE1My41IDY3MS44MzNMMTE1My41IDcwNS4xNjdDMTE1My41IDcwOS43NjkgMTE0OS43NyA3MTMuNSAxMTQ1LjE3IDcxMy41TDI5NS44MzMgNzEzLjVDMjkxLjIzMSA3MTMuNSAyODcuNSA3MDkuNzY5IDI4Ny41IDcwNS4xNjdaIiBzdHJva2U9IiNGMTkwMzEiIHN0cm9rZS13aWR0aD0iMS4zMzMzMyIgc3Ryb2tlLW1pdGVybGltaXQ9IjgiIGZpbGw9IiNGRkZGRkYiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjx0ZXh0IGZvbnQtZmFtaWx5PSJBcmlhbCxBcmlhbF9NU0ZvbnRTZXJ2aWNlLHNhbnMtc2VyaWYiIGZvbnQtd2VpZ2h0PSI3MDAiIGZvbnQtc2l6ZT0iMTkiIHRyYW5zZm9ybT0idHJhbnNsYXRlKDMwNS40NDUgNjkwKSI+SOG7jWM8dHNwYW4gZm9udC1zaXplPSIxOSIgeD0iNDAuMzMzMyIgeT0iMCI+cGjhuqduPC90c3Bhbj48dHNwYW4gZm9udC1zaXplPSIxOSIgeD0iODkuODMzMyIgeT0iMCI+MTAgPC90c3Bhbj48dHNwYW4gZm9udC1zaXplPSIxOSIgeD0iMTE1LjY2NyIgeT0iMCI+LTwvdHNwYW4+PHRzcGFuIGZvbnQtc2l6ZT0iMTkiIHg9IjEyNyIgeT0iMCI+Q0hJ4bq+TiBCSU5IIFJPQk9UICZhbXA7IFPDgE4gVEhJIMSQ4bqkVSBNSU5JPC90c3Bhbj48dHNwYW4gZm9udC1zaXplPSIxOSIgeD0iNDk3LjE2NyIgeT0iMCI+LTwvdHNwYW4+PHRzcGFuIGZvbnQtc2l6ZT0iMTkiIHg9IjUwMy4zMzMiIHk9IjAiPldSTzwvdHNwYW4+PHRzcGFuIGZvbnQtZmFtaWx5PSJTYW5zU2VyaWYsU2Fuc1NlcmlmX01TRm9udFNlcnZpY2Usc2Fucy1zZXJpZiIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zaXplPSIzMCIgeD0iLTEwMC44MjUiIHk9IjEwIj4xMDwvdHNwYW4+PHRzcGFuIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zaXplPSIyMCIgeD0iNzAzLjg0NyIgeT0iMyI+MTIgPC90c3Bhbj48dHNwYW4gZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjIwIiB4PSI3MzEuMDEzIiB5PSIzIj5iw6BpPC90c3Bhbj48dHNwYW4gZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjIwIiB4PSI3NjIuNTEzIiB5PSIzIj4tPC90c3Bhbj48dHNwYW4gZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjIwIiB4PSI3NzQuNTEzIiB5PSIzIj4xOCA8L3RzcGFuPjx0c3BhbiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMjAiIHg9IjgwMS42OCIgeT0iMyI+Z2nhu508L3RzcGFuPjwvdGV4dD48cGF0aCBkPSJNMjIyIDY1MCAyMjIgNjYyLjYiIHN0cm9rZT0iI0YxOTAzMSIgc3Ryb2tlLXdpZHRoPSIyIiBzdHJva2UtbWl0ZXJsaW1pdD0iOCIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIi8+PHBhdGggZD0iTTE5Ny41IDc1MkMxOTcuNSA3MzcuOTE3IDIwOC45MTcgNzI2LjUgMjIzIDcyNi41IDIzNy4wODMgNzI2LjUgMjQ4LjUgNzM3LjkxNyAyNDguNSA3NTIgMjQ4LjUgNzY2LjA4MyAyMzcuMDgzIDc3Ny41IDIyMyA3NzcuNSAyMDguOTE3IDc3Ny41IDE5Ny41IDc2Ni4wODMgMTk3LjUgNzUyWiIgc3Ryb2tlPSIjRjE5MDMxIiBzdHJva2Utd2lkdGg9IjEuMzMzMzMiIHN0cm9rZS1taXRlcmxpbWl0PSI4IiBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48cGF0aCBkPSJNMjg3LjUgNzM0LjgzM0MyODcuNSA3MzAuMjMxIDI5MS4yMzEgNzI2LjUgMjk1LjgzMyA3MjYuNUwxMTQ1LjE3IDcyNi41QzExNDkuNzcgNzI2LjUgMTE1My41IDczMC4yMzEgMTE1My41IDczNC44MzNMMTE1My41IDc2OC4xNjdDMTE1My41IDc3Mi43NjkgMTE0OS43NyA3NzYuNSAxMTQ1LjE3IDc3Ni41TDI5NS44MzMgNzc2LjVDMjkxLjIzMSA3NzYuNSAyODcuNSA3NzIuNzY5IDI4Ny41IDc2OC4xNjdaIiBzdHJva2U9IiNGMTkwMzEiIHN0cm9rZS13aWR0aD0iMS4zMzMzMyIgc3Ryb2tlLW1pdGVybGltaXQ9IjgiIGZpbGw9IiNGRkZGRkYiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjx0ZXh0IGZvbnQtZmFtaWx5PSJBcmlhbCxBcmlhbF9NU0ZvbnRTZXJ2aWNlLHNhbnMtc2VyaWYiIGZvbnQtd2VpZ2h0PSI3MDAiIGZvbnQtc2l6ZT0iMTkiIHRyYW5zZm9ybT0idHJhbnNsYXRlKDMwNS40NDQgNzU0KSI+SOG7jWM8dHNwYW4gZm9udC1zaXplPSIxOSIgeD0iNDAuMzMzMyIgeT0iMCI+cGjhuqduPC90c3Bhbj48dHNwYW4gZm9udC1zaXplPSIxOSIgeD0iODkuODMzMyIgeT0iMCI+MTEgPC90c3Bhbj4tPHRzcGFuIGZvbnQtc2l6ZT0iMTkiIHg9IjEyNS45NzMiIHk9IjAiPkNISeG6vk4gQklOSCBST0JPVCAmYW1wOyBTw4BOIFRISSDEkOG6pFUgTUlOSTwvdHNwYW4+PHRzcGFuIGZvbnQtc2l6ZT0iMTkiIHg9IjQ5Ni4xNCIgeT0iMCI+LTwvdHNwYW4+PHRzcGFuIGZvbnQtc2l6ZT0iMTkiIHg9IjUwMi4zMDciIHk9IjAiPldSTzwvdHNwYW4+PHRzcGFuIGZvbnQtZmFtaWx5PSJTYW5zU2VyaWYsU2Fuc1NlcmlmX01TRm9udFNlcnZpY2Usc2Fucy1zZXJpZiIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zaXplPSIzMCIgeD0iLTk4LjY0NDciIHk9IjExIj4xMTwvdHNwYW4+PHRzcGFuIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zaXplPSIyMCIgeD0iNzAzLjg0NyIgeT0iMiI+MTIgPC90c3Bhbj48dHNwYW4gZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjIwIiB4PSI3MzEuMDE0IiB5PSIyIj5iw6BpPC90c3Bhbj48dHNwYW4gZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjIwIiB4PSI3NjIuNTE0IiB5PSIyIj4tPC90c3Bhbj48dHNwYW4gZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjIwIiB4PSI3NzQuNTE0IiB5PSIyIj4xOCA8L3RzcGFuPjx0c3BhbiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMjAiIHg9IjgwMS42OCIgeT0iMiI+Z2nhu508L3RzcGFuPjwvdGV4dD48cGF0aCBkPSJNMjIyIDcxMyAyMjIgNzI1LjYiIHN0cm9rZT0iI0YxOTAzMSIgc3Ryb2tlLXdpZHRoPSIyIiBzdHJva2UtbWl0ZXJsaW1pdD0iOCIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIi8+PHBhdGggZD0iTTE5Ny41IDgxNS41QzE5Ny41IDgwMS42OTMgMjA4LjkxNyA3OTAuNSAyMjMgNzkwLjUgMjM3LjA4MyA3OTAuNSAyNDguNSA4MDEuNjkzIDI0OC41IDgxNS41IDI0OC41IDgyOS4zMDcgMjM3LjA4MyA4NDAuNSAyMjMgODQwLjUgMjA4LjkxNyA4NDAuNSAxOTcuNSA4MjkuMzA3IDE5Ny41IDgxNS41WiIgc3Ryb2tlPSIjRjE5MDMxIiBzdHJva2Utd2lkdGg9IjEuMzMzMzMiIHN0cm9rZS1taXRlcmxpbWl0PSI4IiBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48cGF0aCBkPSJNMjg3LjUgNzk4QzI4Ny41IDc5My4zMDYgMjkxLjMwNiA3ODkuNSAyOTYgNzg5LjVMMTE0NSA3ODkuNUMxMTQ5LjY5IDc4OS41IDExNTMuNSA3OTMuMzA2IDExNTMuNSA3OThMMTE1My41IDgzMkMxMTUzLjUgODM2LjY5NCAxMTQ5LjY5IDg0MC41IDExNDUgODQwLjVMMjk2IDg0MC41QzI5MS4zMDYgODQwLjUgMjg3LjUgODM2LjY5NCAyODcuNSA4MzJaIiBzdHJva2U9IiNGMTkwMzEiIHN0cm9rZS13aWR0aD0iMS4zMzMzMyIgc3Ryb2tlLW1pdGVybGltaXQ9IjgiIGZpbGw9IiNGRkZGRkYiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjx0ZXh0IGZvbnQtZmFtaWx5PSJBcmlhbCxBcmlhbF9NU0ZvbnRTZXJ2aWNlLHNhbnMtc2VyaWYiIGZvbnQtd2VpZ2h0PSI3MDAiIGZvbnQtc2l6ZT0iMTkiIHRyYW5zZm9ybT0idHJhbnNsYXRlKDMwNS40NDUgODE3KSI+SOG7jWM8dHNwYW4gZm9udC1zaXplPSIxOSIgeD0iNDAuMzMzMyIgeT0iMCI+cGjhuqduPC90c3Bhbj48dHNwYW4gZm9udC1zaXplPSIxOSIgeD0iODkuODMzMyIgeT0iMCI+MTIgPC90c3Bhbj48dHNwYW4gZm9udC1zaXplPSIxOSIgeD0iMTE1LjY2NyIgeT0iMCI+LTwvdHNwYW4+PHRzcGFuIGZvbnQtc2l6ZT0iMTkiIHg9IjEyNyIgeT0iMCI+Q0hJ4bq+TiBCSU5IIFJPQk9UICZhbXA7IFPDgE4gVEhJIMSQ4bqkVSBNSU5JPC90c3Bhbj48dHNwYW4gZm9udC1zaXplPSIxOSIgeD0iNDk3LjE2NyIgeT0iMCI+LTwvdHNwYW4+PHRzcGFuIGZvbnQtc2l6ZT0iMTkiIHg9IjUwMy4zMzMiIHk9IjAiPldSTzwvdHNwYW4+PHRzcGFuIGZvbnQtZmFtaWx5PSJTYW5zU2VyaWYsU2Fuc1NlcmlmX01TRm9udFNlcnZpY2Usc2Fucy1zZXJpZiIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zaXplPSIzMCIgeD0iLTk4LjE1NjQiIHk9IjExIj4xMjwvdHNwYW4+PHRzcGFuIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zaXplPSIyMCIgeD0iNzAzLjg0NyIgeT0iMyI+MTIgPC90c3Bhbj48dHNwYW4gZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjIwIiB4PSI3MzEuMDEzIiB5PSIzIj5iw6BpPC90c3Bhbj48dHNwYW4gZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjIwIiB4PSI3NjIuNTEzIiB5PSIzIj4tPC90c3Bhbj48dHNwYW4gZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjIwIiB4PSI3NzQuNTEzIiB5PSIzIj4xOCA8L3RzcGFuPjx0c3BhbiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMjAiIHg9IjgwMS42OCIgeT0iMyI+Z2nhu508L3RzcGFuPjwvdGV4dD48cGF0aCBkPSJNMjIyIDc3NyAyMjIgNzg5LjYiIHN0cm9rZT0iI0YxOTAzMSIgc3Ryb2tlLXdpZHRoPSIyIiBzdHJva2UtbWl0ZXJsaW1pdD0iOCIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIi8+PC9nPjwvc3ZnPg==\" data-filename=\"lotrinh_robot.svg\" style=\"width: 984.683px; height: 772.375px;\"><span style=\"font-weight: 700;\"><font color=\"#003163\"><br></font></span></h2><h2 style=\"color: rgb(33, 37, 41); text-align: center; margin-bottom: 1rem; font-family: &quot;Open Sans&quot;, sans-serif; letter-spacing: -0.048px; padding: 0px;\"><span style=\"font-weight: 700;\"><br></span></h2></ul><section class=\"section-title\" id=\"zone7\" style=\"color: rgb(33, 37, 41); margin: 1rem 0px; padding: 0px;\"><div class=\"container\" style=\"margin-top: 0px; margin-bottom: 0px; padding-top: 0px; padding-bottom: 30px; width: 810px;\"><div class=\"row\" style=\"margin-right: -15px; margin-left: -15px; padding: 0px;\"><h3 class=\"section-intro-title\" style=\"text-align: center; margin: 0px 0px 0.5rem; padding: 0px; line-height: 1.2; font-size: 1.75rem;\"><br></h3></div></div></section></div>', '144 giờ (2 học kỳ ~ 24 tháng), 90\' mỗi buổi', '8 học phần từ thấp đến cao', 'java-core, java-tutorial,..', ' 14/7/2021', ' 14/7/2021', 'Khóa học lập trình Robot SPEC', 'Lập trình Robot là gì? Tại sao nên dạy lập trình Robot cho trẻ ngay hôm nay? Hãy cùng tìm hiểu những thông tin hữu ích ngay sau đây nhé.', 'Lập trình Robot, Robot cơ bản, Robot cho trẻ em, học lập trình Robot, Robot, game Robot', 'index,follow', 0, b'1');
INSERT INTO `course` (`id`, `image`, `student_fees`, `tuition_fee_after_reduction`, `name`, `deleted`, `id_small_category`, `url_view`, `obj_students`, `id_user`, `theme_id`, `promotion`, `sub_content`, `create_date`, `age`, `number_of_student`, `teacher_id`, `main_content`, `duration_of_study`, `section`, `document`, `opening_day`, `study_time`, `meta_title`, `meta_description`, `meta_keyword`, `meta_robot`, `percent_of_promotion`, `classify`) VALUES
(12, 'https://spec.edu.vn/client/image/images_Trang_Chu/scrath.jpg', 1600000, 1600000, 'Khóa học lập trình Scratch', b'1', 1, 'scrath', 'Thiếu nhi', 8, 5, b'1', 'Làm quen và nuôi dưỡng đam mê lập trình thông qua phần mềm Scratch JR, các phần mềm thiết kế 2D,3D', '2021-05-06', '7-12', 20, 1, '<h1><strong>Gi&uacute;p b&eacute; trở th&agrave;nh nh&agrave; s&aacute;ng tạo tương lai c&ugrave;ng kh&oacute;a học lập tr&igrave;nh Scratch</strong></h1>\n\n<p>Dạy lập tr&igrave;nh Scratch cho trẻ đang l&agrave; xu hướng đưc nhiều bậc phụ huynh quan t&acirc;m trong thời gian gần đ&acirc;y. H&atilde;y c&ugrave;ng đi t&igrave;m nguy&ecirc;n nh&acirc;n tạo n&ecirc;n sức h&uacute;t mạnh mẽ từ tr&agrave;o lưu n&agrave;y nh&eacute;!</p>\n\n<div>12 th&aacute;ng 03, 2021</div>\n\n<div>\n<h2>Dạy cho trẻ về lập tr&igrave;nh Scrath</h2>\n\n<p>Scratch l&agrave; ng&ocirc;n ngữ lập tr&igrave;nh được nhiều bậc phụ huynh lựa chọn cho con em m&igrave;nh. Với những lợi &iacute;ch tuyệt vời, việc nắm vững kiến thức về ng&ocirc;n ngữ lập tr&igrave;nh Scratch thực sự sẽ l&agrave; nền tảng để th&uacute;c đẩy sự ph&aacute;t triển to&agrave;n diện ở trẻ v&agrave; mang đến cơ hội rộng mở cho trẻ trong tương lai.&nbsp;</p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<h2>Scratch- ng&ocirc;n ngữ lập tr&igrave;nh ph&ugrave; hợp với trẻ nhỏ</h2>\n\n<p>Scratch l&agrave; một ng&ocirc;n ngữ lập tr&igrave;nh miễn ph&iacute;, được s&aacute;ng tạo bởi một nh&oacute;m kỹ sư Lifelong Kindergarten Viện nghi&ecirc;n cứu c&ocirc;ng nghệ Massachusetts - Mỹ v&agrave; được ra mắt lần đầu ti&ecirc;n v&agrave;o năm 2006. Ngay từ khi xuất hiện, ng&ocirc;n ngữ lập tr&igrave;nh n&agrave;y đ&atilde; thu h&uacute;t được sự ch&uacute; &yacute; của giới c&ocirc;ng nghệ bởi những đặc điểm nổi bật như:</p>\n\n<ul>\n</ul>\n\n<ul>\n	<li>Tương th&iacute;ch với tất cả c&aacute;c hệ điều h&agrave;nh tr&ecirc;n thế giới. Bạn dễ d&agrave;ng truy cập v&agrave; sử dụng Scratch ngay h&ocirc;m nay tại bất cứ quốc gia n&agrave;o tr&ecirc;n thế giới chỉ với chiếc m&aacute;y t&iacute;nh c&oacute; kết nối internet m&agrave; th&ocirc;i.</li>\n	<li>C&ocirc;ng cụ l&agrave; sự tương t&aacute;c giữa &acirc;m thanh v&agrave; h&igrave;nh ảnh sống động v&ocirc; c&ugrave;ng cuốn h&uacute;t người d&ugrave;ng. Sử dụng Scratch chắc chắn sẽ kh&ocirc;ng khiến bạn cảm thấy nh&agrave;m ch&aacute;n hay kh&ocirc; khan như những ng&ocirc;n ngữ lập tr&igrave;nh kh&aacute;c.</li>\n	<li>Tương th&iacute;ch với tất cả c&aacute;c hệ điều h&agrave;nh tr&ecirc;n thế giới. Bạn dễ d&agrave;ng truy cập v&agrave; sử dụng Scratch ngay h&ocirc;m nay tại bất cứ quốc gia n&agrave;o tr&ecirc;n thế giới chỉ với chiếc m&aacute;y t&iacute;nh c&oacute; kết nối internet m&agrave; th&ocirc;i.</li>\n</ul>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"365\" src=\"https://spec.edu.vn/uploadfileimage/image/img_scrath/scrath.jpg\" width=\"600\" /></p>\n\n<p style=\"text-align:center\">Lập tr&igrave;nh Scratch l&agrave; c&ocirc;ng cụ đẹp mắt v&agrave; hấp dẫn trẻ nhỏ</p>\n\n<ul>\n	<li>C&oacute; thể sử dụng c&ocirc;ng cụ để tạo n&ecirc;n những mini game hay những đoạn hoạt h&igrave;nh ấn tượng</li>\n	<li>L&agrave; một c&ocirc;ng cụ th&iacute;ch hợp với mọi người, kể cả người mới bắt đầu v&agrave; trẻ nhỏ. Ch&iacute;nh v&igrave; vậy thay v&igrave; sử dụng những d&ograve;ng lệnh phức tạp, Scratch sử dụng những c&uacute; ph&aacute;p đơn giản, dễ hiểu v&agrave; dễ nhớ. Bất cứ ai cũng c&oacute; thể học v&agrave; sử dụng Scratch th&agrave;nh thạo sau một thời gian ngắn học tập</li>\n</ul>\n\n<p>Ch&iacute;nh v&igrave; vậy m&agrave; ng&ocirc;n ngữ lập tr&igrave;nh Scratch đ&atilde; trở th&agrave;nh ng&ocirc;n ngữ lập tr&igrave;nh ho&agrave;n hảo d&agrave;nh cho trẻ. Đặc biệt được đưa v&agrave;o chương tr&igrave;nh gi&aacute;o dục tiểu học tại nhiều quốc gia tr&ecirc;n thế giới. Tại một số trường tại Việt Nam, ng&ocirc;n ngữ lập tr&igrave;nh Scratch đ&atilde; được đưa v&agrave;o chương tr&igrave;nh học tự chọn v&agrave; đ&atilde; thu được nhiều kết quả khả quan v&agrave; được đ&ocirc;ng đảo c&aacute;c bậc phụ huynh ủng hộ.</p>\n\n<h2>Những kiến thức trẻ học được từ việc học ng&ocirc;n ngữ lập tr&igrave;nh Scratch</h2>\n\n<p>Với c&ocirc;ng cụ Scratch, trẻ sẽ tạo ra c&aacute;c nh&acirc;n vật v&agrave; l&ecirc;n &yacute; tưởng để ch&uacute;ng c&oacute; những t&iacute;nh c&aacute;ch, cử chỉ, h&agrave;nh động ri&ecirc;ng biệt. Từ đ&oacute; tạo n&ecirc;n những game, clip,...v&ocirc; c&ugrave;ng sinh động v&agrave; hấp dẫn.</p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:center\"><img alt=\"\" height=\"360\" src=\"https://spec.edu.vn/uploadfileimage/image/img_scrath/a26.jpg\" width=\"641\" /></p>\n\n<p style=\"text-align:center\">Scratch mang đến những ph&uacute;t gi&acirc;y vừa học vừa chơi th&uacute; vị cho b&eacute;</p>\n\n<p>Ch&iacute;nh v&igrave; vậy m&agrave; việc học lập tr&igrave;nh Scratch sẽ tạo n&ecirc;n cho b&eacute; những trải nghiệm v&ocirc; c&ugrave;ng vui vẻ v&agrave; kh&ocirc;ng hề nh&agrave;m ch&aacute;n. Đặc biệt, sẽ k&iacute;ch th&iacute;ch ph&aacute;t triển tư duy v&agrave; sự s&aacute;ng tạo kh&ocirc;ng ngừng của trẻ nhỏ. Trẻ vừa được r&egrave;n luyện để ph&aacute;t triển to&agrave;n diện vừa c&oacute; thỏa sức thể hiện đam m&ecirc; v&agrave; c&aacute; t&iacute;nh của bản th&acirc;n m&agrave; kh&ocirc;ng hề cảm thấy g&ograve; b&oacute;. Ch&iacute;nh v&igrave; vậy m&agrave; việc vừa học vừa chơi c&ugrave;ng Scratch thực sự l&agrave; m&ocirc;n học th&uacute; vị v&agrave; hấp dẫn d&agrave;nh cho trẻ.</p>\n\n<p>Scratch thực sự ph&ugrave; hợp với tất cả mọi người. Đặc biệt với c&aacute;c b&eacute; y&ecirc;u th&iacute;ch lập tr&igrave;nh v&agrave; c&ocirc;ng nghệ c&oacute; độ tuổi từ 7-12 tuổi. Đ&acirc;y l&agrave; giai đoạn b&eacute; đ&atilde; c&oacute; sự ph&aacute;t triển đầy đủ về tr&iacute; tuệ, c&oacute; thể tiếp thu những tri thức khoa học mới mẻ. Ch&iacute;nh v&igrave; vậy, c&aacute;c bậc phụ huynh n&ecirc;n lưu &yacute; giai đoạn v&agrave;ng n&agrave;y ở trẻ để c&oacute; thể cho b&eacute; tiếp cận sớm với ng&ocirc;n ngữ lập tr&igrave;nh n&oacute;i chung v&agrave; lập tr&igrave;nh Scratch n&oacute;i ri&ecirc;ng.</p>\n\n<ul>\n</ul>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"https://spec.edu.vn/uploadfileimage/image/img_scrath/Image_csvc.jpg\" width=\"590\" /></p>\n\n<p style=\"text-align:center\">Scratch l&agrave; ng&ocirc;n ngữ lập tr&igrave;nh được mọi trẻ em tr&ecirc;n thế giới y&ecirc;u th&iacute;ch</p>\n\n<h2>SPEC- trường dạy lập tr&igrave;nh cho b&eacute; tốt nhất Việt Nam</h2>\n\n<p>Lập tr&igrave;nh Scratch thực sự l&agrave; lựa chọn ho&agrave;n hảo d&agrave;nh cho trẻ em m&agrave; c&aacute;c bậc phụ huynh kh&ocirc;ng n&ecirc;n bỏ qua. Tuy nhi&ecirc;n, n&ecirc;n học Scratch ở đ&acirc;u? l&agrave; điều kh&ocirc;ng phải ai cũng biết. Để c&oacute; được h&agrave;nh tr&igrave;nh trải nghiệm th&uacute; vị v&agrave; hiệu quả nhất, h&atilde;y t&igrave;m đến những trung t&acirc;m gi&aacute;o dục uy t&iacute;n như SPEC.</p>\n\n<p>Địa chỉ được đ&ocirc;ng đảo học vi&ecirc;n y&ecirc;u th&iacute;ch</p>\n\n<p>L&agrave; c&aacute;i t&ecirc;n kh&ocirc;ng con xa lạ đối với nhiều học vi&ecirc;n v&agrave; c&aacute;c bậc phụ huynh tr&ecirc;n khắp cả nước. SPEC l&agrave; trường đ&agrave;o tạo c&ocirc;ng nghệ th&ocirc;ng tin n&oacute;i chung, dạy lập tr&igrave;nh Scratch uy t&iacute;n. Với sự nỗ lực kh&ocirc;ng ngừng, SPEC kh&ocirc;ng ngừng cải tiến v&agrave; n&acirc;ng cao chất lượng giảng dạy hướng đến mục ti&ecirc;u:</p>\n\n<p>Gi&aacute;o tr&igrave;nh học lập tr&igrave;nh cho b&eacute; chuy&ecirc;n nghiệp</p>\n\n<p>SPEC tự tin mang đến cho c&aacute;c bạn học vi&ecirc;n gi&aacute;o tr&igrave;nh lập tr&igrave;nh Scratch chuy&ecirc;n nghiệp, đạt ti&ecirc;u chuẩn quốc tế với nội dung cơ bản gồm c&oacute;:</p>\n\n<p>Đội ngũ giảng vi&ecirc;n chuy&ecirc;n nghiệp với phương ph&aacute;p sư phạm hiệu quả</p>\n\n<p>SPEC tự h&agrave;o khi đang c&oacute; nguồn nh&acirc;n lực đ&ocirc;ng đảo v&agrave; chất lượng với những gi&aacute;o vi&ecirc;n được đ&agrave;o tạo b&agrave;i bản v&agrave; nhiều năm kinh nghiệm trong lĩnh vực giảng dạy. Họ lu&ocirc;n l&agrave; những người l&aacute;i đ&ograve; tận t&igrave;nh, t&acirc;m huyết lu&ocirc;n mong muốn truyền thụ tất cả c&aacute;c tri thức qu&yacute; b&aacute;u nhất tới những học vi&ecirc;n th&acirc;n y&ecirc;u</p>\n\n<p>Đặc biệt 100% gi&aacute;o vi&ecirc;n, giảng vi&ecirc;n tại SPEC đều l&agrave; những người c&oacute; kinh nghiệm giảng dạy l&acirc;u năm. Lu&ocirc;n lu&ocirc;n nắm bắt được t&acirc;m l&yacute; học sinh, từ đ&oacute; m&agrave; c&oacute; những b&agrave;i giảng thiết thực, hấp dẫn với mọi đối tượng. Ri&ecirc;ng đối với những kh&oacute;a học lập tr&igrave;nh cho b&eacute; từ 7-12 tuổi, c&aacute;c gi&aacute;o vi&ecirc;n lu&ocirc;n mang đến những kiến thức gần gũi, dễ hiểu nhất. V&agrave; lu&ocirc;n kết hợp với những v&iacute; dụ minh họa th&uacute; vị, ch&iacute;nh v&igrave; thế m&agrave; những giờ học lập tr&igrave;nh Scratch tại SPEC lu&ocirc;n l&agrave; những ph&uacute;t gi&acirc;y th&uacute; vị v&agrave; hấp dẫn.</p>\n\n<p>Cơ sở vật chất hiện đại</p>\n\n<p>Cơ sở vật chất, trang thiết bị giảng dạy lu&ocirc;n l&agrave; yếu tố kh&ocirc;ng nhỏ t&aacute;c động đến chất lượng gi&aacute;o dục. Đến với SPEC c&aacute;c bậc phụ huynh c&oacute; thể ho&agrave;n to&agrave;n y&ecirc;n t&acirc;m bởi trung t&acirc;m lu&ocirc;n tạo cho c&aacute;c bạn học sinh m&ocirc;i trường học tập chuy&ecirc;n nghiệp v&agrave; thoải m&aacute;i nhất. Hệ thống ph&ograve;ng học s&aacute;ng sủa, tho&aacute;ng m&aacute;t. B&ecirc;n cạnh đ&oacute;, c&aacute;c trang thiết bị, t&agrave;i liệu học tập lu&ocirc;n được trang bị đầy đủ, đ&aacute;p ứng tốt nhất nhu cầu sử dụng của người học</p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"https://cf.microninja.me/wp-content/uploads/2017/12/scratch.png\" width=\"569\" /></p>\n\n<p style=\"text-align:center\">SPEC mang đến cơ hội học lập tr&igrave;nh cho mọi trẻ em Việt Nam</p>\n\n<p>Chi ph&iacute; ph&ugrave; hợp</p>\n\n<p>SPEC cam kết mang đến cho c&aacute;c bạn nhỏ kh&oacute;a học lập tr&igrave;nh robot chuy&ecirc;n nghiệp với mức gi&aacute; phải chăng. Đặc biệt, trung t&acirc;m cam kết gi&uacute;p b&eacute; sau khi ho&agrave;n th&agrave;nh kh&oacute;a học sẽ nắm vững những kiến thức cơ bản v&agrave; c&oacute; thể thực h&agrave;nh hiệu quả trong thực tiễn.</p>\n\n<p>Lập tr&igrave;nh robot ch&iacute;nh l&agrave; ng&ocirc;n ngữ lập tr&igrave;nh phổ biến trong x&atilde; hội hiện đại. Việc dạy lập tr&igrave;nh cho b&eacute; ngay từ nhỏ sẽ mang đến cho b&eacute; nền tảng vững chắc để c&oacute; thể vững bước trong thế kỷ 21 với tương lai rộng mở v&agrave; cơ hội nghề nghiệp hấp dẫn với thu nhập cao. Để biết th&ecirc;m th&ocirc;ng tin chi tiết v&agrave; đăng k&yacute; c&aacute;c kh&oacute;a học hấp dẫn h&atilde;y li&ecirc;n hệ với SPEC ngay h&ocirc;m nay nh&eacute;.</p>\n\n<p>&nbsp;</p>\n\n<ul>\n	<li style=\"list-style-type:initial\">Trẻ c&oacute; thể vừa học vừa chơi với những b&agrave;i giảng hấp dẫn. Mỗi giờ học tập sẽ kh&ocirc;ng hề nh&agrave;m ch&aacute;n v&agrave; kh&ocirc; cứng m&agrave; sẽ cực kỳ cuốn h&uacute;t, tạo kh&ocirc;ng kh&iacute; vui vẻ</li>\n	<li style=\"list-style-type:initial\">Trẻ nhanh ch&oacute;ng nắm bắt được c&aacute;c nguy&ecirc;n tắc cơ bản trong lập tr&igrave;nh Scratch</li>\n	<li style=\"list-style-type:initial\">Phần 1: Giới thiệu chung về Scratch v&agrave; c&aacute;ch c&agrave;i đặt c&ocirc;ng cụ.</li>\n	<li style=\"list-style-type:initial\">Phần 2: L&agrave;m quen với giao diện của lập tr&igrave;nh Scratch.</li>\n	<li style=\"list-style-type:initial\">Phần 3: Lập tr&igrave;nh Scratch cơ bản v&agrave; những điều cần biết</li>\n	<li style=\"list-style-type:initial\">Phần 4: Lập tr&igrave;nh dự &aacute;n Game Scratch n&acirc;ng cao d&agrave;nh cho trẻ\n	<h2>Lộ tr&igrave;nh kh&oacute;a học:</h2>\n\n	<div style=\"text-align:center\"><img alt=\"\" src=\"data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iOTU3IiBoZWlnaHQ9IjQ3OSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgb3ZlcmZsb3c9ImhpZGRlbiI+PGRlZnM+PGNsaXBQYXRoIGlkPSJjbGlwMCI+PHJlY3QgeD0iMTU1IiB5PSIxMjUiIHdpZHRoPSI5NTciIGhlaWdodD0iNDc5Ii8+PC9jbGlwUGF0aD48L2RlZnM+PGcgY2xpcC1wYXRoPSJ1cmwoI2NsaXAwKSIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTE1NSAtMTI1KSI+PHBhdGggZD0iTTE1Ny41IDE1MS41QzE1Ny41IDEzOC4yNDUgMTY4LjI0NSAxMjcuNSAxODEuNSAxMjcuNSAxOTQuNzU1IDEyNy41IDIwNS41IDEzOC4yNDUgMjA1LjUgMTUxLjUgMjA1LjUgMTY0Ljc1NSAxOTQuNzU1IDE3NS41IDE4MS41IDE3NS41IDE2OC4yNDUgMTc1LjUgMTU3LjUgMTY0Ljc1NSAxNTcuNSAxNTEuNVoiIHN0cm9rZT0iI0YxOTAzMSIgc3Ryb2tlLXdpZHRoPSIxLjMzMzMzIiBzdHJva2UtbWl0ZXJsaW1pdD0iOCIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIi8+PHBhdGggZD0iTTI0Mi41IDEzNC41MDFDMjQyLjUgMTMwLjA4MiAyNDYuMDgyIDEyNi41IDI1MC41IDEyNi41TDExMDIuNSAxMjYuNUMxMTA2LjkyIDEyNi41IDExMTAuNSAxMzAuMDgyIDExMTAuNSAxMzQuNTAxTDExMTAuNSAxNjYuNTAxQzExMTAuNSAxNzAuOTE5IDExMDYuOTIgMTc0LjUwMSAxMTAyLjUgMTc0LjUwMUwyNTAuNSAxNzQuNUMyNDYuMDgyIDE3NC41IDI0Mi41IDE3MC45MTggMjQyLjUgMTY2LjVaIiBzdHJva2U9IiNGMTkwMzEiIHN0cm9rZS13aWR0aD0iMS4zMzMzMyIgc3Ryb2tlLW1pdGVybGltaXQ9IjgiIGZpbGw9IiNGRkZGRkYiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjx0ZXh0IGZvbnQtZmFtaWx5PSJBcmlhbCxBcmlhbF9NU0ZvbnRTZXJ2aWNlLHNhbnMtc2VyaWYiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMjQiIHRyYW5zZm9ybT0idHJhbnNsYXRlKDI2MC4yMjYgMTU5KSI+SOG7jWM8dHNwYW4gZm9udC1zaXplPSIyNCIgeD0iNDkuMzMzMyIgeT0iMCI+cGjhuqduPC90c3Bhbj48dHNwYW4gZm9udC1zaXplPSIyNCIgeD0iMTA5LjMzMyIgeT0iMCI+MSA8L3RzcGFuPi08dHNwYW4gZm9udC1zaXplPSIyNCIgeD0iMTQ0IiB5PSIwIj5M4bqvcDwvdHNwYW4+PHRzcGFuIGZvbnQtc2l6ZT0iMjQiIHg9IjE5MC42NjciIHk9IjAiPnLDoXA8L3RzcGFuPjx0c3BhbiBmb250LXNpemU9IjI0IiB4PSIyMzIiIHk9IjAiPnbDoDwvdHNwYW4+PHRzcGFuIGZvbnQtc2l6ZT0iMjQiIHg9IjI2NCIgeT0iMCI+bOG6rXA8L3RzcGFuPjx0c3BhbiBmb250LXNpemU9IjI0IiB4PSIzMDIuNjY3IiB5PSIwIj50csOsbmg8L3RzcGFuPjx0c3BhbiBmb250LXNpemU9IjI0IiB4PSIzNTcuMzMzIiB5PSIwIj524bubaTwvdHNwYW4+PHRzcGFuIGZvbnQtc2l6ZT0iMjQiIHg9IjM5NyIgeT0iMCI+VWFybzwvdHNwYW4+PHRzcGFuIGZvbnQtZmFtaWx5PSJTYW5zU2VyaWYsU2Fuc1NlcmlmX01TRm9udFNlcnZpY2Usc2Fucy1zZXJpZiIgZm9udC1zaXplPSIyNCIgeD0iLTg2LjM3MjgiIHk9IjAiPjE8L3RzcGFuPjx0c3BhbiBmaWxsPSIjNzY3MTcxIiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtc2l6ZT0iMTkiIHg9IjcwNy40MTEiIHk9IjEiPjEyIDwvdHNwYW4+PHRzcGFuIGZpbGw9IiM3NjcxNzEiIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC1zaXplPSIxOSIgeD0iNzMzLjI0NCIgeT0iMSI+YsOgaTwvdHNwYW4+PHRzcGFuIGZpbGw9IiM3NjcxNzEiIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC1zaXplPSIxOSIgeD0iNzYzLjI0NCIgeT0iMSI+LTwvdHNwYW4+PHRzcGFuIGZpbGw9IiM3NjcxNzEiIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC1zaXplPSIxOSIgeD0iNzc0LjU3OCIgeT0iMSI+MTggPC90c3Bhbj48dHNwYW4gZmlsbD0iIzc2NzE3MSIgZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXNpemU9IjE5IiB4PSI4MDAuNDExIiB5PSIxIj5naeG7nTwvdHNwYW4+PC90ZXh0PjxwYXRoIGQ9Ik0xNTcuNSAyMTEuNUMxNTcuNSAxOTguMjQ1IDE2OC4yNDUgMTg3LjUgMTgxLjUgMTg3LjUgMTk0Ljc1NSAxODcuNSAyMDUuNSAxOTguMjQ1IDIwNS41IDIxMS41IDIwNS41IDIyNC43NTUgMTk0Ljc1NSAyMzUuNSAxODEuNSAyMzUuNSAxNjguMjQ1IDIzNS41IDE1Ny41IDIyNC43NTUgMTU3LjUgMjExLjVaIiBzdHJva2U9IiNGMTkwMzEiIHN0cm9rZS13aWR0aD0iMS4zMzMzMyIgc3Ryb2tlLW1pdGVybGltaXQ9IjgiIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjxwYXRoIGQ9Ik0yNDIuNSAxOTQuNTAxQzI0Mi41IDE5MC4wODIgMjQ2LjA4MiAxODYuNSAyNTAuNSAxODYuNUwxMTAyLjUgMTg2LjVDMTEwNi45MiAxODYuNSAxMTEwLjUgMTkwLjA4MiAxMTEwLjUgMTk0LjUwMUwxMTEwLjUgMjI2LjUwMUMxMTEwLjUgMjMwLjkxOSAxMTA2LjkyIDIzNC41MDEgMTEwMi41IDIzNC41MDFMMjUwLjUgMjM0LjVDMjQ2LjA4MiAyMzQuNSAyNDIuNSAyMzAuOTE4IDI0Mi41IDIyNi41WiIgc3Ryb2tlPSIjRjE5MDMxIiBzdHJva2Utd2lkdGg9IjEuMzMzMzMiIHN0cm9rZS1taXRlcmxpbWl0PSI4IiBmaWxsPSIjRkZGRkZGIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48dGV4dCBmb250LWZhbWlseT0iQXJpYWwsQXJpYWxfTVNGb250U2VydmljZSxzYW5zLXNlcmlmIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjI0IiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgyNjAuMjI2IDIxOSkiPkjhu41jPHRzcGFuIGZvbnQtc2l6ZT0iMjQiIHg9IjQ5LjMzMzMiIHk9IjAiPnBo4bqnbjwvdHNwYW4+PHRzcGFuIGZvbnQtc2l6ZT0iMjQiIHg9IjEwOS4zMzMiIHk9IjAiPjIgPC90c3Bhbj4tPHRzcGFuIGZvbnQtc2l6ZT0iMjQiIHg9IjE0NCIgeT0iMCI+TOG6r3A8L3RzcGFuPjx0c3BhbiBmb250LXNpemU9IjI0IiB4PSIxOTAuNjY3IiB5PSIwIj5yw6FwPC90c3Bhbj48dHNwYW4gZm9udC1zaXplPSIyNCIgeD0iMjMyIiB5PSIwIj52w6A8L3RzcGFuPjx0c3BhbiBmb250LXNpemU9IjI0IiB4PSIyNjQiIHk9IjAiPmzhuq1wPC90c3Bhbj48dHNwYW4gZm9udC1zaXplPSIyNCIgeD0iMzAyLjY2NyIgeT0iMCI+dHLDrG5oPC90c3Bhbj48dHNwYW4gZm9udC1zaXplPSIyNCIgeD0iMzU3LjMzMyIgeT0iMCI+duG7m2k8L3RzcGFuPjx0c3BhbiBmb250LXNpemU9IjI0IiB4PSIzOTciIHk9IjAiPlVhcm88L3RzcGFuPjx0c3BhbiBmb250LWZhbWlseT0iU2Fuc1NlcmlmLFNhbnNTZXJpZl9NU0ZvbnRTZXJ2aWNlLHNhbnMtc2VyaWYiIGZvbnQtc2l6ZT0iMjQiIHg9Ii04Ni4zNzI4IiB5PSIwIj4yPC90c3Bhbj48dHNwYW4gZmlsbD0iIzc2NzE3MSIgZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXNpemU9IjE5IiB4PSI3MDcuNDExIiB5PSItMSI+MTIgPC90c3Bhbj48dHNwYW4gZmlsbD0iIzc2NzE3MSIgZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXNpemU9IjE5IiB4PSI3MzMuMjQ0IiB5PSItMSI+YsOgaTwvdHNwYW4+PHRzcGFuIGZpbGw9IiM3NjcxNzEiIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC1zaXplPSIxOSIgeD0iNzYzLjI0NCIgeT0iLTEiPi08L3RzcGFuPjx0c3BhbiBmaWxsPSIjNzY3MTcxIiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtc2l6ZT0iMTkiIHg9Ijc3NC41NzgiIHk9Ii0xIj4xOCA8L3RzcGFuPjx0c3BhbiBmaWxsPSIjNzY3MTcxIiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtc2l6ZT0iMTkiIHg9IjgwMC40MTEiIHk9Ii0xIj5naeG7nTwvdHNwYW4+PC90ZXh0PjxwYXRoIGQ9Ik0xODEgMTc1IDE4MSAxODciIHN0cm9rZT0iI0YxOTAzMSIgc3Ryb2tlLXdpZHRoPSIyIiBzdHJva2UtbWl0ZXJsaW1pdD0iOCIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIi8+PHBhdGggZD0iTTE1Ny41IDI3MS41QzE1Ny41IDI1OC4yNDUgMTY4LjI0NSAyNDcuNSAxODEuNSAyNDcuNSAxOTQuNzU1IDI0Ny41IDIwNS41IDI1OC4yNDUgMjA1LjUgMjcxLjUgMjA1LjUgMjg0Ljc1NSAxOTQuNzU1IDI5NS41IDE4MS41IDI5NS41IDE2OC4yNDUgMjk1LjUgMTU3LjUgMjg0Ljc1NSAxNTcuNSAyNzEuNVoiIHN0cm9rZT0iI0YxOTAzMSIgc3Ryb2tlLXdpZHRoPSIxLjMzMzMzIiBzdHJva2UtbWl0ZXJsaW1pdD0iOCIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIi8+PHBhdGggZD0iTTI0Mi41IDI1NS41MDFDMjQyLjUgMjUxLjA4MiAyNDYuMDgyIDI0Ny41IDI1MC41IDI0Ny41TDExMDIuNSAyNDcuNUMxMTA2LjkyIDI0Ny41IDExMTAuNSAyNTEuMDgyIDExMTAuNSAyNTUuNTAxTDExMTAuNSAyODcuNTAxQzExMTAuNSAyOTEuOTE5IDExMDYuOTIgMjk1LjUwMSAxMTAyLjUgMjk1LjUwMUwyNTAuNSAyOTUuNUMyNDYuMDgyIDI5NS41IDI0Mi41IDI5MS45MTggMjQyLjUgMjg3LjVaIiBzdHJva2U9IiNGMTkwMzEiIHN0cm9rZS13aWR0aD0iMS4zMzMzMyIgc3Ryb2tlLW1pdGVybGltaXQ9IjgiIGZpbGw9IiNGRkZGRkYiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjx0ZXh0IGZvbnQtZmFtaWx5PSJBcmlhbCxBcmlhbF9NU0ZvbnRTZXJ2aWNlLHNhbnMtc2VyaWYiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMjQiIHRyYW5zZm9ybT0idHJhbnNsYXRlKDI2MC4yMjYgMjc5KSI+SOG7jWM8dHNwYW4gZm9udC1zaXplPSIyNCIgeD0iNDkuMzMzMyIgeT0iMCI+cGjhuqduPC90c3Bhbj48dHNwYW4gZm9udC1zaXplPSIyNCIgeD0iMTA5LjMzMyIgeT0iMCI+MyA8L3RzcGFuPi08dHNwYW4gZm9udC1zaXplPSIyNCIgeD0iMTQ0IiB5PSIwIj5M4bqvcDwvdHNwYW4+PHRzcGFuIGZvbnQtc2l6ZT0iMjQiIHg9IjE5MC42NjciIHk9IjAiPnLDoXA8L3RzcGFuPjx0c3BhbiBmb250LXNpemU9IjI0IiB4PSIyMzIiIHk9IjAiPnbDoDwvdHNwYW4+PHRzcGFuIGZvbnQtc2l6ZT0iMjQiIHg9IjI2NCIgeT0iMCI+bOG6rXA8L3RzcGFuPjx0c3BhbiBmb250LXNpemU9IjI0IiB4PSIzMDIuNjY3IiB5PSIwIj50csOsbmg8L3RzcGFuPjx0c3BhbiBmb250LXNpemU9IjI0IiB4PSIzNTcuMzMzIiB5PSIwIj524bubaTwvdHNwYW4+PHRzcGFuIGZvbnQtc2l6ZT0iMjQiIHg9IjM5NyIgeT0iMCI+VWFybzwvdHNwYW4+PHRzcGFuIGZvbnQtZmFtaWx5PSJTYW5zU2VyaWYsU2Fuc1NlcmlmX01TRm9udFNlcnZpY2Usc2Fucy1zZXJpZiIgZm9udC1zaXplPSIyNCIgeD0iLTg2LjM3MjgiIHk9IjAiPjM8L3RzcGFuPjx0c3BhbiBmaWxsPSIjNzY3MTcxIiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtc2l6ZT0iMTkiIHg9IjcwNy40MTEiIHk9IjAiPjEyIDwvdHNwYW4+PHRzcGFuIGZpbGw9IiM3NjcxNzEiIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC1zaXplPSIxOSIgeD0iNzMzLjI0NCIgeT0iMCI+YsOgaTwvdHNwYW4+PHRzcGFuIGZpbGw9IiM3NjcxNzEiIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC1zaXplPSIxOSIgeD0iNzYzLjI0NCIgeT0iMCI+LTwvdHNwYW4+PHRzcGFuIGZpbGw9IiM3NjcxNzEiIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC1zaXplPSIxOSIgeD0iNzc0LjU3OCIgeT0iMCI+MTggPC90c3Bhbj48dHNwYW4gZmlsbD0iIzc2NzE3MSIgZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXNpemU9IjE5IiB4PSI4MDAuNDExIiB5PSIwIj5naeG7nTwvdHNwYW4+PC90ZXh0PjxwYXRoIGQ9Ik0xODEgMjM1IDE4MSAyNDciIHN0cm9rZT0iI0YxOTAzMSIgc3Ryb2tlLXdpZHRoPSIyIiBzdHJva2UtbWl0ZXJsaW1pdD0iOCIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIi8+PHBhdGggZD0iTTE1Ny41IDMzMi41QzE1Ny41IDMxOS4yNDUgMTY4LjI0NSAzMDguNSAxODEuNSAzMDguNSAxOTQuNzU1IDMwOC41IDIwNS41IDMxOS4yNDUgMjA1LjUgMzMyLjUgMjA1LjUgMzQ1Ljc1NSAxOTQuNzU1IDM1Ni41IDE4MS41IDM1Ni41IDE2OC4yNDUgMzU2LjUgMTU3LjUgMzQ1Ljc1NSAxNTcuNSAzMzIuNVoiIHN0cm9rZT0iI0YxOTAzMSIgc3Ryb2tlLXdpZHRoPSIxLjMzMzMzIiBzdHJva2UtbWl0ZXJsaW1pdD0iOCIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIi8+PHBhdGggZD0iTTI0Mi41IDMxNS41MDFDMjQyLjUgMzExLjA4MiAyNDYuMDgyIDMwNy41IDI1MC41IDMwNy41TDExMDIuNSAzMDcuNUMxMTA2LjkyIDMwNy41IDExMTAuNSAzMTEuMDgyIDExMTAuNSAzMTUuNTAxTDExMTAuNSAzNDcuNTAxQzExMTAuNSAzNTEuOTE5IDExMDYuOTIgMzU1LjUwMSAxMTAyLjUgMzU1LjUwMUwyNTAuNSAzNTUuNUMyNDYuMDgyIDM1NS41IDI0Mi41IDM1MS45MTggMjQyLjUgMzQ3LjVaIiBzdHJva2U9IiNGMTkwMzEiIHN0cm9rZS13aWR0aD0iMS4zMzMzMyIgc3Ryb2tlLW1pdGVybGltaXQ9IjgiIGZpbGw9IiNGRkZGRkYiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjx0ZXh0IGZvbnQtZmFtaWx5PSJBcmlhbCxBcmlhbF9NU0ZvbnRTZXJ2aWNlLHNhbnMtc2VyaWYiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMjQiIHRyYW5zZm9ybT0idHJhbnNsYXRlKDI2MC4yMjYgMzQwKSI+SOG7jWM8dHNwYW4gZm9udC1zaXplPSIyNCIgeD0iNDkuMzMzMyIgeT0iMCI+cGjhuqduPC90c3Bhbj48dHNwYW4gZm9udC1zaXplPSIyNCIgeD0iMTA5LjMzMyIgeT0iMCI+NCA8L3RzcGFuPi08dHNwYW4gZm9udC1zaXplPSIyNCIgeD0iMTQ0IiB5PSIwIj5M4bqvcDwvdHNwYW4+PHRzcGFuIGZvbnQtc2l6ZT0iMjQiIHg9IjE5MC42NjciIHk9IjAiPnLDoXA8L3RzcGFuPjx0c3BhbiBmb250LXNpemU9IjI0IiB4PSIyMzIiIHk9IjAiPnbDoDwvdHNwYW4+PHRzcGFuIGZvbnQtc2l6ZT0iMjQiIHg9IjI2NCIgeT0iMCI+bOG6rXA8L3RzcGFuPjx0c3BhbiBmb250LXNpemU9IjI0IiB4PSIzMDIuNjY3IiB5PSIwIj50csOsbmg8L3RzcGFuPjx0c3BhbiBmb250LXNpemU9IjI0IiB4PSIzNTcuMzMzIiB5PSIwIj524bubaTwvdHNwYW4+PHRzcGFuIGZvbnQtc2l6ZT0iMjQiIHg9IjM5NyIgeT0iMCI+VWFybzwvdHNwYW4+PHRzcGFuIGZvbnQtZmFtaWx5PSJTYW5zU2VyaWYsU2Fuc1NlcmlmX01TRm9udFNlcnZpY2Usc2Fucy1zZXJpZiIgZm9udC1zaXplPSIyNCIgeD0iLTg2LjM3MjgiIHk9IjAiPjQ8L3RzcGFuPjx0c3BhbiBmaWxsPSIjNzY3MTcxIiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtc2l6ZT0iMTkiIHg9IjcwNy40MTEiIHk9Ii0xIj4xMiA8L3RzcGFuPjx0c3BhbiBmaWxsPSIjNzY3MTcxIiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtc2l6ZT0iMTkiIHg9IjczMy4yNDQiIHk9Ii0xIj5iw6BpPC90c3Bhbj48dHNwYW4gZmlsbD0iIzc2NzE3MSIgZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXNpemU9IjE5IiB4PSI3NjMuMjQ0IiB5PSItMSI+LTwvdHNwYW4+PHRzcGFuIGZpbGw9IiM3NjcxNzEiIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC1zaXplPSIxOSIgeD0iNzc0LjU3OCIgeT0iLTEiPjE4IDwvdHNwYW4+PHRzcGFuIGZpbGw9IiM3NjcxNzEiIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC1zaXplPSIxOSIgeD0iODAwLjQxMSIgeT0iLTEiPmdp4budPC90c3Bhbj48L3RleHQ+PHBhdGggZD0iTTE4MSAyOTUgMTgxIDMwNyIgc3Ryb2tlPSIjRjE5MDMxIiBzdHJva2Utd2lkdGg9IjIiIHN0cm9rZS1taXRlcmxpbWl0PSI4IiBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48cGF0aCBkPSJNMTU3LjUgMzkyLjVDMTU3LjUgMzc5LjI0NSAxNjguMjQ1IDM2OC41IDE4MS41IDM2OC41IDE5NC43NTUgMzY4LjUgMjA1LjUgMzc5LjI0NSAyMDUuNSAzOTIuNSAyMDUuNSA0MDUuNzU1IDE5NC43NTUgNDE2LjUgMTgxLjUgNDE2LjUgMTY4LjI0NSA0MTYuNSAxNTcuNSA0MDUuNzU1IDE1Ny41IDM5Mi41WiIgc3Ryb2tlPSIjRjE5MDMxIiBzdHJva2Utd2lkdGg9IjEuMzMzMzMiIHN0cm9rZS1taXRlcmxpbWl0PSI4IiBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48cGF0aCBkPSJNMjQyLjUgMzc2LjUwMUMyNDIuNSAzNzIuMDgyIDI0Ni4wODIgMzY4LjUgMjUwLjUgMzY4LjVMMTEwMi41IDM2OC41QzExMDYuOTIgMzY4LjUgMTExMC41IDM3Mi4wODIgMTExMC41IDM3Ni41MDFMMTExMC41IDQwOC41MDFDMTExMC41IDQxMi45MTkgMTEwNi45MiA0MTYuNTAxIDExMDIuNSA0MTYuNTAxTDI1MC41IDQxNi41QzI0Ni4wODIgNDE2LjUgMjQyLjUgNDEyLjkxOCAyNDIuNSA0MDguNVoiIHN0cm9rZT0iI0YxOTAzMSIgc3Ryb2tlLXdpZHRoPSIxLjMzMzMzIiBzdHJva2UtbWl0ZXJsaW1pdD0iOCIgZmlsbD0iI0ZGRkZGRiIgZmlsbC1ydWxlPSJldmVub2RkIi8+PHRleHQgZm9udC1mYW1pbHk9IkFyaWFsLEFyaWFsX01TRm9udFNlcnZpY2Usc2Fucy1zZXJpZiIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zaXplPSIyNCIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMjYwLjIyNiA0MDApIj5I4buNYzx0c3BhbiBmb250LXNpemU9IjI0IiB4PSI0OS4zMzMzIiB5PSIwIj5waOG6p248L3RzcGFuPjx0c3BhbiBmb250LXNpemU9IjI0IiB4PSIxMDkuMzMzIiB5PSIwIj41IDwvdHNwYW4+LTx0c3BhbiBmb250LXNpemU9IjI0IiB4PSIxNDQiIHk9IjAiPkzhuq1wPC90c3Bhbj48dHNwYW4gZm9udC1zaXplPSIyNCIgeD0iMTkwLjY2NyIgeT0iMCI+dHLDrG5oPC90c3Bhbj48dHNwYW4gZm9udC1zaXplPSIyNCIgeD0iMjQ1LjMzMyIgeT0iMCI+duG7m2k8L3RzcGFuPjx0c3BhbiBmb250LXNpemU9IjI0IiB4PSIyODUiIHk9IjAiPlNjcmF0Y2ggSnIuPC90c3Bhbj48dHNwYW4gZm9udC1mYW1pbHk9IlNhbnNTZXJpZixTYW5zU2VyaWZfTVNGb250U2VydmljZSxzYW5zLXNlcmlmIiBmb250LXNpemU9IjI0IiB4PSItODYuMzcyOCIgeT0iMCI+NTwvdHNwYW4+PHRzcGFuIGZpbGw9IiM3NjcxNzEiIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC1zaXplPSIxOSIgeD0iNzA3LjQxMSIgeT0iMCI+MTIgPC90c3Bhbj48dHNwYW4gZmlsbD0iIzc2NzE3MSIgZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXNpemU9IjE5IiB4PSI3MzMuMjQ0IiB5PSIwIj5iw6BpPC90c3Bhbj48dHNwYW4gZmlsbD0iIzc2NzE3MSIgZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXNpemU9IjE5IiB4PSI3NjMuMjQ0IiB5PSIwIj4tPC90c3Bhbj48dHNwYW4gZmlsbD0iIzc2NzE3MSIgZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXNpemU9IjE5IiB4PSI3NzQuNTc4IiB5PSIwIj4xOCA8L3RzcGFuPjx0c3BhbiBmaWxsPSIjNzY3MTcxIiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtc2l6ZT0iMTkiIHg9IjgwMC40MTEiIHk9IjAiPmdp4budPC90c3Bhbj48L3RleHQ+PHBhdGggZD0iTTE4MSAzNTYgMTgxIDM2OCIgc3Ryb2tlPSIjRjE5MDMxIiBzdHJva2Utd2lkdGg9IjIiIHN0cm9rZS1taXRlcmxpbWl0PSI4IiBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48cGF0aCBkPSJNMTU3LjUgNDUzLjVDMTU3LjUgNDQwLjI0NSAxNjguMjQ1IDQyOS41IDE4MS41IDQyOS41IDE5NC43NTUgNDI5LjUgMjA1LjUgNDQwLjI0NSAyMDUuNSA0NTMuNSAyMDUuNSA0NjYuNzU1IDE5NC43NTUgNDc3LjUgMTgxLjUgNDc3LjUgMTY4LjI0NSA0NzcuNSAxNTcuNSA0NjYuNzU1IDE1Ny41IDQ1My41WiIgc3Ryb2tlPSIjRjE5MDMxIiBzdHJva2Utd2lkdGg9IjEuMzMzMzMiIHN0cm9rZS1taXRlcmxpbWl0PSI4IiBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48cGF0aCBkPSJNMjQyLjUgNDM3LjUwMUMyNDIuNSA0MzMuMDgyIDI0Ni4wODIgNDI5LjUgMjUwLjUgNDI5LjVMMTEwMi41IDQyOS41QzExMDYuOTIgNDI5LjUgMTExMC41IDQzMy4wODIgMTExMC41IDQzNy41MDFMMTExMC41IDQ2OS41MDFDMTExMC41IDQ3My45MTkgMTEwNi45MiA0NzcuNTAxIDExMDIuNSA0NzcuNTAxTDI1MC41IDQ3Ny41QzI0Ni4wODIgNDc3LjUgMjQyLjUgNDczLjkxOCAyNDIuNSA0NjkuNVoiIHN0cm9rZT0iI0YxOTAzMSIgc3Ryb2tlLXdpZHRoPSIxLjMzMzMzIiBzdHJva2UtbWl0ZXJsaW1pdD0iOCIgZmlsbD0iI0ZGRkZGRiIgZmlsbC1ydWxlPSJldmVub2RkIi8+PHRleHQgZm9udC1mYW1pbHk9IkFyaWFsLEFyaWFsX01TRm9udFNlcnZpY2Usc2Fucy1zZXJpZiIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zaXplPSIyNCIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMjYwLjIyNiA0NjEpIj5I4buNYzx0c3BhbiBmb250LXNpemU9IjI0IiB4PSI0OS4zMzMzIiB5PSIwIj5waOG6p248L3RzcGFuPjx0c3BhbiBmb250LXNpemU9IjI0IiB4PSIxMDkuMzMzIiB5PSIwIj42IDwvdHNwYW4+LTx0c3BhbiBmb250LXNpemU9IjI0IiB4PSIxNDQiIHk9IjAiPkzhuq1wPC90c3Bhbj48dHNwYW4gZm9udC1zaXplPSIyNCIgeD0iMTkwLjY2NyIgeT0iMCI+dHLDrG5oPC90c3Bhbj48dHNwYW4gZm9udC1zaXplPSIyNCIgeD0iMjQ1LjMzMyIgeT0iMCI+duG7m2k8L3RzcGFuPjx0c3BhbiBmb250LXNpemU9IjI0IiB4PSIyODUiIHk9IjAiPlNjcmF0Y2ggSnIuIDwvdHNwYW4+PHRzcGFuIGZvbnQtZmFtaWx5PSJTYW5zU2VyaWYsU2Fuc1NlcmlmX01TRm9udFNlcnZpY2Usc2Fucy1zZXJpZiIgZm9udC1zaXplPSIyNCIgeD0iLTg2LjM3MjgiIHk9IjAiPjY8L3RzcGFuPjx0c3BhbiBmaWxsPSIjNzY3MTcxIiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtc2l6ZT0iMTkiIHg9IjcwNy40MTEiIHk9IjAiPjEyIDwvdHNwYW4+PHRzcGFuIGZpbGw9IiM3NjcxNzEiIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC1zaXplPSIxOSIgeD0iNzMzLjI0NCIgeT0iMCI+YsOgaTwvdHNwYW4+PHRzcGFuIGZpbGw9IiM3NjcxNzEiIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC1zaXplPSIxOSIgeD0iNzYzLjI0NCIgeT0iMCI+LTwvdHNwYW4+PHRzcGFuIGZpbGw9IiM3NjcxNzEiIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC1zaXplPSIxOSIgeD0iNzc0LjU3OCIgeT0iMCI+MTggPC90c3Bhbj48dHNwYW4gZmlsbD0iIzc2NzE3MSIgZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXNpemU9IjE5IiB4PSI4MDAuNDExIiB5PSIwIj5naeG7nTwvdHNwYW4+PC90ZXh0PjxwYXRoIGQ9Ik0xODEgNDE3IDE4MSA0MjkiIHN0cm9rZT0iI0YxOTAzMSIgc3Ryb2tlLXdpZHRoPSIyIiBzdHJva2UtbWl0ZXJsaW1pdD0iOCIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIi8+PHBhdGggZD0iTTE1Ny41IDUxNC41QzE1Ny41IDUwMS4yNDUgMTY4LjI0NSA0OTAuNSAxODEuNSA0OTAuNSAxOTQuNzU1IDQ5MC41IDIwNS41IDUwMS4yNDUgMjA1LjUgNTE0LjUgMjA1LjUgNTI3Ljc1NSAxOTQuNzU1IDUzOC41IDE4MS41IDUzOC41IDE2OC4yNDUgNTM4LjUgMTU3LjUgNTI3Ljc1NSAxNTcuNSA1MTQuNVoiIHN0cm9rZT0iI0YxOTAzMSIgc3Ryb2tlLXdpZHRoPSIxLjMzMzMzIiBzdHJva2UtbWl0ZXJsaW1pdD0iOCIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIi8+PHBhdGggZD0iTTI0Mi41IDQ5Ny41MDFDMjQyLjUgNDkzLjA4MiAyNDYuMDgyIDQ4OS41IDI1MC41IDQ4OS41TDExMDIuNSA0ODkuNUMxMTA2LjkyIDQ4OS41IDExMTAuNSA0OTMuMDgyIDExMTAuNSA0OTcuNTAxTDExMTAuNSA1MjkuNTAxQzExMTAuNSA1MzMuOTE5IDExMDYuOTIgNTM3LjUwMSAxMTAyLjUgNTM3LjUwMUwyNTAuNSA1MzcuNUMyNDYuMDgyIDUzNy41IDI0Mi41IDUzMy45MTggMjQyLjUgNTI5LjVaIiBzdHJva2U9IiNGMTkwMzEiIHN0cm9rZS13aWR0aD0iMS4zMzMzMyIgc3Ryb2tlLW1pdGVybGltaXQ9IjgiIGZpbGw9IiNGRkZGRkYiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjx0ZXh0IGZvbnQtZmFtaWx5PSJBcmlhbCxBcmlhbF9NU0ZvbnRTZXJ2aWNlLHNhbnMtc2VyaWYiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMjQiIHRyYW5zZm9ybT0idHJhbnNsYXRlKDI2MC4yMjYgNTIyKSI+SOG7jWM8dHNwYW4gZm9udC1zaXplPSIyNCIgeD0iNDkuMzMzMyIgeT0iMCI+cGjhuqduPC90c3Bhbj48dHNwYW4gZm9udC1zaXplPSIyNCIgeD0iMTA5LjMzMyIgeT0iMCI+NyA8L3RzcGFuPi08dHNwYW4gZm9udC1zaXplPSIyNCIgeD0iMTQ0IiB5PSIwIj5Dw7RuZzwvdHNwYW4+PHRzcGFuIGZvbnQtc2l6ZT0iMjQiIHg9IjIwOCIgeT0iMCI+bmdo4buHPC90c3Bhbj48dHNwYW4gZm9udC1zaXplPSIyNCIgeD0iMjY4IiB5PSIwIj5pbiAzRCA8L3RzcGFuPnbhu5tpPHRzcGFuIGZvbnQtc2l6ZT0iMjQiIHg9IjM3MC4zMzMiIHk9IjAiPk1ha2VyIEVtcGlyZTwvdHNwYW4+PHRzcGFuIGZvbnQtZmFtaWx5PSJTYW5zU2VyaWYsU2Fuc1NlcmlmX01TRm9udFNlcnZpY2Usc2Fucy1zZXJpZiIgZm9udC1zaXplPSIyNCIgeD0iLTg2LjM3MjgiIHk9IjAiPjc8L3RzcGFuPjx0c3BhbiBmaWxsPSIjNzY3MTcxIiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtc2l6ZT0iMTkiIHg9IjcwNy40MTEiIHk9Ii0xIj4xMiA8L3RzcGFuPjx0c3BhbiBmaWxsPSIjNzY3MTcxIiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtc2l6ZT0iMTkiIHg9IjczMy4yNDQiIHk9Ii0xIj5iw6BpPC90c3Bhbj48dHNwYW4gZmlsbD0iIzc2NzE3MSIgZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXNpemU9IjE5IiB4PSI3NjMuMjQ0IiB5PSItMSI+LTwvdHNwYW4+PHRzcGFuIGZpbGw9IiM3NjcxNzEiIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC1zaXplPSIxOSIgeD0iNzc0LjU3OCIgeT0iLTEiPjE4IDwvdHNwYW4+PHRzcGFuIGZpbGw9IiM3NjcxNzEiIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC1zaXplPSIxOSIgeD0iODAwLjQxMSIgeT0iLTEiPmdp4budPC90c3Bhbj48L3RleHQ+PHBhdGggZD0iTTE4MSA0NzcgMTgxIDQ4OSIgc3Ryb2tlPSIjRjE5MDMxIiBzdHJva2Utd2lkdGg9IjIiIHN0cm9rZS1taXRlcmxpbWl0PSI4IiBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48cGF0aCBkPSJNMTU3LjUgNTc1LjVDMTU3LjUgNTYyLjI0NSAxNjguMjQ1IDU1MS41IDE4MS41IDU1MS41IDE5NC43NTUgNTUxLjUgMjA1LjUgNTYyLjI0NSAyMDUuNSA1NzUuNSAyMDUuNSA1ODguNzU1IDE5NC43NTUgNTk5LjUgMTgxLjUgNTk5LjUgMTY4LjI0NSA1OTkuNSAxNTcuNSA1ODguNzU1IDE1Ny41IDU3NS41WiIgc3Ryb2tlPSIjRjE5MDMxIiBzdHJva2Utd2lkdGg9IjEuMzMzMzMiIHN0cm9rZS1taXRlcmxpbWl0PSI4IiBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48cGF0aCBkPSJNMjQyLjUgNTU4LjUwMUMyNDIuNSA1NTQuMDgyIDI0Ni4wODIgNTUwLjUgMjUwLjUgNTUwLjVMMTEwMi41IDU1MC41QzExMDYuOTIgNTUwLjUgMTExMC41IDU1NC4wODIgMTExMC41IDU1OC41MDFMMTExMC41IDU5MC41MDFDMTExMC41IDU5NC45MTkgMTEwNi45MiA1OTguNTAxIDExMDIuNSA1OTguNTAxTDI1MC41IDU5OC41QzI0Ni4wODIgNTk4LjUgMjQyLjUgNTk0LjkxOCAyNDIuNSA1OTAuNVoiIHN0cm9rZT0iI0YxOTAzMSIgc3Ryb2tlLXdpZHRoPSIxLjMzMzMzIiBzdHJva2UtbWl0ZXJsaW1pdD0iOCIgZmlsbD0iI0ZGRkZGRiIgZmlsbC1ydWxlPSJldmVub2RkIi8+PHRleHQgZm9udC1mYW1pbHk9IkFyaWFsLEFyaWFsX01TRm9udFNlcnZpY2Usc2Fucy1zZXJpZiIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zaXplPSIyNCIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMjYwLjIyNiA1ODMpIj5I4buNYzx0c3BhbiBmb250LXNpemU9IjI0IiB4PSI0OS4zMzMzIiB5PSIwIj5waOG6p248L3RzcGFuPjx0c3BhbiBmb250LXNpemU9IjI0IiB4PSIxMDkuMzMzIiB5PSIwIj44IDwvdHNwYW4+LTx0c3BhbiBmb250LXNpemU9IjI0IiB4PSIxNDQiIHk9IjAiPkPDtG5nPC90c3Bhbj48dHNwYW4gZm9udC1zaXplPSIyNCIgeD0iMjA4IiB5PSIwIj5uZ2jhu4c8L3RzcGFuPjx0c3BhbiBmb250LXNpemU9IjI0IiB4PSIyNjgiIHk9IjAiPmluIDNEIDwvdHNwYW4+duG7m2k8dHNwYW4gZm9udC1zaXplPSIyNCIgeD0iMzcwLjMzMyIgeT0iMCI+TWFrZXIgRW1waXJlPC90c3Bhbj48dHNwYW4gZm9udC1mYW1pbHk9IlNhbnNTZXJpZixTYW5zU2VyaWZfTVNGb250U2VydmljZSxzYW5zLXNlcmlmIiBmb250LXNpemU9IjI0IiB4PSItODYuMzcyOCIgeT0iMCI+ODwvdHNwYW4+PHRzcGFuIGZpbGw9IiM3NjcxNzEiIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC1zaXplPSIxOSIgeD0iNzA3LjQxMSIgeT0iLTEiPjEyIDwvdHNwYW4+PHRzcGFuIGZpbGw9IiM3NjcxNzEiIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC1zaXplPSIxOSIgeD0iNzMzLjI0NCIgeT0iLTEiPmLDoGk8L3RzcGFuPjx0c3BhbiBmaWxsPSIjNzY3MTcxIiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtc2l6ZT0iMTkiIHg9Ijc2My4yNDQiIHk9Ii0xIj4tPC90c3Bhbj48dHNwYW4gZmlsbD0iIzc2NzE3MSIgZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXNpemU9IjE5IiB4PSI3NzQuNTc4IiB5PSItMSI+MTggPC90c3Bhbj48dHNwYW4gZmlsbD0iIzc2NzE3MSIgZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXNpemU9IjE5IiB4PSI4MDAuNDExIiB5PSItMSI+Z2nhu508L3RzcGFuPjwvdGV4dD48cGF0aCBkPSJNMTgxIDUzOCAxODEgNTUwIiBzdHJva2U9IiNGMTkwMzEiIHN0cm9rZS13aWR0aD0iMiIgc3Ryb2tlLW1pdGVybGltaXQ9IjgiIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjwvZz48L3N2Zz4=\" width=\"957\" /></div>\n\n	<ul>\n	</ul>\n	</li>\n</ul>\n</div>\n', '144 giờ (2 học kỳ ~ 24 tháng), 90\' mỗi buổi', '8 học phần từ thấp đến cao', 'java-core, java-tutorial,..', ' 14/7/2021', ' 14/7/2021', 'Khóa học lập trình Scratch', 'Lập trình Scratch là gì? Tại sao nên dạy lập trình Scratch cho trẻ ngay hôm nay? Hãy cùng tìm hiểu những thông tin hữu ích ngay sau đây nhé!', 'Lập trình Scratch, Scratch cơ bản, Scratch cho trẻ em, học lập trình Scratch, Scratch, game Scratch', 'index,follow', 0, b'1'),
(13, 'https://spec.edu.vn/uploadfileimage/spec/khac/759113500z2605447812175_20b7d752a1676e3cf0b21c19d94d3987.jpg', 3500000, 2800000, 'Khóa học lập trình  Android nâng cao', b'1', 1, 'android-tutorial', 'Doanh Nghiệp', 8, 1, b'1', 'Tự thiết kế được ứng dụng trên Android Tutorial với React Native, làm quen các kiến thức nâng cao của JavaScript theo chuẩn ES6/ES7/ES8', '2021-07-11', '18-30', 20, 13, '<h1>Gi&uacute;p b&eacute; trở th&agrave;nh nh&agrave; s&aacute;ng tạo tương lai c&ugrave;ng kh&oacute;a học lập tr&igrave;nh Scratch</h1>\n\n<p>Dạy lập tr&igrave;nh Scratch cho trẻ đang l&agrave; xu hướng được nhiều bậc phụ huynh quan t&acirc;m trong thời gian gần đ&acirc;y. H&atilde;y c&ugrave;ng đi t&igrave;m nguy&ecirc;n nh&acirc;n tạo n&ecirc;n sức h&uacute;t mạnh mẽ từ tr&agrave;o lưu n&agrave;y nh&eacute;!</p>\n\n<div>12 th&aacute;ng 03, 2021</div>\n\n<div>\n<h2>Dạy cho trẻ về lập tr&igrave;nh Scrath</h2>\n\n<p>Scratch l&agrave; ng&ocirc;n ngữ lập tr&igrave;nh được nhiều bậc phụ huynh lựa chọn cho con em m&igrave;nh. Với những lợi &iacute;ch tuyệt vời, việc nắm vững kiến thức về ng&ocirc;n ngữ lập tr&igrave;nh Scratch thực sự sẽ l&agrave; nền tảng để th&uacute;c đẩy sự ph&aacute;t triển to&agrave;n diện ở trẻ v&agrave; mang đến cơ hội rộng mở cho trẻ trong tương lai.&nbsp;</p>\n\n<h2>Scratch- ng&ocirc;n ngữ lập tr&igrave;nh ph&ugrave; hợp với trẻ nhỏ</h2>\n\n<p>Scratch l&agrave; một ng&ocirc;n ngữ lập tr&igrave;nh miễn ph&iacute;, được s&aacute;ng tạo bởi một nh&oacute;m kỹ sư Lifelong Kindergarten Viện nghi&ecirc;n cứu c&ocirc;ng nghệ Massachusetts - Mỹ v&agrave; được ra mắt lần đầu ti&ecirc;n v&agrave;o năm 2006. Ngay từ khi xuất hiện, ng&ocirc;n ngữ lập tr&igrave;nh n&agrave;y đ&atilde; thu h&uacute;t được sự ch&uacute; &yacute; của giới c&ocirc;ng nghệ bởi những đặc điểm nổi bật như:</p>\n\n<ul>\n</ul>\n\n<ul>\n	<li>Tương th&iacute;ch với tất cả c&aacute;c hệ điều h&agrave;nh tr&ecirc;n thế giới. Bạn dễ d&agrave;ng truy cập v&agrave; sử dụng Scratch ngay h&ocirc;m nay tại bất cứ quốc gia n&agrave;o tr&ecirc;n thế giới chỉ với chiếc m&aacute;y t&iacute;nh c&oacute; kết nối internet m&agrave; th&ocirc;i.</li>\n	<li>C&ocirc;ng cụ l&agrave; sự tương t&aacute;c giữa &acirc;m thanh v&agrave; h&igrave;nh ảnh sống động v&ocirc; c&ugrave;ng cuốn h&uacute;t người d&ugrave;ng. Sử dụng Scratch chắc chắn sẽ kh&ocirc;ng khiến bạn cảm thấy nh&agrave;m ch&aacute;n hay kh&ocirc; khan như những ng&ocirc;n ngữ lập tr&igrave;nh kh&aacute;c.</li>\n	<li>Tương th&iacute;ch với tất cả c&aacute;c hệ điều h&agrave;nh tr&ecirc;n thế giới. Bạn dễ d&agrave;ng truy cập v&agrave; sử dụng Scratch ngay h&ocirc;m nay tại bất cứ quốc gia n&agrave;o tr&ecirc;n thế giới chỉ với chiếc m&aacute;y t&iacute;nh c&oacute; kết nối internet m&agrave; th&ocirc;i.</li>\n</ul>\n\n<div aria-label=\" ảnh widget\" contenteditable=\"false\" role=\"region\" tabindex=\"-1\">\n<p class=\"image-align-center\" data-widget=\"image\"><img alt=\"\" height=\"313\" src=\"https://spec.edu.vn/client/image/a25.jpg\" width=\"516\" /></p>\n<span style=\"background-color:rgba(220,220,220,0.5)\"><img height=\"15\" role=\"presentation\" src=\"data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==\" title=\"Nhấp chuột và kéo để di chuyển\" width=\"15\" /></span></div>\n\n<p style=\"text-align:center\">Lập tr&igrave;nh Scratch l&agrave; c&ocirc;ng cụ đẹp mắt v&agrave; hấp dẫn trẻ nhỏ</p>\n\n<ul>\n	<li>C&oacute; thể sử dụng c&ocirc;ng cụ để tạo n&ecirc;n những mini game hay những đoạn hoạt h&igrave;nh ấn tượng</li>\n	<li>L&agrave; một c&ocirc;ng cụ th&iacute;ch hợp với mọi người, kể cả người mới bắt đầu v&agrave; trẻ nhỏ. Ch&iacute;nh v&igrave; vậy thay v&igrave; sử dụng những d&ograve;ng lệnh phức tạp, Scratch sử dụng những c&uacute; ph&aacute;p đơn giản, dễ hiểu v&agrave; dễ nhớ. Bất cứ ai cũng c&oacute; thể học v&agrave; sử dụng Scratch th&agrave;nh thạo sau một thời gian ngắn học tập</li>\n</ul>\n\n<p>Ch&iacute;nh v&igrave; vậy m&agrave; ng&ocirc;n ngữ lập tr&igrave;nh Scratch đ&atilde; trở th&agrave;nh ng&ocirc;n ngữ lập tr&igrave;nh ho&agrave;n hảo d&agrave;nh cho trẻ. Đặc biệt được đưa v&agrave;o chương tr&igrave;nh gi&aacute;o dục tiểu học tại nhiều quốc gia tr&ecirc;n thế giới. Tại một số trường tại Việt Nam, ng&ocirc;n ngữ lập tr&igrave;nh Scratch đ&atilde; được đưa v&agrave;o chương tr&igrave;nh học tự chọn v&agrave; đ&atilde; thu được nhiều kết quả khả quan v&agrave; được đ&ocirc;ng đảo c&aacute;c bậc phụ huynh ủng hộ.</p>\n\n<h2>Những kiến thức trẻ học được từ việc học ng&ocirc;n ngữ lập tr&igrave;nh Scratch</h2>\n\n<p>Với c&ocirc;ng cụ Scratch, trẻ sẽ tạo ra c&aacute;c nh&acirc;n vật v&agrave; l&ecirc;n &yacute; tưởng để ch&uacute;ng c&oacute; những t&iacute;nh c&aacute;ch, cử chỉ, h&agrave;nh động ri&ecirc;ng biệt. Từ đ&oacute; tạo n&ecirc;n những game, clip,...v&ocirc; c&ugrave;ng sinh động v&agrave; hấp dẫn.</p>\n\n<p style=\"text-align:center\"><span aria-label=\" ảnh widget\" contenteditable=\"false\" role=\"region\" tabindex=\"-1\"><img alt=\"\" data-widget=\"image\" height=\"602\" src=\"https://spec.edu.vn/client/image/a26.png\" width=\"500\" /><span style=\"background-color:rgba(220,220,220,0.5)\"><img draggable=\"true\" height=\"15\" role=\"presentation\" src=\"data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==\" title=\"Nhấp chuột và kéo để di chuyển\" width=\"15\" /></span></span></p>\n\n<p style=\"text-align:center\">Scratch mang đến những ph&uacute;t gi&acirc;y vừa học vừa chơi th&uacute; vị cho b&eacute;</p>\n\n<p>Ch&iacute;nh v&igrave; vậy m&agrave; việc học lập tr&igrave;nh Scratch sẽ tạo n&ecirc;n cho b&eacute; những trải nghiệm v&ocirc; c&ugrave;ng vui vẻ v&agrave; kh&ocirc;ng hề nh&agrave;m ch&aacute;n. Đặc biệt, sẽ k&iacute;ch th&iacute;ch ph&aacute;t triển tư duy v&agrave; sự s&aacute;ng tạo kh&ocirc;ng ngừng của trẻ nhỏ. Trẻ vừa được r&egrave;n luyện để ph&aacute;t triển to&agrave;n diện vừa c&oacute; thỏa sức thể hiện đam m&ecirc; v&agrave; c&aacute; t&iacute;nh của bản th&acirc;n m&agrave; kh&ocirc;ng hề cảm thấy g&ograve; b&oacute;. Ch&iacute;nh v&igrave; vậy m&agrave; việc vừa học vừa chơi c&ugrave;ng Scratch thực sự l&agrave; m&ocirc;n học th&uacute; vị v&agrave; hấp dẫn d&agrave;nh cho trẻ.</p>\n\n<p>Scratch thực sự ph&ugrave; hợp với tất cả mọi người. Đặc biệt với c&aacute;c b&eacute; y&ecirc;u th&iacute;ch lập tr&igrave;nh v&agrave; c&ocirc;ng nghệ c&oacute; độ tuổi từ 7-12 tuổi. Đ&acirc;y l&agrave; giai đoạn b&eacute; đ&atilde; c&oacute; sự ph&aacute;t triển đầy đủ về tr&iacute; tuệ, c&oacute; thể tiếp thu những tri thức khoa học mới mẻ. Ch&iacute;nh v&igrave; vậy, c&aacute;c bậc phụ huynh n&ecirc;n lưu &yacute; giai đoạn v&agrave;ng n&agrave;y ở trẻ để c&oacute; thể cho b&eacute; tiếp cận sớm với ng&ocirc;n ngữ lập tr&igrave;nh n&oacute;i chung v&agrave; lập tr&igrave;nh Scratch n&oacute;i ri&ecirc;ng.</p>\n\n<ul>\n</ul>\n\n<p style=\"text-align:center\"><span aria-label=\" ảnh widget\" contenteditable=\"false\" role=\"region\" tabindex=\"-1\"><img alt=\"\" data-widget=\"image\" height=\"602\" src=\"https://spec.edu.vn/client/image/a27.png\" width=\"500\" /><span style=\"background-color:rgba(220,220,220,0.5)\"><img draggable=\"true\" height=\"15\" role=\"presentation\" src=\"data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==\" title=\"Nhấp chuột và kéo để di chuyển\" width=\"15\" /></span></span></p>\n\n<p style=\"text-align:center\">Scratch l&agrave; ng&ocirc;n ngữ lập tr&igrave;nh được mọi trẻ em tr&ecirc;n thế giới y&ecirc;u th&iacute;ch</p>\n\n<h2>SPEC- trường dạy lập tr&igrave;nh cho b&eacute; tốt nhất Việt Nam</h2>\n\n<p>Lập tr&igrave;nh Scratch thực sự l&agrave; lựa chọn ho&agrave;n hảo d&agrave;nh cho trẻ em m&agrave; c&aacute;c bậc phụ huynh kh&ocirc;ng n&ecirc;n bỏ qua. Tuy nhi&ecirc;n, n&ecirc;n học Scratch ở đ&acirc;u? l&agrave; điều kh&ocirc;ng phải ai cũng biết. Để c&oacute; được h&agrave;nh tr&igrave;nh trải nghiệm th&uacute; vị v&agrave; hiệu quả nhất, h&atilde;y t&igrave;m đến những trung t&acirc;m gi&aacute;o dục uy t&iacute;n như SPEC.</p>\n\n<p>Địa chỉ được đ&ocirc;ng đảo học vi&ecirc;n y&ecirc;u th&iacute;ch</p>\n\n<p>L&agrave; c&aacute;i t&ecirc;n kh&ocirc;ng con xa lạ đối với nhiều học vi&ecirc;n v&agrave; c&aacute;c bậc phụ huynh tr&ecirc;n khắp cả nước. SPEC l&agrave; trường đ&agrave;o tạo c&ocirc;ng nghệ th&ocirc;ng tin n&oacute;i chung, dạy lập tr&igrave;nh Scratch uy t&iacute;n. Với sự nỗ lực kh&ocirc;ng ngừng, SPEC kh&ocirc;ng ngừng cải tiến v&agrave; n&acirc;ng cao chất lượng giảng dạy hướng đến mục ti&ecirc;u:</p>\n\n<p>Gi&aacute;o tr&igrave;nh học lập tr&igrave;nh cho b&eacute; chuy&ecirc;n nghiệp</p>\n\n<p>SPEC tự tin mang đến cho c&aacute;c bạn học vi&ecirc;n gi&aacute;o tr&igrave;nh lập tr&igrave;nh Scratch chuy&ecirc;n nghiệp, đạt ti&ecirc;u chuẩn quốc tế với nội dung cơ bản gồm c&oacute;:</p>\n\n<p>Đội ngũ giảng vi&ecirc;n chuy&ecirc;n nghiệp với phương ph&aacute;p sư phạm hiệu quả</p>\n\n<p>SPEC tự h&agrave;o khi đang c&oacute; nguồn nh&acirc;n lực đ&ocirc;ng đảo v&agrave; chất lượng với những gi&aacute;o vi&ecirc;n được đ&agrave;o tạo b&agrave;i bản v&agrave; nhiều năm kinh nghiệm trong lĩnh vực giảng dạy. Họ lu&ocirc;n l&agrave; những người l&aacute;i đ&ograve; tận t&igrave;nh, t&acirc;m huyết lu&ocirc;n mong muốn truyền thụ tất cả c&aacute;c tri thức qu&yacute; b&aacute;u nhất tới những học vi&ecirc;n th&acirc;n y&ecirc;u</p>\n\n<p>Đặc biệt 100% gi&aacute;o vi&ecirc;n, giảng vi&ecirc;n tại SPEC đều l&agrave; những người c&oacute; kinh nghiệm giảng dạy l&acirc;u năm. Lu&ocirc;n lu&ocirc;n nắm bắt được t&acirc;m l&yacute; học sinh, từ đ&oacute; m&agrave; c&oacute; những b&agrave;i giảng thiết thực, hấp dẫn với mọi đối tượng. Ri&ecirc;ng đối với những kh&oacute;a học lập tr&igrave;nh cho b&eacute; từ 7-12 tuổi, c&aacute;c gi&aacute;o vi&ecirc;n lu&ocirc;n mang đến những kiến thức gần gũi, dễ hiểu nhất. V&agrave; lu&ocirc;n kết hợp với những v&iacute; dụ minh họa th&uacute; vị, ch&iacute;nh v&igrave; thế m&agrave; những giờ học lập tr&igrave;nh Scratch tại SPEC lu&ocirc;n l&agrave; những ph&uacute;t gi&acirc;y th&uacute; vị v&agrave; hấp dẫn.</p>\n\n<p>Cơ sở vật chất hiện đại</p>\n\n<p>Cơ sở vật chất, trang thiết bị giảng dạy lu&ocirc;n l&agrave; yếu tố kh&ocirc;ng nhỏ t&aacute;c động đến chất lượng gi&aacute;o dục. Đến với SPEC c&aacute;c bậc phụ huynh c&oacute; thể ho&agrave;n to&agrave;n y&ecirc;n t&acirc;m bởi trung t&acirc;m lu&ocirc;n tạo cho c&aacute;c bạn học sinh m&ocirc;i trường học tập chuy&ecirc;n nghiệp v&agrave; thoải m&aacute;i nhất. Hệ thống ph&ograve;ng học s&aacute;ng sủa, tho&aacute;ng m&aacute;t. B&ecirc;n cạnh đ&oacute;, c&aacute;c trang thiết bị, t&agrave;i liệu học tập lu&ocirc;n được trang bị đầy đủ, đ&aacute;p ứng tốt nhất nhu cầu sử dụng của người học</p>\n\n<p style=\"text-align:center\"><span aria-label=\" ảnh widget\" contenteditable=\"false\" role=\"region\" tabindex=\"-1\"><img alt=\"\" data-widget=\"image\" height=\"602\" src=\"https://spec.edu.vn/client/image/a28.png\" width=\"500\" /><span style=\"background-color:rgba(220,220,220,0.5)\"><img draggable=\"true\" height=\"15\" role=\"presentation\" src=\"data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==\" title=\"Nhấp chuột và kéo để di chuyển\" width=\"15\" /></span></span></p>\n\n<p style=\"text-align:center\">SPEC mang đến cơ hội học lập tr&igrave;nh cho mọi trẻ em Việt Nam</p>\n\n<p>Chi ph&iacute; ph&ugrave; hợp</p>\n\n<p>SPEC cam kết mang đến cho c&aacute;c bạn nhỏ kh&oacute;a học lập tr&igrave;nh robot chuy&ecirc;n nghiệp với mức gi&aacute; phải chăng. Đặc biệt, trung t&acirc;m cam kết gi&uacute;p b&eacute; sau khi ho&agrave;n th&agrave;nh kh&oacute;a học sẽ nắm vững những kiến thức cơ bản v&agrave; c&oacute; thể thực h&agrave;nh hiệu quả trong thực tiễn.</p>\n\n<p>Lập tr&igrave;nh robot ch&iacute;nh l&agrave; ng&ocirc;n ngữ lập tr&igrave;nh phổ biến trong x&atilde; hội hiện đại. Việc dạy lập tr&igrave;nh cho b&eacute; ngay từ nhỏ sẽ mang đến cho b&eacute; nền tảng vững chắc để c&oacute; thể vững bước trong thế kỷ 21 với tương lai rộng mở v&agrave; cơ hội nghề nghiệp hấp dẫn với thu nhập cao. Để biết th&ecirc;m th&ocirc;ng tin chi tiết v&agrave; đăng k&yacute; c&aacute;c kh&oacute;a học hấp dẫn h&atilde;y li&ecirc;n hệ với SPEC ngay h&ocirc;m nay nh&eacute;.</p>\n\n<ul>\n	<li style=\"list-style-type:initial\">Trẻ c&oacute; thể vừa học vừa chơi với những b&agrave;i giảng hấp dẫn. Mỗi giờ học tập sẽ kh&ocirc;ng hề nh&agrave;m ch&aacute;n v&agrave; kh&ocirc; cứng m&agrave; sẽ cực kỳ cuốn h&uacute;t, tạo kh&ocirc;ng kh&iacute; vui vẻ</li>\n	<li style=\"list-style-type:initial\">Trẻ nhanh ch&oacute;ng nắm bắt được c&aacute;c nguy&ecirc;n tắc cơ bản trong lập tr&igrave;nh Scratch</li>\n	<li style=\"list-style-type:initial\">Phần 1: Giới thiệu chung về Scratch v&agrave; c&aacute;ch c&agrave;i đặt c&ocirc;ng cụ.</li>\n	<li style=\"list-style-type:initial\">Phần 2: L&agrave;m quen với giao diện của lập tr&igrave;nh Scratch.</li>\n	<li style=\"list-style-type:initial\">Phần 3: Lập tr&igrave;nh Scratch cơ bản v&agrave; những điều cần biết</li>\n	<li style=\"list-style-type:initial\">Phần 4: Lập tr&igrave;nh dự &aacute;n Game Scratch n&acirc;ng cao d&agrave;nh cho trẻ</li>\n</ul>\n\n<div>\n<div>\n<h3>&nbsp;</h3>\n\n<h2>LỘ TR&Igrave;NH HỌC TẬP</h2>\n</div>\n\n<div><span aria-label=\" ảnh widget\" contenteditable=\"false\" role=\"region\" tabindex=\"-1\"><img alt=\"\" data-widget=\"image\" src=\"https://spec.edu.vn/client/image/thanh_ngang.svg\" /><span style=\"background-color:rgba(220,220,220,0.5)\"><img draggable=\"true\" height=\"15\" role=\"presentation\" src=\"data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==\" title=\"Nhấp chuột và kéo để di chuyển\" width=\"15\" /></span></span>&nbsp;<span aria-label=\" ảnh widget\" contenteditable=\"false\" role=\"region\" tabindex=\"-1\"><img alt=\"\" data-widget=\"image\" src=\"https://spec.edu.vn/client/image/img_minecraft/lotrinh.JPG\" /><span style=\"background-color:rgba(220,220,220,0.5)\"><img draggable=\"true\" height=\"15\" role=\"presentation\" src=\"data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==\" title=\"Nhấp chuột và kéo để di chuyển\" width=\"15\" /></span></span></div>\n</div>\n</div>\n', '144 giờ (2 học kỳ ~ 24 tháng), 90\' mỗi buổi', '8 học phần từ thấp đến cao', 'java-core, java-tutorial,..', ' 14/7/2021', ' 14/7/2021', 'Khóa học lập trình androidtutorial', 'Lập trình Android Tutorial là gì? Tại sao nên dạy lập trình Scratch cho trẻ ngay hôm nay? Hãy cùng tìm hiểu những thông tin hữu ích ngay sau đây nhé!', 'Lập trình Scratch, Scratch cơ bản, Scratch cho trẻ em, học lập trình Scratch, Scratch, game Scratch', 'index,follow', 20, b'1');
INSERT INTO `course` (`id`, `image`, `student_fees`, `tuition_fee_after_reduction`, `name`, `deleted`, `id_small_category`, `url_view`, `obj_students`, `id_user`, `theme_id`, `promotion`, `sub_content`, `create_date`, `age`, `number_of_student`, `teacher_id`, `main_content`, `duration_of_study`, `section`, `document`, `opening_day`, `study_time`, `meta_title`, `meta_description`, `meta_keyword`, `meta_robot`, `percent_of_promotion`, `classify`) VALUES
(19, 'https://spec.edu.vn/client/image/images_Trang_Chu/picture1.jpg', 2000000, 2000000, 'Khóa học Robot và điện tử tự động', b'1', 1, 'khoa-hoc-robot-va-dien-tu-tu-dong', 'Thiếu nhi', 8, 4, b'1', 'Lắp ráp, điều khiển robot LEGO WeDo 2.0, LEGO Mindstorms, Lập trình với Scratch và Makecode', '2021-06-10', '7-12', 8, 13, '<h1><span style=\"color:#2980b9\"><strong>Lập tr&igrave;nh robot- ng&agrave;nh học hứa hẹn tương lai tươi s&aacute;ng cho b&eacute;</strong></span></h1>\n\n<p>Lập tr&igrave;nh Robot đang l&agrave; m&ocirc;n học v&ocirc; c&ugrave;ng th&uacute; vị, cuốn h&uacute;t tất cả mọi người đặc biệt l&agrave; c&aacute;c bạn nhỏ. Qu&aacute; tr&igrave;nh học mang đến cho c&aacute;c em niềm vui v&agrave; nền tảng tri thức vững chắc cho tương lai</p>\n\n<div>12 th&aacute;ng 03, 2021</div>\n\n<div>\n<h2><strong>Dạy cho trẻ về lập tr&igrave;nh Robot</strong></h2>\n\n<p>Sự tuyệt vời v&agrave; th&uacute; vị từ những con robot đ&atilde; tạo n&ecirc;n sức h&uacute;t mạnh mẽ đối với bộ m&ocirc;n lập tr&igrave;nh robot của rất nhiều người. Đặc biệt c&aacute;c bạn nhỏ ho&agrave;n to&agrave;n c&oacute; thể tiếp cận sớm với m&ocirc;n học n&agrave;y để thỏa m&atilde;n đam m&ecirc; v&agrave; sự s&aacute;ng tạo kh&ocirc;ng ngừng c&ugrave;ng c&aacute;c kh&oacute;a học lập tr&igrave;nh cho b&eacute; chuy&ecirc;n nghiệp.&nbsp;</p>\n\n<h2><strong>Lập tr&igrave;nh robot l&agrave; g&igrave; ? V&agrave; những ứng dụng trong cuộc sống con người?</strong></h2>\n\n<p>Lập tr&igrave;nh Robot l&agrave; ng&agrave;nh khoa học kỹ thuật cao nổi tiếng tại c&aacute;c quốc gia ph&aacute;t triển tr&ecirc;n thế giới như: Nhật Bản, Mỹ, ch&acirc;u &Acirc;u,...Sự ra đời của robot được xem như bước ngoặt trong sự ph&aacute;t triển của nh&acirc;n loại. Bởi c&aacute;c c&ocirc;ng nghệ robot đ&atilde; g&oacute;p phần kh&ocirc;ng nhỏ gi&uacute;p thay thế sức lực con người trong những m&ocirc;i trường l&agrave;m việc nguy hiểm, độc hại. Thậm ch&iacute; trong một số c&ocirc;ng việc m&agrave; con người kh&ocirc;ng thể l&agrave;m được th&igrave; robot l&agrave; c&ocirc;ng cụ hỗ trợ tuyệt vời, được lựa chọn h&agrave;ng đầu. B&ecirc;n cạnh đ&oacute;, robot c&ograve;n gi&uacute;p con người n&acirc;ng cao năng suất lao động, giảm chi ph&iacute; sản xuất,....hiệu quả</p>\n\n<ul>\n</ul>\n\n<p style=\"text-align:center\"><img alt=\"\" height=\"400\" src=\"https://spec.edu.vn/client/image/a20.jpg\" width=\"533\" /></p>\n\n<p style=\"text-align:center\">C&ocirc;ng nghệ robot v&ocirc; c&ugrave;ng ph&aacute;t triển trong cuộc sống hiện đại</p>\n\n<p>Ch&iacute;nh v&igrave; vậy, hiện nay robot được ứng dụng rộng r&atilde;i trong nhiều ng&agrave;nh nghề, lĩnh vực như c&ocirc;ng nghiệp, y tế, gi&aacute;o dục, qu&acirc;n sự,&hellip;Trong đ&oacute; việc chiếm lĩnh c&ocirc;ng nghệ robot được xem l&agrave; mục ti&ecirc;u đối với sự ph&aacute;t triển to&agrave;n diện của mọi quốc gia trong thế kỷ 21. Tại Việt Nam, lĩnh vực n&agrave;y cũng đang được c&aacute;c đặc biệt quan t&acirc;m v&agrave; ph&aacute;t triển trong thời gian gần đ&acirc;y v&agrave; đ&atilde; đạt được nhiều kết quả đ&aacute;ng tự h&agrave;o.</p>\n\n<h2><strong>Học lập tr&igrave;nh robot c&oacute; ph&ugrave; hợp với trẻ em kh&ocirc;ng?</strong></h2>\n\n<p>Nhiều người cho rằng đối với m&ocirc;n khoa học kỹ thuật cao n&agrave;y ph&ugrave; hợp với người trưởng th&agrave;nh hơn. Tuy nhi&ecirc;n, c&aacute;c nh&agrave; khoa học đ&atilde; chứng minh rằng, những đứa trẻ sinh ra trong thời đại c&ocirc;ng nghệ 4.0 c&oacute; tr&iacute; tuệ ph&aacute;t triển v&agrave; sự nhạy b&eacute;n ho&agrave;n to&agrave;n c&oacute; thể tiếp thu những kiến thức khoa học hiện đại n&agrave;y nhanh ch&oacute;ng v&agrave; hiệu quả.</p>\n\n<p>C&aacute;c b&eacute; từ 5-6 tuổi ho&agrave;n to&agrave;n c&oacute; thể bắt đầu trải nghiệm v&agrave; tiếp cận với bộ m&ocirc;n n&agrave;y. Đặc biệt độ tuổi từ 7-12 được xem l&agrave; giai đoạn v&agrave;ng, khi đ&oacute; tr&iacute; tuệ v&agrave; nhận thức của b&eacute; ph&aacute;t triển kh&aacute; đầy đủ. B&ecirc;n cạnh đ&oacute; với ham học học, kh&aacute;m ph&aacute; của b&eacute; sẽ gi&uacute;p qu&aacute; tr&igrave;nh đ&agrave;o tạo trở n&ecirc;n hiệu quả hơn rất nhiều.</p>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"281\" src=\"https://spec.edu.vn/uploadfileimage/spec/khoahoc/103012700bb.jpg\" width=\"500\" /></p>\n\n<p style=\"text-align:center\">Lập tr&igrave;nh robot l&agrave; m&ocirc;n học hấp dẫn với trẻ em</p>\n\n<ul>\n</ul>\n\n<p><strong>Những lợi &iacute;ch khi dạy lập tr&igrave;nh cho trẻ ngay h&ocirc;m nay</strong></p>\n\n<p>Sự ra đời của robot đ&atilde; đ&aacute;nh dấu bước ngoặt lớn đối với lo&agrave;i người, khi ước mơ từ ng&agrave;n đời về những cỗ m&aacute;y c&oacute; thể thay thế sức lực của con người đ&atilde; ra đời. Lập tr&igrave;nh robot đ&atilde; mang đến những th&agrave;nh tựu nổi bật để ph&aacute;t triển khoa học, kỹ thuật, kinh tế,....</p>\n\n<p>Nhận thấy được sự quan trọng của bộ m&ocirc;n n&agrave;y, hiện nay tại nhiều quốc gia tr&ecirc;n thế giới đ&atilde; đưa chương tr&igrave;nh học lập tr&igrave;nh robot cho trẻ v&agrave;o giảng dạy tại c&aacute;c nh&agrave; trường. Qua đ&oacute; để trẻ em c&oacute; thể tiếp cận với kiến thức lập tr&igrave;nh ngay từ nhỏ, bồi đắp niềm đam m&ecirc; cho c&aacute;c b&eacute;. Đồng thời mang đến nhiều lợi &iacute;ch tuyệt vời cho sự ph&aacute;t triển to&agrave;n diện của trẻ</p>\n\n<p><strong>K&iacute;ch th&iacute;ch sự s&aacute;ng tạo của trẻ</strong></p>\n\n<p>Tr&iacute; tưởng tượng v&agrave; s&aacute;ng tạo của b&eacute; l&agrave; điều kh&ocirc;ng giới hạn. Khi b&eacute; được tiếp cận sớm với lập tr&igrave;nh sẽ gi&uacute;p cho năng lực đ&oacute; được ph&aacute;t huy tối đa, mang đến những ứng dụng mới mẻ v&agrave; độc đ&aacute;o.</p>\n\n<p style=\"text-align:center\"><img alt=\"\" height=\"683\" src=\"https://spec.edu.vn/uploadfileimage/spec/khoahoc/268590000cc.jpg\" width=\"1024\" /></p>\n\n<p style=\"text-align:center\">Học lập tr&igrave;nh robot ngay từ nhỏ gi&uacute;p trẻ ph&aacute;t triển to&agrave;n diện</p>\n\n<p><strong>R&egrave;n luyện khả năng l&agrave;m việc, giải quyết vấn đề linh hoạt</strong></p>\n\n<p>Khi bắt tay v&agrave;o nghi&ecirc;n cứu v&agrave; thực h&agrave;nh về lập tr&igrave;nh y&ecirc;u cầu đặt ra đối với trẻ lu&ocirc;n phải chủ động, s&aacute;ng tạo để c&oacute; giải ph&aacute;p ph&ugrave; hợp trong giải quyết mọi vấn đề ph&aacute;t sinh. Từ đ&oacute;, gi&uacute;p b&eacute; trưởng th&agrave;nh, nhạy b&eacute;n hơn trong học tập cũng như cuộc sống</p>\n\n<p><strong>Ph&aacute;t triển tr&iacute; tuệ ho&agrave;n hảo</strong></p>\n\n<p>Khi b&eacute; được tiếp cận sớm với m&ocirc;n khoa học kỹ thuật cao như lập tr&igrave;nh ngay từ nhỏ th&igrave; sẽ k&iacute;ch th&iacute;ch sự ph&aacute;t triển to&agrave;n diện về tư duy hiệu quả v&agrave; nhanh ch&oacute;ng. Từ đ&oacute; hỗ trợ tối đa cho việc học tập v&agrave; giải quyết b&agrave;i tập tr&ecirc;n lớp của trẻ. Đồng thời chuẩn bị h&agrave;nh trang vững chắc trong tương lai</p>\n\n<p><strong>Ph&aacute;t triển kỹ năng mềm</strong></p>\n\n<p>Thực tế, việc học lập tr&igrave;nh n&oacute;i chung, v&agrave; học lập tr&igrave;nh robot n&oacute;i ri&ecirc;ng thực sự kh&ocirc;ng chỉ mang lại tri thức cho trẻ. B&ecirc;n cạnh đ&oacute;, c&ograve;n r&egrave;n luyện những kỹ năng mềm cần thiết cho cuộc sống như: khả năng thuyết tr&igrave;nh, khả năng l&agrave;m việc nh&oacute;m,.... Ch&iacute;nh v&igrave; những lợi &iacute;ch tuyệt vời tr&ecirc;n, kh&ocirc;ng c&oacute; l&yacute; do g&igrave; m&agrave; c&aacute;c bậc phụ huynh kh&ocirc;ng cho trẻ tiếp cận sớm với bộ m&ocirc;n khoa học tuyệt vời n&agrave;y ngay từ h&ocirc;m nay</p>\n\n<ul>\n</ul>\n\n<h2><strong>Những cơ hội ph&aacute;t triển của trẻ với lập tr&igrave;nh robot</strong></h2>\n\n<p>Cũng giống như c&aacute;c ng&ocirc;n ngữ th&ocirc;ng dụng tr&ecirc;n thế giới, lập tr&igrave;nh robot hứa hẹn l&agrave; ng&ocirc;n ngữ phổ biến tr&ecirc;n thế giới trong thời gian tới. Bởi thực tế ng&agrave;y nay c&ocirc;ng nghệ robot đang được xem l&agrave; ti&ecirc;u chuẩn đ&aacute;nh gi&aacute; sự ph&aacute;t triển của một quốc gia. Mọi quốc gia ph&aacute;t triển nhất thế giới như: Nhật bản, Singapore, Mỹ,...đều sở hữu c&ocirc;ng nghệ robot bậc cao. V&agrave; tại Việt Nam ng&agrave;nh khoa học n&agrave;y cũng đang l&agrave; một trong những lĩnh vực rất được quan t&acirc;m v&agrave; đầu tư.</p>\n\n<p>Ch&iacute;nh v&igrave; tất cả những l&yacute; do tr&ecirc;n m&agrave; việc trang bị những kiến thức về lập tr&igrave;nh robot cho b&eacute; ngay từ khi c&ograve;n nhỏ (đặc biệt trong giai đoạn từ 7-12 tuổi) được xem l&agrave; điều v&ocirc; c&ugrave;ng quan trọng. Với nền tảng kiến thức vững chắc đ&oacute;, c&ugrave;ng niềm đam m&ecirc; với khoa học chắc chắn sẽ gi&uacute;p c&aacute;c b&eacute; c&oacute; động lực để học tập v&agrave; l&agrave;m việc trong lĩnh vực c&ocirc;ng nghệ th&ocirc;ng tin, khoa học kỹ thuật cao trong tương lai. Đồng thời cơ hội l&agrave;m việc kh&ocirc;ng chỉ tại Việt Nam m&agrave; c&ograve;n mở rộng ra nhiều quốc gia ph&aacute;t triển kh&aacute;c tr&ecirc;n khắp thế giới. Hứa hẹn một tương lai rộng mở cho b&eacute;.</p>\n\n<ul>\n</ul>\n\n<h2><strong>Địa chỉ dạy lập tr&igrave;nh cho b&eacute; uy t&iacute;n tại Việt Nam</strong></h2>\n\n<p>Học lập tr&igrave;nh web ở đ&acirc;u tốt nhất l&agrave; c&acirc;u hỏi kh&ocirc;ng hề đơn giản. Bởi hiện nay, c&aacute;c trung t&acirc;m, trường dạy về lĩnh vực n&agrave;y đang ph&aacute;t triển nhanh ch&oacute;ng, đem đến nhiều lựa chọn cho phụ huynh v&agrave; c&aacute;c em học sinh. Tuy nhi&ecirc;n, để gi&uacute;p b&eacute; c&oacute; thể tiếp cận được với những kiến thức về lập tr&igrave;nh Web b&agrave;i bản nhất, cha mẹ n&ecirc;n lựa chọn cho con em m&igrave;nh những địa chỉ uy t&iacute;n, được đ&ocirc;ng đảo c&aacute;c bạn học vi&ecirc;n y&ecirc;u th&iacute;ch v&agrave; đ&aacute;nh gi&aacute; cao. V&agrave; SPEC l&agrave; một trong những c&aacute;i t&ecirc;n quen thuộc m&agrave; c&aacute;c bạn kh&ocirc;ng n&ecirc;n bỏ qua</p>\n\n<p><strong>Uy t&iacute;n đ&atilde; được khẳng định</strong></p>\n\n<p>Với nhiều năm kinh nghiệm trong lĩnh vực gi&aacute;o dục, SPEC tự h&agrave;o l&agrave; địa chỉ đ&agrave;o tạo c&ocirc;ng nghệ lập tr&igrave;nh h&agrave;ng đầu Việt Nam hiện nay. Mỗi năm trung t&acirc;m gi&uacute;p cho h&agrave;ng ng&agrave;n trẻ em tr&ecirc;n khắp cả nước được tiếp cận với bộ m&ocirc;n khoa học kỹ thuật cao hấp dẫn n&agrave;y.</p>\n\n<p style=\"text-align:center\"><img alt=\"\" height=\"567\" src=\"https://spec.edu.vn/client/image/a23.jpg\" width=\"850\" /></p>\n\n<p style=\"text-align:center\">SPEC tự h&agrave;o l&agrave; địa chỉ ươm mầm c&aacute;c t&agrave;i năng c&ocirc;ng nghệ robot trong tương lai</p>\n\n<p><strong>Đội ngũ giảng vi&ecirc;n uy t&iacute;n.</strong></p>\n\n<p>Giảng vi&ecirc;n tại trung t&acirc;m đều l&agrave; những người được đ&agrave;o tạo b&agrave;i bản, c&oacute; kinh nghiệm l&acirc;u năm trong nghề. V&igrave; vậy m&agrave; lu&ocirc;n mang đến cho c&aacute;c bạn học vi&ecirc;n những b&agrave;i học, kiến thức hữu &iacute;ch nhất về lập tr&igrave;nh robot. Với phương ph&aacute;p giảng dạy sư phạm, ph&ugrave; hợp với từng đối tượng học vi&ecirc;n chắc chắn rằng mỗi giờ học tập tại SPEC lu&ocirc;n gi&uacute;p c&aacute;c b&eacute; cảm thấy vui vẻ v&agrave; h&agrave;o hứng.</p>\n\n<p><strong>Hệ thống cơ sở vật chất phục vụ giảng dạy hiện đại</strong></p>\n\n<p>Đ&aacute;p ứng nhu cầu của học vi&ecirc;n khi tham gia học tập bộ m&ocirc;n khoa học kỹ thuật cao như lập tr&igrave;nh robot, SPEC đầu tư hệ thống trang thiết bị, cơ sở vật chất hiện đại. Học vi&ecirc;n được học trong m&ocirc;i trường v&ocirc; c&ugrave;ng chuy&ecirc;n nghiệp, từ đ&oacute; gi&uacute;p b&eacute; nắm bắt v&agrave; tiếp cận kiến thức nhanh ch&oacute;ng v&agrave; hiệu quả hơn.</p>\n\n<p><strong>Chi ph&iacute; ph&ugrave; hợp</strong></p>\n\n<p>SPEC cam kết mang đến cho c&aacute;c bạn nhỏ kh&oacute;a học lập tr&igrave;nh robot chuy&ecirc;n nghiệp với mức gi&aacute; phải chăng. Đặc biệt, trung t&acirc;m cam kết gi&uacute;p b&eacute; sau khi ho&agrave;n th&agrave;nh kh&oacute;a học sẽ nắm vững những kiến thức cơ bản v&agrave; c&oacute; thể thực h&agrave;nh hiệu quả trong thực tiễn.</p>\n\n<p>Lập tr&igrave;nh robot ch&iacute;nh l&agrave; ng&ocirc;n ngữ lập tr&igrave;nh phổ biến trong x&atilde; hội hiện đại. Việc dạy lập tr&igrave;nh cho b&eacute; ngay từ nhỏ sẽ mang đến cho b&eacute; nền tảng vững chắc để c&oacute; thể vững bước trong thế kỷ 21 với tương lai rộng mở v&agrave; cơ hội nghề nghiệp hấp dẫn với thu nhập cao. Để biết th&ecirc;m th&ocirc;ng tin chi tiết v&agrave; đăng k&yacute; c&aacute;c kh&oacute;a học hấp dẫn h&atilde;y li&ecirc;n hệ với SPEC ngay h&ocirc;m nay nh&eacute;.</p>\n\n<h2 style=\"text-align:left\"><strong><span style=\"color:#003163\">LỘ TR&Igrave;NH KH&Oacute;A HỌC</span></strong></h2>\n\n<h2 style=\"text-align:center\"><img alt=\"\" height=\"772\" src=\"data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iOTc0IiBoZWlnaHQ9Ijc2NCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgb3ZlcmZsb3c9ImhpZGRlbiI+PGRlZnM+PGNsaXBQYXRoIGlkPSJjbGlwMCI+PHJlY3QgeD0iMTg2IiB5PSI4OSIgd2lkdGg9Ijk3NCIgaGVpZ2h0PSI3NjQiLz48L2NsaXBQYXRoPjwvZGVmcz48ZyBjbGlwLXBhdGg9InVybCgjY2xpcDApIiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgtMTg2IC04OSkiPjxwYXRoIGQ9Ik0xOTcuNSAxMTdDMTk3LjUgMTAyLjkxNyAyMDguOTE3IDkxLjUwMDEgMjIzIDkxLjUwMDEgMjM3LjA4MyA5MS41MDAxIDI0OC41IDEwMi45MTcgMjQ4LjUgMTE3IDI0OC41IDEzMS4wODMgMjM3LjA4MyAxNDIuNSAyMjMgMTQyLjUgMjA4LjkxNyAxNDIuNSAxOTcuNSAxMzEuMDgzIDE5Ny41IDExN1oiIHN0cm9rZT0iI0YxOTAzMSIgc3Ryb2tlLXdpZHRoPSIxLjMzMzMzIiBzdHJva2UtbWl0ZXJsaW1pdD0iOCIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIi8+PHBhdGggZD0iTTI4Ny41IDk5LjgzMzRDMjg3LjUgOTUuMjMxIDI5MS4yMzEgOTEuNTAwMSAyOTUuODMzIDkxLjUwMDFMMTE0NS4xNyA5MS41MDAxQzExNDkuNzcgOTEuNTAwMSAxMTUzLjUgOTUuMjMxIDExNTMuNSA5OS44MzM0TDExNTMuNSAxMzMuMTY3QzExNTMuNSAxMzcuNzY5IDExNDkuNzcgMTQxLjUgMTE0NS4xNyAxNDEuNUwyOTUuODMzIDE0MS41QzI5MS4yMzEgMTQxLjUgMjg3LjUgMTM3Ljc2OSAyODcuNSAxMzMuMTY3WiIgc3Ryb2tlPSIjRjE5MDMxIiBzdHJva2Utd2lkdGg9IjEuMzMzMzMiIHN0cm9rZS1taXRlcmxpbWl0PSI4IiBmaWxsPSIjRkZGRkZGIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48dGV4dCBmb250LWZhbWlseT0iQXJpYWwsQXJpYWxfTVNGb250U2VydmljZSxzYW5zLXNlcmlmIiBmb250LXdlaWdodD0iNzAwIiBmb250LXNpemU9IjE5IiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgzMDUuNDQ0IDEyMykiPkjhu41jIHBo4bqnbiAxIC08dHNwYW4gZm9udC1zaXplPSIxOSIgeD0iMTE2LjY2NyIgeT0iMCI+TOG6rlAgUsOBUCBWw4AgTOG6rFAgVFLDjE5IIFJPQk9UIEPGoCBC4bqiTiBW4buaSSBMRUdPIFdFRE88L3RzcGFuPjx0c3BhbiBmb250LWZhbWlseT0iU2Fuc1NlcmlmLFNhbnNTZXJpZl9NU0ZvbnRTZXJ2aWNlLHNhbnMtc2VyaWYiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMzAiIHg9Ii05MC42OTE1IiB5PSI2Ij4xPC90c3Bhbj48dHNwYW4gZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjIwIiB4PSI3MDMuODQ3IiB5PSIwIj4xMiA8L3RzcGFuPjx0c3BhbiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMjAiIHg9IjczMS4wMTQiIHk9IjAiPmLDoGk8L3RzcGFuPjx0c3BhbiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMjAiIHg9Ijc2Mi41MTQiIHk9IjAiPi08L3RzcGFuPjx0c3BhbiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMjAiIHg9Ijc3NC41MTQiIHk9IjAiPjE4IDwvdHNwYW4+PHRzcGFuIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zaXplPSIyMCIgeD0iODAxLjY4IiB5PSIwIj5naeG7nTwvdHNwYW4+PC90ZXh0PjxwYXRoIGQ9Ik0xOTcuNSAxODBDMTk3LjUgMTY1LjkxNyAyMDguOTE3IDE1NC41IDIyMyAxNTQuNSAyMzcuMDgzIDE1NC41IDI0OC41IDE2NS45MTcgMjQ4LjUgMTgwIDI0OC41IDE5NC4wODMgMjM3LjA4MyAyMDUuNSAyMjMgMjA1LjUgMjA4LjkxNyAyMDUuNSAxOTcuNSAxOTQuMDgzIDE5Ny41IDE4MFoiIHN0cm9rZT0iI0YxOTAzMSIgc3Ryb2tlLXdpZHRoPSIxLjMzMzMzIiBzdHJva2UtbWl0ZXJsaW1pdD0iOCIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIi8+PHBhdGggZD0iTTI4Ny41IDE2Mi44MzNDMjg3LjUgMTU4LjIzMSAyOTEuMjMxIDE1NC41IDI5NS44MzMgMTU0LjVMMTE0NS4xNyAxNTQuNUMxMTQ5Ljc3IDE1NC41IDExNTMuNSAxNTguMjMxIDExNTMuNSAxNjIuODMzTDExNTMuNSAxOTYuMTY3QzExNTMuNSAyMDAuNzY5IDExNDkuNzcgMjA0LjUgMTE0NS4xNyAyMDQuNUwyOTUuODMzIDIwNC41QzI5MS4yMzEgMjA0LjUgMjg3LjUgMjAwLjc2OSAyODcuNSAxOTYuMTY3WiIgc3Ryb2tlPSIjRjE5MDMxIiBzdHJva2Utd2lkdGg9IjEuMzMzMzMiIHN0cm9rZS1taXRlcmxpbWl0PSI4IiBmaWxsPSIjRkZGRkZGIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48dGV4dCBmb250LWZhbWlseT0iQXJpYWwsQXJpYWxfTVNGb250U2VydmljZSxzYW5zLXNlcmlmIiBmb250LXdlaWdodD0iNzAwIiBmb250LXNpemU9IjE5IiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgzMDUuNDQ0IDE4MSkiPkjhu41jIHBo4bqnbiAyIC08dHNwYW4gZm9udC1zaXplPSIxOSIgeD0iMTE2LjY2NyIgeT0iMCI+TOG6rlAgUsOBUCBWw4AgTOG6rFAgVFLDjE5IIFJPQk9UIEPGoCBC4bqiTiBW4buaSSBMRUdPIFdFRE88L3RzcGFuPjx0c3BhbiBmb250LWZhbWlseT0iU2Fuc1NlcmlmLFNhbnNTZXJpZl9NU0ZvbnRTZXJ2aWNlLHNhbnMtc2VyaWYiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMzAiIHg9Ii05MC42OTE1IiB5PSIxMSI+MjwvdHNwYW4+PHRzcGFuIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zaXplPSIyMCIgeD0iNzAzLjg0NyIgeT0iMyI+MTIgPC90c3Bhbj48dHNwYW4gZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjIwIiB4PSI3MzEuMDE0IiB5PSIzIj5iw6BpPC90c3Bhbj48dHNwYW4gZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjIwIiB4PSI3NjIuNTE0IiB5PSIzIj4tPC90c3Bhbj48dHNwYW4gZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjIwIiB4PSI3NzQuNTE0IiB5PSIzIj4xOCA8L3RzcGFuPjx0c3BhbiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMjAiIHg9IjgwMS42OCIgeT0iMyI+Z2nhu508L3RzcGFuPjwvdGV4dD48cGF0aCBkPSJNMjIyIDE0MiAyMjIgMTU0LjYiIHN0cm9rZT0iI0YxOTAzMSIgc3Ryb2tlLXdpZHRoPSIyIiBzdHJva2UtbWl0ZXJsaW1pdD0iOCIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIi8+PHBhdGggZD0iTTE5Ny41IDI0My41QzE5Ny41IDIyOS42OTMgMjA4LjkxNyAyMTguNSAyMjMgMjE4LjUgMjM3LjA4MyAyMTguNSAyNDguNSAyMjkuNjkzIDI0OC41IDI0My41IDI0OC41IDI1Ny4zMDcgMjM3LjA4MyAyNjguNSAyMjMgMjY4LjUgMjA4LjkxNyAyNjguNSAxOTcuNSAyNTcuMzA3IDE5Ny41IDI0My41WiIgc3Ryb2tlPSIjRjE5MDMxIiBzdHJva2Utd2lkdGg9IjEuMzMzMzMiIHN0cm9rZS1taXRlcmxpbWl0PSI4IiBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48cGF0aCBkPSJNMjg3LjUgMjI2QzI4Ny41IDIyMS4zMDYgMjkxLjMwNiAyMTcuNSAyOTYgMjE3LjVMMTE0NSAyMTcuNUMxMTQ5LjY5IDIxNy41IDExNTMuNSAyMjEuMzA2IDExNTMuNSAyMjZMMTE1My41IDI2MEMxMTUzLjUgMjY0LjY5NCAxMTQ5LjY5IDI2OC41IDExNDUgMjY4LjVMMjk2IDI2OC41QzI5MS4zMDYgMjY4LjUgMjg3LjUgMjY0LjY5NCAyODcuNSAyNjBaIiBzdHJva2U9IiNGMTkwMzEiIHN0cm9rZS13aWR0aD0iMS4zMzMzMyIgc3Ryb2tlLW1pdGVybGltaXQ9IjgiIGZpbGw9IiNGRkZGRkYiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjx0ZXh0IGZvbnQtZmFtaWx5PSJBcmlhbCxBcmlhbF9NU0ZvbnRTZXJ2aWNlLHNhbnMtc2VyaWYiIGZvbnQtd2VpZ2h0PSI3MDAiIGZvbnQtc2l6ZT0iMTkiIHRyYW5zZm9ybT0idHJhbnNsYXRlKDMwNS40NDQgMjQ1KSI+SOG7jWMgcGjhuqduIDMgLTx0c3BhbiBmb250LXNpemU9IjE5IiB4PSIxMTYuNjY3IiB5PSIwIj5M4bquUCBSw4FQIFbDgCBM4bqsUCBUUsOMTkggUk9CT1QgQ8agIELhuqJOIFbhu5pJIExFR08gV0VETzwvdHNwYW4+PHRzcGFuIGZvbnQtZmFtaWx5PSJTYW5zU2VyaWYsU2Fuc1NlcmlmX01TRm9udFNlcnZpY2Usc2Fucy1zZXJpZiIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zaXplPSIzMCIgeD0iLTkwLjY5MTUiIHk9IjExIj4zPC90c3Bhbj48dHNwYW4gZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjIwIiB4PSI3MDMuODQ3IiB5PSIzIj4xMiA8L3RzcGFuPjx0c3BhbiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMjAiIHg9IjczMS4wMTQiIHk9IjMiPmLDoGk8L3RzcGFuPjx0c3BhbiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMjAiIHg9Ijc2Mi41MTQiIHk9IjMiPi08L3RzcGFuPjx0c3BhbiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMjAiIHg9Ijc3NC41MTQiIHk9IjMiPjE4IDwvdHNwYW4+PHRzcGFuIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zaXplPSIyMCIgeD0iODAxLjY4IiB5PSIzIj5naeG7nTwvdHNwYW4+PC90ZXh0PjxwYXRoIGQ9Ik0yMjIgMjA1IDIyMiAyMTcuNiIgc3Ryb2tlPSIjRjE5MDMxIiBzdHJva2Utd2lkdGg9IjIiIHN0cm9rZS1taXRlcmxpbWl0PSI4IiBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48cGF0aCBkPSJNMTk3LjUgMzA3QzE5Ny41IDI5Mi45MTcgMjA4LjkxNyAyODEuNSAyMjMgMjgxLjUgMjM3LjA4MyAyODEuNSAyNDguNSAyOTIuOTE3IDI0OC41IDMwNyAyNDguNSAzMjEuMDgzIDIzNy4wODMgMzMyLjUgMjIzIDMzMi41IDIwOC45MTcgMzMyLjUgMTk3LjUgMzIxLjA4MyAxOTcuNSAzMDdaIiBzdHJva2U9IiNGMTkwMzEiIHN0cm9rZS13aWR0aD0iMS4zMzMzMyIgc3Ryb2tlLW1pdGVybGltaXQ9IjgiIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjxwYXRoIGQ9Ik0yODcuNSAyODkuODMzQzI4Ny41IDI4NS4yMzEgMjkxLjIzMSAyODEuNSAyOTUuODMzIDI4MS41TDExNDUuMTcgMjgxLjVDMTE0OS43NyAyODEuNSAxMTUzLjUgMjg1LjIzMSAxMTUzLjUgMjg5LjgzM0wxMTUzLjUgMzIzLjE2N0MxMTUzLjUgMzI3Ljc2OSAxMTQ5Ljc3IDMzMS41IDExNDUuMTcgMzMxLjVMMjk1LjgzMyAzMzEuNUMyOTEuMjMxIDMzMS41IDI4Ny41IDMyNy43NjkgMjg3LjUgMzIzLjE2N1oiIHN0cm9rZT0iI0YxOTAzMSIgc3Ryb2tlLXdpZHRoPSIxLjMzMzMzIiBzdHJva2UtbWl0ZXJsaW1pdD0iOCIgZmlsbD0iI0ZGRkZGRiIgZmlsbC1ydWxlPSJldmVub2RkIi8+PHRleHQgZm9udC1mYW1pbHk9IkFyaWFsLEFyaWFsX01TRm9udFNlcnZpY2Usc2Fucy1zZXJpZiIgZm9udC13ZWlnaHQ9IjcwMCIgZm9udC1zaXplPSIxOSIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMzA1LjQ0NCAzMDgpIj5I4buNYyBwaOG6p24gNCAtPHRzcGFuIGZvbnQtc2l6ZT0iMTkiIHg9IjExNi42NjciIHk9IjAiPkzhuq5QIFLDgVAgVsOAIEzhuqxQIFRSw4xOSCBST0JPVCBDxqAgQuG6ok4gVuG7mkkgTEVHTyBXRURPPC90c3Bhbj48dHNwYW4gZm9udC1mYW1pbHk9IlNhbnNTZXJpZixTYW5zU2VyaWZfTVNGb250U2VydmljZSxzYW5zLXNlcmlmIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjMwIiB4PSItOTAuNjkxNSIgeT0iMTEiPjQ8L3RzcGFuPjx0c3BhbiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMjAiIHg9IjcwMy44NDciIHk9IjMiPjEyIDwvdHNwYW4+PHRzcGFuIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zaXplPSIyMCIgeD0iNzMxLjAxNCIgeT0iMyI+YsOgaTwvdHNwYW4+PHRzcGFuIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zaXplPSIyMCIgeD0iNzYyLjUxNCIgeT0iMyI+LTwvdHNwYW4+PHRzcGFuIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zaXplPSIyMCIgeD0iNzc0LjUxNCIgeT0iMyI+MTggPC90c3Bhbj48dHNwYW4gZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjIwIiB4PSI4MDEuNjgiIHk9IjMiPmdp4budPC90c3Bhbj48L3RleHQ+PHBhdGggZD0iTTIyMiAyNjggMjIyIDI4MC42IiBzdHJva2U9IiNGMTkwMzEiIHN0cm9rZS13aWR0aD0iMiIgc3Ryb2tlLW1pdGVybGltaXQ9IjgiIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjxwYXRoIGQ9Ik0xOTcuNSAzNzAuNUMxOTcuNSAzNTYuNjkzIDIwOC45MTcgMzQ1LjUgMjIzIDM0NS41IDIzNy4wODMgMzQ1LjUgMjQ4LjUgMzU2LjY5MyAyNDguNSAzNzAuNSAyNDguNSAzODQuMzA3IDIzNy4wODMgMzk1LjUgMjIzIDM5NS41IDIwOC45MTcgMzk1LjUgMTk3LjUgMzg0LjMwNyAxOTcuNSAzNzAuNVoiIHN0cm9rZT0iI0YxOTAzMSIgc3Ryb2tlLXdpZHRoPSIxLjMzMzMzIiBzdHJva2UtbWl0ZXJsaW1pdD0iOCIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIi8+PHBhdGggZD0iTTI4Ny41IDM1M0MyODcuNSAzNDguMzA2IDI5MS4zMDYgMzQ0LjUgMjk2IDM0NC41TDExNDUgMzQ0LjVDMTE0OS42OSAzNDQuNSAxMTUzLjUgMzQ4LjMwNiAxMTUzLjUgMzUzTDExNTMuNSAzODdDMTE1My41IDM5MS42OTQgMTE0OS42OSAzOTUuNSAxMTQ1IDM5NS41TDI5NiAzOTUuNUMyOTEuMzA2IDM5NS41IDI4Ny41IDM5MS42OTQgMjg3LjUgMzg3WiIgc3Ryb2tlPSIjRjE5MDMxIiBzdHJva2Utd2lkdGg9IjEuMzMzMzMiIHN0cm9rZS1taXRlcmxpbWl0PSI4IiBmaWxsPSIjRkZGRkZGIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48dGV4dCBmb250LWZhbWlseT0iQXJpYWwsQXJpYWxfTVNGb250U2VydmljZSxzYW5zLXNlcmlmIiBmb250LXdlaWdodD0iNzAwIiBmb250LXNpemU9IjE5IiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgzMDUuNDQ0IDM3MikiPkjhu41jPHRzcGFuIGZvbnQtc2l6ZT0iMTkiIHg9IjQwLjMzMzMiIHk9IjAiPnBo4bqnbjwvdHNwYW4+PHRzcGFuIGZvbnQtc2l6ZT0iMTkiIHg9Ijg5LjgzMzMiIHk9IjAiPjUgPC90c3Bhbj4tPHRzcGFuIGZvbnQtc2l6ZT0iMTkiIHg9IjExNi42NjciIHk9IjAiPlPDgU5HIENI4bq+IFbhu5pJIExFR08gV0VETywgU0NSQVRDSDwvdHNwYW4+PHRzcGFuIGZvbnQtZmFtaWx5PSJTYW5zU2VyaWYsU2Fuc1NlcmlmX01TRm9udFNlcnZpY2Usc2Fucy1zZXJpZiIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zaXplPSIzMCIgeD0iLTkwLjY5MTUiIHk9IjExIj41PC90c3Bhbj48dHNwYW4gZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjIwIiB4PSI3MDMuODQ3IiB5PSIzIj4xMiA8L3RzcGFuPjx0c3BhbiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMjAiIHg9IjczMS4wMTQiIHk9IjMiPmLDoGk8L3RzcGFuPjx0c3BhbiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMjAiIHg9Ijc2Mi41MTQiIHk9IjMiPi08L3RzcGFuPjx0c3BhbiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMjAiIHg9Ijc3NC41MTQiIHk9IjMiPjE4IDwvdHNwYW4+PHRzcGFuIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zaXplPSIyMCIgeD0iODAxLjY4IiB5PSIzIj5naeG7nTwvdHNwYW4+PC90ZXh0PjxwYXRoIGQ9Ik0yMjIgMzMyIDIyMiAzNDQuNiIgc3Ryb2tlPSIjRjE5MDMxIiBzdHJva2Utd2lkdGg9IjIiIHN0cm9rZS1taXRlcmxpbWl0PSI4IiBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48cGF0aCBkPSJNMTk3LjUgNDM0LjVDMTk3LjUgNDIwLjY5MyAyMDguOTE3IDQwOS41IDIyMyA0MDkuNSAyMzcuMDgzIDQwOS41IDI0OC41IDQyMC42OTMgMjQ4LjUgNDM0LjUgMjQ4LjUgNDQ4LjMwNyAyMzcuMDgzIDQ1OS41IDIyMyA0NTkuNSAyMDguOTE3IDQ1OS41IDE5Ny41IDQ0OC4zMDcgMTk3LjUgNDM0LjVaIiBzdHJva2U9IiNGMTkwMzEiIHN0cm9rZS13aWR0aD0iMS4zMzMzMyIgc3Ryb2tlLW1pdGVybGltaXQ9IjgiIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjxwYXRoIGQ9Ik0yODcuNSA0MTdDMjg3LjUgNDEyLjMwNiAyOTEuMzA2IDQwOC41IDI5NiA0MDguNUwxMTQ1IDQwOC41QzExNDkuNjkgNDA4LjUgMTE1My41IDQxMi4zMDYgMTE1My41IDQxN0wxMTUzLjUgNDUxQzExNTMuNSA0NTUuNjk0IDExNDkuNjkgNDU5LjUgMTE0NSA0NTkuNUwyOTYgNDU5LjVDMjkxLjMwNiA0NTkuNSAyODcuNSA0NTUuNjk0IDI4Ny41IDQ1MVoiIHN0cm9rZT0iI0YxOTAzMSIgc3Ryb2tlLXdpZHRoPSIxLjMzMzMzIiBzdHJva2UtbWl0ZXJsaW1pdD0iOCIgZmlsbD0iI0ZGRkZGRiIgZmlsbC1ydWxlPSJldmVub2RkIi8+PHRleHQgZm9udC1mYW1pbHk9IkFyaWFsLEFyaWFsX01TRm9udFNlcnZpY2Usc2Fucy1zZXJpZiIgZm9udC13ZWlnaHQ9IjcwMCIgZm9udC1zaXplPSIxOSIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMzA1LjQ0NCA0MzYpIj5I4buNYzx0c3BhbiBmb250LXNpemU9IjE5IiB4PSI0MC4zMzMzIiB5PSIwIj5waOG6p248L3RzcGFuPjx0c3BhbiBmb250LXNpemU9IjE5IiB4PSI4OS44MzMzIiB5PSIwIj42IDwvdHNwYW4+LTx0c3BhbiBmb250LXNpemU9IjE5IiB4PSIxMTYuNjY3IiB5PSIwIj5Tw4FORyBDSOG6viBW4buaSSBMRUdPIFdFRE8sIFNDUkFUQ0g8L3RzcGFuPjx0c3BhbiBmb250LWZhbWlseT0iU2Fuc1NlcmlmLFNhbnNTZXJpZl9NU0ZvbnRTZXJ2aWNlLHNhbnMtc2VyaWYiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMzAiIHg9Ii05MC42OTE1IiB5PSIxMSI+NjwvdHNwYW4+PHRzcGFuIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zaXplPSIyMCIgeD0iNzAzLjg0NyIgeT0iMyI+MTIgPC90c3Bhbj48dHNwYW4gZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjIwIiB4PSI3MzEuMDE0IiB5PSIzIj5iw6BpPC90c3Bhbj48dHNwYW4gZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjIwIiB4PSI3NjIuNTE0IiB5PSIzIj4tPC90c3Bhbj48dHNwYW4gZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjIwIiB4PSI3NzQuNTE0IiB5PSIzIj4xOCA8L3RzcGFuPjx0c3BhbiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMjAiIHg9IjgwMS42OCIgeT0iMyI+Z2nhu508L3RzcGFuPjwvdGV4dD48cGF0aCBkPSJNMjIyIDM5NiAyMjIgNDA4LjYiIHN0cm9rZT0iI0YxOTAzMSIgc3Ryb2tlLXdpZHRoPSIyIiBzdHJva2UtbWl0ZXJsaW1pdD0iOCIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIi8+PHBhdGggZD0iTTE5Ny41IDQ5OEMxOTcuNSA0ODMuOTE3IDIwOC45MTcgNDcyLjUgMjIzIDQ3Mi41IDIzNy4wODMgNDcyLjUgMjQ4LjUgNDgzLjkxNyAyNDguNSA0OTggMjQ4LjUgNTEyLjA4MyAyMzcuMDgzIDUyMy41IDIyMyA1MjMuNSAyMDguOTE3IDUyMy41IDE5Ny41IDUxMi4wODMgMTk3LjUgNDk4WiIgc3Ryb2tlPSIjRjE5MDMxIiBzdHJva2Utd2lkdGg9IjEuMzMzMzMiIHN0cm9rZS1taXRlcmxpbWl0PSI4IiBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48cGF0aCBkPSJNMjg3LjUgNDgwLjgzM0MyODcuNSA0NzYuMjMxIDI5MS4yMzEgNDcyLjUgMjk1LjgzMyA0NzIuNUwxMTQ1LjE3IDQ3Mi41QzExNDkuNzcgNDcyLjUgMTE1My41IDQ3Ni4yMzEgMTE1My41IDQ4MC44MzNMMTE1My41IDUxNC4xNjdDMTE1My41IDUxOC43NjkgMTE0OS43NyA1MjIuNSAxMTQ1LjE3IDUyMi41TDI5NS44MzMgNTIyLjVDMjkxLjIzMSA1MjIuNSAyODcuNSA1MTguNzY5IDI4Ny41IDUxNC4xNjdaIiBzdHJva2U9IiNGMTkwMzEiIHN0cm9rZS13aWR0aD0iMS4zMzMzMyIgc3Ryb2tlLW1pdGVybGltaXQ9IjgiIGZpbGw9IiNGRkZGRkYiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjx0ZXh0IGZvbnQtZmFtaWx5PSJBcmlhbCxBcmlhbF9NU0ZvbnRTZXJ2aWNlLHNhbnMtc2VyaWYiIGZvbnQtd2VpZ2h0PSI3MDAiIGZvbnQtc2l6ZT0iMTkiIHRyYW5zZm9ybT0idHJhbnNsYXRlKDMwNS40NDUgNTAwKSI+SOG7jWM8dHNwYW4gZm9udC1zaXplPSIxOSIgeD0iNDAuMzMzMyIgeT0iMCI+cGjhuqduPC90c3Bhbj48dHNwYW4gZm9udC1zaXplPSIxOSIgeD0iODkuODMzMyIgeT0iMCI+NyA8L3RzcGFuPi08dHNwYW4gZm9udC1zaXplPSIxOSIgeD0iMTE2LjY2NyIgeT0iMCI+U8OBTkcgQ0jhur4gVuG7mkkgTEVHTyBNSU5EU1RPUk1TPC90c3Bhbj48dHNwYW4gZm9udC1mYW1pbHk9IlNhbnNTZXJpZixTYW5zU2VyaWZfTVNGb250U2VydmljZSxzYW5zLXNlcmlmIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjMwIiB4PSItOTAuNjkxOCIgeT0iMTEiPjc8L3RzcGFuPjx0c3BhbiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMjAiIHg9IjcwMy44NDciIHk9IjIiPjEyIDwvdHNwYW4+PHRzcGFuIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zaXplPSIyMCIgeD0iNzMxLjAxMyIgeT0iMiI+YsOgaTwvdHNwYW4+PHRzcGFuIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zaXplPSIyMCIgeD0iNzYyLjUxMyIgeT0iMiI+LTwvdHNwYW4+PHRzcGFuIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zaXplPSIyMCIgeD0iNzc0LjUxMyIgeT0iMiI+MTggPC90c3Bhbj48dHNwYW4gZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjIwIiB4PSI4MDEuNjgiIHk9IjIiPmdp4budPC90c3Bhbj48L3RleHQ+PHBhdGggZD0iTTIyMiA0NTkgMjIyIDQ3MS42IiBzdHJva2U9IiNGMTkwMzEiIHN0cm9rZS13aWR0aD0iMiIgc3Ryb2tlLW1pdGVybGltaXQ9IjgiIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjxwYXRoIGQ9Ik0xOTcuNSA1NjJDMTk3LjUgNTQ3LjkxNyAyMDguOTE3IDUzNi41IDIyMyA1MzYuNSAyMzcuMDgzIDUzNi41IDI0OC41IDU0Ny45MTcgMjQ4LjUgNTYyIDI0OC41IDU3Ni4wODMgMjM3LjA4MyA1ODcuNSAyMjMgNTg3LjUgMjA4LjkxNyA1ODcuNSAxOTcuNSA1NzYuMDgzIDE5Ny41IDU2MloiIHN0cm9rZT0iI0YxOTAzMSIgc3Ryb2tlLXdpZHRoPSIxLjMzMzMzIiBzdHJva2UtbWl0ZXJsaW1pdD0iOCIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIi8+PHBhdGggZD0iTTI4Ny41IDU0NC44MzNDMjg3LjUgNTQwLjIzMSAyOTEuMjMxIDUzNi41IDI5NS44MzMgNTM2LjVMMTE0NS4xNyA1MzYuNUMxMTQ5Ljc3IDUzNi41IDExNTMuNSA1NDAuMjMxIDExNTMuNSA1NDQuODMzTDExNTMuNSA1NzguMTY3QzExNTMuNSA1ODIuNzY5IDExNDkuNzcgNTg2LjUgMTE0NS4xNyA1ODYuNUwyOTUuODMzIDU4Ni41QzI5MS4yMzEgNTg2LjUgMjg3LjUgNTgyLjc2OSAyODcuNSA1NzguMTY3WiIgc3Ryb2tlPSIjRjE5MDMxIiBzdHJva2Utd2lkdGg9IjEuMzMzMzMiIHN0cm9rZS1taXRlcmxpbWl0PSI4IiBmaWxsPSIjRkZGRkZGIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48dGV4dCBmb250LWZhbWlseT0iQXJpYWwsQXJpYWxfTVNGb250U2VydmljZSxzYW5zLXNlcmlmIiBmb250LXdlaWdodD0iNzAwIiBmb250LXNpemU9IjE5IiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgzMDUuNDQ1IDU2MykiPkjhu41jPHRzcGFuIGZvbnQtc2l6ZT0iMTkiIHg9IjQwLjMzMzMiIHk9IjAiPnBo4bqnbjwvdHNwYW4+PHRzcGFuIGZvbnQtc2l6ZT0iMTkiIHg9Ijg5LjgzMzMiIHk9IjAiPjggPC90c3Bhbj4tPHRzcGFuIGZvbnQtc2l6ZT0iMTkiIHg9IjExNi42NjciIHk9IjAiPlPDgU5HIENI4bq+IFbhu5pJIExFR08gTUlORFNUT1JNUzwvdHNwYW4+PHRzcGFuIGZvbnQtZmFtaWx5PSJTYW5zU2VyaWYsU2Fuc1NlcmlmX01TRm9udFNlcnZpY2Usc2Fucy1zZXJpZiIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zaXplPSIzMCIgeD0iLTkwLjY5MTgiIHk9IjExIj44PC90c3Bhbj48dHNwYW4gZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjIwIiB4PSI3MDMuODQ3IiB5PSIzIj4xMiA8L3RzcGFuPjx0c3BhbiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMjAiIHg9IjczMS4wMTMiIHk9IjMiPmLDoGk8L3RzcGFuPjx0c3BhbiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMjAiIHg9Ijc2Mi41MTMiIHk9IjMiPi08L3RzcGFuPjx0c3BhbiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMjAiIHg9Ijc3NC41MTMiIHk9IjMiPjE4IDwvdHNwYW4+PHRzcGFuIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zaXplPSIyMCIgeD0iODAxLjY4IiB5PSIzIj5naeG7nTwvdHNwYW4+PC90ZXh0PjxwYXRoIGQ9Ik0yMjIgNTIzIDIyMiA1MzUuNiIgc3Ryb2tlPSIjRjE5MDMxIiBzdHJva2Utd2lkdGg9IjIiIHN0cm9rZS1taXRlcmxpbWl0PSI4IiBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48cGF0aCBkPSJNMTk3LjUgNjI2QzE5Ny41IDYxMS45MTcgMjA4LjkxNyA2MDAuNSAyMjMgNjAwLjUgMjM3LjA4MyA2MDAuNSAyNDguNSA2MTEuOTE3IDI0OC41IDYyNiAyNDguNSA2NDAuMDgzIDIzNy4wODMgNjUxLjUgMjIzIDY1MS41IDIwOC45MTcgNjUxLjUgMTk3LjUgNjQwLjA4MyAxOTcuNSA2MjZaIiBzdHJva2U9IiNGMTkwMzEiIHN0cm9rZS13aWR0aD0iMS4zMzMzMyIgc3Ryb2tlLW1pdGVybGltaXQ9IjgiIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjxwYXRoIGQ9Ik0yODcuNSA2MDguODMzQzI4Ny41IDYwNC4yMzEgMjkxLjIzMSA2MDAuNSAyOTUuODMzIDYwMC41TDExNDUuMTcgNjAwLjVDMTE0OS43NyA2MDAuNSAxMTUzLjUgNjA0LjIzMSAxMTUzLjUgNjA4LjgzM0wxMTUzLjUgNjQyLjE2N0MxMTUzLjUgNjQ2Ljc2OSAxMTQ5Ljc3IDY1MC41IDExNDUuMTcgNjUwLjVMMjk1LjgzMyA2NTAuNUMyOTEuMjMxIDY1MC41IDI4Ny41IDY0Ni43NjkgMjg3LjUgNjQyLjE2N1oiIHN0cm9rZT0iI0YxOTAzMSIgc3Ryb2tlLXdpZHRoPSIxLjMzMzMzIiBzdHJva2UtbWl0ZXJsaW1pdD0iOCIgZmlsbD0iI0ZGRkZGRiIgZmlsbC1ydWxlPSJldmVub2RkIi8+PHRleHQgZm9udC1mYW1pbHk9IkFyaWFsLEFyaWFsX01TRm9udFNlcnZpY2Usc2Fucy1zZXJpZiIgZm9udC13ZWlnaHQ9IjcwMCIgZm9udC1zaXplPSIxOSIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMzA1LjQ0NCA2MjgpIj5I4buNYzx0c3BhbiBmb250LXNpemU9IjE5IiB4PSI0MC4zMzMzIiB5PSIwIj5waOG6p248L3RzcGFuPjx0c3BhbiBmb250LXNpemU9IjE5IiB4PSI4OS44MzMzIiB5PSIwIj45IDwvdHNwYW4+LTx0c3BhbiBmb250LXNpemU9IjE5IiB4PSIxMTYuNjY3IiB5PSIwIj5Tw4FORyBDSOG6viBW4buaSSBMRUdPIE1JTkRTVE9STVM8L3RzcGFuPjx0c3BhbiBmb250LWZhbWlseT0iU2Fuc1NlcmlmLFNhbnNTZXJpZl9NU0ZvbnRTZXJ2aWNlLHNhbnMtc2VyaWYiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMzAiIHg9Ii05MC42OTE2IiB5PSIxMSI+OTwvdHNwYW4+PHRzcGFuIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zaXplPSIyMCIgeD0iNzAzLjg0NyIgeT0iMiI+MTIgPC90c3Bhbj48dHNwYW4gZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjIwIiB4PSI3MzEuMDEzIiB5PSIyIj5iw6BpPC90c3Bhbj48dHNwYW4gZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjIwIiB4PSI3NjIuNTEzIiB5PSIyIj4tPC90c3Bhbj48dHNwYW4gZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjIwIiB4PSI3NzQuNTEzIiB5PSIyIj4xOCA8L3RzcGFuPjx0c3BhbiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMjAiIHg9IjgwMS42OCIgeT0iMiI+Z2nhu508L3RzcGFuPjwvdGV4dD48cGF0aCBkPSJNMjIyIDU4NyAyMjIgNTk5LjYiIHN0cm9rZT0iI0YxOTAzMSIgc3Ryb2tlLXdpZHRoPSIyIiBzdHJva2UtbWl0ZXJsaW1pdD0iOCIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIi8+PHBhdGggZD0iTTE5Ny41IDY4OUMxOTcuNSA2NzQuOTE3IDIwOC45MTcgNjYzLjUgMjIzIDY2My41IDIzNy4wODMgNjYzLjUgMjQ4LjUgNjc0LjkxNyAyNDguNSA2ODkgMjQ4LjUgNzAzLjA4MyAyMzcuMDgzIDcxNC41IDIyMyA3MTQuNSAyMDguOTE3IDcxNC41IDE5Ny41IDcwMy4wODMgMTk3LjUgNjg5WiIgc3Ryb2tlPSIjRjE5MDMxIiBzdHJva2Utd2lkdGg9IjEuMzMzMzMiIHN0cm9rZS1taXRlcmxpbWl0PSI4IiBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48cGF0aCBkPSJNMjg3LjUgNjcxLjgzM0MyODcuNSA2NjcuMjMxIDI5MS4yMzEgNjYzLjUgMjk1LjgzMyA2NjMuNUwxMTQ1LjE3IDY2My41QzExNDkuNzcgNjYzLjUgMTE1My41IDY2Ny4yMzEgMTE1My41IDY3MS44MzNMMTE1My41IDcwNS4xNjdDMTE1My41IDcwOS43NjkgMTE0OS43NyA3MTMuNSAxMTQ1LjE3IDcxMy41TDI5NS44MzMgNzEzLjVDMjkxLjIzMSA3MTMuNSAyODcuNSA3MDkuNzY5IDI4Ny41IDcwNS4xNjdaIiBzdHJva2U9IiNGMTkwMzEiIHN0cm9rZS13aWR0aD0iMS4zMzMzMyIgc3Ryb2tlLW1pdGVybGltaXQ9IjgiIGZpbGw9IiNGRkZGRkYiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjx0ZXh0IGZvbnQtZmFtaWx5PSJBcmlhbCxBcmlhbF9NU0ZvbnRTZXJ2aWNlLHNhbnMtc2VyaWYiIGZvbnQtd2VpZ2h0PSI3MDAiIGZvbnQtc2l6ZT0iMTkiIHRyYW5zZm9ybT0idHJhbnNsYXRlKDMwNS40NDUgNjkwKSI+SOG7jWM8dHNwYW4gZm9udC1zaXplPSIxOSIgeD0iNDAuMzMzMyIgeT0iMCI+cGjhuqduPC90c3Bhbj48dHNwYW4gZm9udC1zaXplPSIxOSIgeD0iODkuODMzMyIgeT0iMCI+MTAgPC90c3Bhbj48dHNwYW4gZm9udC1zaXplPSIxOSIgeD0iMTE1LjY2NyIgeT0iMCI+LTwvdHNwYW4+PHRzcGFuIGZvbnQtc2l6ZT0iMTkiIHg9IjEyNyIgeT0iMCI+Q0hJ4bq+TiBCSU5IIFJPQk9UICZhbXA7IFPDgE4gVEhJIMSQ4bqkVSBNSU5JPC90c3Bhbj48dHNwYW4gZm9udC1zaXplPSIxOSIgeD0iNDk3LjE2NyIgeT0iMCI+LTwvdHNwYW4+PHRzcGFuIGZvbnQtc2l6ZT0iMTkiIHg9IjUwMy4zMzMiIHk9IjAiPldSTzwvdHNwYW4+PHRzcGFuIGZvbnQtZmFtaWx5PSJTYW5zU2VyaWYsU2Fuc1NlcmlmX01TRm9udFNlcnZpY2Usc2Fucy1zZXJpZiIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zaXplPSIzMCIgeD0iLTEwMC44MjUiIHk9IjEwIj4xMDwvdHNwYW4+PHRzcGFuIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zaXplPSIyMCIgeD0iNzAzLjg0NyIgeT0iMyI+MTIgPC90c3Bhbj48dHNwYW4gZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjIwIiB4PSI3MzEuMDEzIiB5PSIzIj5iw6BpPC90c3Bhbj48dHNwYW4gZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjIwIiB4PSI3NjIuNTEzIiB5PSIzIj4tPC90c3Bhbj48dHNwYW4gZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjIwIiB4PSI3NzQuNTEzIiB5PSIzIj4xOCA8L3RzcGFuPjx0c3BhbiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMjAiIHg9IjgwMS42OCIgeT0iMyI+Z2nhu508L3RzcGFuPjwvdGV4dD48cGF0aCBkPSJNMjIyIDY1MCAyMjIgNjYyLjYiIHN0cm9rZT0iI0YxOTAzMSIgc3Ryb2tlLXdpZHRoPSIyIiBzdHJva2UtbWl0ZXJsaW1pdD0iOCIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIi8+PHBhdGggZD0iTTE5Ny41IDc1MkMxOTcuNSA3MzcuOTE3IDIwOC45MTcgNzI2LjUgMjIzIDcyNi41IDIzNy4wODMgNzI2LjUgMjQ4LjUgNzM3LjkxNyAyNDguNSA3NTIgMjQ4LjUgNzY2LjA4MyAyMzcuMDgzIDc3Ny41IDIyMyA3NzcuNSAyMDguOTE3IDc3Ny41IDE5Ny41IDc2Ni4wODMgMTk3LjUgNzUyWiIgc3Ryb2tlPSIjRjE5MDMxIiBzdHJva2Utd2lkdGg9IjEuMzMzMzMiIHN0cm9rZS1taXRlcmxpbWl0PSI4IiBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48cGF0aCBkPSJNMjg3LjUgNzM0LjgzM0MyODcuNSA3MzAuMjMxIDI5MS4yMzEgNzI2LjUgMjk1LjgzMyA3MjYuNUwxMTQ1LjE3IDcyNi41QzExNDkuNzcgNzI2LjUgMTE1My41IDczMC4yMzEgMTE1My41IDczNC44MzNMMTE1My41IDc2OC4xNjdDMTE1My41IDc3Mi43NjkgMTE0OS43NyA3NzYuNSAxMTQ1LjE3IDc3Ni41TDI5NS44MzMgNzc2LjVDMjkxLjIzMSA3NzYuNSAyODcuNSA3NzIuNzY5IDI4Ny41IDc2OC4xNjdaIiBzdHJva2U9IiNGMTkwMzEiIHN0cm9rZS13aWR0aD0iMS4zMzMzMyIgc3Ryb2tlLW1pdGVybGltaXQ9IjgiIGZpbGw9IiNGRkZGRkYiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjx0ZXh0IGZvbnQtZmFtaWx5PSJBcmlhbCxBcmlhbF9NU0ZvbnRTZXJ2aWNlLHNhbnMtc2VyaWYiIGZvbnQtd2VpZ2h0PSI3MDAiIGZvbnQtc2l6ZT0iMTkiIHRyYW5zZm9ybT0idHJhbnNsYXRlKDMwNS40NDQgNzU0KSI+SOG7jWM8dHNwYW4gZm9udC1zaXplPSIxOSIgeD0iNDAuMzMzMyIgeT0iMCI+cGjhuqduPC90c3Bhbj48dHNwYW4gZm9udC1zaXplPSIxOSIgeD0iODkuODMzMyIgeT0iMCI+MTEgPC90c3Bhbj4tPHRzcGFuIGZvbnQtc2l6ZT0iMTkiIHg9IjEyNS45NzMiIHk9IjAiPkNISeG6vk4gQklOSCBST0JPVCAmYW1wOyBTw4BOIFRISSDEkOG6pFUgTUlOSTwvdHNwYW4+PHRzcGFuIGZvbnQtc2l6ZT0iMTkiIHg9IjQ5Ni4xNCIgeT0iMCI+LTwvdHNwYW4+PHRzcGFuIGZvbnQtc2l6ZT0iMTkiIHg9IjUwMi4zMDciIHk9IjAiPldSTzwvdHNwYW4+PHRzcGFuIGZvbnQtZmFtaWx5PSJTYW5zU2VyaWYsU2Fuc1NlcmlmX01TRm9udFNlcnZpY2Usc2Fucy1zZXJpZiIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zaXplPSIzMCIgeD0iLTk4LjY0NDciIHk9IjExIj4xMTwvdHNwYW4+PHRzcGFuIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zaXplPSIyMCIgeD0iNzAzLjg0NyIgeT0iMiI+MTIgPC90c3Bhbj48dHNwYW4gZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjIwIiB4PSI3MzEuMDE0IiB5PSIyIj5iw6BpPC90c3Bhbj48dHNwYW4gZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjIwIiB4PSI3NjIuNTE0IiB5PSIyIj4tPC90c3Bhbj48dHNwYW4gZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjIwIiB4PSI3NzQuNTE0IiB5PSIyIj4xOCA8L3RzcGFuPjx0c3BhbiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMjAiIHg9IjgwMS42OCIgeT0iMiI+Z2nhu508L3RzcGFuPjwvdGV4dD48cGF0aCBkPSJNMjIyIDcxMyAyMjIgNzI1LjYiIHN0cm9rZT0iI0YxOTAzMSIgc3Ryb2tlLXdpZHRoPSIyIiBzdHJva2UtbWl0ZXJsaW1pdD0iOCIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIi8+PHBhdGggZD0iTTE5Ny41IDgxNS41QzE5Ny41IDgwMS42OTMgMjA4LjkxNyA3OTAuNSAyMjMgNzkwLjUgMjM3LjA4MyA3OTAuNSAyNDguNSA4MDEuNjkzIDI0OC41IDgxNS41IDI0OC41IDgyOS4zMDcgMjM3LjA4MyA4NDAuNSAyMjMgODQwLjUgMjA4LjkxNyA4NDAuNSAxOTcuNSA4MjkuMzA3IDE5Ny41IDgxNS41WiIgc3Ryb2tlPSIjRjE5MDMxIiBzdHJva2Utd2lkdGg9IjEuMzMzMzMiIHN0cm9rZS1taXRlcmxpbWl0PSI4IiBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48cGF0aCBkPSJNMjg3LjUgNzk4QzI4Ny41IDc5My4zMDYgMjkxLjMwNiA3ODkuNSAyOTYgNzg5LjVMMTE0NSA3ODkuNUMxMTQ5LjY5IDc4OS41IDExNTMuNSA3OTMuMzA2IDExNTMuNSA3OThMMTE1My41IDgzMkMxMTUzLjUgODM2LjY5NCAxMTQ5LjY5IDg0MC41IDExNDUgODQwLjVMMjk2IDg0MC41QzI5MS4zMDYgODQwLjUgMjg3LjUgODM2LjY5NCAyODcuNSA4MzJaIiBzdHJva2U9IiNGMTkwMzEiIHN0cm9rZS13aWR0aD0iMS4zMzMzMyIgc3Ryb2tlLW1pdGVybGltaXQ9IjgiIGZpbGw9IiNGRkZGRkYiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjx0ZXh0IGZvbnQtZmFtaWx5PSJBcmlhbCxBcmlhbF9NU0ZvbnRTZXJ2aWNlLHNhbnMtc2VyaWYiIGZvbnQtd2VpZ2h0PSI3MDAiIGZvbnQtc2l6ZT0iMTkiIHRyYW5zZm9ybT0idHJhbnNsYXRlKDMwNS40NDUgODE3KSI+SOG7jWM8dHNwYW4gZm9udC1zaXplPSIxOSIgeD0iNDAuMzMzMyIgeT0iMCI+cGjhuqduPC90c3Bhbj48dHNwYW4gZm9udC1zaXplPSIxOSIgeD0iODkuODMzMyIgeT0iMCI+MTIgPC90c3Bhbj48dHNwYW4gZm9udC1zaXplPSIxOSIgeD0iMTE1LjY2NyIgeT0iMCI+LTwvdHNwYW4+PHRzcGFuIGZvbnQtc2l6ZT0iMTkiIHg9IjEyNyIgeT0iMCI+Q0hJ4bq+TiBCSU5IIFJPQk9UICZhbXA7IFPDgE4gVEhJIMSQ4bqkVSBNSU5JPC90c3Bhbj48dHNwYW4gZm9udC1zaXplPSIxOSIgeD0iNDk3LjE2NyIgeT0iMCI+LTwvdHNwYW4+PHRzcGFuIGZvbnQtc2l6ZT0iMTkiIHg9IjUwMy4zMzMiIHk9IjAiPldSTzwvdHNwYW4+PHRzcGFuIGZvbnQtZmFtaWx5PSJTYW5zU2VyaWYsU2Fuc1NlcmlmX01TRm9udFNlcnZpY2Usc2Fucy1zZXJpZiIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zaXplPSIzMCIgeD0iLTk4LjE1NjQiIHk9IjExIj4xMjwvdHNwYW4+PHRzcGFuIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zaXplPSIyMCIgeD0iNzAzLjg0NyIgeT0iMyI+MTIgPC90c3Bhbj48dHNwYW4gZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjIwIiB4PSI3MzEuMDEzIiB5PSIzIj5iw6BpPC90c3Bhbj48dHNwYW4gZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjIwIiB4PSI3NjIuNTEzIiB5PSIzIj4tPC90c3Bhbj48dHNwYW4gZm9udC1zdHlsZT0iaXRhbGljIiBmb250LXdlaWdodD0iNDAwIiBmb250LXNpemU9IjIwIiB4PSI3NzQuNTEzIiB5PSIzIj4xOCA8L3RzcGFuPjx0c3BhbiBmb250LXN0eWxlPSJpdGFsaWMiIGZvbnQtd2VpZ2h0PSI0MDAiIGZvbnQtc2l6ZT0iMjAiIHg9IjgwMS42OCIgeT0iMyI+Z2nhu508L3RzcGFuPjwvdGV4dD48cGF0aCBkPSJNMjIyIDc3NyAyMjIgNzg5LjYiIHN0cm9rZT0iI0YxOTAzMSIgc3Ryb2tlLXdpZHRoPSIyIiBzdHJva2UtbWl0ZXJsaW1pdD0iOCIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIi8+PC9nPjwvc3ZnPg==\" width=\"984\" /></h2>\n\n<h2 style=\"text-align:center\">&nbsp;</h2>\n\n<ul>\n</ul>\n\n<div>\n<div>\n<h3 style=\"text-align:center\">&nbsp;</h3>\n</div>\n</div>\n</div>\n', '36 giờ ( ~ 1 tháng), 120\' mỗi buổi', '8 học phần từ thấp đến cao', 'LEGO WeDo, LEGO Mindstorms, Scratch, Wecode', ' 14/7/2021', ' 14/7/2021', 'Khóa học lập trình Robot SPEC', 'Lập trình Robot là gì? Tại sao nên dạy lập trình Robot cho trẻ ngay hôm nay? Hãy cùng tìm hiểu những thông tin hữu ích ngay sau đây nhé.', 'Lập trình Robot, Robot cơ bản, Robot cho trẻ em, học lập trình Robot, Robot, game Robot', '', 0, b'1'),
(21, 'https://spec.edu.vn/uploadfileimage/spec/khoahoc/65439700sdfdf.jpg', 2500000, 2000000, 'Khóa học lập trình C# - Online', b'1', 1, 'khoa-hoc-lap-trinh-c-sharp', 'Doanh Nghiệp', 8, 1, b'1', 'C# là ngôn ngữ lập trình hiện đại, thuần hường đối tượng được xây dựng trên nền tảng của 2 ngôn ngữ lập trình huyền thoại C++ và Java. Không chỉ vậy C# còn được coi là sự cân bằng giữa các ngôn ngữ lập trình Java, Visual Basic, Delphi, C++.', '2021-07-20', '18-30', 20, 13, '<p>abc</p>\n', '72 giờ (3 học kỳ ~ 5 tháng), 90\' mỗi buổi', '7 học phần từ thấp đến cao', 'C# cơ bản, C# nâng cao, Window Form...', '20h 04/08/2021', '19h30 đến 21h30 các ngày 2,4,6', 'Khóa học lập trình C# SPEC', 'Lập trình C# là gì? Tạo sao nên học lập trình C#', 'Lập trình C#, C# căn bản, C# nâng cao, Lập trình hướng đối tương, Lập trình cơ bản cho sinh viên', 'index,follow', 20, b'1'),
(24, 'https://spec.edu.vn/uploadfileimage/spec/khoahoc/237036400dkjew.jpg', 3500000, 2800000, 'Khóa học lập trình C# nâng cao - Online', b'1', 1, 'khoa-hoc-c-sharp-nang-cao', 'Doanh Nghiệp', 8, 1, b'1', 'C# là ngôn ngữ lập trình hiện đại, thuần hường đối tượng được xây dựng trên nền tảng của 2 ngôn ngữ lập trình huyền thoại C++ và Java. Không chỉ vậy C# còn được coi là sự cân bằng giữa các ngôn ngữ lập trình Java, Visual Basic, Delphi, C++.', '2021-07-11', '18-30', 20, 13, '<p>acbc</p>\n', '72 giờ (3 học kỳ ~ 5 tháng), 90\' mỗi buổi', '7 học phần từ thấp đến cao', 'C# cơ bản, C# nâng cao, Window Form...', 'Updating...', '19h30 đến 21h30 các ngày 2,4,6', 'Khóa học lập trình C# SPEC', 'Lập trình C# là gì? Tạo sao nên học lập trình C#', 'Lập trình C#, C# căn bản, C# nâng cao, Lập trình hướng đối tương, Lập trình cơ bản cho sinh viên', 'index,follow', 20, b'1'),
(25, 'https://codefresher.vn/wp-content/uploads/2019/12/Java-Programming-Basics.jpg', 1200000, 840000, 'Khóa học lập trình Java cơ bản', b'1', 1, 'khoa-hoc-java-co-ban', 'Doanh Nghiep', 8, 1, b'1', 'Java là một ngôn ngữ lập trình hướng đối tượng, dựa trên lớp được thiết kế để có càng ít phụ thuộc thực thi càng tốt. Nó là ngôn ngữ lập trình có mục đích chung cho phép các nhà phát triển ứng dụng viết một lần, chạy ở mọi nơi (WORA),', '2021-08-29', '18-30', 20, 13, '<p>abc</p>\n', '20 gio (12 buoi)', '1 hoc phan', 'Java co ban,...', '01/08/2021', '19h30 đến 21h30 các ngày 2,4,6', 'Khoa hoc lap trinh java', 'Lap trinh java la gi', 'Lap trinh Java co ban', 'index,follow', 30, b'1');

-- --------------------------------------------------------

--
-- Table structure for table `course_has_student`
--

CREATE TABLE `course_has_student` (
  `id_course` int NOT NULL,
  `id_students` int NOT NULL,
  `deleted` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `course_has_student`
--

INSERT INTO `course_has_student` (`id_course`, `id_students`, `deleted`) VALUES
(9, 71, b'1'),
(9, 72, b'1'),
(9, 73, b'1'),
(9, 74, b'1'),
(12, 67, b'1'),
(12, 70, b'1'),
(13, 32, b'1'),
(13, 59, b'1'),
(13, 60, b'1'),
(13, 69, b'1'),
(21, 32, b'0'),
(21, 33, b'1'),
(21, 34, b'1'),
(21, 35, b'1'),
(21, 36, b'1'),
(21, 37, b'1'),
(21, 38, b'1'),
(21, 39, b'1'),
(21, 40, b'1'),
(21, 41, b'1'),
(21, 42, b'1'),
(21, 43, b'1'),
(21, 44, b'1'),
(21, 45, b'1'),
(21, 46, b'1'),
(21, 47, b'1'),
(21, 48, b'1'),
(21, 49, b'1'),
(21, 50, b'1'),
(21, 51, b'1'),
(21, 52, b'1'),
(21, 53, b'1'),
(21, 56, b'1'),
(21, 57, b'1'),
(21, 64, b'1'),
(21, 65, b'1'),
(21, 66, b'1'),
(21, 68, b'1'),
(21, 78, b'1'),
(24, 76, b'1'),
(24, 77, b'1'),
(24, 79, b'1'),
(25, 61, b'1'),
(25, 62, b'1');

-- --------------------------------------------------------

--
-- Table structure for table `course_has_type_education`
--

CREATE TABLE `course_has_type_education` (
  `course_id` int NOT NULL,
  `type_education_id` int NOT NULL,
  `deleted` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `course_has_type_education`
--

INSERT INTO `course_has_type_education` (`course_id`, `type_education_id`, `deleted`) VALUES
(6, 1, b'1'),
(6, 2, b'1'),
(6, 3, b'1'),
(8, 1, b'0'),
(8, 2, b'0'),
(8, 3, b'0'),
(8, 4, b'0'),
(9, 1, b'1'),
(9, 2, b'0'),
(9, 3, b'1'),
(9, 4, b'0'),
(10, 1, b'1'),
(11, 1, b'0'),
(11, 2, b'0'),
(11, 3, b'0'),
(11, 4, b'0'),
(12, 1, b'1'),
(12, 2, b'1'),
(12, 4, b'1'),
(13, 1, b'1'),
(13, 2, b'1'),
(13, 3, b'0'),
(13, 4, b'1'),
(19, 2, b'1'),
(25, 1, b'1'),
(25, 2, b'1'),
(25, 3, b'1'),
(25, 4, b'1');

-- --------------------------------------------------------

--
-- Table structure for table `folder_image`
--

CREATE TABLE `folder_image` (
  `value` varchar(155) NOT NULL,
  `name` varchar(155) NOT NULL,
  `deleted` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `folder_image`
--

INSERT INTO `folder_image` (`value`, `name`, `deleted`) VALUES
('baiviet', 'Bài viết', b'1'),
('giangvien', 'Giảng viên', b'1'),
('khac', 'Khác', b'1'),
('khoahoc', 'Khóa học', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `group_student`
--

CREATE TABLE `group_student` (
  `id` int NOT NULL COMMENT 'Nhom hoc vien dang ky khoa hoc',
  `name` varchar(100) NOT NULL,
  `deleted` bit(1) NOT NULL,
  `priority` int NOT NULL COMMENT 'Thứ tự ưu tiên',
  `default_order` bit(1) NOT NULL COMMENT 'mac dinh hay khong: 1 la có 0 là không'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `group_student`
--

INSERT INTO `group_student` (`id`, `name`, `deleted`, `priority`, `default_order`) VALUES
(1, 'Chưa gọi điện thoại', b'1', 1, b'1'),
(2, 'Đã gọi điện thoại', b'1', 2, b'0'),
(3, 'Sẽ đi học', b'1', 3, b'0'),
(4, 'Đã học', b'1', 4, b'0'),
(5, 'Không học', b'1', 5, b'0'),
(6, 'Không nghe máy', b'1', 6, b'0'),
(7, 'Đi học đóng tiền', b'1', 7, b'0'),
(8, 'Khóa sau', b'1', 8, b'0'),
(9, 'Đã đóng tiền', b'1', 9, b'0'),
(10, 'Bảo lưu', b'1', 10, b'0'),
(11, 'Không có lớp', b'1', 11, b'0'),
(12, 'Sai số điện thoại', b'1', 12, b'0');

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `src` varchar(255) NOT NULL,
  `status` bit(1) NOT NULL,
  `folder_image_value` varchar(155) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`id`, `name`, `src`, `status`, `folder_image_value`) VALUES
(17, '3138731001.jpg', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/3138731001.jpg', b'1', 'giangvien'),
(18, '4407270001.jpg', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/4407270001.jpg', b'1', 'giangvien'),
(19, '844563200Image 24.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/844563200Image 24.png', b'1', 'giangvien'),
(20, '117520800Image 24.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/117520800Image 24.png', b'1', 'giangvien'),
(21, '417012200HoangDQ.jpg', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/417012200HoangDQ.jpg', b'1', 'giangvien'),
(22, '771439900NganKM.jpg', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/771439900NganKM.jpg', b'1', 'giangvien'),
(23, '716488000nguyenhv.jpg', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/716488000nguyenhv.jpg', b'0', 'giangvien'),
(24, '239945500nguyenhv.jpg', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/239945500nguyenhv.jpg', b'1', 'giangvien'),
(25, '944025100nguyenhv.jpg', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/944025100nguyenhv.jpg', b'1', 'giangvien'),
(26, '778926200172047613_890294294850690_538357257391327507_n.jpg', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/778926200172047613_890294294850690_538357257391327507_n.jpg', b'0', 'giangvien'),
(27, '375032000172047613_890294294850690_538357257391327507_n.jpg', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/375032000172047613_890294294850690_538357257391327507_n.jpg', b'0', 'giangvien'),
(28, '926517900172047613_890294294850690_538357257391327507_n.jpg', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/926517900172047613_890294294850690_538357257391327507_n.jpg', b'0', 'giangvien'),
(29, '21477500nguyenhv.jpg', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/21477500nguyenhv.jpg', b'1', 'giangvien'),
(30, '291366300phucpd.jpg', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/291366300phucpd.jpg', b'1', 'giangvien'),
(31, '25650300phucpd.jpg', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/25650300phucpd.jpg', b'0', 'giangvien'),
(32, '910908000a12.png', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/910908000a12.png', b'1', 'baiviet'),
(33, '416061000172047613_890294294850690_538357257391327507_n.jpg', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/416061000172047613_890294294850690_538357257391327507_n.jpg', b'0', 'baiviet'),
(34, '123607400172047613_890294294850690_538357257391327507_n.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khoahoc/123607400172047613_890294294850690_538357257391327507_n.jpg', b'1', 'khoahoc'),
(35, '594680400172047613_890294294850690_538357257391327507_n.jpg', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/594680400172047613_890294294850690_538357257391327507_n.jpg', b'0', 'giangvien'),
(36, '826895600logo.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/826895600logo.png', b'1', 'giangvien'),
(37, '5812130002.jpg', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/5812130002.jpg', b'1', 'giangvien'),
(38, '4568476004.jpeg', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/4568476004.jpeg', b'1', 'giangvien'),
(39, '922424900nguyenhv.jpg', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/922424900nguyenhv.jpg', b'1', 'giangvien'),
(40, '501585400PhucPD.jpg', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/501585400PhucPD.jpg', b'1', 'giangvien'),
(41, '658834900cuong.jpg', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/658834900cuong.jpg', b'1', 'giangvien'),
(42, '161436100cuong.jpg', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/161436100cuong.jpg', b'1', 'giangvien'),
(43, '922121200nguyenhv.jpg', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/922121200nguyenhv.jpg', b'1', 'giangvien'),
(44, '6586955003.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/6586955003.png', b'0', 'giangvien'),
(50, '330828800phucpd.jpg', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/330828800phucpd.jpg', b'1', 'giangvien'),
(51, '371896600lotrinh_robot.svg', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/371896600lotrinh_robot.svg', b'1', 'giangvien'),
(52, '568070100aa.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khoahoc/568070100aa.jpg', b'1', 'khoahoc'),
(53, '661828200aa.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khoahoc/661828200aa.jpg', b'1', 'khoahoc'),
(54, '867042200ee.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khoahoc/867042200ee.jpg', b'1', 'khoahoc'),
(55, '867042200ee.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khoahoc/867042200ee.jpg', b'1', 'khoahoc'),
(56, '868614600bb.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khoahoc/868614600bb.jpg', b'1', 'khoahoc'),
(57, '103012700bb.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khoahoc/103012700bb.jpg', b'1', 'khoahoc'),
(58, '268590000cc.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khoahoc/268590000cc.jpg', b'1', 'khoahoc'),
(59, '159207100cc.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khoahoc/159207100cc.jpg', b'1', 'khoahoc'),
(60, '563943100172047613_890294294850690_538357257391327507_n.jpg', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/563943100172047613_890294294850690_538357257391327507_n.jpg', b'0', 'giangvien'),
(61, '248827900172047613_890294294850690_538357257391327507_n.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khoahoc/248827900172047613_890294294850690_538357257391327507_n.jpg', b'0', 'khoahoc'),
(62, '248827900172047613_890294294850690_538357257391327507_n.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khoahoc/248827900172047613_890294294850690_538357257391327507_n.jpg', b'0', 'khoahoc'),
(63, '949475600Capture.PNG', 'https://spec.edu.vn/uploadfileimage/spec/khoahoc/949475600Capture.PNG', b'0', 'khoahoc'),
(64, '66892000web.svg', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/66892000web.svg', b'0', 'giangvien'),
(65, '773408500java_ky1.svg', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/773408500java_ky1.svg', b'1', 'giangvien'),
(66, '961420400java_ky2.svg', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/961420400java_ky2.svg', b'1', 'giangvien'),
(67, '78795100python.svg', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/78795100python.svg', b'1', 'giangvien'),
(68, '46353900web.svg', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/46353900web.svg', b'1', 'giangvien'),
(69, '186194800demo.jpg', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/186194800demo.jpg', b'1', 'baiviet'),
(70, '6616186005.png', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/6616186005.png', b'1', 'baiviet'),
(71, '6136764001.png', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/6136764001.png', b'1', 'baiviet'),
(72, '6790268009.png', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/6790268009.png', b'1', 'baiviet'),
(73, '1586238005.png', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/1586238005.png', b'0', 'baiviet'),
(74, '58949620011.jpg', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/58949620011.jpg', b'1', 'baiviet'),
(75, '4477425008.jpg', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/4477425008.jpg', b'1', 'baiviet'),
(76, '334966600iudnej.png', 'https://spec.edu.vn/uploadfileimage/spec/khoahoc/334966600iudnej.png', b'1', 'khoahoc'),
(77, '243932400picture3.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khoahoc/243932400picture3.jpg', b'1', 'khoahoc'),
(78, '598436300dieosicture4.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khoahoc/598436300dieosicture4.jpg', b'1', 'khoahoc'),
(79, '632423000reicture5.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khoahoc/632423000reicture5.jpg', b'1', 'khoahoc'),
(80, '233520100sdjskdjw.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khoahoc/233520100sdjskdjw.jpg', b'0', 'khoahoc'),
(81, '485803600dfoeissa.png', 'https://spec.edu.vn/uploadfileimage/spec/khoahoc/485803600dfoeissa.png', b'0', 'khoahoc'),
(82, '450403000dskdjsowo.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khoahoc/450403000dskdjsowo.jpg', b'0', 'khoahoc'),
(83, '927887200c-sharp-c-seeklogo.com 7.png', 'https://spec.edu.vn/uploadfileimage/spec/khac/927887200c-sharp-c-seeklogo.com 7.png', b'1', 'khac'),
(84, '916600200c-sharp-c-seeklogo.com.png', 'https://spec.edu.vn/uploadfileimage/spec/khac/916600200c-sharp-c-seeklogo.com.png', b'1', 'khac'),
(85, '815473100Group 27.png', 'https://spec.edu.vn/uploadfileimage/spec/khac/815473100Group 27.png', b'0', 'khac'),
(86, '473405500Group27.png', 'https://spec.edu.vn/uploadfileimage/spec/khac/473405500Group27.png', b'1', 'khac'),
(87, '19163000Image 26.png', 'https://spec.edu.vn/uploadfileimage/spec/khac/19163000Image 26.png', b'1', 'khac'),
(88, '644681700Group 34.png', 'https://spec.edu.vn/uploadfileimage/spec/khac/644681700Group 34.png', b'1', 'khac'),
(89, '817307400Group 27.png', 'https://spec.edu.vn/uploadfileimage/spec/khac/817307400Group 27.png', b'1', 'khac'),
(90, '24779400Image 34.png', 'https://spec.edu.vn/uploadfileimage/spec/khac/24779400Image 34.png', b'1', 'khac'),
(91, '431363900Image 33 (1).png', 'https://spec.edu.vn/uploadfileimage/spec/khac/431363900Image 33 (1).png', b'1', 'khac'),
(92, '25469900Image 33.png', 'https://spec.edu.vn/uploadfileimage/spec/khac/25469900Image 33.png', b'0', 'khac'),
(93, '98990000Image 33 (2).png', 'https://spec.edu.vn/uploadfileimage/spec/khac/98990000Image 33 (2).png', b'1', 'khac'),
(94, '891787200Group 20.png', 'https://spec.edu.vn/uploadfileimage/spec/khac/891787200Group 20.png', b'0', 'khac'),
(95, '673407200Group 23.png', 'https://spec.edu.vn/uploadfileimage/spec/khac/673407200Group 23.png', b'0', 'khac'),
(96, '768027200Group 24.png', 'https://spec.edu.vn/uploadfileimage/spec/khac/768027200Group 24.png', b'0', 'khac'),
(97, '2954786003.svg', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/2954786003.svg', b'0', 'giangvien'),
(98, '436915500lsdksds1.svg', 'https://spec.edu.vn/uploadfileimage/spec/khoahoc/436915500lsdksds1.svg', b'0', 'khoahoc'),
(99, '617455800kdskdj2.svg', 'https://spec.edu.vn/uploadfileimage/spec/khoahoc/617455800kdskdj2.svg', b'0', 'khoahoc'),
(100, '841533300dsdkjsd3.svg', 'https://spec.edu.vn/uploadfileimage/spec/khoahoc/841533300dsdkjsd3.svg', b'0', 'khoahoc'),
(101, '482998300lsdksds1.svg', 'https://spec.edu.vn/uploadfileimage/spec/khoahoc/482998300lsdksds1.svg', b'0', 'khoahoc'),
(102, '794305600123.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/794305600123.png', b'1', 'giangvien'),
(103, '3729800001.jpg', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/3729800001.jpg', b'1', 'giangvien'),
(104, '311856300123.png', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/311856300123.png', b'1', 'baiviet'),
(105, '3279760001.jpg', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/3279760001.jpg', b'1', 'baiviet'),
(106, '1883201002.jpg', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/1883201002.jpg', b'1', 'baiviet'),
(107, '1277522003.jpg', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/1277522003.jpg', b'1', 'baiviet'),
(108, '6124702004.jpg', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/6124702004.jpg', b'1', 'baiviet'),
(109, '8940425005.png', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/8940425005.png', b'1', 'baiviet'),
(110, '3318820006.png', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/3318820006.png', b'1', 'baiviet'),
(111, '8637796008.png', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/8637796008.png', b'1', 'baiviet'),
(112, '2234846009.png', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/2234846009.png', b'1', 'baiviet'),
(113, '55194290010.png', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/55194290010.png', b'1', 'baiviet'),
(114, '95852700011.png', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/95852700011.png', b'1', 'baiviet'),
(115, '49022540012.png', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/49022540012.png', b'1', 'baiviet'),
(116, '63116360013.png', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/63116360013.png', b'1', 'baiviet'),
(117, '44403870014.png', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/44403870014.png', b'1', 'baiviet'),
(118, '89750710015.png', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/89750710015.png', b'1', 'baiviet'),
(119, '36659570016.png', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/36659570016.png', b'1', 'baiviet'),
(120, '5445480017.png', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/5445480017.png', b'1', 'baiviet'),
(121, '47677490018.png', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/47677490018.png', b'1', 'baiviet'),
(122, '227092500Screenshotxs2021-05-04xs135149.png', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/227092500Screenshotxs2021-05-04xs135149.png', b'1', 'baiviet'),
(123, '513554000lotrinh1.JPG', 'https://spec.edu.vn/uploadfileimage/spec/khoahoc/513554000lotrinh1.JPG', b'0', 'khoahoc'),
(124, '630148800group20.svg', 'https://spec.edu.vn/uploadfileimage/spec/khoahoc/630148800group20.svg', b'0', 'khoahoc'),
(125, '896426700roup23.svg', 'https://spec.edu.vn/uploadfileimage/spec/khoahoc/896426700roup23.svg', b'0', 'khoahoc'),
(126, '146976800roup24.svg', 'https://spec.edu.vn/uploadfileimage/spec/khoahoc/146976800roup24.svg', b'0', 'khoahoc'),
(127, '579552100Group20.svg', 'https://spec.edu.vn/uploadfileimage/spec/khoahoc/579552100Group20.svg', b'0', 'khoahoc'),
(128, '48830300Group23.svg', 'https://spec.edu.vn/uploadfileimage/spec/khoahoc/48830300Group23.svg', b'0', 'khoahoc'),
(129, '502364300Group24.svg', 'https://spec.edu.vn/uploadfileimage/spec/khoahoc/502364300Group24.svg', b'0', 'khoahoc'),
(130, '607149200Group20.svg', 'https://spec.edu.vn/uploadfileimage/spec/khoahoc/607149200Group20.svg', b'0', 'khoahoc'),
(131, '326920500C_ky1.svg', 'https://spec.edu.vn/uploadfileimage/spec/khoahoc/326920500C_ky1.svg', b'1', 'khoahoc'),
(132, '702684500C_ky2.svg', 'https://spec.edu.vn/uploadfileimage/spec/khoahoc/702684500C_ky2.svg', b'1', 'khoahoc'),
(133, '704327200C_ky3.svg', 'https://spec.edu.vn/uploadfileimage/spec/khoahoc/704327200C_ky3.svg', b'1', 'khoahoc'),
(134, '733341200C_CanBan_ky1.svg', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/733341200C_CanBan_ky1.svg', b'0', 'giangvien'),
(135, '751402800C_CanBan_ky2.svg', 'https://spec.edu.vn/uploadfileimage/spec/khoahoc/751402800C_CanBan_ky2.svg', b'1', 'khoahoc'),
(136, '720839000C_CanBan_ky1.svg', 'https://spec.edu.vn/uploadfileimage/spec/khoahoc/720839000C_CanBan_ky1.svg', b'1', 'khoahoc'),
(137, '759950900anhxslopxshocxsQS(2).jpg', 'https://spec.edu.vn/uploadfileimage/spec/khoahoc/759950900anhxslopxshocxsQS(2).jpg', b'1', 'khoahoc'),
(138, '34064840078502942_2862821753728090_3108639394030944256_n.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khoahoc/34064840078502942_2862821753728090_3108639394030944256_n.jpg', b'1', 'khoahoc'),
(139, '310547600125544427_3815325215144401_6391551920922740498_n.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khoahoc/310547600125544427_3815325215144401_6391551920922740498_n.jpg', b'1', 'khoahoc'),
(140, '37535010070728258_2704219189588348_8200994620100837376_n.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khoahoc/37535010070728258_2704219189588348_8200994620100837376_n.jpg', b'1', 'khoahoc'),
(141, '861112000128930193_3860095640667358_4851044470912431770_n.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khoahoc/861112000128930193_3860095640667358_4851044470912431770_n.jpg', b'1', 'khoahoc'),
(142, '549916300anhxskhoaxshocxsdaoxstaoxsQS.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khoahoc/549916300anhxskhoaxshocxsdaoxstaoxsQS.jpg', b'1', 'khoahoc'),
(143, '7494067002.jpg', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/7494067002.jpg', b'1', 'giangvien'),
(144, '7055872003.jpg', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/7055872003.jpg', b'1', 'giangvien'),
(145, '5810655004.jpg', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/5810655004.jpg', b'1', 'giangvien'),
(146, '1283871005.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/1283871005.png', b'1', 'giangvien'),
(147, '3962067006.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/3962067006.png', b'1', 'giangvien'),
(148, '3188593007.jpg', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/3188593007.jpg', b'1', 'giangvien'),
(149, '2572433008.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/2572433008.png', b'0', 'giangvien'),
(150, '8838774009.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/8838774009.png', b'0', 'giangvien'),
(151, '97803390010.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/97803390010.png', b'0', 'giangvien'),
(152, '52525990011.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/52525990011.png', b'0', 'giangvien'),
(153, '32280230012.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/32280230012.png', b'0', 'giangvien'),
(154, '12192650014.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/12192650014.png', b'1', 'giangvien'),
(155, '81080910013.jpg', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/81080910013.jpg', b'1', 'giangvien'),
(156, '71291000015.jpg', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/71291000015.jpg', b'1', 'giangvien'),
(157, '32796350016.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/32796350016.png', b'1', 'giangvien'),
(158, '64562800017.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/64562800017.png', b'1', 'giangvien'),
(159, '21281320018.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/21281320018.png', b'1', 'giangvien'),
(160, '70472790019.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/70472790019.png', b'0', 'giangvien'),
(161, '73929460020.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/73929460020.png', b'1', 'giangvien'),
(162, '5444200021.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/5444200021.png', b'0', 'giangvien'),
(163, '15258910022.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/15258910022.png', b'0', 'giangvien'),
(164, '57671000023.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/57671000023.png', b'1', 'giangvien'),
(165, '64302680024.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/64302680024.png', b'1', 'giangvien'),
(166, '237036400dkjew.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khoahoc/237036400dkjew.jpg', b'1', 'khoahoc'),
(167, '65439700sdfdf.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khoahoc/65439700sdfdf.jpg', b'1', 'khoahoc'),
(168, '2542295001.jpg', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/2542295001.jpg', b'1', 'giangvien'),
(169, '37432600PikPng.com_java-logo-png_2047616.png', 'https://spec.edu.vn/uploadfileimage/spec/khac/37432600PikPng.com_java-logo-png_2047616.png', b'1', 'khac'),
(170, '179106800java-seeklogo.com.svg', 'https://spec.edu.vn/uploadfileimage/spec/khac/179106800java-seeklogo.com.svg', b'1', 'khac'),
(171, '759113500z2605447812175_20b7d752a1676e3cf0b21c19d94d3987.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khac/759113500z2605447812175_20b7d752a1676e3cf0b21c19d94d3987.jpg', b'1', 'khac'),
(172, '572785700Screenshotxs2021-07-24xs093524.png', 'https://spec.edu.vn/uploadfileimage/spec/khac/572785700Screenshotxs2021-07-24xs093524.png', b'0', 'khac'),
(173, '74107500020201109_145926.png', 'https://spec.edu.vn/uploadfileimage/spec/khac/74107500020201109_145926.png', b'0', 'khac'),
(174, '457166400fff.png', 'https://spec.edu.vn/uploadfileimage/spec/khac/457166400fff.png', b'1', 'khac'),
(175, '73389260015.jpg', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/73389260015.jpg', b'1', 'baiviet'),
(176, '11539930014.jpg', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/11539930014.jpg', b'1', 'baiviet'),
(177, '51884900013.jpg', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/51884900013.jpg', b'1', 'baiviet'),
(178, '44486920012.jpg', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/44486920012.jpg', b'1', 'baiviet'),
(179, '26981260011.jpg', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/26981260011.jpg', b'1', 'baiviet'),
(180, '56124070010.jpg', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/56124070010.jpg', b'1', 'baiviet'),
(181, '5232570009.jpg', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/5232570009.jpg', b'1', 'baiviet'),
(182, '4160139008.jpg', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/4160139008.jpg', b'1', 'baiviet'),
(183, '789644007.jpg', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/789644007.jpg', b'1', 'baiviet'),
(184, '2249750006.jpg', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/2249750006.jpg', b'1', 'baiviet'),
(185, '6310318005.jpg', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/6310318005.jpg', b'1', 'baiviet'),
(186, '9378510004.jpg', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/9378510004.jpg', b'1', 'baiviet'),
(187, '5301957003.jpg', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/5301957003.jpg', b'1', 'baiviet'),
(188, '2701939002.jpg', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/2701939002.jpg', b'1', 'baiviet'),
(189, '8721310001.jpg', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/8721310001.jpg', b'1', 'baiviet'),
(190, '922985200dffdficture1.png', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/922985200dffdficture1.png', b'1', 'baiviet'),
(191, '463847100fsdfsdfds.png', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/463847100fsdfsdfds.png', b'0', 'baiviet'),
(192, '777113800sdfsdfsdfe.png', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/777113800sdfsdfsdfe.png', b'1', 'baiviet'),
(193, '712885500vtk_logo.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khac/712885500vtk_logo.jpg', b'1', 'khac'),
(194, '5735570004bdada6d003df763ae2c.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khac/5735570004bdada6d003df763ae2c.jpg', b'1', 'khac'),
(195, '716732500tienminh123.jpeg', 'https://spec.edu.vn/uploadfileimage/spec/khac/716732500tienminh123.jpeg', b'0', 'khac'),
(196, '295223100tienminh123.jpeg', 'https://spec.edu.vn/uploadfileimage/spec/khac/295223100tienminh123.jpeg', b'0', 'khac'),
(197, '605736800tienminh123.jpeg', 'https://spec.edu.vn/uploadfileimage/spec/khac/605736800tienminh123.jpeg', b'0', 'khac'),
(198, '856909200tienminh123.jpeg', 'https://spec.edu.vn/uploadfileimage/spec/khac/856909200tienminh123.jpeg', b'0', 'khac'),
(199, '483762800tienminh123.jpeg', 'https://spec.edu.vn/uploadfileimage/spec/khac/483762800tienminh123.jpeg', b'0', 'khac'),
(200, '6697248004bdada6d003df763ae2c.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khac/6697248004bdada6d003df763ae2c.jpg', b'0', 'khac'),
(201, '291303200217573619_569138644248169_2076005827414256980_n.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khac/291303200217573619_569138644248169_2076005827414256980_n.jpg', b'0', 'khac'),
(202, '836982500tienminh123.jpeg', 'https://spec.edu.vn/uploadfileimage/spec/khac/836982500tienminh123.jpeg', b'0', 'khac'),
(203, '945055900tienminh123.jpeg', 'https://spec.edu.vn/uploadfileimage/spec/khac/945055900tienminh123.jpeg', b'0', 'khac'),
(204, '433472500tienminh123.jpeg', 'https://spec.edu.vn/uploadfileimage/spec/khac/433472500tienminh123.jpeg', b'1', 'khac'),
(205, '45617000tienminh123.jpeg', 'https://spec.edu.vn/uploadfileimage/spec/khac/45617000tienminh123.jpeg', b'0', 'khac'),
(206, '92543900tienminh123.jpeg', 'https://spec.edu.vn/uploadfileimage/spec/khac/92543900tienminh123.jpeg', b'0', 'khac'),
(207, '32477870083082571_1280697702120717_8095390745910837248_n.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khac/32477870083082571_1280697702120717_8095390745910837248_n.jpg', b'0', 'khac'),
(208, '85810100tienminh123.jpeg', 'https://spec.edu.vn/uploadfileimage/spec/khac/85810100tienminh123.jpeg', b'0', 'khac'),
(209, '186840400tieu-su-ronaldo.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khac/186840400tieu-su-ronaldo.jpg', b'0', 'khac'),
(210, '894672100tienminh123.jpeg', 'https://spec.edu.vn/uploadfileimage/spec/khac/894672100tienminh123.jpeg', b'0', 'khac'),
(211, '255257300tienminh123.jpeg', 'https://spec.edu.vn/uploadfileimage/spec/khac/255257300tienminh123.jpeg', b'0', 'khac'),
(212, '25780800tieu-su-ronaldo.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khac/25780800tieu-su-ronaldo.jpg', b'0', 'khac'),
(213, '668994100tieu-su-ronaldo.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khac/668994100tieu-su-ronaldo.jpg', b'0', 'khac'),
(214, '610416200tieu-su-ronaldo.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khac/610416200tieu-su-ronaldo.jpg', b'0', 'khac'),
(215, '768093000tieu-su-ronaldo.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khac/768093000tieu-su-ronaldo.jpg', b'0', 'khac'),
(216, '490299100tieu-su-ronaldo.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khac/490299100tieu-su-ronaldo.jpg', b'0', 'khac'),
(217, '94323820083082571_1280697702120717_8095390745910837248_n.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khac/94323820083082571_1280697702120717_8095390745910837248_n.jpg', b'0', 'khac'),
(218, '828863000tieu-su-ronaldo.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khac/828863000tieu-su-ronaldo.jpg', b'0', 'khac'),
(219, '81445100ronaldo-juventus.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khac/81445100ronaldo-juventus.jpg', b'0', 'khac'),
(220, '957659100tieu-su-ronaldo.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khac/957659100tieu-su-ronaldo.jpg', b'0', 'khac'),
(221, '645425700tieu-su-ronaldo.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khac/645425700tieu-su-ronaldo.jpg', b'0', 'khac'),
(222, '489461100tieu-su-ronaldo.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khac/489461100tieu-su-ronaldo.jpg', b'0', 'khac'),
(223, '990006800ronaldo-juventus.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khac/990006800ronaldo-juventus.jpg', b'0', 'khac'),
(224, '56267490083082571_1280697702120717_8095390745910837248_n.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khac/56267490083082571_1280697702120717_8095390745910837248_n.jpg', b'0', 'khac'),
(225, '977677100tieu-su-ronaldo.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khac/977677100tieu-su-ronaldo.jpg', b'0', 'khac'),
(226, '368623700tieu-su-ronaldo.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khac/368623700tieu-su-ronaldo.jpg', b'0', 'khac'),
(227, '44657600ronaldo-juventus.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khac/44657600ronaldo-juventus.jpg', b'0', 'khac'),
(228, '74628710083082571_1280697702120717_8095390745910837248_n.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khac/74628710083082571_1280697702120717_8095390745910837248_n.jpg', b'0', 'khac'),
(229, '15563210083082571_1280697702120717_8095390745910837248_n.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khac/15563210083082571_1280697702120717_8095390745910837248_n.jpg', b'0', 'khac'),
(230, '31291230083082571_1280697702120717_8095390745910837248_n.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khac/31291230083082571_1280697702120717_8095390745910837248_n.jpg', b'0', 'khac'),
(231, '29886100083082571_1280697702120717_8095390745910837248_n.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khac/29886100083082571_1280697702120717_8095390745910837248_n.jpg', b'0', 'khac'),
(232, '378014000ronaldo-juventus.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khac/378014000ronaldo-juventus.jpg', b'0', 'khac'),
(233, '103918400217573619_569138644248169_2076005827414256980_n.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khac/103918400217573619_569138644248169_2076005827414256980_n.jpg', b'0', 'khac'),
(234, '531588600ronaldo-juventus.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khac/531588600ronaldo-juventus.jpg', b'0', 'khac'),
(235, '110093700ronaldo-juventus.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khac/110093700ronaldo-juventus.jpg', b'0', 'khac'),
(236, '645339800126330050_101646811781474_3452457867058222136_o.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khac/645339800126330050_101646811781474_3452457867058222136_o.jpg', b'0', 'khac'),
(237, '263368200126330050_101646811781474_3452457867058222136_o.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khac/263368200126330050_101646811781474_3452457867058222136_o.jpg', b'0', 'khac'),
(238, '4656066001.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khac/4656066001.jpg', b'0', 'khac'),
(239, '5373382004bdada6d003df763ae2c.jpg', 'https://spec.edu.vn/uploadfileimage/spec/khac/5373382004bdada6d003df763ae2c.jpg', b'0', 'khac'),
(240, '34001720015.png', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/34001720015.png', b'0', 'baiviet'),
(241, '10622340014.png', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/10622340014.png', b'0', 'baiviet'),
(242, '38920390015.png', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/38920390015.png', b'1', 'baiviet'),
(243, '34292790014.png', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/34292790014.png', b'1', 'baiviet'),
(244, '71836460013.png', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/71836460013.png', b'0', 'baiviet'),
(245, '68830730012.png', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/68830730012.png', b'0', 'baiviet'),
(246, '28282630011.png', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/28282630011.png', b'0', 'baiviet'),
(247, '93973760010.png', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/93973760010.png', b'0', 'baiviet'),
(248, '6904150009.png', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/6904150009.png', b'0', 'baiviet'),
(249, '7535304008.png', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/7535304008.png', b'0', 'baiviet'),
(250, '1604169007.png', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/1604169007.png', b'0', 'baiviet'),
(251, '1767451006.png', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/1767451006.png', b'0', 'baiviet'),
(252, '2713097005.png', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/2713097005.png', b'0', 'baiviet'),
(253, '3500367004.png', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/3500367004.png', b'0', 'baiviet'),
(254, '2257877003.png', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/2257877003.png', b'1', 'baiviet'),
(255, '5859820002.jpg', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/5859820002.jpg', b'1', 'baiviet'),
(256, '5088110001.jpg', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/5088110001.jpg', b'1', 'baiviet'),
(257, '41153930016.png', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/41153930016.png', b'0', 'baiviet'),
(258, '234818700fdsdsffwe-min.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/234818700fdsdsffwe-min.png', b'1', 'giangvien'),
(259, '532030800fdsfd-min.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/532030800fdsfd-min.png', b'1', 'giangvien'),
(260, '344235500dsfsdfre-min.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/344235500dsfsdfre-min.png', b'1', 'giangvien'),
(261, '878143700sdfewew-min.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/878143700sdfewew-min.png', b'1', 'giangvien'),
(262, '607471300sfsdfsdf-min.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/607471300sfsdfsdf-min.png', b'1', 'giangvien'),
(263, '809621700sfadsfasd-min.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/809621700sfadsfasd-min.png', b'1', 'giangvien'),
(264, '427633300sdfsdf-min.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/427633300sdfsdf-min.png', b'1', 'giangvien'),
(265, '256038900dsfdfss-min.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/256038900dsfdfss-min.png', b'1', 'giangvien'),
(266, '2930542001ewes-min.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/2930542001ewes-min.png', b'1', 'giangvien'),
(267, '8268751002dfweds-min.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/8268751002dfweds-min.png', b'1', 'giangvien'),
(268, '1661778003sefsdsf-min.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/1661778003sefsdsf-min.png', b'1', 'giangvien'),
(269, '3121332004sdffgd-min.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/3121332004sdffgd-min.png', b'1', 'giangvien'),
(270, '6951090005sdfefsd-min.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/6951090005sdfefsd-min.png', b'1', 'giangvien'),
(271, '9140912006dfgdfg-min.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/9140912006dfgdfg-min.png', b'1', 'giangvien'),
(272, '903355007dsfdsfsdf-min.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/903355007dsfdsfsdf-min.png', b'1', 'giangvien'),
(273, '125000008dfsdfsd-min.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/125000008dfsdfsd-min.png', b'1', 'giangvien'),
(274, '9292254009đfsdfsdf-min.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/9292254009đfsdfsdf-min.png', b'1', 'giangvien'),
(275, '50136850010sdfsdfresdf-min.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/50136850010sdfsdfresdf-min.png', b'1', 'giangvien'),
(276, '7395683001dewedsd-min.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/7395683001dewedsd-min.png', b'1', 'giangvien'),
(277, '7648490002sdfsdfsd-min.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/7648490002sdfsdfsd-min.png', b'1', 'giangvien'),
(278, '5933467003dsfewsd-min.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/5933467003dsfewsd-min.png', b'1', 'giangvien'),
(279, '4578967004sdfersdf-min.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/4578967004sdfersdf-min.png', b'1', 'giangvien'),
(280, '1329435005sdfesdf-min.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/1329435005sdfesdf-min.png', b'1', 'giangvien'),
(281, '5239999006dgdfgdf-min.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/5239999006dgdfgdf-min.png', b'1', 'giangvien'),
(282, '8123550007dfgdfgdf-min.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/8123550007dfgdfgdf-min.png', b'1', 'giangvien'),
(283, '2512667008fdfgrd-min.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/2512667008fdfgrd-min.png', b'1', 'giangvien'),
(284, '505343009dfsdfew-min.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/505343009dfsdfew-min.png', b'1', 'giangvien'),
(285, '25867920010fsdfewfsd-min.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/25867920010fsdfewfsd-min.png', b'1', 'giangvien'),
(286, '66536410011sdfsdfew-min.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/66536410011sdfsdfew-min.png', b'1', 'giangvien'),
(287, '73770290012fsdferxv-min.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/73770290012fsdferxv-min.png', b'1', 'giangvien'),
(288, '91969860013dsfesdf-min.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/91969860013dsfesdf-min.png', b'1', 'giangvien'),
(289, '63428740014sdfewsd-min.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/63428740014sdfewsd-min.png', b'1', 'giangvien'),
(290, '13577360015sfsdfsdf-min.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/13577360015sfsdfsdf-min.png', b'1', 'giangvien'),
(291, '35483890016dfersd-min.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/35483890016dfersd-min.png', b'1', 'giangvien'),
(292, '84594970017dgrđsf-min.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/84594970017dgrđsf-min.png', b'1', 'giangvien'),
(293, '97125370018gdfgdfg-min.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/97125370018gdfgdfg-min.png', b'1', 'giangvien'),
(294, '61973260019dfgdfg-min.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/61973260019dfgdfg-min.png', b'1', 'giangvien'),
(295, '4026766002sdfsdfsd.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/4026766002sdfsdfsd.png', b'0', 'giangvien'),
(296, '42188800dfsdfe.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/42188800dfsdfe.png', b'1', 'giangvien'),
(297, '543398200Screenshotxs2021-10-05xs141052.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/543398200Screenshotxs2021-10-05xs141052.png', b'1', 'giangvien'),
(298, '833116200Screenshotxs2021-08-02xs153725.png', 'https://spec.edu.vn/uploadfileimage/spec/khac/833116200Screenshotxs2021-08-02xs153725.png', b'0', 'khac'),
(299, '289931300bighero.png', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/289931300bighero.png', b'0', 'giangvien'),
(300, '340000000chi-20-trieu-dong-chang-sinh-vien-hn-ho-bien-phong-tro-cu-thanh-chung-cu-dep-me-lydocx-1613823633290.jpeg', 'https://spec.edu.vn/uploadfileimage/spec/khac/340000000chi-20-trieu-dong-chang-sinh-vien-hn-ho-bien-phong-tro-cu-thanh-chung-cu-dep-me-lydocx-1613823633290.jpeg', b'0', 'khac'),
(301, '146000000Theoxsdõi.png', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/146000000Theoxsdõi.png', b'1', 'baiviet'),
(302, '659000000Screenshotxs2022-01-13xs183118.png', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/659000000Screenshotxs2022-01-13xs183118.png', b'1', 'baiviet'),
(303, '281000000KM.jpg', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/281000000KM.jpg', b'1', 'baiviet'),
(304, '912000000Chặnxsweb.jpg', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/912000000Chặnxsweb.jpg', b'1', 'baiviet');

-- --------------------------------------------------------

--
-- Table structure for table `phan_mem`
--

CREATE TABLE `phan_mem` (
  `id` int NOT NULL,
  `ten` varchar(155) NOT NULL,
  `user_id` int NOT NULL,
  `anh` varchar(300) NOT NULL,
  `mo_ta_ngan` varchar(300) DEFAULT NULL,
  `mo_ta_chi_tiet` mediumtext NOT NULL,
  `ngay_tao` date NOT NULL,
  `gia_ban` int NOT NULL,
  `gia_giam` int NOT NULL,
  `meta_title` varchar(145) NOT NULL,
  `slug` varchar(145) NOT NULL,
  `meta_keyword` varchar(145) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_robot` varchar(45) NOT NULL,
  `deleted` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `small_category`
--

CREATE TABLE `small_category` (
  `id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `deleted` bit(1) NOT NULL,
  `id_big_category` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `small_category`
--

INSERT INTO `small_category` (`id`, `name`, `deleted`, `id_big_category`) VALUES
(1, 'Danh sách học sinh', b'1', 2);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int NOT NULL,
  `phone_number` varchar(45) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `date_of_birth` date NOT NULL,
  `addr_of_birth` varchar(50) NOT NULL COMMENT 'noi sinh',
  `job_current` varchar(100) NOT NULL COMMENT 'công việc hiện tại',
  `name_school` varchar(100) NOT NULL COMMENT 'tên trường',
  `faculty_school` varchar(100) NOT NULL COMMENT 'tên khoa',
  `id_address` int NOT NULL COMMENT 'dia chi chi nhanh',
  `take_certification` bit(1) NOT NULL COMMENT 'nhan chung chi tai dau, yes: tai trung tam, no: gui chuyen phat nhanh ve nha',
  `deleted` bit(1) NOT NULL,
  `status_call` bit(1) NOT NULL COMMENT 'trạng thái đã gọi điện hay chưa, true: rồi, false chưa.',
  `sex` bit(1) NOT NULL,
  `user_id` int NOT NULL,
  `group_student_id` int NOT NULL,
  `code_private` varchar(55) NOT NULL COMMENT 'ma ca nhan',
  `code_gt` varchar(255) NOT NULL COMMENT 'ma cua nguoi gioi thieu',
  `user_id_num` int NOT NULL COMMENT 'luu id cua user ',
  `group_student_id_num` int NOT NULL COMMENT 'luu id cua gr student',
  `course_id_num` int NOT NULL COMMENT 'id khoa hoc ma sinh vien dang ky ',
  `signin_date` date NOT NULL COMMENT 'ngày đăng ký',
  `tuition_fee_of_student` double NOT NULL COMMENT 'hoc phi cua moi student phai dong',
  `check_old_student` bit(1) NOT NULL COMMENT 'true: la hoc sinh cu, false la hoc sinh moi'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `phone_number`, `full_name`, `email`, `address`, `date_of_birth`, `addr_of_birth`, `job_current`, `name_school`, `faculty_school`, `id_address`, `take_certification`, `deleted`, `status_call`, `sex`, `user_id`, `group_student_id`, `code_private`, `code_gt`, `user_id_num`, `group_student_id_num`, `course_id_num`, `signin_date`, `tuition_fee_of_student`, `check_old_student`) VALUES
(32, '0967840437', 'Đỗ Xuân Hiếu - ctv', 'anhhieu@gmail.com', 'hà nội', '2000-10-05', '', 'Sinh viên', 'Đh Xây dựng', 'CNTT', 1, b'1', b'1', b'0', b'0', 9, 2, '323655', '', 9, 2, 13, '2021-05-31', 2125000, b'0'),
(33, '0775378069', 'Phạm Văn Trịnh - ctv', 'trinh202764@nuce.edu.vn', 'Hà Nội', '2001-05-05', '', 'Sinh Viên', 'DH Xây Dựng', 'Tin Học Xây Dựng', 1, b'1', b'1', b'0', b'0', 9, 4, '334065', '', 9, 4, 21, '2021-05-24', 0, b'0'),
(34, '0338585190', 'Chu Xuân Đoàn - ctv', 'doan1512764@nuce.edu.vn', 'Hà Nội', '2001-01-18', '', 'Sinh Viên', 'Đại học Xây Dựng', 'Công Nghệ Thông Tin', 1, b'1', b'1', b'0', b'0', 9, 4, '347734', '323655', 9, 4, 21, '2021-05-24', 0, b'0'),
(35, '0968880402', 'Trần Thế Hiệp', 'hieptran240401@gmail.com', 'Hà Nội', '2001-04-24', '', 'Sinh Viên', 'ĐH Xây Dựng', 'Tin Học Xây Dựng', 1, b'1', b'1', b'0', b'0', 9, 4, '353502', '334065', 9, 4, 21, '2021-05-24', 2000000, b'0'),
(36, '0383476596', 'Tống Phúc Ninh', 'ninh1539764@nuce.edu.vn', 'Hà Nội', '2001-10-19', '', 'Sinh Viên', 'ĐH Xây Dựng', 'Tin Học Xây Dựng', 1, b'1', b'1', b'0', b'0', 9, 4, '366572', '334065', 9, 4, 21, '2021-05-24', 2000000, b'0'),
(37, '0853400493', 'Bùi Quang Hùng', 'hung95564@nuce.edu.nv', 'Hà Nội', '2001-10-17', '', 'Sinh Viên', 'ĐH Xây Dựng', 'TIn Học Xây Dựng', 1, b'1', b'1', b'0', b'0', 9, 4, '379742', '334065', 9, 4, 21, '2021-05-24', 2000000, b'0'),
(38, '0981995517', 'Đỗ Trường Giang', 'giang20301@gmail.com', 'Hà Nội', '2001-03-20', '', 'Sinh Viên', 'ĐH Xây Dựng', 'Tin Học Xây Dựng', 1, b'1', b'1', b'0', b'0', 9, 2, '389165', '334065', 9, 2, 21, '2021-05-24', 2000000, b'0'),
(39, '0389690092', 'Nguyễn Công Thành', 'congthanh9a@gmail.com', 'Hà Nội', '2001-07-08', '', 'Sinh Viên', 'ĐH Xây Dựng', 'Tin Học Xây Dựng', 1, b'1', b'1', b'0', b'0', 9, 2, '393034', '334065', 9, 2, 21, '2021-05-24', 2000000, b'0'),
(40, '0974027256', 'Nguyễn Công Hiếu', 'hieu77164@nuce.edu.vn', 'Ngõ 297, đường Hoàng Mai, Hà Nội', '2001-10-22', '', 'Sinh vjeen', 'Đại học Xây Dựng', 'CNTT', 1, b'0', b'1', b'0', b'0', 9, 2, '407599', '334065', 9, 2, 21, '2021-05-24', 2000000, b'0'),
(41, '0366231969', 'Lê Tuấn Hoàng', 'tuanhoang151015@gmail.com', 'Hà Nội', '2001-07-02', '', 'Sinh Viên', 'ĐH Xây Dựng', 'Tin Học Xây Dựng', 1, b'1', b'1', b'0', b'0', 9, 4, '416128', '334065', 9, 4, 21, '2021-05-24', 2000000, b'0'),
(42, '0974027256', 'Nguyễn Công Hiếu', 'hieu77164@nuce.edu.vn', 'Hà Nội', '2001-10-22', '', 'Sinh Viên', 'ĐH Xây Dựng', 'Tin Học Xây Dựng', 1, b'1', b'1', b'0', b'0', 9, 2, '426615', '334065', 9, 2, 21, '2021-05-27', 2000000, b'0'),
(43, '0946480312', 'Phạm Văn Hoàng', 'hoang1521864@nuce.edu.vn', 'Hà Nội', '2001-01-27', '', 'Sinh Viên', 'ĐH Xây Dựng', 'Tin Học Xây Dựng', 1, b'1', b'1', b'0', b'0', 9, 2, '432117', '334065', 9, 2, 21, '2021-05-27', 2000000, b'0'),
(44, '0985962184', 'Nguyễn Đình Việt', 'vietsbtc123@gmail.com', 'Hà Nội', '2001-10-06', '', 'Sinh Viên', 'ĐH Xây Dựng', 'Tin Học Xây dựng', 1, b'1', b'1', b'0', b'0', 9, 8, '443884', '334065', 9, 8, 21, '2021-05-24', 2000000, b'0'),
(45, '0971492007', 'Đạt', 'dat46264@nuce.edu.vn', 'Hà Nội', '2001-04-06', '', 'Sinh Viên', 'ĐH Xây Dựng', 'Tin Học Xây Dựng', 1, b'1', b'1', b'0', b'0', 9, 2, '456107', '334065', 9, 2, 21, '2021-05-27', 2000000, b'0'),
(46, '0971747621', 'Nguyễn Văn Dũng', 'dung35764@nuce.edu.vn', 'Hà Nội', '2001-03-20', '', 'SInh Viên', 'ĐH Xây Dựng', 'TIn Học Xây Dựng', 1, b'1', b'1', b'0', b'0', 9, 8, '468047', '334065', 9, 8, 21, '2021-05-24', 2000000, b'0'),
(47, '0397338193', 'Trần Tiến Anh', 'anh13864@nuce.edu.vn', 'Hà Nội', '2001-02-18', '', 'Sinh Viên', 'ĐH Xây Dựng', 'TIn Học Xây Dựng', 1, b'1', b'1', b'0', b'0', 9, 8, '476807', '334065', 9, 8, 21, '2021-05-24', 2000000, b'0'),
(48, '0387643110', 'Ngô Trung Dũng', 'dung1508264@nuce.edu.vn', 'Hà Nội', '2001-05-30', '', 'Sinh Viên', 'ĐH Xây Đựng', 'Tin Học Xây Dựng', 1, b'1', b'1', b'0', b'0', 9, 6, '481571', '334065', 9, 6, 21, '2021-05-24', 2000000, b'0'),
(49, '0969803756', 'Hoàng Ngọc Thanh', 'thanh182264@nuce.edu.vn', 'Hà Nội', '2000-11-13', '', 'Sinh Viên', 'ĐH Xây Dựng', 'Tin Học Xây Dựng', 1, b'1', b'1', b'0', b'0', 9, 6, '495257', '334065', 9, 6, 21, '2021-05-24', 2000000, b'0'),
(50, '0378616871', 'Phan Văn Khải', 'khai18864@nuce.edu.vn', 'Hà Nội', '2001-01-01', '', 'SInh Viên ', 'ĐH Xây Dựng', 'Tin Học Xây Dựng', 1, b'1', b'1', b'0', b'0', 9, 6, '505009', '334065', 9, 6, 21, '2021-05-24', 2000000, b'0'),
(51, '0348534077', 'Phó Đức Hải', 'hai67364@nuce.edu.vn', 'Hà Nội', '2001-08-24', '', 'Sinh Viên', 'ĐH Xây Dựng', 'Tin Học Xây Dựng', 1, b'1', b'1', b'0', b'0', 9, 6, '519134', '334065', 9, 6, 21, '2021-05-24', 2000000, b'0'),
(52, '0388867864', 'Nguyễn Minh Hiếu', 'dragonmid227@gmail.com', 'Hà Nội', '2001-07-22', '', 'Sinh Viên', 'ĐH Xây Dựng', 'TIn Học Xây Dựng', 1, b'1', b'1', b'0', b'0', 9, 6, '528482', '334065', 9, 6, 21, '2021-05-24', 2000000, b'0'),
(53, '0989913526', 'Nguyễn Văn Hòa', 'hoa1519464@nuce.edu.vn', 'Hà Nội', '2001-09-14', '', 'SInh Viên', 'ĐH Xây Dựng', 'Tin Học Xây Dựng', 1, b'1', b'1', b'0', b'0', 9, 4, '534926', '347734', 9, 4, 21, '2021-05-24', 0, b'0'),
(56, '0344440199', 'Nguyễn Xuân Tiến', 'tienkimtan1411@gmail.com', 'số 66, tổ 7, thị trấn Đông Anh, Hà Nội', '2000-11-14', '', 'Sinh viên', 'Đại học xây dựng ', 'Khoa CNTT', 1, b'1', b'1', b'0', b'0', 9, 4, '567496', '', 9, 4, 21, '2021-05-24', 0, b'0'),
(57, '0344440199', 'Nguyễn Xuân Tiến', 'tienkimtan1411@gmail.com', ' ', '2000-11-14', ' ', ' ', ' ', ' ', 1, b'1', b'1', b'1', b'0', 2, 4, '578864', '', 2, 4, 21, '2021-05-27', 2500000, b'0'),
(59, '0382097688', 'Nguyễn Tuấn Thành ', 'entiadnan2k@gmail.com', '129 lê trojgn sdkjfhgsidjf', '2021-07-06', '', 'sdfewrf', 'ưerqere', 'êrewr', 1, b'1', b'1', b'0', b'0', 2, 6, '593581', '323655', 2, 6, 13, '2021-06-01', 2375000, b'0'),
(60, '0942662582', 'Lê Minh Hiếu', 'hieu1516963@nuce.edu.vn', '29 Giáp Nhị Thịnh Liệt Hoàng Mai Hà Nội', '2000-03-14', '', 'Sinh viên', 'Đại học Xây Dựng', 'Công nghệ thông tin', 1, b'1', b'1', b'0', b'0', 2, 8, '601954', '323655', 2, 8, 13, '2021-06-01', 2375000, b'0'),
(61, '0903662344', 'Trần duy hùng', 'hungksxd2@gmail.com', ' ', '1982-10-24', ' ', ' ', ' ', ' ', 1, b'1', b'1', b'1', b'0', 2, 5, '616384', '', 2, 5, 25, '2021-06-10', 790000, b'0'),
(62, '0903662344', 'Trần duy hùng', 'hungksxd2@gmail.com', ' ', '1982-10-24', ' ', ' ', ' ', ' ', 1, b'1', b'1', b'1', b'0', 2, 8, '623108', '', 2, 8, 25, '2021-06-10', 790000, b'0'),
(64, '0767400239', 'Trương Vỹ khang', 'nhoxkhang999@gmail.com', '31 đường 37 phường 10 quận 6 tphcm', '1999-08-18', '', 'sinh viên', 'FPT', 'Jetking', 1, b'0', b'1', b'0', b'0', 2, 2, '644595', '', 2, 2, 21, '2021-07-12', 2000000, b'0'),
(65, '0949360348', 'Minh Đạt', 'dangminhdat02051999@gmail.com', ' ', '1999-05-02', ' ', ' ', ' ', ' ', 1, b'1', b'1', b'1', b'0', 2, 5, '658753', '', 2, 5, 21, '2021-07-13', 2000000, b'0'),
(66, '0949360348', 'Minh Đạt', 'dangminhdat02051999@gmail.com', ' ', '1999-05-02', ' ', ' ', ' ', ' ', 1, b'1', b'1', b'1', b'0', 2, 2, '665084', '', 2, 2, 21, '2021-07-13', 2000000, b'0'),
(67, '0917310483', 'Thùy Nương', 'phanthuynuong@gmal.com', 'Số 10 đường N6, Kdc Phú Hòa , Tbur Dầu Một, Bình Dương', '2012-07-07', '', 'Học sinh lớp 4', 'Trương prm', 'Lập trình Scratch', 1, b'0', b'1', b'0', b'0', 8, 1, '672169', '', 8, 1, 12, '2021-07-19', 1600000, b'0'),
(68, '0989427809', 'Võ Ngọc Xuân Thiện', 'vo.nxuanthien@gmail.com', 'TP Hồ Chí Minh', '1998-08-26', '', 'chưa biết', 'chưa biết', 'chưa biết', 1, b'0', b'1', b'0', b'0', 2, 2, '686998', '', 2, 2, 21, '2021-07-28', 2000000, b'0'),
(69, '0987546215', 'dsfsd', 'sdfsdf@gmail.com', 'sdfsd', '2021-08-09', '', 'sdfsdfsd', 'sdfsdf', 'sdfsdf', 1, b'0', b'1', b'0', b'1', 8, 2, '697643', '', 8, 2, 13, '2021-08-15', 2800000, b'0'),
(70, '0938960115', 'Tran Minh Thong', 'tranvanty@gmail.com', ' ', '2014-04-21', ' ', ' ', ' ', ' ', 1, b'1', b'1', b'1', b'0', 8, 5, '707935', '', 8, 5, 12, '2021-09-14', 1600000, b'0'),
(71, '0868757693', 'Nguyễn Khánh Thư', 'thu193866@nuce.edu.vn', 'Thanh Thủy Phú Thọ', '2002-03-31', '', 'Sinh viên', 'Trường Đại học Xây Dựng Hà Nội', 'k65', 1, b'0', b'1', b'0', b'1', 8, 1, '719780', '', 8, 1, 9, '2021-10-02', 2000000, b'0'),
(72, '0987654321', 'hehehehe', 'anhhh@gmail.com', 'sdfdsf', '2021-10-14', '', 'sdfsdf', 'sdfds', 'dsfdsfs', 1, b'0', b'1', b'0', b'1', 1, 6, '725725', '', 1, 6, 9, '2021-10-02', 2000000, b'0'),
(73, '0987654321', 'hehehehe', 'hehe@gmail.com', 'sdfsdf', '2021-10-13', '', 'sdfsdf', 'sdfsdf', 'sdfsdf', 1, b'0', b'1', b'0', b'1', 1, 6, '733777', '', 1, 6, 9, '2021-10-02', 1700000, b'0'),
(74, '0987654321', 'hehehehe', 'hehe@gmail.com', 'sdfsdf', '2021-10-13', '', 'sdfsdf', 'sdfsdf', 'sdfsdf', 1, b'0', b'1', b'0', b'1', 1, 6, '747429', '733777', 1, 6, 9, '2021-10-02', 1900000, b'0'),
(76, '0918250368', 'Phan Ngọc Tuyền', 'tuyenktktcamau@gmail.com', ' ', '1979-06-15', ' ', ' ', ' ', ' ', 1, b'1', b'1', b'1', b'0', 8, 1, '766567', '', 8, 1, 24, '2021-11-12', 2800000, b'0'),
(77, '0918250368', 'Phan Ngọc Tuyền', 'tuyenktktcamau@gmail.com', ' ', '1979-06-15', ' ', ' ', ' ', ' ', 1, b'1', b'1', b'1', b'0', 2, 1, '777673', '', 2, 1, 24, '2021-11-12', 2800000, b'0'),
(78, '0918250368', 'Phan Ngọc Tuyền', 'tuyenktktcamau@gmail.com', ' ', '1979-06-15', ' ', ' ', ' ', ' ', 1, b'1', b'1', b'1', b'0', 8, 1, '786352', '', 8, 1, 21, '2021-11-12', 2000000, b'0'),
(79, '0386357797', 'Phan Văn Anh Nhật', 'phanvananhnhat@gmail.com', 'Hà Nội', '1996-08-23', '', 'Không biết', 'không biết', 'không biết', 1, b'0', b'1', b'0', b'0', 8, 2, '791099', '', 8, 2, 24, '2021-11-15', 2800000, b'0');

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `deleted` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`id`, `name`, `deleted`) VALUES
(3, 'Java', b'1'),
(4, 'Python', b'1'),
(5, 'Sping', b'1'),
(16, 'Minecraft', b'1'),
(19, 'fullstack', b'1'),
(20, 'HocWeb', b'1'),
(21, 'laptrinh', b'1'),
(22, 'robot', b'1'),
(23, 'laptringdongian', b'1'),
(24, 'laptrinhchobe', b'1'),
(25, 'rso', b'1'),
(27, 'zoom', b'1'),
(28, 'hoconline', b'1'),
(29, '', b'1'),
(30, 'zoom', b'1'),
(31, 'hoconline', b'1'),
(32, 'zoom', b'1'),
(33, 'zoom', b'1'),
(34, '', b'1'),
(35, '', b'1'),
(36, 'hoconline', b'1'),
(37, 'hoconline', b'1'),
(38, 'goodChild', b'1'),
(39, 'ChanYoutube', b'1'),
(40, 'ChanGameMayTinh', b'1'),
(41, 'ChanGameOnline', b'1'),
(42, 'ChanGameMayTinh', b'1'),
(43, 'ChanGameOnline', b'1'),
(44, 'Azota', b'1'),
(45, 'Azota', b'1'),
(46, 'ChanGame', b'1'),
(47, 'ChanGame', b'1'),
(48, 'ChanYoutube', b'1'),
(49, '', b'1'),
(50, 'Zoom', b'1'),
(51, '', b'1'),
(52, '', b'1'),
(53, 'Zoom', b'1'),
(54, '', b'1'),
(55, '', b'1'),
(56, '', b'1'),
(57, '', b'1'),
(58, '', b'1'),
(59, '', b'1'),
(60, '', b'1'),
(61, 'ChanGame', b'1'),
(62, '', b'1'),
(63, 'ChanGameOnline', b'1'),
(64, 'ChanYoutube', b'1'),
(65, 'ChanGameMayTinh', b'1'),
(66, 'Azota', b'1'),
(67, 'Zoom', b'1'),
(68, '', b'1'),
(69, '', b'1'),
(70, '', b'1'),
(71, '', b'1'),
(72, 'ChanGame', b'1'),
(73, 'Zoom', b'1'),
(74, 'ChanGameMayTinh', b'1'),
(75, 'ChanGameOnline', b'1'),
(76, '', b'1'),
(77, 'ChanGame', b'1'),
(78, 'ChanYoutube', b'1'),
(79, 'ChanYoutube', b'1'),
(80, 'ChanGameOnline', b'1'),
(81, 'ChanGameMayTinh', b'1'),
(82, 'Azota', b'1'),
(83, '', b'1'),
(84, 'Zoom', b'1'),
(85, 'Azota', b'1'),
(86, '', b'1'),
(87, '', b'1'),
(88, '', b'1'),
(89, '', b'1'),
(90, '', b'1'),
(91, '', b'1'),
(92, '', b'1'),
(93, '', b'1'),
(94, 'ChanGame', b'1'),
(95, 'ChanYoutube', b'1'),
(96, 'ChanGame', b'1'),
(97, 'ChanGameMayTinh', b'1'),
(98, 'ChanGameOnline', b'1'),
(99, 'Azota', b'1'),
(100, 'ChanGameOnline', b'1'),
(101, 'ChanGameMayTinh', b'1'),
(102, '', b'1'),
(103, '', b'1'),
(104, 'ChanYoutube', b'1'),
(105, 'Zoom', b'1'),
(106, '', b'1'),
(107, 'Zoom', b'1'),
(108, 'Azota', b'1'),
(109, '', b'1'),
(110, 'ChanYoutube', b'1'),
(111, 'Azota', b'1'),
(112, '', b'1'),
(113, '', b'1'),
(114, '', b'1'),
(115, '', b'1'),
(116, 'ChanGame', b'1'),
(117, 'ChanGameOnline', b'1'),
(118, '', b'1'),
(119, 'ChanGameMayTinh', b'1'),
(120, 'Zoom', b'1'),
(121, '', b'1'),
(122, '', b'1'),
(123, '', b'1'),
(124, '', b'1'),
(125, '', b'1'),
(126, '', b'1'),
(127, 'ChanGame', b'1'),
(128, 'ChanGameMayTinh', b'1'),
(129, '', b'1'),
(130, 'Zoom', b'1'),
(131, 'ChanGameOnline', b'1'),
(132, '', b'1'),
(133, 'ChanYoutube', b'1'),
(134, 'Azota', b'1'),
(135, 'Zoom', b'1'),
(136, 'Azota', b'1'),
(137, 'Zoom', b'1'),
(138, '', b'1'),
(139, 'ChanGame', b'1'),
(140, 'ChanYoutube', b'1'),
(141, 'ChanGameMayTinh', b'1'),
(142, 'ChanYoutube', b'1'),
(143, 'ChanGame', b'1'),
(144, 'ChanGameOnline', b'1'),
(145, 'ChanGameOnline', b'1'),
(146, '', b'1'),
(147, 'ChanGameMayTinh', b'1'),
(148, 'ChanGameOnline', b'1'),
(149, '', b'1'),
(150, 'ChanGame', b'1'),
(151, 'Zoom', b'1'),
(152, 'Azota', b'1'),
(153, 'Azota', b'1'),
(154, '', b'1'),
(155, 'ChanGameMayTinh', b'1'),
(156, 'ChanYoutube', b'1'),
(157, '', b'1'),
(158, '', b'1'),
(159, '', b'1'),
(160, '', b'1'),
(161, '', b'1'),
(162, '', b'1'),
(163, '', b'1'),
(164, '', b'1'),
(165, '', b'1'),
(166, '', b'1'),
(167, '', b'1'),
(168, '', b'1'),
(169, '', b'1'),
(170, '', b'1'),
(171, 'ChanGameMayTinh', b'1'),
(172, 'ChanYoutube', b'1'),
(173, '', b'1'),
(174, 'ChanGameMayTinh', b'1'),
(175, 'ChanGameOnline', b'1'),
(176, 'Zoom', b'1'),
(177, 'Zoom', b'1'),
(178, 'ChanGame', b'1'),
(179, 'Azota', b'1'),
(180, 'ChanGameMayTinh', b'1'),
(181, 'ChanGameOnline', b'1'),
(182, '', b'1'),
(183, 'ChanYoutube', b'1'),
(184, 'Azota', b'1'),
(185, 'ChanGame', b'1'),
(186, 'ChanGame', b'1'),
(187, 'ChanGameMayTinh', b'1'),
(188, 'ChanYoutube', b'1'),
(189, 'Zoom', b'1'),
(190, '', b'1'),
(191, 'ChanGameOnline', b'1'),
(192, 'Azota', b'1'),
(193, 'ChanYoutube', b'1'),
(194, 'ChanGameMayTinh', b'1'),
(195, '', b'1'),
(196, 'ChanGame', b'1'),
(197, 'Zoom', b'1'),
(198, 'ChanGameOnline', b'1'),
(199, '', b'1'),
(200, 'ChanGameOnline', b'1'),
(201, 'Azota', b'1'),
(202, 'ChanYoutube', b'1'),
(203, 'ChanGame', b'1'),
(204, 'Zoom', b'1'),
(205, 'Azota', b'1'),
(206, '', b'1'),
(207, '', b'1'),
(208, '', b'1'),
(209, '', b'1'),
(210, '', b'1'),
(211, '', b'1'),
(212, '', b'1'),
(213, '', b'1'),
(214, '', b'1'),
(215, '', b'1'),
(216, '', b'1'),
(217, '', b'1'),
(218, '', b'1'),
(219, '', b'1'),
(220, '', b'1'),
(221, '', b'1'),
(222, '', b'1'),
(223, '', b'1'),
(224, '', b'1'),
(225, '', b'1'),
(226, 'ChanGame', b'1'),
(227, '', b'1'),
(228, 'ChanYoutube', b'1'),
(229, '', b'1'),
(230, 'Azota', b'1'),
(231, 'Zoom', b'1'),
(232, 'ChanGameMayTinh', b'1'),
(233, 'ChanGameOnline', b'1'),
(234, '', b'1'),
(235, '', b'1'),
(236, 'ChanGame', b'1'),
(237, 'ChanGameMayTinh', b'1'),
(238, 'ChanYoutube', b'1'),
(239, 'ChanGameOnline', b'1'),
(240, 'Azota', b'1'),
(241, 'ChanGame', b'1'),
(242, 'Zoom', b'1'),
(243, 'ChanYoutube', b'1'),
(244, 'Zoom', b'1'),
(245, 'ChanGameMayTinh', b'1'),
(246, 'Zoom', b'1'),
(247, '', b'1'),
(248, 'Azota', b'1'),
(249, 'ChanGameOnline', b'1'),
(250, 'Azota', b'1'),
(251, 'ChanGameOnline', b'1'),
(252, 'ChanGameOnline', b'1'),
(253, 'ChanGame', b'1'),
(254, 'ChanGameMayTinh', b'1'),
(255, 'Azota', b'1'),
(256, 'ChanYoutube', b'1'),
(257, 'ChanGameMayTinh', b'1'),
(258, '', b'1'),
(259, 'ChanGame', b'1'),
(260, 'Azota', b'1'),
(261, 'ChanYoutube', b'1'),
(262, 'Zoom', b'1'),
(263, 'ChanGameOnline', b'1'),
(264, 'ChanYoutube', b'1'),
(265, 'ChanGameMayTinh', b'1'),
(266, 'Zoom', b'1'),
(267, 'ChanGame', b'1'),
(268, '', b'1'),
(269, '', b'1'),
(270, '', b'1'),
(271, '', b'1'),
(272, '', b'1'),
(273, '', b'1'),
(274, '', b'1'),
(275, '', b'1'),
(276, '', b'1'),
(277, '', b'1'),
(278, '', b'1'),
(279, '', b'1'),
(280, '', b'1'),
(281, '', b'1'),
(282, '', b'1'),
(283, '', b'1'),
(284, '', b'1'),
(285, '', b'1'),
(286, '', b'1'),
(287, '', b'1'),
(288, '', b'1'),
(289, '', b'1'),
(290, '', b'1'),
(291, '', b'1'),
(292, 'ChanGame', b'1'),
(293, 'Zoom', b'1'),
(294, 'ChanGameOnline', b'1'),
(295, 'ChanYoutube', b'1'),
(296, '', b'1'),
(297, '', b'1'),
(298, 'Azota', b'1'),
(299, '', b'1'),
(300, 'Zoom', b'1'),
(301, '', b'1'),
(302, 'ChanGameOnline', b'1'),
(303, 'ChanGame', b'1'),
(304, 'Zoom', b'1'),
(305, 'Azota', b'1'),
(306, 'ChanGame', b'1'),
(307, 'ChanGameMayTinh', b'1'),
(308, 'ChanGameMayTinh', b'1'),
(309, 'ChanGameOnline', b'1'),
(310, 'Azota', b'1'),
(311, 'Zoom', b'1'),
(312, 'ChanGameMayTinh', b'1'),
(313, 'ChanGameOnline', b'1'),
(314, 'Azota', b'1'),
(315, 'ChanYoutube', b'1'),
(316, 'ChanGameOnline', b'1'),
(317, 'ChanYoutube', b'1'),
(318, 'ChanGame', b'1'),
(319, '', b'1'),
(320, 'Zoom', b'1'),
(321, 'ChanGameMayTinh', b'1'),
(322, 'Azota', b'1'),
(323, 'ChanGameMayTinh', b'1'),
(324, '', b'1'),
(325, 'ChanYoutube', b'1'),
(326, 'ChanYoutube', b'1'),
(327, 'ChanGame', b'1'),
(328, '', b'1'),
(329, 'ChanGame', b'1'),
(330, 'Zoom', b'1'),
(331, 'Azota', b'1'),
(332, '', b'1'),
(333, 'ChanGameOnline', b'1'),
(334, 'ChanGameMayTinh', b'1'),
(335, 'ChanYoutube', b'1'),
(336, 'Zoom', b'1'),
(337, 'ChanGame', b'1'),
(338, 'ChanGameOnline', b'1'),
(339, 'Azota', b'1'),
(340, '', b'1'),
(341, 'ChanYoutube', b'1'),
(342, 'ChanGameMayTinh', b'1'),
(343, '', b'1'),
(344, '', b'1'),
(345, '', b'1'),
(346, '', b'1'),
(347, '', b'1'),
(348, '', b'1'),
(349, '', b'1'),
(350, '', b'1'),
(351, '', b'1'),
(352, '', b'1'),
(353, '', b'1'),
(354, '', b'1'),
(355, '', b'1'),
(356, '', b'1'),
(357, '', b'1'),
(358, '', b'1'),
(359, '', b'1'),
(360, '', b'1'),
(361, '', b'1'),
(362, '', b'1'),
(363, '', b'1'),
(364, '', b'1'),
(365, '', b'1'),
(366, '', b'1'),
(367, '', b'1'),
(368, '', b'1'),
(369, 'ChanGame', b'1'),
(370, 'ChanYoutube', b'1'),
(371, 'ChanGameMayTinh', b'1'),
(372, '', b'1'),
(373, 'ChanGameOnline', b'1'),
(374, 'Azota', b'1'),
(375, 'Zoom', b'1'),
(376, '', b'1'),
(377, '', b'1'),
(378, '', b'1'),
(379, '', b'1'),
(380, 'ChanGame', b'1'),
(381, 'Zoom', b'1'),
(382, '', b'1'),
(383, '', b'1'),
(384, '', b'1'),
(385, 'ChanGameMayTinh', b'1'),
(386, 'Azota', b'1'),
(387, '', b'1'),
(388, 'ChanGame', b'1'),
(389, 'ChanGameOnline', b'1'),
(390, 'ChanYoutube', b'1'),
(391, 'ChanGame', b'1'),
(392, 'ChanGameOnline', b'1'),
(393, 'ChanYoutube', b'1'),
(394, 'ChanGameOnline', b'1'),
(395, 'Zoom', b'1'),
(396, 'Azota', b'1'),
(397, 'ChanGame', b'1'),
(398, 'ChanGameMayTinh', b'1'),
(399, 'ChanYoutube', b'1'),
(400, 'ChanGame', b'1'),
(401, 'ChanGameMayTinh', b'1'),
(402, 'ChanGame', b'1'),
(403, 'Zoom', b'1'),
(404, 'ChanYoutube', b'1'),
(405, 'Azota', b'1'),
(406, 'ChanGameMayTinh', b'1'),
(407, 'ChanGame', b'1'),
(408, 'ChanGameOnline', b'1'),
(409, 'Azota', b'1'),
(410, '', b'1'),
(411, 'ChanGameMayTinh', b'1'),
(412, 'ChanGameOnline', b'1'),
(413, 'ChanGameOnline', b'1'),
(414, 'ChanGameOnline', b'1'),
(415, 'Zoom', b'1'),
(416, 'ChanYoutube', b'1'),
(417, 'Azota', b'1'),
(418, 'ChanGameMayTinh', b'1'),
(419, 'Zoom', b'1'),
(420, 'ChanGameOnline', b'1'),
(421, '', b'1'),
(422, '', b'1'),
(423, 'ChanYoutube', b'1'),
(424, 'ChanGameMayTinh', b'1'),
(425, 'ChanYoutube', b'1'),
(426, '', b'1'),
(427, 'Zoom', b'1'),
(428, 'ChanGame', b'1'),
(429, 'Zoom', b'1'),
(430, 'Azota', b'1'),
(431, 'Azota', b'1'),
(432, 'ChanGameMayTinh', b'1'),
(433, '', b'1'),
(434, 'Zoom', b'1'),
(435, 'ChanYoutube', b'1'),
(436, '', b'1'),
(437, 'Azota', b'1'),
(438, '', b'1'),
(439, '', b'1'),
(440, '', b'1'),
(441, '', b'1'),
(442, '', b'1'),
(443, '', b'1'),
(444, '', b'1'),
(445, '', b'1'),
(446, '', b'1'),
(447, '', b'1'),
(448, '', b'1'),
(449, '', b'1'),
(450, '', b'1'),
(451, '', b'1'),
(452, '', b'1'),
(453, '', b'1'),
(454, '', b'1'),
(455, '', b'1'),
(456, '', b'1'),
(457, '', b'1'),
(458, '', b'1'),
(459, '', b'1'),
(460, '', b'1'),
(461, '', b'1'),
(462, '', b'1'),
(463, '', b'1'),
(464, '', b'1'),
(465, '', b'1'),
(466, '', b'1'),
(467, '', b'1'),
(468, 'ChanGameMayTinh', b'1'),
(469, 'Azota', b'1'),
(470, '', b'1'),
(471, 'ChanGame', b'1'),
(472, '', b'1'),
(473, 'ChanYoutube', b'1'),
(474, '', b'1'),
(475, 'Zoom', b'1'),
(476, 'Zoom', b'1'),
(477, 'ChanGame', b'1'),
(478, 'ChanGameOnline', b'1'),
(479, 'ChanGameOnline', b'1'),
(480, 'Zoom', b'1'),
(481, 'ChanGameMayTinh', b'1'),
(482, 'ChanYoutube', b'1'),
(483, 'Azota', b'1'),
(484, 'ChanYoutube', b'1'),
(485, 'ChanGame', b'1'),
(486, 'Zoom', b'1'),
(487, 'ChanYoutube', b'1'),
(488, 'ChanGameOnline', b'1'),
(489, 'ChanGame', b'1'),
(490, 'Azota', b'1'),
(491, '', b'1'),
(492, 'ChanGame', b'1'),
(493, '', b'1'),
(494, 'ChanGameMayTinh', b'1'),
(495, 'ChanYoutube', b'1'),
(496, '', b'1'),
(497, 'ChanGameMayTinh', b'1'),
(498, 'Azota', b'1'),
(499, 'ChanGameMayTinh', b'1'),
(500, 'ChanGameOnline', b'1'),
(501, 'Zoom', b'1'),
(502, 'ChanGameOnline', b'1'),
(503, 'ChanGame', b'1'),
(504, 'Azota', b'1'),
(505, 'ChanYoutube', b'1'),
(506, '', b'1'),
(507, 'ChanGameMayTinh', b'1'),
(508, 'ChanYoutube', b'1'),
(509, 'ChanGameMayTinh', b'1'),
(510, 'Azota', b'1'),
(511, '', b'1'),
(512, 'ChanGame', b'1'),
(513, 'Zoom', b'1'),
(514, 'ChanGameOnline', b'1'),
(515, 'ChanGame', b'1'),
(516, 'ChanGameMayTinh', b'1'),
(517, '', b'1'),
(518, 'ChanGameOnline', b'1'),
(519, 'ChanYoutube', b'1'),
(520, 'Zoom', b'1'),
(521, 'Azota', b'1'),
(522, 'ChanGame', b'1'),
(523, 'ChanGameOnline', b'1'),
(524, 'ChanGameMayTinh', b'1'),
(525, 'Zoom', b'1'),
(526, '', b'1'),
(527, 'ChanYoutube', b'1'),
(528, 'Azota', b'1'),
(529, 'ChanGameOnline', b'1'),
(530, 'Zoom', b'1'),
(531, '', b'1'),
(532, 'Azota', b'1'),
(533, '', b'1'),
(534, '', b'1'),
(535, '', b'1'),
(536, '', b'1'),
(537, '', b'1'),
(538, '', b'1'),
(539, '', b'1'),
(540, '', b'1'),
(541, '', b'1'),
(542, '', b'1'),
(543, '', b'1'),
(544, '', b'1'),
(545, '', b'1'),
(546, '', b'1'),
(547, '', b'1'),
(548, '', b'1'),
(549, '', b'1'),
(550, '', b'1'),
(551, '', b'1'),
(552, '', b'1'),
(553, '', b'1'),
(554, '', b'1'),
(555, '', b'1'),
(556, '', b'1'),
(557, '', b'1'),
(558, '', b'1'),
(559, '', b'1'),
(560, '', b'1'),
(561, '', b'1'),
(562, '', b'1'),
(563, '', b'1'),
(564, '', b'1'),
(565, '', b'1'),
(566, '', b'1'),
(567, 'Zoom', b'1'),
(568, 'ChanGame', b'1'),
(569, '', b'1'),
(570, 'ChanGameMayTinh', b'1'),
(571, 'Azota', b'1'),
(572, 'ChanGameOnline', b'1'),
(573, 'ChanYoutube', b'1'),
(574, '', b'1'),
(575, '', b'1'),
(576, '', b'1'),
(577, 'Zoom', b'1'),
(578, '', b'1'),
(579, 'ChanGameMayTinh', b'1'),
(580, 'ChanYoutube', b'1'),
(581, 'Azota', b'1'),
(582, 'ChanGame', b'1'),
(583, 'ChanGameOnline', b'1'),
(584, 'ChanGameOnline', b'1'),
(585, 'ChanGame', b'1'),
(586, 'ChanYoutube', b'1'),
(587, 'ChanGameMayTinh', b'1'),
(588, 'ChanYoutube', b'1'),
(589, 'Zoom', b'1'),
(590, 'ChanGame', b'1'),
(591, 'Azota', b'1'),
(592, 'Zoom', b'1'),
(593, 'ChanGameOnline', b'1'),
(594, 'ChanGameMayTinh', b'1'),
(595, 'Zoom', b'1'),
(596, 'ChanGame', b'1'),
(597, '', b'1'),
(598, 'Azota', b'1'),
(599, 'Zoom', b'1'),
(600, 'Azota', b'1'),
(601, 'ChanYoutube', b'1'),
(602, 'ChanGameMayTinh', b'1'),
(603, 'ChanGameOnline', b'1'),
(604, 'ChanYoutube', b'1'),
(605, 'ChanGame', b'1'),
(606, 'ChanGameOnline', b'1'),
(607, 'Azota', b'1'),
(608, '', b'1'),
(609, 'ChanGameMayTinh', b'1'),
(610, 'Azota', b'1'),
(611, 'ChanGame', b'1'),
(612, 'Zoom', b'1'),
(613, 'ChanYoutube', b'1'),
(614, 'ChanGameOnline', b'1'),
(615, 'ChanGameMayTinh', b'1'),
(616, '', b'1'),
(617, 'ChanGame', b'1'),
(618, 'ChanGameMayTinh', b'1'),
(619, '', b'1'),
(620, 'ChanGame', b'1'),
(621, 'Azota', b'1'),
(622, '', b'1'),
(623, 'ChanGameOnline', b'1'),
(624, 'ChanGameOnline', b'1'),
(625, '', b'1'),
(626, 'ChanGameMayTinh', b'1'),
(627, 'Azota', b'1'),
(628, '', b'1'),
(629, '', b'1'),
(630, '', b'1'),
(631, 'Zoom', b'1'),
(632, 'ChanGameOnline', b'1'),
(633, 'ChanGameMayTinh', b'1'),
(634, 'Azota', b'1'),
(635, 'ChanGame', b'1'),
(636, 'ChanYoutube', b'1'),
(637, 'ChanYoutube', b'1'),
(638, 'ChanGameOnline', b'1'),
(639, 'Azota', b'1'),
(640, 'ChanYoutube', b'1'),
(641, 'Zoom', b'1'),
(642, '', b'1'),
(643, 'ChanGameMayTinh', b'1'),
(644, '', b'1'),
(645, 'Zoom', b'1'),
(646, '', b'1'),
(647, 'Zoom', b'1'),
(648, 'ChanGame', b'1'),
(649, '', b'1'),
(650, '', b'1'),
(651, '', b'1'),
(652, 'ChanYoutube', b'1'),
(653, '', b'1'),
(654, '', b'1'),
(655, '', b'1'),
(656, '', b'1'),
(657, '', b'1'),
(658, '', b'1'),
(659, '', b'1'),
(660, '', b'1'),
(661, '', b'1'),
(662, '', b'1'),
(663, '', b'1'),
(664, '', b'1'),
(665, '', b'1'),
(666, '', b'1'),
(667, '', b'1'),
(668, '', b'1'),
(669, '', b'1'),
(670, '', b'1'),
(671, '', b'1'),
(672, '', b'1'),
(673, '', b'1'),
(674, '', b'1'),
(675, '', b'1'),
(676, '', b'1'),
(677, '', b'1'),
(678, '', b'1'),
(679, '', b'1'),
(680, '', b'1'),
(681, '', b'1'),
(682, '', b'1'),
(683, '', b'1'),
(684, '', b'1'),
(685, '', b'1'),
(686, '', b'1'),
(687, '', b'1'),
(688, 'ChanGame', b'1'),
(689, '', b'1'),
(690, '', b'1'),
(691, '', b'1'),
(692, '', b'1'),
(693, 'ChanGameMayTinh', b'1'),
(694, '', b'1'),
(695, 'ChanYoutube', b'1'),
(696, 'ChanGameOnline', b'1'),
(697, 'ChanGame', b'1'),
(698, 'Zoom', b'1'),
(699, '', b'1'),
(700, 'ChanYoutube', b'1'),
(701, 'Zoom', b'1'),
(702, 'ChanYoutube', b'1'),
(703, '', b'1'),
(704, 'ChanGameOnline', b'1'),
(705, 'Zoom', b'1'),
(706, 'ChanGameMayTinh', b'1'),
(707, 'Azota', b'1'),
(708, 'ChanGameMayTinh', b'1'),
(709, 'ChanGameMayTinh', b'1'),
(710, 'ChanGameOnline', b'1'),
(711, '', b'1'),
(712, 'ChanYoutube', b'1'),
(713, '', b'1'),
(714, 'Azota', b'1'),
(715, 'ChanGameOnline', b'1'),
(716, 'ChanGameOnline', b'1'),
(717, 'ChanGame', b'1'),
(718, 'Zoom', b'1'),
(719, 'ChanGameOnline', b'1'),
(720, 'ChanGame', b'1'),
(721, 'ChanGame', b'1'),
(722, '', b'1'),
(723, 'Azota', b'1'),
(724, 'ChanGame', b'1'),
(725, 'ChanYoutube', b'1'),
(726, 'ChanYoutube', b'1'),
(727, 'ChanGameMayTinh', b'1'),
(728, 'Azota', b'1'),
(729, 'Azota', b'1'),
(730, 'Zoom', b'1'),
(731, 'ChanGameMayTinh', b'1'),
(732, 'Azota', b'1'),
(733, 'Azota', b'1'),
(734, 'ChanGame', b'1'),
(735, 'ChanGame', b'1'),
(736, '', b'1'),
(737, 'Zoom', b'1'),
(738, 'ChanYoutube', b'1'),
(739, 'ChanGameMayTinh', b'1'),
(740, 'Zoom', b'1'),
(741, 'ChanGameOnline', b'1'),
(742, 'ChanYoutube', b'1'),
(743, 'Azota', b'1'),
(744, 'ChanGame', b'1'),
(745, 'ChanYoutube', b'1'),
(746, '', b'1'),
(747, 'Azota', b'1'),
(748, 'ChanGameOnline', b'1'),
(749, '', b'1'),
(750, 'Azota', b'1'),
(751, 'ChanGameOnline', b'1'),
(752, 'ChanGame', b'1'),
(753, 'Zoom', b'1'),
(754, 'ChanGameMayTinh', b'1'),
(755, 'ChanYoutube', b'1'),
(756, 'ChanGameMayTinh', b'1'),
(757, 'ChanGame', b'1'),
(758, 'ChanGameMayTinh', b'1'),
(759, '', b'1'),
(760, 'ChanGameMayTinh', b'1'),
(761, 'Zoom', b'1'),
(762, 'ChanGameMayTinh', b'1'),
(763, 'Zoom', b'1'),
(764, '', b'1'),
(765, 'ChanGame', b'1'),
(766, 'Zoom', b'1'),
(767, 'ChanGameOnline', b'1'),
(768, 'ChanYoutube', b'1'),
(769, 'Azota', b'1'),
(770, '', b'1'),
(771, 'Azota', b'1'),
(772, 'Zoom', b'1'),
(773, '', b'1'),
(774, 'ChanGameOnline', b'1'),
(775, 'ChanYoutube', b'1'),
(776, '', b'1'),
(777, 'ChanGameOnline', b'1'),
(778, '', b'1'),
(779, '', b'1'),
(780, '', b'1'),
(781, '', b'1'),
(782, '', b'1'),
(783, '', b'1'),
(784, '', b'1'),
(785, '', b'1'),
(786, '', b'1'),
(787, '', b'1'),
(788, '', b'1'),
(789, '', b'1'),
(790, '', b'1'),
(791, '', b'1'),
(792, '', b'1'),
(793, '', b'1'),
(794, '', b'1'),
(795, '', b'1'),
(796, '', b'1'),
(797, '', b'1'),
(798, '', b'1'),
(799, '', b'1'),
(800, '', b'1'),
(801, '', b'1'),
(802, '', b'1'),
(803, '', b'1'),
(804, '', b'1'),
(805, '', b'1'),
(806, '', b'1'),
(807, '', b'1'),
(808, '', b'1'),
(809, '', b'1'),
(810, '', b'1'),
(811, '', b'1'),
(812, '', b'1'),
(813, '', b'1'),
(814, '', b'1'),
(815, '', b'1'),
(816, '', b'1'),
(817, '', b'1'),
(818, '', b'1'),
(819, '', b'1'),
(820, 'ChanGame', b'1'),
(821, '', b'1'),
(822, '', b'1'),
(823, '', b'1'),
(824, '', b'1'),
(825, 'ChanGameMayTinh', b'1'),
(826, 'ChanYoutube', b'1'),
(827, 'ChanGameOnline', b'1'),
(828, 'ChanGame', b'1'),
(829, 'ChanYoutube', b'1'),
(830, 'Zoom', b'1'),
(831, 'ChanGameOnline', b'1'),
(832, 'ChanGameMayTinh', b'1'),
(833, 'Zoom', b'1'),
(834, 'Azota', b'1'),
(835, '', b'1'),
(836, 'ChanGameOnline', b'1'),
(837, 'Azota', b'1'),
(838, 'ChanGameMayTinh', b'1'),
(839, 'Zoom', b'1'),
(840, 'Zoom', b'1'),
(841, 'ChanYoutube', b'1'),
(842, 'ChanGameMayTinh', b'1'),
(843, 'Azota', b'1'),
(844, 'ChanGameOnline', b'1'),
(845, '', b'1'),
(846, 'Azota', b'1'),
(847, 'ChanGameMayTinh', b'1'),
(848, 'Zoom', b'1'),
(849, 'ChanGame', b'1'),
(850, 'ChanGameOnline', b'1'),
(851, 'ChanGameMayTinh', b'1'),
(852, 'ChanGame', b'1'),
(853, 'ChanGameMayTinh', b'1'),
(854, 'Azota', b'1'),
(855, 'ChanGameOnline', b'1'),
(856, 'ChanGame', b'1'),
(857, 'Zoom', b'1'),
(858, 'ChanGame', b'1'),
(859, 'ChanYoutube', b'1'),
(860, 'Azota', b'1'),
(861, 'ChanYoutube', b'1'),
(862, '', b'1'),
(863, 'ChanYoutube', b'1'),
(864, 'Zoom', b'1'),
(865, 'ChanGameMayTinh', b'1'),
(866, 'ChanYoutube', b'1'),
(867, 'Azota', b'1'),
(868, 'ChanGameMayTinh', b'1'),
(869, 'ChanGameOnline', b'1'),
(870, 'Zoom', b'1'),
(871, 'ChanYoutube', b'1'),
(872, 'Azota', b'1'),
(873, 'ChanGame', b'1'),
(874, '', b'1'),
(875, 'ChanGameOnline', b'1'),
(876, 'Zoom', b'1'),
(877, 'ChanGameMayTinh', b'1'),
(878, 'ChanGameOnline', b'1'),
(879, 'Zoom', b'1'),
(880, 'ChanGameMayTinh', b'1'),
(881, 'ChanGameMayTinh', b'1'),
(882, '', b'1'),
(883, 'ChanYoutube', b'1'),
(884, 'ChanGameMayTinh', b'1'),
(885, '', b'1'),
(886, 'ChanYoutube', b'1'),
(887, '', b'1'),
(888, '', b'1'),
(889, 'Azota', b'1'),
(890, 'Azota', b'1'),
(891, 'ChanGame', b'1'),
(892, 'Zoom', b'1'),
(893, 'ChanGameOnline', b'1'),
(894, 'ChanGameOnline', b'1'),
(895, 'Azota', b'1'),
(896, 'ChanYoutube', b'1'),
(897, 'ChanGame', b'1'),
(898, 'Zoom', b'1'),
(899, 'ChanGameOnline', b'1'),
(900, '', b'1'),
(901, 'ChanGame', b'1'),
(902, 'ChanYoutube', b'1'),
(903, 'Azota', b'1'),
(904, 'Zoom', b'1'),
(905, 'Azota', b'1'),
(906, 'ChanYoutube', b'1'),
(907, '', b'1'),
(908, 'ChanGame', b'1'),
(909, 'ChanGameOnline', b'1'),
(910, 'ChanGame', b'1'),
(911, '', b'1'),
(912, 'ChanGame', b'1'),
(913, '', b'1'),
(914, '', b'1'),
(915, '', b'1'),
(916, '', b'1'),
(917, '', b'1'),
(918, '', b'1'),
(919, '', b'1'),
(920, '', b'1'),
(921, '', b'1'),
(922, '', b'1'),
(923, '', b'1'),
(924, '', b'1'),
(925, '', b'1'),
(926, '', b'1'),
(927, '', b'1'),
(928, '', b'1'),
(929, '', b'1'),
(930, '', b'1'),
(931, '', b'1'),
(932, '', b'1'),
(933, '', b'1'),
(934, '', b'1'),
(935, '', b'1'),
(936, '', b'1'),
(937, '', b'1'),
(938, '', b'1'),
(939, '', b'1'),
(940, '', b'1'),
(941, '', b'1'),
(942, '', b'1'),
(943, '', b'1'),
(944, '', b'1'),
(945, '', b'1'),
(946, '', b'1'),
(947, '', b'1'),
(948, '', b'1'),
(949, '', b'1'),
(950, '', b'1'),
(951, '', b'1'),
(952, '', b'1'),
(953, '', b'1'),
(954, '', b'1'),
(955, '', b'1'),
(956, '', b'1'),
(957, '', b'1'),
(958, '', b'1'),
(959, '', b'1'),
(960, '', b'1'),
(961, '', b'1'),
(962, '', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `date_of_birth` date NOT NULL,
  `regency` mediumtext NOT NULL COMMENT 'Chức vụ trong công ty',
  `add_of_birth` varchar(100) NOT NULL,
  `profile` mediumtext NOT NULL COMMENT 'thong tin cua giang vien',
  `address` varchar(100) NOT NULL,
  `image_src` varchar(255) NOT NULL,
  `create_date` date NOT NULL,
  `deleted` bit(1) NOT NULL,
  `image_slide` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`id`, `name`, `date_of_birth`, `regency`, `add_of_birth`, `profile`, `address`, `image_src`, `create_date`, `deleted`, `image_slide`) VALUES
(1, 'Nguyễn Tuấn Anh', '1997-08-09', 'Trưởng phòng CNTT trung tâm SPEC', 'Hà nội', '<h3 id=\"embed\" _msthash=\"59423\" _msttexthash=\"76193\" style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(66, 81, 95); margin-bottom: 8px; font-size: 18px; margin-right: 0px; margin-left: 0px; padding-top: 96px; margin-top: -80px !important;\"><span data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;Các hệ thống chịu trách nhiệm chính:\\n- Phần mềm thiết kế âm học phòng ARAC.\\n- Ứng dụng đo kiểm hiện trường Viettel.\\n- Phần mềm BCKĐ Viettel.\\n- Ứng dụng phơi nhiễm hiện trường Viettel.\\n- Ứng dụng Viettel mapinr.\\n- Phần mềm tạo bản vẽ hiện trạng phơi nhiễm Viettel.\\n- Phần mềm vẽ tuyến cáp Viettel.\\n- Trang Web SPEC.&quot;}\" data-sheets-userformat=\"{&quot;2&quot;:15357,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:[null,2,0]},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;9&quot;:0,&quot;10&quot;:0,&quot;11&quot;:4,&quot;12&quot;:0,&quot;14&quot;:[null,2,0],&quot;15&quot;:&quot;Times New Roman&quot;,&quot;16&quot;:12}\" style=\"color: rgb(0, 0, 0); font-size: 12pt; font-family: &quot;Times New Roman&quot;;\">Các hệ thống chịu trách nhiệm chính:<br>- Phần mềm thiết kế âm học phòng ARAC.<br>- Ứng dụng đo kiểm hiện trường Viettel.<br>- Phần mềm BCKĐ Viettel.<br>- Ứng dụng phơi nhiễm hiện trường Viettel.<br>- Ứng dụng Viettel mapinr.<br>- Phần mềm tạo bản vẽ hiện trạng phơi nhiễm Viettel.<br>- Phần mềm vẽ tuyến cáp Viettel.<br>- Trang Web SPEC.</span><br></h3>', 'Hà nội', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/4407270001.jpg', '2021-04-14', b'0', 'https://spec.edu.vn/client/image/images_Trang_Chu/4.jpeg'),
(4, 'Hiếu', '2000-11-15', 'Lập trình viên', 'Hà nội', '<p>ababababab</p>', 'Hà nội ', 'https://techmaster.vn/resources/image/route_mobile.jpg', '2021-04-10', b'0', ''),
(5, 'Trần Anh Bình', '1981-03-10', 'Trưởng khoa Công nghệ Thông tin, Trường Đại học Xây dựng.', 'Nam Định', '<p><br></p>', 'Hà Nội', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/117520800Image 24.png', '2021-04-12', b'1', 'https://spec.edu.vn/client/image/images_Trang_Chu/2.jpg'),
(6, 'Đỗ Quốc Hoàng', '1982-07-11', 'Giám đốc trung tâm lập trình SPEC', 'Hứng Yên', '<p><br></p>', 'Hà Nội', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/417012200HoangDQ.jpg', '2021-04-12', b'1', 'https://spec.edu.vn/client/image/images_Trang_Chu/3.jpg'),
(7, 'Mai Kim Ngân', '1997-05-05', 'Kỹ sư CNTT trường đại học xây dựng', 'Thái Bình', '<p><br></p>', 'Hà Nội', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/771439900NganKM.jpg', '2021-04-12', b'0', 'https://spec.edu.vn/client/image/images_Trang_Chu/5.jpg'),
(8, 'Hoàng Văn Nguyên', '1998-04-29', 'Lập trình viên phòng CNTT SPEC', 'Thanh Hóa', '<p><br></p>', 'Hà Nội', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/922121200nguyenhv.jpg', '2021-04-16', b'1', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/922424900nguyenhv.jpg'),
(9, 'Hiếu', '2021-04-15', 'Lập trình viên', 'Quê quán', '<p>abc</p>', 'Hà nội ', 'https://techmaster.vn/resources/image/route_mobile.jpg', '2021-04-14', b'0', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/21477500nguyenhv.jpg'),
(10, 'Phùng Đăng Phúc', '1999-06-10', 'Lập trình viên phòng CNTT SPEC', 'Hà Nội', '<p><br></p>', 'Hà Nội', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/330828800phucpd.jpg', '2021-04-17', b'1', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/501585400PhucPD.jpg'),
(11, 'Phùng Đăng Phúc', '1999-06-10', 'Lập trình viên phòng CNTT SPEC', 'Hà Nội', '<p><br></p>', 'Hà Nội', '', '2021-04-14', b'0', ''),
(12, 'Nguyễn Phú Cường', '2000-02-05', 'Lập trình viên SPEC', 'Hà Nội', '', 'Hà Nội', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/161436100cuong.jpg', '2021-04-16', b'1', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/658834900cuong.jpg'),
(13, 'Nguyễn Tuấn Anh', '1997-08-09', 'Trưởng phòng CNTT trung tâm lập trình SPEC', 'Hoài Đức, Hà Nội', '', 'Hoài Đức, Hà Nội', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/2542295001.jpg', '2021-05-22', b'1', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/4568476004.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `theme`
--

CREATE TABLE `theme` (
  `id` int NOT NULL COMMENT 'chu de cua khoa hoc',
  `name` varchar(65) NOT NULL,
  `deleted` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `theme`
--

INSERT INTO `theme` (`id`, `name`, `deleted`) VALUES
(1, 'Web Frontend', b'1'),
(2, 'Web Backend', b'1'),
(3, 'Di Động', b'1'),
(4, 'Big Data', b'1'),
(5, 'Kiểm Thử', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `topic`
--

CREATE TABLE `topic` (
  `id` int NOT NULL,
  `title` varchar(100) NOT NULL,
  `create_date` date NOT NULL,
  `introduct` mediumtext NOT NULL COMMENT 'lời giới thiệu',
  `content` mediumtext NOT NULL COMMENT 'nội dung bài viết',
  `view` double NOT NULL COMMENT 'số lượt xem',
  `id_user` int NOT NULL,
  `deleted` bit(1) NOT NULL,
  `meta_html` mediumtext NOT NULL,
  `image_src` varchar(255) NOT NULL,
  `course_id` int NOT NULL,
  `view_url` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` mediumtext NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `meta_robot` varchar(155) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `topic`
--

INSERT INTO `topic` (`id`, `title`, `create_date`, `introduct`, `content`, `view`, `id_user`, `deleted`, `meta_html`, `image_src`, `course_id`, `view_url`, `meta_title`, `meta_description`, `meta_keyword`, `meta_robot`) VALUES
(16, 'Khóa Java Mobile cho trẻ với những trải nghiệm lý thú', '2021-05-12', '<p><span style=\"color:#212529; font-family:&quot;Open Sans&quot;,sans-serif\">Trong thời đại c&ocirc;ng nghệ 4.0 b&ecirc;n cạnh việc gi&aacute;o dục trẻ những kiến thức v&agrave; kỹ năng cơ bản th&igrave; nhiều phụ huynh hướng tới việc dạy ng&ocirc;n ngữ lập tr&igrave;nh, trong đ&oacute; c&oacute; lập tr&igrave;nh Java cho trẻ c&oacute; độ tuổi từ 12-16 nhằm gi&uacute;p b&eacute; ph&aacute;t triển to&agrave;n diện về tư duy v&agrave; sự s&aacute;ng tạo. H&atilde;y c&ugrave;ng t&igrave;m hiểu vấn đề hữu &iacute;ch n&agrave;y qua b&agrave;i viết dưới đ&acirc;y nh&eacute;!&nbsp;</span></p>\n', '<h1>Dạy lập tr&igrave;nh Java cho trẻ v&agrave; những điều bạn cần biết</h1>\n\n<div>12 th&aacute;ng 03, 2021</div>\n\n<div>\n<h2>Dạy cho trẻ về ng&ocirc;n ngữ lập tr&igrave;nh n&oacute;i chung v&agrave; lập tr&igrave;nh Java</h2>\n\n<p>&emsp;Trong thời đại c&ocirc;ng nghệ 4.0 b&ecirc;n cạnh việc gi&aacute;o dục trẻ những kiến thức v&agrave; kỹ năng cơ bản th&igrave; nhiều phụ huynh hướng tới việc dạy ng&ocirc;n ngữ lập tr&igrave;nh, trong đ&oacute; c&oacute; lập tr&igrave;nh Java cho trẻ c&oacute; độ tuổi từ 12-16 nhằm gi&uacute;p b&eacute; ph&aacute;t triển to&agrave;n diện về tư duy v&agrave; sự s&aacute;ng tạo. H&atilde;y c&ugrave;ng t&igrave;m hiểu vấn đề hữu &iacute;ch n&agrave;y qua b&agrave;i viết dưới đ&acirc;y nh&eacute;!&nbsp;</p>\n\n<p style=\"text-align:center\"><img alt=\"\" height=\"719\" src=\"https://spec.edu.vn/client/image/a1.jpg\" width=\"477\" /></p>\n\n<p style=\"text-align:center\">Dạy lập tr&igrave;nh Java cho trẻ đang l&agrave; xu hướng tại c&aacute;c quốc gia ti&ecirc;n tiến tr&ecirc;n thế giới</p>\n\n<h2>Lập tr&igrave;nh Java l&agrave; g&igrave;?</h2>\n\n<p>&emsp;Ng&ocirc;n ngữ lập tr&igrave;nh Java l&agrave; một ng&ocirc;n ngữ lập tr&igrave;nh bậc cao, sinh ra với mục ti&ecirc;u &ldquo;Viết một lần, thực thi mọi nơi&rdquo; hiện đang được ứng dụng trong nhiều lĩnh vực kh&aacute;c nhau. Chương tr&igrave;nh viết bằng phần mềm Java c&oacute; thể chạy tr&ecirc;n nhiều nền tảng kh&aacute;c nhau, đ&acirc;y ch&iacute;nh l&agrave; điểm mạnh vượt trội của Java so với những ng&ocirc;n ngữ cũ. V&igrave; vậy m&agrave; khiến cho ng&ocirc;n ngữ lập tr&igrave;nh Java ng&agrave;y c&agrave;ng trở n&ecirc;n phổ biến v&agrave; được y&ecirc;u th&iacute;ch đối với mọi lập tr&igrave;nh vi&ecirc;n tr&ecirc;n to&agrave;n thế giới.</p>\n\n<ul>\n</ul>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"397\" src=\"https://spec.edu.vn/client/image/a4.jpg\" width=\"596\" /></p>\n\n<p style=\"text-align:center\">Java hiện l&agrave; một trong những ng&ocirc;n ngữ lập tr&igrave;nh phổ biến nhất tr&ecirc;n thế giới</p>\n\n<h2>Tại sao n&ecirc;n cho trẻ tiếp cận với ng&ocirc;n ngữ lập tr&igrave;nh Java?</h2>\n\n<ul>\n	<li>Trẻ nhỏ được học v&agrave; tiếp cận với Java từ sớm sẽ mở ra rất nhiều cơ hội tiếp x&uacute;c với c&aacute;c c&ocirc;ng nghệ ti&ecirc;n tiến v&agrave; xu thế của thế giới hiện nay.&nbsp;</li>\n	<li>K&iacute;ch th&iacute;ch sự ph&aacute;t triển tư duy, t&iacute;nh logic ở trẻ. V&igrave; vậy m&agrave; hỗ trợ tốt trong việc học tập v&agrave; giải quyết c&aacute;c b&agrave;i tập tr&ecirc;n lớp của trẻ&nbsp;</li>\n	<li>Ph&aacute;t huy sự s&aacute;ng tạo kh&ocirc;ng ngừng ở trẻ. Trẻ sẽ lu&ocirc;n mong muốn được kh&aacute;m ph&aacute; v&agrave; t&igrave;m t&ograve;i những kiến thức v&agrave; điều mới mẻ trong cuộc sống.</li>\n	<li>R&egrave;n luyện sự nhanh nhẹn, tỉ mỉ v&agrave; nhạy b&eacute;n</li>\n</ul>\n\n<h2>Trẻ học lập tr&igrave;nh Java c&oacute; kh&oacute; hay dễ</h2>\n\n<p>Lập tr&igrave;nh Java l&agrave; kiến thức c&ocirc;ng nghệ v&ocirc; c&ugrave;ng hữu &iacute;ch, mang đến nhiều c&ocirc;ng dụng tuyệt vời cho sự ph&aacute;t triển to&agrave;n diện của trẻ. Tuy nhi&ecirc;n trẻ học lập tr&igrave;nh Java kh&oacute; hay dễ? L&agrave; thắc mắc của rất nhiều người, đặc biệt l&agrave; c&aacute;c bậc phụ huynh.</p>\n\n<p>Học lập tr&igrave;nh Java kh&oacute; hay dễ?</p>\n\n<p>&emsp;Ng&ocirc;n ngữ lập tr&igrave;nh Java l&agrave; một ng&ocirc;n ngữ lập tr&igrave;nh bậc cao, sinh ra với mục ti&ecirc;u &ldquo;Viết một lần, thực thi mọi nơi&rdquo; hiện đang được ứng dụng trong nhiều lĩnh vực kh&aacute;c nhau. Chương tr&igrave;nh viết bằng phần mềm Java c&oacute; thể chạy tr&ecirc;n nhiều nền tảng kh&aacute;c nhau, đ&acirc;y ch&iacute;nh l&agrave; điểm mạnh vượt trội của Java so với những ng&ocirc;n ngữ cũ. V&igrave; vậy m&agrave; khiến cho ng&ocirc;n ngữ lập tr&igrave;nh Java ng&agrave;y c&agrave;ng trở n&ecirc;n phổ biến v&agrave; được y&ecirc;u th&iacute;ch đối với mọi lập tr&igrave;nh vi&ecirc;n tr&ecirc;n to&agrave;n thế giới.</p>\n\n<p>&emsp;Theo c&aacute;c chuy&ecirc;n gia, Java l&agrave; một loại ng&ocirc;n ngữ lập tr&igrave;nh bậc cao với sự kế thừa v&agrave; ho&agrave;n thiện hơn so với những đ&agrave;n anh đi trước. V&igrave; vậy tuy c&oacute; c&uacute; ph&aacute;p dễ hiểu, khoa học nhưng được đ&aacute;nh gi&aacute; hơi kh&oacute; học so với Ruby hay Python. Nhưng chắc chắn rằng khi nắm được những kiến thức căn bản nhất của ng&ocirc;n ngữ lập tr&igrave;nh n&agrave;y chắc chắn việc ứng dụng của ch&uacute;ng v&agrave;o việc tạo ra c&aacute;c ứng dụng v&agrave; trang web trở n&ecirc;n v&ocirc; c&ugrave;ng nhanh ch&oacute;ng v&agrave; chắc chắn rằng việc chọn Java như một ng&ocirc;n ngữ lập tr&igrave;nh lần đầu để chinh phục sẽ l&agrave;m cho việc học bất kỳ ng&ocirc;n ngữ lập tr&igrave;nh n&agrave;o tiếp theo sẽ trở n&ecirc;n dễ d&agrave;ng hơn rất nhiều đối với cho trẻ.</p>\n\n<ul>\n</ul>\n\n<p style=\"text-align:center\"><img alt=\"\" height=\"1024\" src=\"https://spec.edu.vn/client/image/a2.jpg\" width=\"1536\" /></p>\n\n<p style=\"text-align:center\">Phương ph&aacute;p học tập l&agrave; yếu tố quyết định hiệu quả việc dạy lập tr&igrave;nh Java cho trẻ</p>\n\n<p>B&iacute; quyết để trẻ học Java cơ bản được dễ d&agrave;ng hơn</p>\n\n<p>&emsp;Hiện nay, việc tự học Java l&agrave; điều kh&ocirc;ng hề xa lạ với nhiều người. Bởi với hệ thống kho t&agrave;ng tri thức rộng lớn th&igrave; bạn sẽ nhanh ch&oacute;ng t&igrave;m kiếm được c&aacute;c th&ocirc;ng tin cần thiết cho m&igrave;nh. Việc học lập tr&igrave;nh Java trở n&ecirc;n dễ d&agrave;ng với c&aacute;c loại gi&aacute;o tr&igrave;nh được b&agrave;y b&aacute;n rộng r&atilde;i, hay những blog tr&ecirc;n mạng x&atilde; hội hoặc học trực tuyến từ website của Java.</p>\n\n<p>&emsp;Tuy nhi&ecirc;n, đối với đối tượng l&agrave; c&aacute;c bạn nhỏ trong độ tuổi từ 12-16 tuổi th&igrave; b&ecirc;n cạnh việc truyền đạt tri thức th&ocirc;ng qua c&aacute;c phương ph&aacute;p truyền thống th&igrave; để truyền niềm đam m&ecirc; v&agrave; sự hứng th&uacute; cho trẻ đối với bộ m&ocirc;n n&agrave;y cần c&oacute; những phương ph&aacute;p gi&aacute;o dục đặc biệt hơn. Cụ thể như:</p>\n\n<h2>SPEC- trung t&acirc;m dạy lập tr&igrave;nh Java uy t&iacute;n v&agrave; chuy&ecirc;n nghiệp cho trẻ em</h2>\n\n<p>&emsp;Học lập tr&igrave;nh Java ở đ&acirc;u uy t&iacute;n? l&agrave; điều m&agrave; c&aacute;c bậc phụ huynh v&agrave; đ&ocirc;ng đảo c&aacute;c bạn nhỏ v&ocirc; c&ugrave;ng quan t&acirc;m. Bởi hiện nay, sự xuất hiện tr&agrave;n lan của c&aacute;c trung t&acirc;m gi&aacute;o dục khiến cho kh&ocirc;ng &iacute;t kh&aacute;ch h&agrave;ng băn khoăn v&agrave; lo lắng. Đ&aacute;p ứng tất cả c&aacute;c ti&ecirc;u ch&iacute; về một đơn vị gi&aacute;o dục uy t&iacute;n với nhiều năm kinh nghiệm, SPEC thực sự l&agrave; trường dạy lập tr&igrave;nh cho b&eacute; uy t&iacute;n v&agrave; chuy&ecirc;n nghiệp. Chắc chắn rằng việc lựa chọn SPEC sẽ mang đến sự h&agrave;i l&ograve;ng tuyệt đối với mọi kh&aacute;ch h&agrave;ng.</p>\n\n<p style=\"text-align:center\"><img alt=\"\" height=\"400\" src=\"https://spec.edu.vn/client/image/a3.jpg\" width=\"600\" /></p>\n\n<p>Phương ph&aacute;p gi&aacute;o dục ho&agrave;n hảo</p>\n\n<p>&emsp;Thực tế, phương ph&aacute;p gi&aacute;o dục được xem l&agrave; một trong những yếu tố h&agrave;ng đầu quyết định sự th&agrave;nh bại trong việc truyền đạt v&agrave; tiếp nhận kiến thức đến với người học. Đặc biệt l&agrave; với đối tượng đặc biệt l&agrave; trẻ em trong độ tuổi từ 12-16 th&igrave; cần c&oacute; những phương ph&aacute;p gi&aacute;o dục đặc biệt v&agrave; ph&ugrave; hợp với t&acirc;m sinh l&yacute;, nhận thức của trẻ.</p>\n\n<p>&emsp;Thấu hiểu điều đ&oacute;, SPEC lu&ocirc;n kh&ocirc;ng ngừng cải tiến v&agrave; n&acirc;ng cao chất lượng giảng dạy ph&ugrave; hợp với đối tượng học tập kh&aacute;c nhau. SPEC kh&ocirc;ng chỉ dạy những kiến thức cơ bản v&agrave; n&acirc;ng cao về lập tr&igrave;nh Java m&agrave; c&ograve;n dẫn dắt, truyền cảm hứng cho trẻ để tạo ra những sản phẩm c&ocirc;ng nghệ chuy&ecirc;n nghiệp. H&agrave;nh tr&igrave;nh học Java cơ bản ở SPEC chắc chắn sẽ để lại ấn tượng s&acirc;u sắc với c&aacute;c bạn nhỏ bởi sẽ mang đến nhiều cung bậc cảm x&uacute;c kh&aacute;c nhau cho trẻ.</p>\n\n<p>Đội ngũ gi&aacute;o vi&ecirc;n chuy&ecirc;n nghiệp</p>\n\n<p>&emsp;SPEC sở hữu đội ngũ gi&aacute;o vi&ecirc;n c&oacute; nhiều kinh nghiệm giảng dạy cũng như trong lĩnh vực c&ocirc;ng nghệ phần mềm, gi&agrave;u năng lượng v&agrave; rất t&acirc;m huyết với trẻ nhỏ. C&ugrave;ng với sự kết hợp giảng dạy tr&ecirc;n m&ocirc;i trường trực tuyến v&agrave; ngoại tuyến linh hoạt v&agrave; hiệu quả. Trung t&acirc;m cam kết sẽ đem đến những buổi học chất lượng nhưng kh&ocirc;ng hề nh&agrave;m ch&aacute;n, khơi dậy đam m&ecirc; lập tr&igrave;nh v&agrave; hứng th&uacute; b&ecirc;n trong c&aacute;c em nhỏ. Mỗi buổi học c&aacute;c em sẽ kh&ocirc;ng chỉ học những kiến thức l&yacute; thuyết kh&ocirc; khan m&agrave; c&ograve;n được c&aacute;c gi&aacute;o vi&ecirc;n giải đ&aacute;p thắc mắc, hướng dẫn cụ thể để &aacute;p dụng v&agrave;o thực tiễn.</p>\n\n<p>Dịch vụ ho&agrave;n hảo</p>\n\n<ul>\n	<li>Dạy lập tr&igrave;nh Java cho trẻ em th&ocirc;ng qua c&aacute;c tr&ograve; chơi về khoa học. Từ đ&oacute;, k&iacute;ch th&iacute;ch sự đam m&ecirc; v&agrave; t&igrave;m t&ograve;i ở trẻ.</li>\n	<li>Lu&ocirc;n động vi&ecirc;n, kh&iacute;ch lệ trẻ để b&eacute; c&oacute; động lực để học tập</li>\n	<li>Tạo m&ocirc;i trường học tập l&agrave;nh mạnh để trẻ c&oacute; điều kiện giao lưu, học hỏi với những bạn c&oacute; c&ugrave;ng niềm đam m&ecirc;. Từ đ&oacute; gi&uacute;p trẻ lu&ocirc;n c&oacute; hứng th&uacute; trong việc học tập</li>\n	<li>Mức học ph&iacute; phải chăng, ph&ugrave; hợp với mọi học sinh</li>\n	<li>Trẻ được học thử miễn ph&iacute; 3 buổi đầu ti&ecirc;n, trước khi đăng k&yacute; c&aacute;c kh&oacute;a học ch&iacute;nh thức</li>\n	<li>Thời gian học tập linh hoạt.</li>\n	<li>Trung t&acirc;m c&oacute; h&igrave;nh thức học bảo lưu &ldquo;miễn ph&iacute;&rdquo; trong v&ograve;ng 1 năm cho đến khi trẻ nắm vững về Java.</li>\n</ul>\n\n<p style=\"text-align:center\">SPEC tự h&agrave;o l&agrave; địa chỉ dạy lập tr&igrave;nh cho trẻ tốt nhất Việt Nam</p>\n\n<p>Đề cương Lập tr&igrave;nh Java cho trẻ:</p>\n</div>\n', 0, 8, b'1', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n    <meta http-equiv=\"content-style-type\" content=\"text/css\">\n    <meta http-equiv=\"content-language\" content=\"en-vi\">\n    <meta name=\"copyright\" content=\"spec.edu.vn\">\n    <meta name=\"keywords\" content=\"Lập trình Java Mobile, Java Mobile cơ bản, Java Mobile cho trẻ em, học lập trình Java Mobile, Java Mobile, game Java Mobile\">\n    <meta name=\"description\" content=\"Trong thời đại công nghệ 4.0 bên cạnh việc giáo dục trẻ những kiến thức và kỹ năng cơ bản thì nhiều phụ huynh hướng tới việc dạy ngôn ngữ lập trình, trong đó có lập trình Java cho trẻ có độ tuổi từ 12-16 nhằm giúp bé phát triển toàn diện về tư duy và sự sáng tạo.\">\n    <meta property=\"og:site_name\" content=\"spec.edu.vn\">\n    <meta property=\"og:type\" content=\"website\">\n    <meta property=\"og:title\" content=\"Khóa Java Mobile cho trẻ với những trải nghiệm lý thú\">\n    <meta property=\"og:description\" content=\"Trong thời đại công nghệ 4.0 bên cạnh việc giáo dục trẻ những kiến thức và kỹ năng cơ bản thì nhiều phụ huynh hướng tới việc dạy ngôn ngữ lập trình, trong đó có lập trình Java cho trẻ có độ tuổi từ 12-16 nhằm giúp bé phát triển toàn diện về tư duy và sự sáng tạo.\">\n    <meta property=\"og:url\" content=\"http://spec.edu.vn/admin-topic\">\n    <meta name=”robots” content=”index,follow” >\n    <meta name=\"author\" content=\"SpecEdu\">\n    <meta name=\"googlebot\" content=\"index,follow,archive\">\n    <meta property=\"og:type\" content=\"article\">', 'https://spec.edu.vn/client/image/banner2.jpeg', 6, 'khoa-hoc-java-mobile-cho-tre-voi-nhung-trai-nghiem-ly-thu', 'Khóa Java Mobile cho trẻ với những trải nghiệm lý thú', 'Trong thời đại công nghệ 4.0 bên cạnh việc giáo dục trẻ những kiến thức và kỹ năng cơ bản thì nhiều phụ huynh hướng tới việc dạy ngôn ngữ lập trình, trong đó có lập trình Java cho trẻ có độ tuổi từ 12-16 nhằm giúp bé phát triển toàn diện về tư duy và sự sáng tạo.', 'Lập trình Java Mobile, Java Mobile cơ bản, Java Mobile cho trẻ em, học lập trình Java Mobile, Java Mobile, game Java Mobile', 'index,follow'),
(17, 'Sức hút từ khóa học lập trình Python SPEC', '2021-04-04', '<span style=\"color: rgb(33, 37, 41); font-family: Exo, sans-serif;\">Lập trình Python là gì? Tại sao nên dạy lập trình Python cho trẻ ngay hôm nay? Hãy cùng tìm hiểu những thông tin hữu ích ngay sau đây nhé!</span>', '<h1 class=\"margin-bottom-15\" style=\"margin-top: 0px; margin-bottom: 15px; padding: 10px 0px 0px; line-height: 1.2; font-size: 2.5rem; font-family: Exo, sans-serif; color: rgb(9, 49, 102);\">Lập trình Python là gì? Tại sao nên dạy lập trình cho trẻ ngay hôm nay</h1><h1 class=\"margin-bottom-15\" style=\"margin-top: 0px; margin-bottom: 15px; padding: 10px 0px 0px; line-height: 1.2; font-size: 2.5rem; font-family: Exo, sans-serif; color: rgb(33, 37, 41);\"><p style=\"margin-bottom: 1rem; padding: 0px; font-size: 16px;\"> Lập trình Python là gì? Tại sao nên dạy lập trình Python cho trẻ ngay hôm nay? Hãy cùng tìm hiểu những thông tin hữu ích ngay sau đây nhé!</p></h1><h2 style=\"margin: 0px 0px 0.5rem; padding: 0px; font-weight: 600; line-height: 1.2; font-size: 2rem; color: rgb(9, 49, 102);\">Dạy cho trẻ về ngôn ngữ lập trình Python</h2><h1 class=\"margin-bottom-15\" style=\"margin-top: 0px; margin-bottom: 15px; padding: 10px 0px 0px; line-height: 1.2; font-size: 2.5rem; font-family: Exo, sans-serif; color: rgb(33, 37, 41);\"><div class=\"techmaster-font-open-sans post-content\" style=\"margin: 0px; padding: 1.5rem 0px 1rem; overflow-x: auto; border-top: 0.5px solid rgba(0, 0, 0, 0.125); line-height: 1.75rem; letter-spacing: -0.003em; overflow-wrap: break-word; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 16px;\"><span style=\"margin: 0px; padding: 0px;\"></span><p style=\"margin-bottom: 1rem; padding: 0px;\"> Python là ngôn ngữ lập trình quen thuộc dùng để phát triển website và các ứng dụng công nghệ khác. Vậy Lập trình Python là gì? Tại sao nên dạy lập trình Python cho trẻ ngay hôm nay? Hãy cùng khám phá những thông tin hữu ích qua bài viết sau đây nhé&nbsp;</p><p style=\"margin-bottom: 1rem; padding: 0px; text-align: center;\"><img alt=\"\" height=\"620\" src=\"https://spec.edu.vn/client/image/a6.png\" width=\"300\" style=\"margin: auto; padding: 0px; border-style: none; max-width: 100%; height: auto;\"></p><span style=\"margin: 0px; padding: 0px;\"></span><p style=\"margin-bottom: 1rem; margin-left: 15px; padding: 0px; font-style: italic; text-align: center;\">Dạy lập trình Python cho trẻ đang là xu hướng tại các quốc gia tiên tiến trên thế giới</p><span style=\"margin: 0px; padding: 0px;\"></span></div></h1><h2 style=\"margin: 0px 0px 0.5rem; padding: 0px; font-weight: 600; line-height: 1.2; font-size: 2rem; color: rgb(9, 49, 102);\">Lập trình Python là gì?</h2><h1 class=\"margin-bottom-15\" style=\"margin-top: 0px; margin-bottom: 15px; padding: 10px 0px 0px; line-height: 1.2; font-size: 2.5rem; font-family: Exo, sans-serif; color: rgb(33, 37, 41);\"><div class=\"techmaster-font-open-sans post-content\" style=\"margin: 0px; padding: 1.5rem 0px 1rem; overflow-x: auto; border-top: 0.5px solid rgba(0, 0, 0, 0.125); line-height: 1.75rem; letter-spacing: -0.003em; overflow-wrap: break-word; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 16px;\"><ul style=\"margin-right: 0px; margin-bottom: 1rem; margin-left: 0px; padding: 0px; list-style: none;\"><p style=\"margin-bottom: 1rem; padding: 0px;\"> Python là một ngôn ngữ lập trình bậc cao và vô cùng quen thuộc đối với những người yêu công nghệ. Ngôn ngữ này được sáng tạo bởi Guido van Rossum và lần đầu công bố vào năm 1991.</p></ul><p style=\"margin-bottom: 1rem; padding: 0px; text-align: center;\"><img alt=\"\" height=\"602\" src=\"https://spec.edu.vn/client/image/a7.jpg\" width=\"500\" style=\"margin: auto; padding: 0px; border-style: none; max-width: 100%; height: auto;\"></p><span style=\"margin: 0px; padding: 0px;\"></span><p style=\"margin-bottom: 1rem; margin-left: 15px; padding: 0px; font-style: italic; text-align: center;\">Python là ngôn ngữ lập trình bậc cao được sử dụng rộng rãi trên thế giới</p><span style=\"margin: 0px; padding: 0px;\"></span></div></h1><h2 style=\"margin: 0px 0px 0.5rem; padding: 0px; font-weight: 600; line-height: 1.2; font-size: 2rem; color: rgb(9, 49, 102);\">Lý do ngôn ngữ lập trình Python được yêu thích trên toàn thế giới</h2><h1 class=\"margin-bottom-15\" style=\"margin-top: 0px; margin-bottom: 15px; padding: 10px 0px 0px; line-height: 1.2; font-size: 2.5rem; font-family: Exo, sans-serif; color: rgb(33, 37, 41);\"><div class=\"techmaster-font-open-sans post-content\" style=\"margin: 0px; padding: 1.5rem 0px 1rem; overflow-x: auto; border-top: 0.5px solid rgba(0, 0, 0, 0.125); line-height: 1.75rem; letter-spacing: -0.003em; overflow-wrap: break-word; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 16px;\"><p style=\"margin-bottom: 1rem; padding: 0px;\"> Là một trong những ngôn ngữ lập trình được yêu thích nhất trên thế giới hiện nay, lập trình Python chiếm được cảm tình của đông đảo khách hàng bởi những ưu điểm như:</p><ul style=\"margin-right: 0px; margin-bottom: 1rem; margin-left: 0px; padding: 0px; list-style: none;\"><li style=\"margin: 0px; padding: 0px;\">Đơn giản, dễ học. Bởi vậy lập trình Python hoàn toàn phù hợp với tất cả mọi người kể cả những người mới bắt đầu và việc tự học Python thực sự là điều không quá khó khăn.&nbsp;</li><li style=\"margin: 0px; padding: 0px;\">Kích thích sự phát triển tư duy, tính logic ở trẻ. Vì vậy mà hỗ trợ tốt trong việc học tập và giải quyết các bài tập trên lớp của trẻ&nbsp;</li><li style=\"margin: 0px; padding: 0px;\">Python là ngôn ngữ mã nguồn mở hoàn toàn miễn phí mang đến nhiều tiện ích cho người sử dụng</li><li style=\"margin: 0px; padding: 0px;\">Ứng dụng rộng rãi trong cuộc sống. Thực tế, lập trình Python đã và đang vô cùng phổ biến trên khắp thế giới với những ứng dụng hữu ích như: phát triển các website và các nền tảng công nghệ khác; ứng dụng trong machine learning; ứng dụng trong giảng dạy; phân tích dữ liệu; phát triển game,….</li></ul><span style=\"margin: 0px; padding: 0px;\"></span></div></h1><h2 style=\"margin: 0px 0px 0.5rem; padding: 0px; font-weight: 600; line-height: 1.2; font-size: 2rem; color: rgb(9, 49, 102);\">Lý do nên học lập trình Python ngay hôm nay</h2><h1 class=\"margin-bottom-15\" style=\"margin-top: 0px; margin-bottom: 15px; padding: 10px 0px 0px; line-height: 1.2; font-size: 2.5rem; font-family: Exo, sans-serif; color: rgb(33, 37, 41);\"><div class=\"techmaster-font-open-sans post-content\" style=\"margin: 0px; padding: 1.5rem 0px 1rem; overflow-x: auto; border-top: 0.5px solid rgba(0, 0, 0, 0.125); line-height: 1.75rem; letter-spacing: -0.003em; overflow-wrap: break-word; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 16px;\"><ul style=\"margin-right: 0px; margin-bottom: 1rem; margin-left: 0px; padding: 0px; list-style: none;\"><p style=\"margin-bottom: 1rem; padding: 0px;\"> Việc học các ngôn ngữ lập trình đã và đang trở nên ngày càng phổ biến trên thế giới. Đặc biệt tại các quốc gia phát triển trên thế giới, học Python đã được đưa vào chương trình giáo dục phổ thông. Và tại Việt Nam trong những năm gần đây, việc dạy lập trình cho trẻ nói chung và dạy Python nói riêng cũng nhận được quan tâm của đông đảo mọi người và đang là xu hướng tất yếu. Bởi các nhà khoa học đã chứng minh được những lợi ích tuyệt vời của bộ môn này đối với sự phát triển toàn diện của trẻ</p><li style=\"margin: 0px; padding: 0px; list-style: inside;\">Phát triển tư duy logic, sự sáng tạo ở trẻ</li><li style=\"margin: 0px; padding: 0px; list-style: inside;\">Rèn luyện tính kiên trì và tỉ mỉ trong cuộc sống</li><li style=\"margin: 0px; padding: 0px; list-style: inside;\">Tăng khả năng làm việc hiệu quả, đặc biệt là làm việc nhóm</li><li style=\"margin: 0px; padding: 0px; list-style: inside;\">Rèn luyện khả năng thuyết trình, giải thích dễ hiểu, khoa học</li></ul><p style=\"margin-bottom: 1rem; padding: 0px; text-align: center;\"><img alt=\"\" height=\"602\" src=\"https://spec.edu.vn/client/image/a2.png\" width=\"500\" style=\"margin: auto; padding: 0px; border-style: none; max-width: 100%; height: auto;\"></p><span style=\"margin: 0px; padding: 0px;\"></span><p style=\"margin-bottom: 1rem; margin-left: 15px; padding: 0px; font-style: italic; text-align: center;\">Phương pháp học tập là yếu tố quyết định hiệu quả việc dạy lập trình cho trẻ</p></div></h1><h2 style=\"margin: 0px 0px 0.5rem; padding: 0px; font-weight: 600; line-height: 1.2; font-size: 2rem; color: rgb(9, 49, 102);\">Học lập trình Python như thế nào để đem lại hiệu quả tối ưu?</h2><h1 class=\"margin-bottom-15\" style=\"margin-top: 0px; margin-bottom: 15px; padding: 10px 0px 0px; line-height: 1.2; font-size: 2.5rem; font-family: Exo, sans-serif; color: rgb(33, 37, 41);\"><div class=\"techmaster-font-open-sans post-content\" style=\"margin: 0px; padding: 1.5rem 0px 1rem; overflow-x: auto; border-top: 0.5px solid rgba(0, 0, 0, 0.125); line-height: 1.75rem; letter-spacing: -0.003em; overflow-wrap: break-word; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 16px;\"><ul style=\"margin-right: 0px; margin-bottom: 1rem; margin-left: 0px; padding: 0px; list-style: none;\"><span style=\"margin: 0px; padding: 0px;\"></span><p style=\"margin-bottom: 1rem; padding: 0px;\"> Chính vì sự phổ biến của ngôn ngữ lập trình Python trong cuộc sống mà hiện nay việc học Python đang là chủ đề được rất nhiều người quan tâm. Tuy được các chuyên gia đánh giá là ngôn ngữ lập trình đơn giản, dễ học, dễ nhớ nhưng để có thể nhanh chóng tiếp cận với những kiến thức cơ bản và sử dụng thành thạo Python bạn vẫn cần có những phương pháp học tập khoa học và hiệu quả</p><span style=\"margin: 0px; padding: 0px;\"></span></ul></div></h1><h5 style=\"margin: 0px 0px 0.5rem; padding: 0px; font-weight: 600; line-height: 1.2; font-size: 1.25rem; color: rgb(0, 0, 0);\">Tự học Python cơ bản ngay tại nhà</h5><h1 class=\"margin-bottom-15\" style=\"margin-top: 0px; margin-bottom: 15px; padding: 10px 0px 0px; line-height: 1.2; font-size: 2.5rem; font-family: Exo, sans-serif; color: rgb(33, 37, 41);\"><div class=\"techmaster-font-open-sans post-content\" style=\"margin: 0px; padding: 1.5rem 0px 1rem; overflow-x: auto; border-top: 0.5px solid rgba(0, 0, 0, 0.125); line-height: 1.75rem; letter-spacing: -0.003em; overflow-wrap: break-word; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 16px;\"><ul style=\"margin-right: 0px; margin-bottom: 1rem; margin-left: 0px; padding: 0px; list-style: none;\"><p style=\"margin-bottom: 1rem; padding: 0px;\"> Với sự phát triển mạnh mẽ của công nghệ 4.0 thì hiện nay việc tìm kiếm kho tàng tri thức trở nên đơn giản và dễ dàng hơn đối với tất cả mọi người. Chính vì vậy, bạn hoàn toàn có thể tự học Python cơ bản ngay tại nhà. Nguồn tài liệu phong phú đa dạng từ sách, báo, internet hay các clip được chia sẻ rộng rãi trên các trang mạng xã hội thực sự là thông tin hữu ích dành cho bạn. Tuy nhiên, việc tự học cũng sẽ có khiến bạn gặp khá nhiều khó khăn trong việc lựa chọn và chắt lọc thông tin chính xác nhất phục vụ việc học tập được hiệu quả và nhanh chóng hơn</p><p style=\"margin-bottom: 1rem; padding: 0px; text-align: center;\"><img alt=\"\" height=\"602\" src=\"https://spec.edu.vn/client/image/a8.png\" width=\"500\" style=\"margin: auto; padding: 0px; border-style: none; max-width: 100%; height: auto;\"></p><span style=\"margin: 0px; padding: 0px;\"></span><p style=\"margin-bottom: 1rem; margin-left: 15px; padding: 0px; font-style: italic; text-align: center;\">Học lập trình Python từ cơ bản đến nâng cao là điều được khách hàng quan tâm</p><span style=\"margin: 0px; padding: 0px;\"></span></ul></div></h1><h5 style=\"margin: 0px 0px 0.5rem; padding: 0px; font-weight: 600; line-height: 1.2; font-size: 1.25rem; color: rgb(0, 0, 0);\">Tự học Python với người khác</h5><h1 class=\"margin-bottom-15\" style=\"margin-top: 0px; margin-bottom: 15px; padding: 10px 0px 0px; line-height: 1.2; font-size: 2.5rem; font-family: Exo, sans-serif; color: rgb(33, 37, 41);\"><div class=\"techmaster-font-open-sans post-content\" style=\"margin: 0px; padding: 1.5rem 0px 1rem; overflow-x: auto; border-top: 0.5px solid rgba(0, 0, 0, 0.125); line-height: 1.75rem; letter-spacing: -0.003em; overflow-wrap: break-word; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 16px;\"><ul style=\"margin-right: 0px; margin-bottom: 1rem; margin-left: 0px; padding: 0px; list-style: none;\"><p style=\"margin-bottom: 1rem; padding: 0px;\"> Để tạo nên không khí học tập sôi nổi và cởi mở bạn hoàn toàn có thể học Python với bạn bè, người thân. Những kiến thức được chia sẻ liên tục giúp việc học tập được hiệu quả hơn bao giờ hết. Đồng thời, bạn hoàn toàn có thể biết được những lỗ hổng kiến thức của bạn thân để kịp thời bổ sung và điều chỉnh phù hợp. Tuy nhiên, phương pháp này được đánh giá phù hợp hơn cả đối với những người đã có những kiến thức lập trình Python cơ bản mà thôi.</p><span style=\"margin: 0px; padding: 0px;\"></span></ul></div></h1><h5 style=\"margin: 0px 0px 0.5rem; padding: 0px; font-weight: 600; line-height: 1.2; font-size: 1.25rem; color: rgb(0, 0, 0);\">Khóa học Python chuyên nghiệp</h5><h1 class=\"margin-bottom-15\" style=\"margin-top: 0px; margin-bottom: 15px; padding: 10px 0px 0px; line-height: 1.2; font-size: 2.5rem; font-family: Exo, sans-serif; color: rgb(33, 37, 41);\"><div class=\"techmaster-font-open-sans post-content\" style=\"margin: 0px; padding: 1.5rem 0px 1rem; overflow-x: auto; border-top: 0.5px solid rgba(0, 0, 0, 0.125); line-height: 1.75rem; letter-spacing: -0.003em; overflow-wrap: break-word; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 16px;\"><ul style=\"margin-right: 0px; margin-bottom: 1rem; margin-left: 0px; padding: 0px; list-style: none;\"><p style=\"margin-bottom: 1rem; padding: 0px;\"> Khắc phục hoàn toàn những khó khăn trong việc tự học python cơ bản, hiện nay nhiều khóa học Python chuyên nghiệp đã mang đến cho người học phương pháp học tập khoa học và hiệu quả nhất. Đến với các trung tâm bạn sẽ được trang bị những kiến thức về ngôn ngữ lập trình Python từ cơ bản đến nâng cao. Các bài giảng được thiết kế đảm bảo mang đến cho người học, kể cả các bạn thanh thiếu nhi có thể dễ dàng tiếp thu những kiến thức cần thiết và chính xác nhất. Đồng thời tại các trung tâm cũng tạo nên môi trường học tập năng động, lành mạnh để các bạn có thể cởi mở học hỏi và khẳng định bản thân. Chính vì vậy, tất cả mọi người, kể cả trẻ em từ 12-16 tuổi đều có thể dễ dàng nắm chắc được những kiến thức về Python nhanh chóng với sự hướng dẫn của các trung tâm chuyên nghiệp cùng sự đồng hành của các bậc phụ huynh.</p><span style=\"margin: 0px; padding: 0px;\"></span></ul></div></h1><h2 style=\"margin: 0px 0px 0.5rem; padding: 0px; font-weight: 600; line-height: 1.2; font-size: 2rem; color: rgb(9, 49, 102);\">Lựa chọn học Python tại SPEC</h2><h1 class=\"margin-bottom-15\" style=\"margin-top: 0px; margin-bottom: 15px; padding: 10px 0px 0px; line-height: 1.2; font-size: 2.5rem; font-family: Exo, sans-serif; color: rgb(33, 37, 41);\"><div class=\"techmaster-font-open-sans post-content\" style=\"margin: 0px; padding: 1.5rem 0px 1rem; overflow-x: auto; border-top: 0.5px solid rgba(0, 0, 0, 0.125); line-height: 1.75rem; letter-spacing: -0.003em; overflow-wrap: break-word; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 16px;\"><ul style=\"margin-right: 0px; margin-bottom: 1rem; margin-left: 0px; padding: 0px; list-style: none;\"><p style=\"margin-bottom: 1rem; padding: 0px;\"> Hiện nay, việc tìm kiếm một khóa học Python khá đơn giản. Bởi khá nhiều trung tâm trên khắp cả nước cung cấp dịch vụ hữu ích này. Tuy nhiên, với kinh nghiệm và uy tín lâu năm trong lĩnh vực giáo dục hiện nay, SPEC thực sự là một trong những địa chỉ mà các bậc phụ huynh và các em học sinh không nên bỏ qua bởi những điểm nổi bật như:</p><span style=\"margin: 0px; padding: 0px;\"></span></ul></div></h1><h6 style=\"margin: 0px 0px 0.5rem; padding: 0px; font-weight: 600; line-height: 1.2; font-size: 1rem; color: rgb(0, 0, 0);\">Đội ngũ giảng viên chuyên nghiệp</h6><h1 class=\"margin-bottom-15\" style=\"margin-top: 0px; margin-bottom: 15px; padding: 10px 0px 0px; line-height: 1.2; font-size: 2.5rem; font-family: Exo, sans-serif; color: rgb(33, 37, 41);\"><div class=\"techmaster-font-open-sans post-content\" style=\"margin: 0px; padding: 1.5rem 0px 1rem; overflow-x: auto; border-top: 0.5px solid rgba(0, 0, 0, 0.125); line-height: 1.75rem; letter-spacing: -0.003em; overflow-wrap: break-word; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 16px;\"><ul style=\"margin-right: 0px; margin-bottom: 1rem; margin-left: 0px; padding: 0px; list-style: none;\"><p style=\"margin-bottom: 1rem; padding: 0px;\"> Trung tâm SPEC với đội ngũ giáo viên nhiệt tình, trẻ trung, và tâm huyết với trẻ, có nhiều năm kinh nghiệm giảng dạy. Mỗi buổi học có ít nhất 2 giáo viên và trợ giảng, giải đáp các thắc mắc, đảm bảo hướng dẫn tỉ mỉ từng thao tác cho trẻ. Vì vậy mà giúp các bạn nhanh chóng lĩnh hội được các kiến thức cần thiết trong việc học và ứng dụng ngôn ngữ lập trình Python vào cuộc sống.</p><p style=\"margin-bottom: 1rem; padding: 0px; text-align: center;\"><img alt=\"\" height=\"602\" src=\"https://spec.edu.vn/client/image/a9.png\" width=\"500\" style=\"margin: auto; padding: 0px; border-style: none; max-width: 100%; height: auto;\"></p><span style=\"margin: 0px; padding: 0px;\"></span><p style=\"margin-bottom: 1rem; margin-left: 15px; padding: 0px; font-style: italic; text-align: center;\">SPEC tự hào là địa chỉ dạy lập trình cho trẻ tốt nhất Việt Nam</p><span style=\"margin: 0px; padding: 0px;\"></span></ul></div></h1><h6 style=\"margin: 0px 0px 0.5rem; padding: 0px; font-weight: 600; line-height: 1.2; font-size: 1rem; color: rgb(0, 0, 0);\">Đội ngũ giảng viên chuyên nghiệp</h6><h1 class=\"margin-bottom-15\" style=\"margin-top: 0px; margin-bottom: 15px; padding: 10px 0px 0px; line-height: 1.2; font-size: 2.5rem; font-family: Exo, sans-serif; color: rgb(33, 37, 41);\"><div class=\"techmaster-font-open-sans post-content\" style=\"margin: 0px; padding: 1.5rem 0px 1rem; overflow-x: auto; border-top: 0.5px solid rgba(0, 0, 0, 0.125); line-height: 1.75rem; letter-spacing: -0.003em; overflow-wrap: break-word; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 16px;\"><ul style=\"margin-right: 0px; margin-bottom: 1rem; margin-left: 0px; padding: 0px; list-style: none;\"><p style=\"margin-bottom: 1rem; padding: 0px;\"> Với mỗi đối tượng học khác nhau, các giảng viên chuyên nghiệp tại SPEC lại có những phương pháp giảng dạy phù hợp để đem lại được hiệu quả cao nhất. Đặc biệt với khóa học ngôn ngữ lập trình Python, các giảng viên sẽ kết hợp việc vừa học vừa chơi vô cùng bổ ích. Các kiến thức lập trình sẽ được khéo léo đưa vào các ví dụ gần gũi và quen thuộc. Từ đó giúp các bé nhanh chóng tiếp thu được những kiến thức cần thiết nhất.Việc học ngôn ngữ lập trình tại SPEC thực sự còn có tính ứng dụng rất cao, giúp phát triển tư duy logic, sự sáng tạo hoàn hảo. Từ đó mà bé có thể giải quyết nhanh chóng hơn các bài tập trên lớp, đồng thời có những kỹ năng mềm cần thiết trong học tập và cuộc sống.</p><span style=\"margin: 0px; padding: 0px;\"></span></ul></div></h1><h6 style=\"margin: 0px 0px 0.5rem; padding: 0px; font-weight: 600; line-height: 1.2; font-size: 1rem; color: rgb(0, 0, 0);\">Dịch vụ hoàn hảo</h6><h1 class=\"margin-bottom-15\" style=\"margin-top: 0px; margin-bottom: 15px; padding: 10px 0px 0px; line-height: 1.2; font-size: 2.5rem; font-family: Exo, sans-serif; color: rgb(33, 37, 41);\"><div class=\"techmaster-font-open-sans post-content\" style=\"margin: 0px; padding: 1.5rem 0px 1rem; overflow-x: auto; border-top: 0.5px solid rgba(0, 0, 0, 0.125); line-height: 1.75rem; letter-spacing: -0.003em; overflow-wrap: break-word; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 16px;\"><ul style=\"margin-right: 0px; margin-bottom: 1rem; margin-left: 0px; padding: 0px; list-style: none;\"><li style=\"margin: 0px; padding: 0px; list-style: inside;\">Mức học phí phải chăng, phù hợp với mọi học sinh</li><li style=\"margin: 0px; padding: 0px; list-style: inside;\">Trẻ được học thử miễn phí 3 buổi đầu tiên, trước khi đăng ký các khóa học chính thức</li><li style=\"margin: 0px; padding: 0px; list-style: inside;\">Thời gian học tập linh hoạt.</li><li style=\"margin: 0px; padding: 0px; list-style: inside;\">Trung tâm có hình thức học bảo lưu “miễn phí” trong vòng 1 năm cho đến khi trẻ nắm vững về Java.</li></ul><span id=\"\" style=\"margin: 0px; padding: 0px;\"></span></div></h1><h5 style=\"box-sizing: border-box; margin: 0px 0px 0.5rem; padding: 0px; font-weight: 600; line-height: 1.2; font-size: 1.25rem; font-family: inherit; color: inherit;\">Đề cương Lập trình cho trẻ:</h5>', 0, 8, b'0', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n    <meta http-equiv=\"content-style-type\" content=\"text/css\">\n    <meta http-equiv=\"content-language\" content=\"en-vi\">\n    <meta name=\"copyright\" content=\"spec.edu.vn\">\n    <meta name=\"keywords\" content=\"Lập trình Python, Python cơ bản, Python cho trẻ em, học lập trình Python, Python, game Python\">\n    <meta name=\"description\" content=\"Lập trình Python là gì? Tại sao nên dạy lập trình Python cho trẻ ngay hôm nay? Hãy cùng tìm hiểu những thông tin hữu ích ngay sau đây nhé!\">\n    <meta property=\"og:site_name\" content=\"spec.edu.vn\">\n    <meta property=\"og:type\" content=\"website\">\n    <meta property=\"og:title\" content=\"Sức hút từ khóa học lập trình Python SPEC\">\n    <meta property=\"og:description\" content=\"Lập trình Python là gì? Tại sao nên dạy lập trình Python cho trẻ ngay hôm nay? Hãy cùng tìm hiểu những thông tin hữu ích ngay sau đây nhé!\">\n    <meta property=\"og:url\" content=\"http://localhost:9668/admin-add-topic\">\n    <meta name=”robots” content=”index,follow” >\n    <meta name=\"author\" content=\"SpecEdu\">\n    <meta name=\"googlebot\" content=\"index,follow,archive\">\n    <meta property=\"og:type\" content=\"article\">', 'https://spec.edu.vn/client/image/a9.png', 13, 'suc-hut-cua-khoa-hoc-lap-trinh-python-spec', 'Sức hút từ khóa học lập trình Python SPEC', 'Lập trình Python là gì? Tại sao nên dạy lập trình Python cho trẻ ngay hôm nay? Hãy cùng tìm hiểu những thông tin hữu ích ngay sau đây nhé!', 'Lập trình Python, Python cơ bản, Python cho trẻ em, học lập trình Python, Python, game Python', 'index,follow'),
(18, 'Sức hút từ khóa học lập trình Python SPEC', '2021-05-12', '<p><span style=\"color:#212529; font-family:Exo,sans-serif\">Lập tr&igrave;nh Python l&agrave; g&igrave;? Tại sao n&ecirc;n dạy lập tr&igrave;nh Python cho trẻ ngay h&ocirc;m nay? H&atilde;y c&ugrave;ng t&igrave;m hiểu những th&ocirc;ng tin hữu &iacute;ch ngay sau đ&acirc;y nh&eacute;!</span></p>\n', '<h1>Lập tr&igrave;nh Python l&agrave; g&igrave;? Tại sao n&ecirc;n dạy lập tr&igrave;nh cho trẻ ngay h&ocirc;m nay</h1>\n\n<p>&emsp;Lập tr&igrave;nh Python l&agrave; g&igrave;? Tại sao n&ecirc;n dạy lập tr&igrave;nh Python cho trẻ ngay h&ocirc;m nay? H&atilde;y c&ugrave;ng t&igrave;m hiểu những th&ocirc;ng tin hữu &iacute;ch ngay sau đ&acirc;y nh&eacute;!</p>\n\n<h2>Dạy cho trẻ về ng&ocirc;n ngữ lập tr&igrave;nh Python</h2>\n\n<div>\n<p>&emsp;Python l&agrave; ng&ocirc;n ngữ lập tr&igrave;nh quen thuộc d&ugrave;ng để ph&aacute;t triển website v&agrave; c&aacute;c ứng dụng c&ocirc;ng nghệ kh&aacute;c. Vậy Lập tr&igrave;nh Python l&agrave; g&igrave;? Tại sao n&ecirc;n dạy lập tr&igrave;nh Python cho trẻ ngay h&ocirc;m nay? H&atilde;y c&ugrave;ng kh&aacute;m ph&aacute; những th&ocirc;ng tin hữu &iacute;ch qua b&agrave;i viết sau đ&acirc;y nh&eacute;&nbsp;</p>\n\n<p style=\"text-align:center\"><img alt=\"\" height=\"400\" src=\"https://spec.edu.vn/client/image/a6.jpg\" width=\"600\" /></p>\n\n<p style=\"text-align:center\">Dạy lập tr&igrave;nh Python cho trẻ đang l&agrave; xu hướng tại c&aacute;c quốc gia ti&ecirc;n tiến tr&ecirc;n thế giới</p>\n</div>\n\n<h2>Lập tr&igrave;nh Python l&agrave; g&igrave;?</h2>\n\n<div>\n<p>&emsp;Python l&agrave; một ng&ocirc;n ngữ lập tr&igrave;nh bậc cao v&agrave; v&ocirc; c&ugrave;ng quen thuộc đối với những người y&ecirc;u c&ocirc;ng nghệ. Ng&ocirc;n ngữ n&agrave;y được s&aacute;ng tạo bởi Guido van Rossum v&agrave; lần đầu c&ocirc;ng bố v&agrave;o năm 1991.</p>\n\n<ul>\n</ul>\n\n<p style=\"text-align:center\"><img alt=\"\" height=\"602\" src=\"https://spec.edu.vn/client/image/a7.jpg\" width=\"500\" /></p>\n\n<p style=\"text-align:center\">Python l&agrave; ng&ocirc;n ngữ lập tr&igrave;nh bậc cao được sử dụng rộng r&atilde;i tr&ecirc;n thế giới</p>\n</div>\n\n<h2>L&yacute; do ng&ocirc;n ngữ lập tr&igrave;nh Python được y&ecirc;u th&iacute;ch tr&ecirc;n to&agrave;n thế giới</h2>\n\n<div>\n<p>&emsp;L&agrave; một trong những ng&ocirc;n ngữ lập tr&igrave;nh được y&ecirc;u th&iacute;ch nhất tr&ecirc;n thế giới hiện nay, lập tr&igrave;nh Python chiếm được cảm t&igrave;nh của đ&ocirc;ng đảo kh&aacute;ch h&agrave;ng bởi những ưu điểm như:</p>\n\n<ul>\n	<li>Đơn giản, dễ học. Bởi vậy lập tr&igrave;nh Python ho&agrave;n to&agrave;n ph&ugrave; hợp với tất cả mọi người kể cả những người mới bắt đầu v&agrave; việc tự học Python thực sự l&agrave; điều kh&ocirc;ng qu&aacute; kh&oacute; khăn.&nbsp;</li>\n	<li>K&iacute;ch th&iacute;ch sự ph&aacute;t triển tư duy, t&iacute;nh logic ở trẻ. V&igrave; vậy m&agrave; hỗ trợ tốt trong việc học tập v&agrave; giải quyết c&aacute;c b&agrave;i tập tr&ecirc;n lớp của trẻ&nbsp;</li>\n	<li>Python l&agrave; ng&ocirc;n ngữ m&atilde; nguồn mở ho&agrave;n to&agrave;n miễn ph&iacute; mang đến nhiều tiện &iacute;ch cho người sử dụng</li>\n	<li>Ứng dụng rộng r&atilde;i trong cuộc sống. Thực tế, lập tr&igrave;nh Python đ&atilde; v&agrave; đang v&ocirc; c&ugrave;ng phổ biến tr&ecirc;n khắp thế giới với những ứng dụng hữu &iacute;ch như: ph&aacute;t triển c&aacute;c website v&agrave; c&aacute;c nền tảng c&ocirc;ng nghệ kh&aacute;c; ứng dụng trong machine learning; ứng dụng trong giảng dạy; ph&acirc;n t&iacute;ch dữ liệu; ph&aacute;t triển game,&hellip;.</li>\n</ul>\n</div>\n\n<h2>L&yacute; do n&ecirc;n học lập tr&igrave;nh Python ngay h&ocirc;m nay</h2>\n\n<div>\n<p>&emsp;Việc học c&aacute;c ng&ocirc;n ngữ lập tr&igrave;nh đ&atilde; v&agrave; đang trở n&ecirc;n ng&agrave;y c&agrave;ng phổ biến tr&ecirc;n thế giới. Đặc biệt tại c&aacute;c quốc gia ph&aacute;t triển tr&ecirc;n thế giới, học Python đ&atilde; được đưa v&agrave;o chương tr&igrave;nh gi&aacute;o dục phổ th&ocirc;ng. V&agrave; tại Việt Nam trong những năm gần đ&acirc;y, việc dạy lập tr&igrave;nh cho trẻ n&oacute;i chung v&agrave; dạy Python n&oacute;i ri&ecirc;ng cũng nhận được quan t&acirc;m của đ&ocirc;ng đảo mọi người v&agrave; đang l&agrave; xu hướng tất yếu. Bởi c&aacute;c nh&agrave; khoa học đ&atilde; chứng minh được những lợi &iacute;ch tuyệt vời của bộ m&ocirc;n n&agrave;y đối với sự ph&aacute;t triển to&agrave;n diện của trẻ</p>\n\n<ul>\n	<li>Ph&aacute;t triển tư duy logic, sự s&aacute;ng tạo ở trẻ</li>\n	<li>R&egrave;n luyện t&iacute;nh ki&ecirc;n tr&igrave; v&agrave; tỉ mỉ trong cuộc sống</li>\n	<li>Tăng khả năng l&agrave;m việc hiệu quả, đặc biệt l&agrave; l&agrave;m việc nh&oacute;m</li>\n	<li>R&egrave;n luyện khả năng thuyết tr&igrave;nh, giải th&iacute;ch dễ hiểu, khoa học</li>\n</ul>\n\n<p style=\"text-align:center\"><img alt=\"\" height=\"602\" src=\"https://spec.edu.vn/client/image/a2.jpg\" width=\"500\" /></p>\n\n<p style=\"text-align:center\">Phương ph&aacute;p học tập l&agrave; yếu tố quyết định hiệu quả việc dạy lập tr&igrave;nh cho trẻ</p>\n</div>\n\n<h2>Học lập tr&igrave;nh Python như thế n&agrave;o để đem lại hiệu quả tối ưu?</h2>\n\n<div>\n<p>&emsp;Ch&iacute;nh v&igrave; sự phổ biến của ng&ocirc;n ngữ lập tr&igrave;nh Python trong cuộc sống m&agrave; hiện nay việc học Python đang l&agrave; chủ đề được rất nhiều người quan t&acirc;m. Tuy được c&aacute;c chuy&ecirc;n gia đ&aacute;nh gi&aacute; l&agrave; ng&ocirc;n ngữ lập tr&igrave;nh đơn giản, dễ học, dễ nhớ nhưng để c&oacute; thể nhanh ch&oacute;ng tiếp cận với những kiến thức cơ bản v&agrave; sử dụng th&agrave;nh thạo Python bạn vẫn cần c&oacute; những phương ph&aacute;p học tập khoa học v&agrave; hiệu quả</p>\n\n<ul>\n</ul>\n</div>\n\n<p><strong>Tự học Python cơ bản ngay tại nh&agrave;</strong></p>\n\n<div>\n<p>&emsp;Với sự ph&aacute;t triển mạnh mẽ của c&ocirc;ng nghệ 4.0 th&igrave; hiện nay việc t&igrave;m kiếm kho t&agrave;ng tri thức trở n&ecirc;n đơn giản v&agrave; dễ d&agrave;ng hơn đối với tất cả mọi người. Ch&iacute;nh v&igrave; vậy, bạn ho&agrave;n to&agrave;n c&oacute; thể tự học Python cơ bản ngay tại nh&agrave;. Nguồn t&agrave;i liệu phong ph&uacute; đa dạng từ s&aacute;ch, b&aacute;o, internet hay c&aacute;c clip được chia sẻ rộng r&atilde;i tr&ecirc;n c&aacute;c trang mạng x&atilde; hội thực sự l&agrave; th&ocirc;ng tin hữu &iacute;ch d&agrave;nh cho bạn. Tuy nhi&ecirc;n, việc tự học cũng sẽ c&oacute; khiến bạn gặp kh&aacute; nhiều kh&oacute; khăn trong việc lựa chọn v&agrave; chắt lọc th&ocirc;ng tin ch&iacute;nh x&aacute;c nhất phục vụ việc học tập được hiệu quả v&agrave; nhanh ch&oacute;ng hơn</p>\n\n<p style=\"text-align:center\"><img alt=\"\" height=\"383\" src=\"https://spec.edu.vn/client/image/a8.jpg\" width=\"680\" /></p>\n\n<p style=\"text-align:center\">Học lập tr&igrave;nh Python từ cơ bản đến n&acirc;ng cao l&agrave; điều được kh&aacute;ch h&agrave;ng quan t&acirc;m</p>\n\n<ul>\n</ul>\n</div>\n\n<p><strong>Tự học Python với người kh&aacute;c</strong></p>\n\n<div>\n<p>&emsp;Để tạo n&ecirc;n kh&ocirc;ng kh&iacute; học tập s&ocirc;i nổi v&agrave; cởi mở bạn ho&agrave;n to&agrave;n c&oacute; thể học Python với bạn b&egrave;, người th&acirc;n. Những kiến thức được chia sẻ li&ecirc;n tục gi&uacute;p việc học tập được hiệu quả hơn bao giờ hết. Đồng thời, bạn ho&agrave;n to&agrave;n c&oacute; thể biết được những lỗ hổng kiến thức của bạn th&acirc;n để kịp thời bổ sung v&agrave; điều chỉnh ph&ugrave; hợp. Tuy nhi&ecirc;n, phương ph&aacute;p n&agrave;y được đ&aacute;nh gi&aacute; ph&ugrave; hợp hơn cả đối với những người đ&atilde; c&oacute; những kiến thức lập tr&igrave;nh Python cơ bản m&agrave; th&ocirc;i.</p>\n\n<ul>\n</ul>\n</div>\n\n<p><strong>Kh&oacute;a học Python chuy&ecirc;n nghiệp</strong></p>\n\n<div>\n<p>&emsp;Khắc phục ho&agrave;n to&agrave;n những kh&oacute; khăn trong việc tự học python cơ bản, hiện nay nhiều kh&oacute;a học Python chuy&ecirc;n nghiệp đ&atilde; mang đến cho người học phương ph&aacute;p học tập khoa học v&agrave; hiệu quả nhất. Đến với c&aacute;c trung t&acirc;m bạn sẽ được trang bị những kiến thức về ng&ocirc;n ngữ lập tr&igrave;nh Python từ cơ bản đến n&acirc;ng cao. C&aacute;c b&agrave;i giảng được thiết kế đảm bảo mang đến cho người học, kể cả c&aacute;c bạn thanh thiếu nhi c&oacute; thể dễ d&agrave;ng tiếp thu những kiến thức cần thiết v&agrave; ch&iacute;nh x&aacute;c nhất. Đồng thời tại c&aacute;c trung t&acirc;m cũng tạo n&ecirc;n m&ocirc;i trường học tập năng động, l&agrave;nh mạnh để c&aacute;c bạn c&oacute; thể cởi mở học hỏi v&agrave; khẳng định bản th&acirc;n. Ch&iacute;nh v&igrave; vậy, tất cả mọi người, kể cả trẻ em từ 12-16 tuổi đều c&oacute; thể dễ d&agrave;ng nắm chắc được những kiến thức về Python nhanh ch&oacute;ng với sự hướng dẫn của c&aacute;c trung t&acirc;m chuy&ecirc;n nghiệp c&ugrave;ng sự đồng h&agrave;nh của c&aacute;c bậc phụ huynh.</p>\n\n<ul>\n</ul>\n</div>\n\n<h2>Lựa chọn học Python tại SPEC</h2>\n\n<div>\n<p>&emsp;Hiện nay, việc t&igrave;m kiếm một kh&oacute;a học Python kh&aacute; đơn giản. Bởi kh&aacute; nhiều trung t&acirc;m tr&ecirc;n khắp cả nước cung cấp dịch vụ hữu &iacute;ch n&agrave;y. Tuy nhi&ecirc;n, với kinh nghiệm v&agrave; uy t&iacute;n l&acirc;u năm trong lĩnh vực gi&aacute;o dục hiện nay, SPEC thực sự l&agrave; một trong những địa chỉ m&agrave; c&aacute;c bậc phụ huynh v&agrave; c&aacute;c em học sinh kh&ocirc;ng n&ecirc;n bỏ qua bởi những điểm nổi bật như:</p>\n\n<ul>\n</ul>\n</div>\n\n<p><strong>Đội ngũ giảng vi&ecirc;n chuy&ecirc;n nghiệp</strong></p>\n\n<div>\n<p>&emsp;Trung t&acirc;m SPEC với đội ngũ gi&aacute;o vi&ecirc;n nhiệt t&igrave;nh, trẻ trung, v&agrave; t&acirc;m huyết với trẻ, c&oacute; nhiều năm kinh nghiệm giảng dạy. Mỗi buổi học c&oacute; &iacute;t nhất 2 gi&aacute;o vi&ecirc;n v&agrave; trợ giảng, giải đ&aacute;p c&aacute;c thắc mắc, đảm bảo hướng dẫn tỉ mỉ từng thao t&aacute;c cho trẻ. V&igrave; vậy m&agrave; gi&uacute;p c&aacute;c bạn nhanh ch&oacute;ng lĩnh hội được c&aacute;c kiến thức cần thiết trong việc học v&agrave; ứng dụng ng&ocirc;n ngữ lập tr&igrave;nh Python v&agrave;o cuộc sống.</p>\n\n<p style=\"text-align:center\"><img alt=\"\" height=\"335\" src=\"https://spec.edu.vn/client/image/a9.jpg\" width=\"640\" /></p>\n\n<p style=\"text-align:center\">SPEC tự h&agrave;o l&agrave; địa chỉ dạy lập tr&igrave;nh cho trẻ tốt nhất Việt Nam</p>\n\n<ul>\n</ul>\n</div>\n\n<div>\n<p>&emsp;Với mỗi đối tượng học kh&aacute;c nhau, c&aacute;c giảng vi&ecirc;n chuy&ecirc;n nghiệp tại SPEC lại c&oacute; những phương ph&aacute;p giảng dạy ph&ugrave; hợp để đem lại được hiệu quả cao nhất. Đặc biệt với kh&oacute;a học ng&ocirc;n ngữ lập tr&igrave;nh Python, c&aacute;c giảng vi&ecirc;n sẽ kết hợp việc vừa học vừa chơi v&ocirc; c&ugrave;ng bổ &iacute;ch. C&aacute;c kiến thức lập tr&igrave;nh sẽ được kh&eacute;o l&eacute;o đưa v&agrave;o c&aacute;c v&iacute; dụ gần gũi v&agrave; quen thuộc. Từ đ&oacute; gi&uacute;p c&aacute;c b&eacute; nhanh ch&oacute;ng tiếp thu được những kiến thức cần thiết nhất.Việc học ng&ocirc;n ngữ lập tr&igrave;nh tại SPEC thực sự c&ograve;n c&oacute; t&iacute;nh ứng dụng rất cao, gi&uacute;p ph&aacute;t triển tư duy logic, sự s&aacute;ng tạo ho&agrave;n hảo. Từ đ&oacute; m&agrave; b&eacute; c&oacute; thể giải quyết nhanh ch&oacute;ng hơn c&aacute;c b&agrave;i tập tr&ecirc;n lớp, đồng thời c&oacute; những kỹ năng mềm cần thiết trong học tập v&agrave; cuộc sống.</p>\n\n<ul>\n</ul>\n</div>\n\n<p>Dịch vụ ho&agrave;n hảo</p>\n\n<div>\n<ul>\n	<li>Mức học ph&iacute; phải chăng, ph&ugrave; hợp với mọi học sinh</li>\n	<li>Trẻ được học thử miễn ph&iacute; 3 buổi đầu ti&ecirc;n, trước khi đăng k&yacute; c&aacute;c kh&oacute;a học ch&iacute;nh thức</li>\n	<li>Thời gian học tập linh hoạt.</li>\n	<li>Trung t&acirc;m c&oacute; h&igrave;nh thức học bảo lưu &ldquo;miễn ph&iacute;&rdquo; trong v&ograve;ng 1 năm cho đến khi trẻ nắm vững về Java.</li>\n</ul>\n</div>\n\n<p>Đề cương Lập tr&igrave;nh cho trẻ:</p>\n', 0, 8, b'1', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n    <meta http-equiv=\"content-style-type\" content=\"text/css\">\n    <meta http-equiv=\"content-language\" content=\"en-vi\">\n    <meta name=\"copyright\" content=\"spec.edu.vn\">\n    <meta name=\"keywords\" content=\"Lập trình Python, Python cơ bản, Python cho trẻ em, học lập trình Python, Python, game Python\">\n    <meta name=\"description\" content=\"Lập trình Python là gì? Tại sao nên dạy lập trình Python cho trẻ ngay hôm nay? Hãy cùng tìm hiểu những thông tin hữu ích ngay sau đây nhé!\">\n    <meta property=\"og:site_name\" content=\"spec.edu.vn\">\n    <meta property=\"og:type\" content=\"website\">\n    <meta property=\"og:title\" content=\"Sức hút từ khóa học lập trình Python SPEC\">\n    <meta property=\"og:description\" content=\"Lập trình Python là gì? Tại sao nên dạy lập trình Python cho trẻ ngay hôm nay? Hãy cùng tìm hiểu những thông tin hữu ích ngay sau đây nhé!\">\n    <meta property=\"og:url\" content=\"http://spec.edu.vn/admin-topic\">\n    <meta name=”robots” content=”index,follow” >\n    <meta name=\"author\" content=\"SpecEdu\">\n    <meta name=\"googlebot\" content=\"index,follow,archive\">\n    <meta property=\"og:type\" content=\"article\">', 'https://spec.edu.vn/client/image/a9.jpg', 8, 'suc-hut-cua-khoa-hoc-lap-trinh-python-spec', 'Sức hút từ khóa học lập trình Python SPEC', 'Lập trình Python là gì? Tại sao nên dạy lập trình Python cho trẻ ngay hôm nay? Hãy cùng tìm hiểu những thông tin hữu ích ngay sau đây nhé!', 'Lập trình Python, Python cơ bản, Python cho trẻ em, học lập trình Python, Python, game Python', 'index,follow');
INSERT INTO `topic` (`id`, `title`, `create_date`, `introduct`, `content`, `view`, `id_user`, `deleted`, `meta_html`, `image_src`, `course_id`, `view_url`, `meta_title`, `meta_description`, `meta_keyword`, `meta_robot`) VALUES
(19, 'Khóa học Minecraft học mà chơi', '2021-05-03', '<p><span style=\"color:#212529; font-family:Exo,sans-serif\">&emsp;Minecraft l&agrave; một ng&ocirc;n ngữ lập tr&igrave;nh nổi tiếng thế giới. Đặc biệt c&aacute;c chuy&ecirc;n gia đ&atilde; nhận định rằng việc cho b&eacute; tiếp cận sớm với bộ m&ocirc;n n&agrave;y thực sự l&agrave; điều v&ocirc; c&ugrave;ng hữu &iacute;ch m&agrave; cha mẹ kh&ocirc;ng n&ecirc;n bỏ qua.</span></p>\n', '<h1>Học lập tr&igrave;nh Minecraft- trải nghiệm l&yacute; th&uacute; cho b&eacute; kh&ocirc;ng n&ecirc;n bỏ qua</h1>\n\n<h1>&nbsp;</h1>\n\n<p>&emsp;Minecraft l&agrave; một ng&ocirc;n ngữ lập tr&igrave;nh nổi tiếng thế giới. Đặc biệt c&aacute;c chuy&ecirc;n gia đ&atilde; nhận định rằng việc cho b&eacute; tiếp cận sớm với bộ m&ocirc;n n&agrave;y thực sự l&agrave; điều v&ocirc; c&ugrave;ng hữu &iacute;ch m&agrave; cha mẹ kh&ocirc;ng n&ecirc;n bỏ qua.</p>\n\n<h2>Dạy cho trẻ về ng&ocirc;n ngữ lập tr&igrave;nh Minecraft</h2>\n\n<h1>&nbsp;</h1>\n\n<div>\n<p>&emsp;Minecraft từ l&acirc;u đ&atilde; l&agrave; c&aacute;i t&ecirc;n quen thuộc đối với những người y&ecirc;u th&iacute;ch lập tr&igrave;nh tr&ecirc;n to&agrave;n thế giới. Đặc biệt ng&ocirc;n ngữ lập tr&igrave;nh n&agrave;y kh&ocirc;ng chỉ ph&ugrave; hợp với người lớn m&agrave; c&ograve;n được c&aacute;c bạn nhỏ v&ocirc; c&ugrave;ng y&ecirc;u th&iacute;ch, gi&uacute;p c&aacute;c b&eacute; ph&aacute;t triển to&agrave;n diện. H&atilde;y c&ugrave;ng ch&uacute;ng t&ocirc;i t&igrave;m hiểu vấn đề n&agrave;y qua b&agrave;i viết sau đ&acirc;y&nbsp;</p>\n</div>\n\n<h2>Những điều cần biết về lập tr&igrave;nh Minecraft</h2>\n\n<h1>&nbsp;</h1>\n\n<div>\n<p>&emsp;Minecraft l&agrave; một sản phẩm của Microsoft - tập đo&agrave;n c&ocirc;ng nghệ lớn nhất thế giới. Ngay từ khi ra đời c&ocirc;ng cụ thu h&uacute;t sự quan t&acirc;m v&agrave; trải nghiệm của 75 triệu người tham gia tr&ecirc;n to&agrave;n cầu.</p>\n\n<ul>\n</ul>\n\n<p style=\"text-align:center\"><img alt=\"\" height=\"360\" src=\"https://spec.edu.vn/client/image/a15.jpg\" width=\"640\" /></p>\n\n<p style=\"text-align:center\">Minecraft l&agrave; c&ocirc;ng cụ được s&aacute;ng tạo bởi tập đo&agrave;n c&ocirc;ng nghệ h&agrave;ng đầu thế giới</p>\n\n<p>&emsp;Sử dụng Minecraft người d&ugrave;ng sẽ được trải nghiệm việc x&acirc;y dựng thế giới ri&ecirc;ng đa dạng m&agrave;u sắc theo &yacute; tưởng của bạn. Từ đ&oacute; những kiến thức cơ bản về lập tr&igrave;nh sẽ được người sử dụng tiếp thu nhanh ch&oacute;ng v&agrave; ho&agrave;n hảo nhất. Ch&iacute;nh v&igrave; vậy, m&agrave; Minecraft ng&agrave;y c&agrave;ng trở n&ecirc;n th&ocirc;ng dụng. Thậm ch&iacute; tại nhiều quốc gia tr&ecirc;n thế giới ng&ocirc;n ngữ lập tr&igrave;nh n&agrave;y c&ograve;n được đưa v&agrave;o chương tr&igrave;nh gi&aacute;o dục phổ th&ocirc;ng v&agrave; nhận được những phản hồi t&iacute;ch cực.</p>\n</div>\n\n<h2>Tại sao lập tr&igrave;nh Minecraft lại cuốn h&uacute;t trẻ em? v&agrave; đ&aacute;p &aacute;n ch&iacute;nh x&aacute;c nhất</h2>\n\n<h1>&nbsp;</h1>\n\n<div>\n<p>&emsp;Nhiều người quan niệm rằng, lập tr&igrave;nh l&agrave; c&ocirc;ng việc chỉ d&agrave;nh cho người lớn m&agrave; th&ocirc;i. Thực tế, trong thời đại c&ocirc;ng nghệ 4.0 việc những bạn nhỏ say sưa viết code lập tr&igrave;nh b&ecirc;n những chiếc m&aacute;y vi t&iacute;nh dần trở th&agrave;nh điều gần gũi v&agrave; quen thuộc.</p>\n\n<p style=\"text-align:center\"><img alt=\"\" height=\"602\" src=\"https://spec.edu.vn/client/image/a16.jpg\" width=\"500\" /></p>\n\n<p style=\"text-align:center\">Giao diện đẹp, c&aacute;c lệnh dễ sử dụng l&agrave; điều cuốn h&uacute;t c&aacute;c bạn nhỏ đến với Minecraft</p>\n\n<p>&emsp;Đặc biệt với t&iacute;nh năng ưu việt của Minecraft, c&aacute;c bạn nhỏ c&oacute; thể học c&aacute;ch sử dụng c&aacute;c lệnh một c&aacute;ch dễ d&agrave;ng, dễ nhớ. Việc học lập tr&igrave;nh v&igrave; vậy m&agrave; kh&ocirc;ng c&ograve;n qu&aacute; kh&oacute; khăn với cả những người mới bắt đầu hay những bạn nhỏ. Ngo&agrave;i ra, Minecraft c&ograve;n được c&aacute;c bạn nhỏ y&ecirc;u th&iacute;ch bởi khả năng lập tr&igrave;nh thế giới của ri&ecirc;ng m&igrave;nh. C&aacute;c b&eacute; sẽ được thỏa sức s&aacute;ng tạo theo sở th&iacute;ch của bản th&acirc;n. Việc học kh&ocirc;ng c&ograve;n kh&ocirc; khan v&agrave; kh&oacute; hiểu như nhiều người tưởng tượng m&agrave; v&ocirc; c&ugrave;ng cuốn h&uacute;t v&agrave; th&uacute; vị.</p>\n\n<p>&emsp;B&ecirc;n cạnh đ&oacute;, rất nhiều bậc phụ huynh đ&atilde; phản hồi t&iacute;ch cực về việc nhận thấy những thay đổi t&iacute;ch cực ở trẻ khi được tiếp cận với bộ m&ocirc;n n&agrave;y như:</p>\n\n<p>&emsp;Ch&iacute;nh v&igrave; những l&yacute; do tr&ecirc;n m&agrave; Minecraft thực sự l&agrave; c&ocirc;ng cụ hữu &iacute;ch đối với trẻ m&agrave; c&aacute;c bậc phụ huynh kh&ocirc;ng n&ecirc;n bỏ qua để tạo n&ecirc;n nền tảng vững chắc cho b&eacute; để vững bước trong tương lai.</p>\n\n<ul>\n	<li>B&eacute; tăng khả năng tư duy khoa học. V&igrave; vậy m&agrave; việc học tr&ecirc;n lớp, đặc biệt đối với c&aacute;c m&ocirc;n tự nhi&ecirc;n trở n&ecirc;n tiến bộ hơn rất nhiều.</li>\n	<li>K&iacute;ch th&iacute;ch sự t&igrave;m hiểu về thế giới xung quanh hơn ở trẻ. Thay v&igrave; mải m&ecirc; với những clip giải tr&iacute;, game,...B&eacute; sẽ t&iacute;ch cực t&igrave;m hiểu những điều mới mẻ v&agrave; th&uacute; vị hơn quanh m&igrave;nh.</li>\n	<li>Tăng khả năng l&agrave;m việc nh&oacute;m - kỹ năng kh&ocirc;ng thể thiếu đối với những c&ocirc;ng d&acirc;n hiện đại của thế kỷ 21</li>\n</ul>\n</div>\n\n<p>Giới thiệu về kh&oacute;a học lập tr&igrave;nh cho b&eacute;</p>\n\n<h1>&nbsp;</h1>\n\n<div>\n<p>&emsp;Thực tế hiện nay nhiều người y&ecirc;u th&iacute;ch lập tr&igrave;nh c&oacute; thể tự học về bộ m&ocirc;n n&agrave;y với nguồn t&agrave;i liệu v&ocirc; c&ugrave;ng từ c&aacute;c loại s&aacute;ch hay c&aacute;c clip tr&ecirc;n mạng,....Tuy nhi&ecirc;n, đối với c&aacute;c bạn nhỏ việc tự học sẽ khiến việc tiếp cận với lập tr&igrave;nh n&oacute;i chung v&agrave; lập tr&igrave;nh Minecraft gặp rất nhiều kh&oacute; khăn. Ch&iacute;nh v&igrave; vậy, c&aacute;c bậc phụ huynh cần t&igrave;m kiếm cho con em m&igrave;nh ngay những kh&oacute;a học uy t&iacute;n, nhằm:</p>\n\n<p style=\"text-align:center\"><img alt=\"\" height=\"440\" src=\"https://spec.edu.vn/client/image/a17.jpg\" width=\"660\" /></p>\n\n<p style=\"text-align:center\">Kh&oacute;a học lập tr&igrave;nh Minecraft được c&aacute;c b&eacute; v&ocirc; c&ugrave;ng y&ecirc;u th&iacute;ch</p>\n\n<p>&emsp;Ch&iacute;nh v&igrave; vậy m&agrave; việc đăng k&yacute; những kh&oacute;a học lập tr&igrave;nh cho b&eacute; l&agrave; điều v&ocirc; c&ugrave;ng quan trọng. Qua đ&oacute; gi&uacute;p n&acirc;ng cao chất lượng học tập, gi&uacute;p b&eacute; học hiệu quả hơn m&agrave; kh&ocirc;ng hề cảm thấy nh&agrave;m ch&aacute;n hay căng thẳng. Tuy nhi&ecirc;n, hiện nay tr&ecirc;n khắp cả nước c&oacute; rất nhiều trung t&acirc;m, trường dạy lập tr&igrave;nh với chất lượng gi&aacute;o dục kh&aacute;c nhau. Ch&iacute;nh v&igrave; vậy, để c&oacute; thể đạt được hiệu quả gi&aacute;o dục tốt nhất c&aacute;c bậc phụ huynh v&agrave; c&aacute;c em học sinh n&ecirc;n t&igrave;m hiểu kỹ lưỡng để lựa chọn cho m&igrave;nh địa chỉ uy t&iacute;n, chất lượng để tr&aacute;nh &ldquo;tiền mất tật mang&rdquo;.</p>\n\n<ul>\n	<li>Mang đến cho b&eacute; cơ hội học tập những kiến thức ch&iacute;nh x&aacute;c v&agrave; ho&agrave;n hảo nhất</li>\n	<li>Mọi thắc mắc của b&eacute; đều lu&ocirc;n được giải đ&aacute;p nhanh ch&oacute;ng</li>\n	<li>B&ecirc;n cạnh những kiến thức l&yacute; thuyết c&aacute;c bạn nhỏ sẽ được tận t&igrave;nh chỉ bảo việc &aacute;p dụng v&agrave;o thực tiễn hiệu quả.</li>\n	<li>C&oacute; m&ocirc;i trường học tập l&agrave;nh mạnh, với sự giao lưu v&agrave; tương t&aacute;c nhiều hơn với thầy c&ocirc; v&agrave; những bạn c&ugrave;ng sở th&iacute;ch.</li>\n</ul>\n</div>\n\n<h2>SPEC- địa chỉ học lập tr&igrave;nh Minecraft uy t&iacute;n tại Việt Nam</h2>\n\n<h1>&nbsp;</h1>\n\n<div>\n<p>&emsp;Học lập tr&igrave;nh web ở đ&acirc;u tốt nhất l&agrave; c&acirc;u hỏi kh&ocirc;ng hề đơn giản. Bởi hiện nay, c&aacute;c trung t&acirc;m, trường dạy về lĩnh vực n&agrave;y đang ph&aacute;t triển nhanh ch&oacute;ng, đem đến nhiều lựa chọn cho phụ huynh v&agrave; c&aacute;c em học sinh. Tuy nhi&ecirc;n, để gi&uacute;p b&eacute; c&oacute; thể tiếp cận được với những kiến thức về lập tr&igrave;nh Web b&agrave;i bản nhất, cha mẹ n&ecirc;n lựa chọn cho con em m&igrave;nh những địa chỉ uy t&iacute;n, được đ&ocirc;ng đảo c&aacute;c bạn học vi&ecirc;n y&ecirc;u th&iacute;ch v&agrave; đ&aacute;nh gi&aacute; cao. V&agrave; SPEC l&agrave; một trong những c&aacute;i t&ecirc;n quen thuộc m&agrave; c&aacute;c bạn kh&ocirc;ng n&ecirc;n bỏ qua</p>\n\n<ul>\n</ul>\n</div>\n\n<p>Mục ti&ecirc;u ph&aacute;t triển của SPEC</p>\n\n<h1>&nbsp;</h1>\n\n<div>\n<p>&emsp;Kh&ocirc;ng đặt vấn đề lợi nhuận l&ecirc;n h&agrave;ng đầu. Tr&aacute;i lại, SPEC lu&ocirc;n hướng đến mục ti&ecirc;u cao cả l&agrave; tạo cho ng&agrave;y c&agrave;ng nhiều trẻ em tại Việt Nam được tiếp cận với ng&ocirc;n ngữ lập tr&igrave;nh - bộ m&ocirc;n khoa học hữu &iacute;ch cho sự ph&aacute;t triển của trẻ. Ch&iacute;nh v&igrave; vậy m&agrave; trung t&acirc;m đ&atilde; kh&ocirc;ng ngừng nỗ lực để cải tiến chất lượng gi&aacute;o dục, mang đến những kh&oacute;a học lập tr&igrave;nh cho trẻ uy t&iacute;n, hiệu quả với chi ph&iacute; ph&ugrave; hợp. Đ&acirc;y ch&iacute;nh l&agrave; một trong những l&yacute; do khiến cho trung t&acirc;m ng&agrave;y c&agrave;ng được nhiều phụ huynh v&agrave; c&aacute;c học vi&ecirc;n biết đến v&agrave; tin tưởng lựa chọn trong suốt thời gian qua.</p>\n\n<p style=\"text-align:center\"><img alt=\"\" height=\"340\" src=\"https://spec.edu.vn/client/image/a18.jpg\" width=\"650\" /></p>\n\n<p style=\"text-align:center\">SPEC tự h&agrave;o l&agrave; người bạn đồng h&agrave;nh với b&eacute; trong việc tiếp cận kiến thức về ng&ocirc;n ngữ lập tr&igrave;nh</p>\n\n<ul>\n</ul>\n</div>\n\n<p>Lợi &iacute;ch tuyệt vời từ c&aacute;c kh&oacute;a học lập tr&igrave;nh cho b&eacute; tại SPEC</p>\n\n<h1>&nbsp;</h1>\n\n<div>\n<p>&emsp;Kết quả nhận được l&agrave; g&igrave; sau những kh&oacute;a học lập tr&igrave;nh tại trung t&acirc;m? l&agrave; điều m&agrave; c&aacute;c bậc phụ huynh lu&ocirc;n v&ocirc; c&ugrave;ng quan t&acirc;m. Tuy nhi&ecirc;n, khi lựa chọn SPEC c&aacute;c bạn sẽ ho&agrave;n to&agrave;n y&ecirc;n t&acirc;m bởi chỉ sau một thời gian ngắn học tập v&agrave; r&egrave;n luyện tại đ&acirc;y, c&aacute;c b&eacute; sẽ dần tiến bộ hơn với những kỹ năng như:</p>\n\n<ul>\n	<li>L&agrave;m quen v&agrave; sử dụng th&agrave;nh thạo m&aacute;y vi t&iacute;nh</li>\n	<li>H&igrave;nh th&agrave;nh tư duy lập tr&igrave;nh từ căn bản đến n&acirc;ng cao</li>\n	<li>R&egrave;n luyện t&iacute;nh ki&ecirc;n tr&igrave; v&agrave; tỉ mỉ trong giải quyết mọi c&ocirc;ng việc cũng như trong cuộc sống</li>\n	<li>Học c&aacute;ch vượt qua mọi thử th&aacute;ch v&agrave; lu&ocirc;n c&oacute; nhiều giải ph&aacute;p thay thế trong mọi t&igrave;nh huống.</li>\n	<li>Tạo dựng khả năng tư duy v&agrave; sự s&aacute;ng tạo, kh&ocirc;ng c&ograve;n sự dập khu&ocirc;n, m&aacute;y m&oacute;c trong l&agrave;m việc v&agrave; cuộc sống</li>\n</ul>\n</div>\n\n<p>Chất lượng h&agrave;ng đầu - điểm nhấn trong việc gi&aacute;o dục tại SPEC</p>\n\n<h1>&nbsp;</h1>\n\n<div>\n<p>&emsp;Để c&oacute; thể mang đến cho trẻ rất nhiều lợi &iacute;ch tuyệt vời như vậy chỉ với những kh&oacute;a học lập tr&igrave;nh kh&ocirc;ng hề d&agrave;i tại SPEC th&igrave; chất lượng gi&aacute;o dục tại đ&acirc;y ch&iacute;nh l&agrave; điểm nhấn kh&ocirc;ng thể bỏ qua với những ưu điểm như:</p>\n\n<p>&emsp;Minecraft l&agrave; ng&ocirc;n ngữ lập tr&igrave;nh kh&aacute; dễ học, đặc biệt với thiết kế l&agrave; những game cuốn h&uacute;t v&igrave; vậy m&agrave; thu h&uacute;t được sự quan t&acirc;m của mọi người, đặc biệt l&agrave; c&aacute;c bạn nhỏ. Th&ocirc;ng qua việc vừa học vừa chơi b&eacute; sẽ được trang bị những kiến thức lập tr&igrave;nh chuy&ecirc;n nghiệp c&ugrave;ng cơ hội ph&aacute;t triển những kỹ năng mềm kh&aacute;c trong cuộc sống. Để c&aacute;c b&eacute; được trải nghiệm những điều l&yacute; th&uacute; đ&oacute;, c&aacute;c bậc phụ huynh n&ecirc;n đăng k&yacute; những kh&oacute;a dạy lập tr&igrave;nh cho trẻ tại những trung t&acirc;m uy t&iacute;n như SPEC ngay h&ocirc;m nay nh&eacute;.</p>\n\n<ul>\n	<li>Gi&aacute;o tr&igrave;nh dạy lập tr&igrave;nh Minecraft được x&acirc;y dựng b&agrave;i bản. Thay v&igrave; đưa qu&aacute; nhiều c&aacute;c kiến thức v&agrave;o chương tr&igrave;nh. Đối với đối tượng học sinh nhỏ tuổi từ 7-12 tuổi th&igrave; c&aacute;c gi&aacute;o vi&ecirc;n tại SPEC đ&atilde; bi&ecirc;n soạn ra nội dung giảng dạy ph&ugrave; hợp, gi&uacute;p c&aacute;c b&eacute; nhanh ch&oacute;ng l&agrave;m quen với khoa học m&aacute;y t&iacute;nh v&agrave; tạo dựng được tư duy lập tr&igrave;nh ho&agrave;n hảo.</li>\n	<li>Đội ngũ giảng vi&ecirc;n tại trung t&acirc;m đều l&agrave; những người được đ&agrave;o tạo b&agrave;i bản về c&ocirc;ng nghệ th&ocirc;ng tin, đồng thời c&oacute; nhiều năm trong c&ocirc;ng t&aacute;c v&agrave; giảng dạy. Bởi vậy m&agrave; c&oacute; thể truyền đạt cho c&aacute;c bạn học vi&ecirc;n những kiến thức khoa học hữu &iacute;ch nhất.</li>\n	<li>Phương ph&aacute;p giảng dạy khoa học, hiệu quả. Cam kết lu&ocirc;n tạo n&ecirc;n những giờ học hữu &iacute;ch v&agrave; cuốn h&uacute;t c&aacute;c em th&ocirc;ng qua qu&aacute; tr&igrave;nh tương t&aacute;c giữa thầy v&agrave; tr&ograve;. Đặc biệt kết th&uacute;c kh&oacute;a học c&aacute;c b&eacute; sẽ nắm được kiến thức lập tr&igrave;nh cơ bản v&agrave; c&oacute; thể tự l&agrave;m ra những sản phẩm game theo sở th&iacute;ch. Đồng thời SPEC sẽ cấp chứng chỉ ho&agrave;n th&agrave;nh kh&oacute;a học d&agrave;nh cho b&eacute;.</li>\n	<li>Gi&aacute; th&agrave;nh c&aacute;c kh&oacute;a học phải chăng, ph&ugrave; hợp với nhiều học vi&ecirc;n, mang đến cơ hội học tập rộng mở hơn cho c&aacute;c bạn nhỏ.</li>\n</ul>\n</div>\n\n<p>Đề cương Lập tr&igrave;nh cho trẻ:</p>\n', 0, 1, b'1', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n    <meta http-equiv=\"content-style-type\" content=\"text/css\">\n    <meta http-equiv=\"content-language\" content=\"en-vi\">\n    <meta name=\"copyright\" content=\"spec.edu.vn\">\n    <meta name=\"keywords\" content=\"Lập trình Minecraft, Minecraft cơ bản, Minecraft cho trẻ em, học lập trình Minecraft, Minecraft, game Minecraft\">\n    <meta name=\"description\" content=\"Minecraft là một ngôn ngữ lập trình nổi tiếng thế giới. Đặc biệt các chuyên gia đã nhận định rằng việc cho bé tiếp cận sớm với bộ môn này thực sự là điều vô cùng hữu ích mà cha mẹ không nên bỏ qua.\">\n    <meta property=\"og:site_name\" content=\"spec.edu.vn\">\n    <meta property=\"og:type\" content=\"website\">\n    <meta property=\"og:title\" content=\"Khóa học Minecraft học mà chơi\">\n    <meta property=\"og:description\" content=\"Minecraft là một ngôn ngữ lập trình nổi tiếng thế giới. Đặc biệt các chuyên gia đã nhận định rằng việc cho bé tiếp cận sớm với bộ môn này thực sự là điều vô cùng hữu ích mà cha mẹ không nên bỏ qua.\">\n    <meta property=\"og:url\" content=\"https://spec.edu.vn/admin-topic\">\n    <meta name=”robots” content=”index,follow” >\n    <meta name=\"author\" content=\"SpecEdu\">\n    <meta name=\"googlebot\" content=\"index,follow,archive\">\n    <meta property=\"og:type\" content=\"article\">', 'https://spec.edu.vn/client/image/images_Trang_Chu/a15.jpg', 10, 'khoa-hoc-minecraft-hoc-ma-choi', 'Khóa học Minecraft học mà chơi', 'Minecraft là một ngôn ngữ lập trình nổi tiếng thế giới. Đặc biệt các chuyên gia đã nhận định rằng việc cho bé tiếp cận sớm với bộ môn này thực sự là điều vô cùng hữu ích mà cha mẹ không nên bỏ qua.', 'Lập trình Minecraft, Minecraft cơ bản, Minecraft cho trẻ em, học lập trình Minecraft, Minecraft, game Minecraft', 'index,follow'),
(38, 'Lập trình robot- ngành học hứa hẹn tương lai tươi sáng cho bé', '2021-05-12', '<p><span style=\"color:#212529; font-family:Exo,sans-serif\">Lập tr&igrave;nh Robot đang l&agrave; m&ocirc;n học v&ocirc; c&ugrave;ng th&uacute; vị, cuốn h&uacute;t tất cả mọi người đặc biệt l&agrave; c&aacute;c bạn nhỏ. Qu&aacute; tr&igrave;nh học mang đến cho c&aacute;c em niềm vui v&agrave; nền tảng tri thức vững chắc cho tương lai</span></p>\n', '<h2>Dạy cho trẻ về lập tr&igrave;nh Robot</h2>\n\n<p>Sự tuyệt vời v&agrave; th&uacute; vị từ những con robot đ&atilde; tạo n&ecirc;n sức h&uacute;t mạnh mẽ đối với bộ m&ocirc;n lập tr&igrave;nh robot của rất nhiều người. Đặc biệt c&aacute;c bạn nhỏ ho&agrave;n to&agrave;n c&oacute; thể tiếp cận sớm với m&ocirc;n học n&agrave;y để thỏa m&atilde;n đam m&ecirc; v&agrave; sự s&aacute;ng tạo kh&ocirc;ng ngừng c&ugrave;ng c&aacute;c kh&oacute;a học lập tr&igrave;nh cho b&eacute; chuy&ecirc;n nghiệp.&nbsp;</p>\n\n<h2>Lập tr&igrave;nh robot l&agrave; g&igrave; ? V&agrave; những ứng dụng trong cuộc sống con người?</h2>\n\n<p>Lập tr&igrave;nh Robot l&agrave; ng&agrave;nh khoa học kỹ thuật cao nổi tiếng tại c&aacute;c quốc gia ph&aacute;t triển tr&ecirc;n thế giới như: Nhật Bản, Mỹ, ch&acirc;u &Acirc;u,...Sự ra đời của robot được xem như bước ngoặt trong sự ph&aacute;t triển của nh&acirc;n loại. Bởi c&aacute;c c&ocirc;ng nghệ robot đ&atilde; g&oacute;p phần kh&ocirc;ng nhỏ gi&uacute;p thay thế sức lực con người trong những m&ocirc;i trường l&agrave;m việc nguy hiểm, độc hại. Thậm ch&iacute; trong một số c&ocirc;ng việc m&agrave; con người kh&ocirc;ng thể l&agrave;m được th&igrave; robot l&agrave; c&ocirc;ng cụ hỗ trợ tuyệt vời, được lựa chọn h&agrave;ng đầu. B&ecirc;n cạnh đ&oacute;, robot c&ograve;n gi&uacute;p con người n&acirc;ng cao năng suất lao động, giảm chi ph&iacute; sản xuất,....hiệu quả</p>\n\n<p style=\"text-align:center\"><img alt=\"\" height=\"400\" src=\"https://spec.edu.vn/client/image/Picture1.jpg\" width=\"533\" /></p>\n\n<ul>\n</ul>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:center\">C&ocirc;ng nghệ robot v&ocirc; c&ugrave;ng ph&aacute;t triển trong cuộc sống hiện đại</p>\n\n<p>Ch&iacute;nh v&igrave; vậy, hiện nay robot được ứng dụng rộng r&atilde;i trong nhiều ng&agrave;nh nghề, lĩnh vực như c&ocirc;ng nghiệp, y tế, gi&aacute;o dục, qu&acirc;n sự,&hellip;Trong đ&oacute; việc chiếm lĩnh c&ocirc;ng nghệ robot được xem l&agrave; mục ti&ecirc;u đối với sự ph&aacute;t triển to&agrave;n diện của mọi quốc gia trong thế kỷ 21. Tại Việt Nam, lĩnh vực n&agrave;y cũng đang được c&aacute;c đặc biệt quan t&acirc;m v&agrave; ph&aacute;t triển trong thời gian gần đ&acirc;y v&agrave; đ&atilde; đạt được nhiều kết quả đ&aacute;ng tự h&agrave;o.</p>\n\n<h2>Học lập tr&igrave;nh robot c&oacute; ph&ugrave; hợp với trẻ em kh&ocirc;ng?</h2>\n\n<p>Nhiều người cho rằng đối với m&ocirc;n khoa học kỹ thuật cao n&agrave;y ph&ugrave; hợp với người trưởng th&agrave;nh hơn. Tuy nhi&ecirc;n, c&aacute;c nh&agrave; khoa học đ&atilde; chứng minh rằng, những đứa trẻ sinh ra trong thời đại c&ocirc;ng nghệ 4.0 c&oacute; tr&iacute; tuệ ph&aacute;t triển v&agrave; sự nhạy b&eacute;n ho&agrave;n to&agrave;n c&oacute; thể tiếp thu những kiến thức khoa học hiện đại n&agrave;y nhanh ch&oacute;ng v&agrave; hiệu quả.</p>\n\n<p>C&aacute;c b&eacute; từ 5-6 tuổi ho&agrave;n to&agrave;n c&oacute; thể bắt đầu trải nghiệm v&agrave; tiếp cận với bộ m&ocirc;n n&agrave;y. Đặc biệt độ tuổi từ 7-12 được xem l&agrave; giai đoạn v&agrave;ng, khi đ&oacute; tr&iacute; tuệ v&agrave; nhận thức của b&eacute; ph&aacute;t triển kh&aacute; đầy đủ. B&ecirc;n cạnh đ&oacute; với ham học học, kh&aacute;m ph&aacute; của b&eacute; sẽ gi&uacute;p qu&aacute; tr&igrave;nh đ&agrave;o tạo trở n&ecirc;n hiệu quả hơn rất nhiều.</p>\n\n<p>Những lợi &iacute;ch khi dạy lập tr&igrave;nh cho trẻ ngay h&ocirc;m nay</p>\n\n<p>Sự ra đời của robot đ&atilde; đ&aacute;nh dấu bước ngoặt lớn đối với lo&agrave;i người, khi ước mơ từ ng&agrave;n đời về những cỗ m&aacute;y c&oacute; thể thay thế sức lực của con người đ&atilde; ra đời. Lập tr&igrave;nh robot đ&atilde; mang đến những th&agrave;nh tựu nổi bật để ph&aacute;t triển khoa học, kỹ thuật, kinh tế,....</p>\n\n<p>Nhận thấy được sự quan trọng của bộ m&ocirc;n n&agrave;y, hiện nay tại nhiều quốc gia tr&ecirc;n thế giới đ&atilde; đưa chương tr&igrave;nh học lập tr&igrave;nh robot cho trẻ v&agrave;o giảng dạy tại c&aacute;c nh&agrave; trường. Qua đ&oacute; để trẻ em c&oacute; thể tiếp cận với kiến thức lập tr&igrave;nh ngay từ nhỏ, bồi đắp niềm đam m&ecirc; cho c&aacute;c b&eacute;. Đồng thời mang đến nhiều lợi &iacute;ch tuyệt vời cho sự ph&aacute;t triển to&agrave;n diện của trẻ</p>\n\n<p>K&iacute;ch th&iacute;ch sự s&aacute;ng tạo của trẻ</p>\n\n<p>Tr&iacute; tưởng tượng v&agrave; s&aacute;ng tạo của b&eacute; l&agrave; điều kh&ocirc;ng giới hạn. Khi b&eacute; được tiếp cận sớm với lập tr&igrave;nh sẽ gi&uacute;p cho năng lực đ&oacute; được ph&aacute;t huy tối đa, mang đến những ứng dụng mới mẻ v&agrave; độc đ&aacute;o.</p>\n\n<p style=\"text-align:center\">&nbsp; &nbsp; &nbsp;<img alt=\"\" height=\"360\" src=\"https://spec.edu.vn/client/image/img_robot/a22.jpg\" width=\"641\" /></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:center\">Học lập tr&igrave;nh robot ngay từ nhỏ gi&uacute;p trẻ ph&aacute;t triển to&agrave;n diện</p>\n\n<p>R&egrave;n luyện khả năng l&agrave;m việc, giải quyết vấn đề linh hoạt</p>\n\n<p>Khi bắt tay v&agrave;o nghi&ecirc;n cứu v&agrave; thực h&agrave;nh về lập tr&igrave;nh y&ecirc;u cầu đặt ra đối với trẻ lu&ocirc;n phải chủ động, s&aacute;ng tạo để c&oacute; giải ph&aacute;p ph&ugrave; hợp trong giải quyết mọi vấn đề ph&aacute;t sinh. Từ đ&oacute;, gi&uacute;p b&eacute; trưởng th&agrave;nh, nhạy b&eacute;n hơn trong học tập cũng như cuộc sống</p>\n\n<p>Ph&aacute;t triển tr&iacute; tuệ ho&agrave;n hảo</p>\n\n<p>Khi b&eacute; được tiếp cận sớm với m&ocirc;n khoa học kỹ thuật cao như lập tr&igrave;nh ngay từ nhỏ th&igrave; sẽ k&iacute;ch th&iacute;ch sự ph&aacute;t triển to&agrave;n diện về tư duy hiệu quả v&agrave; nhanh ch&oacute;ng. Từ đ&oacute; hỗ trợ tối đa cho việc học tập v&agrave; giải quyết b&agrave;i tập tr&ecirc;n lớp của trẻ. Đồng thời chuẩn bị h&agrave;nh trang vững chắc trong tương lai</p>\n\n<p>Ph&aacute;t triển kỹ năng mềm</p>\n\n<p>Thực tế, việc học lập tr&igrave;nh n&oacute;i chung, v&agrave; học lập tr&igrave;nh robot n&oacute;i ri&ecirc;ng thực sự kh&ocirc;ng chỉ mang lại tri thức cho trẻ. B&ecirc;n cạnh đ&oacute;, c&ograve;n r&egrave;n luyện những kỹ năng mềm cần thiết cho cuộc sống như: khả năng thuyết tr&igrave;nh, khả năng l&agrave;m việc nh&oacute;m,.... Ch&iacute;nh v&igrave; những lợi &iacute;ch tuyệt vời tr&ecirc;n, kh&ocirc;ng c&oacute; l&yacute; do g&igrave; m&agrave; c&aacute;c bậc phụ huynh kh&ocirc;ng cho trẻ tiếp cận sớm với bộ m&ocirc;n khoa học tuyệt vời n&agrave;y ngay từ h&ocirc;m nay</p>\n\n<ul>\n</ul>\n\n<h2>Những cơ hội ph&aacute;t triển của trẻ với lập tr&igrave;nh robot</h2>\n\n<p>Cũng giống như c&aacute;c ng&ocirc;n ngữ th&ocirc;ng dụng tr&ecirc;n thế giới, lập tr&igrave;nh robot hứa hẹn l&agrave; ng&ocirc;n ngữ phổ biến tr&ecirc;n thế giới trong thời gian tới. Bởi thực tế ng&agrave;y nay c&ocirc;ng nghệ robot đang được xem l&agrave; ti&ecirc;u chuẩn đ&aacute;nh gi&aacute; sự ph&aacute;t triển của một quốc gia. Mọi quốc gia ph&aacute;t triển nhất thế giới như: Nhật bản, Singapore, Mỹ,...đều sở hữu c&ocirc;ng nghệ robot bậc cao. V&agrave; tại Việt Nam ng&agrave;nh khoa học n&agrave;y cũng đang l&agrave; một trong những lĩnh vực rất được quan t&acirc;m v&agrave; đầu tư.</p>\n\n<p>Ch&iacute;nh v&igrave; tất cả những l&yacute; do tr&ecirc;n m&agrave; việc trang bị những kiến thức về lập tr&igrave;nh robot cho b&eacute; ngay từ khi c&ograve;n nhỏ (đặc biệt trong giai đoạn từ 7-12 tuổi) được xem l&agrave; điều v&ocirc; c&ugrave;ng quan trọng. Với nền tảng kiến thức vững chắc đ&oacute;, c&ugrave;ng niềm đam m&ecirc; với khoa học chắc chắn sẽ gi&uacute;p c&aacute;c b&eacute; c&oacute; động lực để học tập v&agrave; l&agrave;m việc trong lĩnh vực c&ocirc;ng nghệ th&ocirc;ng tin, khoa học kỹ thuật cao trong tương lai. Đồng thời cơ hội l&agrave;m việc kh&ocirc;ng chỉ tại Việt Nam m&agrave; c&ograve;n mở rộng ra nhiều quốc gia ph&aacute;t triển kh&aacute;c tr&ecirc;n khắp thế giới. Hứa hẹn một tương lai rộng mở cho b&eacute;.</p>\n\n<ul>\n</ul>\n\n<h2>Địa chỉ dạy lập tr&igrave;nh cho b&eacute; uy t&iacute;n tại Việt Nam</h2>\n\n<p>Học lập tr&igrave;nh web ở đ&acirc;u tốt nhất l&agrave; c&acirc;u hỏi kh&ocirc;ng hề đơn giản. Bởi hiện nay, c&aacute;c trung t&acirc;m, trường dạy về lĩnh vực n&agrave;y đang ph&aacute;t triển nhanh ch&oacute;ng, đem đến nhiều lựa chọn cho phụ huynh v&agrave; c&aacute;c em học sinh. Tuy nhi&ecirc;n, để gi&uacute;p b&eacute; c&oacute; thể tiếp cận được với những kiến thức về lập tr&igrave;nh Web b&agrave;i bản nhất, cha mẹ n&ecirc;n lựa chọn cho con em m&igrave;nh những địa chỉ uy t&iacute;n, được đ&ocirc;ng đảo c&aacute;c bạn học vi&ecirc;n y&ecirc;u th&iacute;ch v&agrave; đ&aacute;nh gi&aacute; cao. V&agrave; SPEC l&agrave; một trong những c&aacute;i t&ecirc;n quen thuộc m&agrave; c&aacute;c bạn kh&ocirc;ng n&ecirc;n bỏ qua</p>\n\n<p>Uy t&iacute;n đ&atilde; được khẳng định</p>\n\n<p>Với nhiều năm kinh nghiệm trong lĩnh vực gi&aacute;o dục, SPEC tự h&agrave;o l&agrave; địa chỉ đ&agrave;o tạo c&ocirc;ng nghệ lập tr&igrave;nh h&agrave;ng đầu Việt Nam hiện nay. Mỗi năm trung t&acirc;m gi&uacute;p cho h&agrave;ng ng&agrave;n trẻ em tr&ecirc;n khắp cả nước được tiếp cận với bộ m&ocirc;n khoa học kỹ thuật cao hấp dẫn n&agrave;y.</p>\n\n<p style=\"text-align:center\"><img alt=\"\" height=\"250\" src=\"https://spec.edu.vn/uploadfileimage/spec/giangvien/5812130002.jpg\" width=\"400\" /></p>\n\n<p style=\"text-align:center\">SPEC tự h&agrave;o l&agrave; địa chỉ ươm mầm c&aacute;c t&agrave;i năng c&ocirc;ng nghệ robot trong tương lai</p>\n\n<p>Đội ngũ giảng vi&ecirc;n uy t&iacute;n.</p>\n\n<p>Giảng vi&ecirc;n tại trung t&acirc;m đều l&agrave; những người được đ&agrave;o tạo b&agrave;i bản, c&oacute; kinh nghiệm l&acirc;u năm trong nghề. V&igrave; vậy m&agrave; lu&ocirc;n mang đến cho c&aacute;c bạn học vi&ecirc;n những b&agrave;i học, kiến thức hữu &iacute;ch nhất về lập tr&igrave;nh robot. Với phương ph&aacute;p giảng dạy sư phạm, ph&ugrave; hợp với từng đối tượng học vi&ecirc;n chắc chắn rằng mỗi giờ học tập tại SPEC lu&ocirc;n gi&uacute;p c&aacute;c b&eacute; cảm thấy vui vẻ v&agrave; h&agrave;o hứng.</p>\n\n<p>Hệ thống cơ sở vật chất phục vụ giảng dạy hiện đại</p>\n\n<p>Đ&aacute;p ứng nhu cầu của học vi&ecirc;n khi tham gia học tập bộ m&ocirc;n khoa học kỹ thuật cao như lập tr&igrave;nh robot, SPEC đầu tư hệ thống trang thiết bị, cơ sở vật chất hiện đại. Học vi&ecirc;n được học trong m&ocirc;i trường v&ocirc; c&ugrave;ng chuy&ecirc;n nghiệp, từ đ&oacute; gi&uacute;p b&eacute; nắm bắt v&agrave; tiếp cận kiến thức nhanh ch&oacute;ng v&agrave; hiệu quả hơn.</p>\n\n<p>Chi ph&iacute; ph&ugrave; hợp</p>\n\n<p>SPEC cam kết mang đến cho c&aacute;c bạn nhỏ kh&oacute;a học lập tr&igrave;nh robot chuy&ecirc;n nghiệp với mức gi&aacute; phải chăng. Đặc biệt, trung t&acirc;m cam kết gi&uacute;p b&eacute; sau khi ho&agrave;n th&agrave;nh kh&oacute;a học sẽ nắm vững những kiến thức cơ bản v&agrave; c&oacute; thể thực h&agrave;nh hiệu quả trong thực tiễn.</p>\n\n<p>Lập tr&igrave;nh robot ch&iacute;nh l&agrave; ng&ocirc;n ngữ lập tr&igrave;nh phổ biến trong x&atilde; hội hiện đại. Việc dạy lập tr&igrave;nh cho b&eacute; ngay từ nhỏ sẽ mang đến cho b&eacute; nền tảng vững chắc để c&oacute; thể vững bước trong thế kỷ 21 với tương lai rộng mở v&agrave; cơ hội nghề nghiệp hấp dẫn với thu nhập cao. Để biết th&ecirc;m th&ocirc;ng tin chi tiết v&agrave; đăng k&yacute; c&aacute;c kh&oacute;a học hấp dẫn h&atilde;y li&ecirc;n hệ với SPEC ngay h&ocirc;m nay nh&eacute;.</p>\n\n<ul>\n</ul>\n\n<p>Đề cương Lập tr&igrave;nh cho trẻ:</p>\n', 0, 8, b'1', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n    <meta http-equiv=\"content-style-type\" content=\"text/css\">\n    <meta http-equiv=\"content-language\" content=\"en-vi\">\n    <meta name=\"copyright\" content=\"spec.edu.vn\">\n    <meta name=\"keywords\" content=\"Lập trình, robot, lập trình robot cho trẻ em\">\n    <meta name=\"description\" content=\"Lập trình robot là gì ? Và những ứng dụng trong cuộc sống con người?\">\n    <meta property=\"og:site_name\" content=\"spec.edu.vn\">\n    <meta property=\"og:type\" content=\"website\">\n    <meta property=\"og:title\" content=\"Lập trình robot\">\n    <meta property=\"og:description\" content=\"Lập trình robot là gì ? Và những ứng dụng trong cuộc sống con người?\">\n    <meta property=\"og:url\" content=\"http://spec.edu.vn/admin-topic\">\n    <meta name=”robots” content=”index,follow” >\n    <meta name=\"author\" content=\"SpecEdu\">\n    <meta name=\"googlebot\" content=\"index,follow,archive\">\n    <meta property=\"og:type\" content=\"article\">', 'https://spec.edu.vn/client/image/images_Trang_Chu/picture1.jpg', 19, 'lap-trinh-robot', 'Lập trình robot', 'Lập trình robot là gì ? Và những ứng dụng trong cuộc sống con người?', 'Lập trình, robot, lập trình robot cho trẻ em', 'index,follow'),
(39, 'Web Frontend + ReactJS', '2021-05-12', '<p><span style=\"font-family:Arial\">﻿Lập tr&igrave;nh JavaScript, Jquery kết hợp css, Bootstrap để thiết kế responsive web v&agrave; ho&agrave;n th&agrave;nh 3 đồ &aacute;n m&ocirc;n học: thiết kế giao diện, lập tr&igrave;nh web site ho&agrave;n chỉnh v&agrave; ứng dụng Single Page App với ReactJS</span></p>\n', '<h1>Lập tr&igrave;nh web l&agrave; g&igrave;? B&iacute; quyết dạy lập tr&igrave;nh cho trẻ hiệu quả nhất</h1>\n\n<p>Lập tr&igrave;nh web l&agrave; g&igrave;? Lợi &iacute;ch của việc học lập tr&igrave;nh web cho trẻ? Lộ tr&igrave;nh học hiệu quả nhất l&agrave; g&igrave;? H&atilde;y c&ugrave;ng t&igrave;m hiểu nh&eacute;!</p>\n\n<div>12 th&aacute;ng 03, 2021</div>\n\n<div>\n<h2>Dạy cho trẻ về ng&ocirc;n ngữ lập tr&igrave;nh Web FullStack</h2>\n\n<p>Dạy lập tr&igrave;nh cho trẻ đang l&agrave; xu hướng tất yếu trong thời đại c&ocirc;ng nghệ 4.0 hiện nay. Tuy nhi&ecirc;n lập tr&igrave;nh web l&agrave; g&igrave;? Dạy lập tr&igrave;nh cho trẻ n&ecirc;n bắt đầu từ đ&acirc;u?...Mọi thắc mắc về vấn đề n&oacute;ng bỏng n&agrave;y sẽ được giải đ&aacute;p chi tiết qua b&agrave;i viết dưới đ&acirc;y.&nbsp;</p>\n\n<h2>Lập tr&igrave;nh web l&agrave; g&igrave;?</h2>\n\n<p>Lập tr&igrave;nh web l&agrave; một c&ocirc;ng đoạn v&ocirc; c&ugrave;ng quan trọng trong việc x&acirc;y dựng n&ecirc;n một website. Lập tr&igrave;nh web l&agrave; việc chuyển to&agrave;n bộ dữ liệu do bộ phận thiết kế web l&agrave;m th&agrave;nh một hệ thống website ho&agrave;n chỉnh.</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"https://topdev.vn/blog/wp-content/uploads/2019/08/the-nao-la-mot-lap-trinh-vien-full-stack.png\" width=\"660\" /></p>\n\n<ul>\n</ul>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:center\">Lập tr&igrave;nh web l&agrave; c&ocirc;ng việc kh&ocirc;ng c&ograve;n xa lạ trong thời đại c&ocirc;ng nghệ 4.0</p>\n\n<p>Nhiều người thường nhầm lẫn kh&aacute;i niệm lập tr&igrave;nh web với thiết kế web. Tuy nhi&ecirc;n c&oacute; thể n&oacute;i đ&acirc;y l&agrave; hai c&ocirc;ng việc kh&aacute;c biệt nhưng c&oacute; mối quan hệ v&ocirc; c&ugrave;ng gắn b&oacute; v&agrave; gần gũi để tạo n&ecirc;n một website. Hiện nay, việc lập tr&igrave;nh đ&atilde; kh&ocirc;ng c&ograve;n l&agrave; điều xa lạ đối với mọi người. Đặc biệt h&igrave;nh ảnh một bạn nhỏ say sưa viết code l&agrave; điều kh&ocirc;ng qu&aacute; mới mẻ trong cuộc sống hiện đại. V&agrave; một trong những nội dung được c&aacute;c b&eacute; y&ecirc;u th&iacute;ch nhất l&agrave; l&agrave; lập tr&igrave;nh web, lập tr&igrave;nh Java web,...</p>\n\n<h2>Học lập tr&igrave;nh web v&agrave; những lợi &iacute;ch d&agrave;nh cho trẻ</h2>\n\n<p>Thực tế, học lập tr&igrave;nh web c&oacute; thực sự chỉ đ&aacute;p ứng nhu cầu giải tr&iacute; của trẻ. Thực tế đ&atilde; chứng minh, việc học c&aacute;c ng&ocirc;n ngữ lập tr&igrave;nh mang đến rất nhiều lợi &iacute;ch tuyệt vời</p>\n\n<p>Th&uacute;c đẩy khả năng tư duy v&agrave; tr&iacute; s&aacute;ng tạo ở trẻ</p>\n\n<p>L&agrave; một m&ocirc;n khoa học, việc học ng&ocirc;n ngữ lập tr&igrave;nh gi&uacute;p trẻ r&egrave;n luyện tư duy logic, sự s&aacute;ng tạo kh&ocirc;ng ngừng trong học tập v&agrave; cuộc sống. B&eacute; sẽ lu&ocirc;n mong muốn được t&igrave;m hiểu v&agrave; kh&ocirc;ng ngừng kh&aacute;m ph&aacute; những điều mới mẻ. Ch&iacute;nh v&igrave; vậy m&agrave; trẻ kh&ocirc;ng chỉ n&acirc;ng cao khả năng giải quyết c&aacute;c b&agrave;i tập tr&ecirc;n lớp, đồng thời c&ograve;n v&ocirc; c&ugrave;ng nhạy b&eacute;n v&agrave; linh hoạt trong mọi vấn đề.</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"https://lh3.googleusercontent.com/proxy/kzsY32Qs0gkJFHRKD9jk5iMOIsAYJft35yMD_oUHrUwAWvh6tgSCXNtPbqldStUe3VmU49ZaqGNo_HPImQ8obYZYJ0v8FO9Y05cc3LGvrjAq_l6zhV4\" width=\"512\" /></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:center\">Dạy lập tr&igrave;nh web cho trẻ l&agrave; xu hướng tại c&aacute;c quốc gia ph&aacute;t triển</p>\n\n<p>C&oacute; cơ hội được kh&aacute;m ph&aacute; thế giới rộng lớn xung quanh</p>\n\n<p>Kh&ocirc;ng thể phủ nhận được những lợi &iacute;ch tuyệt vời của internet khi mang đến cho con người kho t&agrave;ng tri thức rộng lớn. D&ugrave; ở bất cứ nơi đ&acirc;u bạn cũng c&oacute; thể dễ d&agrave;ng tiếp cận được. Đối với những bạn nhỏ sớm được học lập tr&igrave;nh web th&igrave; sẽ l&agrave;m gia tăng cơ hội được tiếp thu những tinh hoa nh&acirc;n loại nhanh ch&oacute;ng hơn bao giờ hết</p>\n\n<p>Gi&uacute;p trẻ tự tin trong m&ocirc;i trường học tập tại nước ngo&agrave;i</p>\n\n<p>Thực tế, việc tiếp cận sớm với ng&ocirc;n ngữ lập tr&igrave;nh thực sự mang đến cho trẻ nền tảng cơ bản, gi&uacute;p trẻ vươn cao, vươn xa hơn trong cuộc sống. Đặc biệt sẽ mang lại sự tự tin hơn cho c&aacute;c bạn khi đi du học tại c&aacute;c quốc gia ph&aacute;t triển tr&ecirc;n thế giới.</p>\n\n<p>Tạo ra cơ hội việc l&agrave;m triển vọng trong tương lai</p>\n\n<p>Trong thời đại khoa học c&ocirc;ng nghệ ph&aacute;t triển vượt bậc như hiện nay th&igrave; việc cho trẻ tiếp cận sớm với c&ocirc;ng nghệ th&ocirc;ng tin n&oacute;i chung v&agrave; lập tr&igrave;nh web n&oacute;i ri&ecirc;ng sẽ g&oacute;p phần tạo n&ecirc;n nguồn nh&acirc;n lực chất lượng cao trong tương lai, đ&aacute;p ứng y&ecirc;u cầu ng&agrave;y c&agrave;ng khắt khe của cuộc sống hiện đại. Ch&iacute;nh v&igrave; những lợi &iacute;ch tuyệt vời tr&ecirc;n m&agrave; ng&agrave;y c&agrave;ng c&oacute; nhiều bậc phụ huynh quan t&acirc;m nhiều hơn đến việc dạy lập tr&igrave;nh cho trẻ. V&agrave; xu hướng n&agrave;y tại Việt Nam cũng kh&ocirc;ng phải l&agrave; điều ngoại lệ</p>\n\n<h2>Những điều cần lưu &yacute; trong việc dạy lập tr&igrave;nh cho b&eacute;</h2>\n\n<p>Việc dạy lập tr&igrave;nh cho trẻ n&oacute;i chung v&agrave; dạy lập tr&igrave;nh web n&oacute;i ri&ecirc;ng l&agrave; vấn đề đang thu h&uacute;t nhiều sự quan t&acirc;m của đ&ocirc;ng đảo c&aacute;c bậc phụ huynh. Tuy nhi&ecirc;n, l&agrave;m sao để việc dạy v&agrave; học thực sự đem lại hiệu quả tối ưu.</p>\n\n<p>Độ tuổi dạy lập tr&igrave;nh cho trẻ th&iacute;ch hợp nhất</p>\n\n<p>Việc học lập tr&igrave;nh web ngay từ nhỏ l&agrave; vấn đề được nhiều phụ huynh quan t&acirc;m. Tuy nhi&ecirc;n độ tuổi th&iacute;ch hợp nhất l&agrave; bao nhi&ecirc;u? Thực tế, c&aacute;c chuy&ecirc;n gia khuy&ecirc;n bạn n&ecirc;n cho trẻ tiếp cận với ng&ocirc;n ngữ lập tr&igrave;nh khi trẻ đ&atilde; biết đọc. Đặc biệt độ tuổi từ 12-16 được xem l&agrave; thời điểm v&agrave;ng m&agrave; những bậc l&agrave;m cha mẹ kh&ocirc;ng n&ecirc;n bỏ qua. Bởi đ&acirc;y ch&iacute;nh l&agrave; giai đoạn m&agrave; bộ n&atilde;o của b&eacute; ph&aacute;t triển ho&agrave;n thiện, đồng thời trẻ sẽ c&oacute; khả năng tiếp thu kiến thức nhanh nhạy nhất.</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"https://spec.edu.vn/uploadfileimage/spec/baiviet/910908000a12.png\" width=\"810\" /></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:center\">Học lập tr&igrave;nh web sớm mang lại nhiều lợi &iacute;ch đối với trẻ</p>\n\n<p>Dạy lập tr&igrave;nh cho trẻ v&agrave; những điều cần biết</p>\n\n<p>L&agrave; đối tượng học tập đặc biệt với những đặc điểm t&acirc;m sinh l&yacute; ri&ecirc;ng biệt, ch&iacute;nh v&igrave; vậy m&agrave; để trẻ c&oacute; học tập hiệu quả nhất, c&aacute;c bậc phụ huynh n&ecirc;n lưu &yacute;:</p>\n\n<ul>\n	<li style=\"list-style-type:initial\">Trang bị những kiến thức về to&aacute;n học v&agrave; tiếng anh cho b&eacute; trước khi học lập tr&igrave;nh web để b&eacute; nhanh ch&oacute;ng tiếp thu v&agrave; nắm bắt được những kiến thức cơ bản v&agrave; dễ d&agrave;ng &aacute;p dụng ch&uacute;ng trong thực tế</li>\n	<li style=\"list-style-type:initial\">Lu&ocirc;n động vi&ecirc;n, kh&iacute;ch lệ trẻ lu&ocirc;n tự tin v&agrave; chủ động trong qu&aacute; tr&igrave;nh học tập</li>\n	<li style=\"list-style-type:initial\">C&oacute; phương ph&aacute;p học tập khoa học, những vẫn đảm bảo c&oacute; được những giờ học tập vui vẻ v&agrave; thoải m&aacute;i nhất</li>\n	<li style=\"list-style-type:initial\">Tạo m&ocirc;i trường học tập l&agrave;nh mạnh v&agrave; s&ocirc;i nổi để trẻ c&oacute; thể thoải m&aacute;i s&aacute;ng tạo v&agrave; kh&aacute;m ph&aacute;</li>\n	<li style=\"list-style-type:initial\">B&ecirc;n cạnh việc hướng dẫn trẻ tự học ở nh&agrave; th&ocirc;ng qua s&aacute;ch vở, clip tr&ecirc;n mạng,...n&ecirc;n đăng k&yacute; những kh&oacute;a học lập tr&igrave;nh web, lập tr&igrave;nh web Java,...cho trẻ. Với sự chuy&ecirc;n nghiệp trong giảng dạy đ&acirc;y sẽ l&agrave; m&ocirc;i trường gi&uacute;p trẻ tiếp cận được với những kiến thức b&agrave;i bản v&agrave; khoa học nhất. Từ đ&oacute; gi&uacute;p việc học tập trở n&ecirc;n dễ d&agrave;ng v&agrave; hiệu quả hơn</li>\n</ul>\n\n<h2>Địa chỉ trường dạy lập tr&igrave;nh web tốt nhất cho trẻ tại Việt Nam</h2>\n\n<p>Học lập tr&igrave;nh web ở đ&acirc;u tốt nhất l&agrave; c&acirc;u hỏi kh&ocirc;ng hề đơn giản. Bởi hiện nay, c&aacute;c trung t&acirc;m, trường dạy về lĩnh vực n&agrave;y đang ph&aacute;t triển nhanh ch&oacute;ng, đem đến nhiều lựa chọn cho phụ huynh v&agrave; c&aacute;c em học sinh. Tuy nhi&ecirc;n, để gi&uacute;p b&eacute; c&oacute; thể tiếp cận được với những kiến thức về lập tr&igrave;nh Web b&agrave;i bản nhất, cha mẹ n&ecirc;n lựa chọn cho con em m&igrave;nh những địa chỉ uy t&iacute;n, được đ&ocirc;ng đảo c&aacute;c bạn học vi&ecirc;n y&ecirc;u th&iacute;ch v&agrave; đ&aacute;nh gi&aacute; cao. V&agrave; SPEC l&agrave; một trong những c&aacute;i t&ecirc;n quen thuộc m&agrave; c&aacute;c bạn kh&ocirc;ng n&ecirc;n bỏ qua</p>\n\n<p>Đội ngũ giảng vi&ecirc;n chuy&ecirc;n nghiệp</p>\n\n<p>Trung t&acirc;m SPEC với đội ngũ gi&aacute;o vi&ecirc;n nhiệt t&igrave;nh, trẻ trung, v&agrave; t&acirc;m huyết với trẻ, c&oacute; nhiều năm kinh nghiệm giảng dạy. Mỗi buổi học c&oacute; &iacute;t nhất 2 gi&aacute;o vi&ecirc;n v&agrave; trợ giảng, giải đ&aacute;p c&aacute;c thắc mắc, đảm bảo hướng dẫn tỉ mỉ từng thao t&aacute;c cho trẻ. V&igrave; vậy m&agrave; gi&uacute;p c&aacute;c bạn nhanh ch&oacute;ng lĩnh hội được c&aacute;c kiến thức cần thiết trong việc học v&agrave; ứng dụng ng&ocirc;n ngữ lập tr&igrave;nh Python v&agrave;o cuộc sống.</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"https://resources.mindx.edu.vn/uploads/images/30546210477_ae6e29cdbe_o.jpg\" width=\"1063\" /></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:center\">Chọn những địa chỉ uy t&iacute;n để trang bị cho trẻ kiến thức nền tảng vững chắc</p>\n\n<p>Gi&aacute;o tr&igrave;nh đạt chuẩn quốc tế</p>\n\n<p>SPEC tự h&agrave;o khi c&oacute; chương tr&igrave;nh giảng dạy đạt ti&ecirc;u chuẩn quốc tế. C&aacute;c nội dung học về lập tr&igrave;nh web từ cơ bản đến n&acirc;ng cao được lựa chọn cẩn thận v&agrave; tỉ mỉ nhất. Từ đ&oacute; gi&uacute;p c&aacute;c bạn nhỏ lu&ocirc;n nắm được c&aacute;c kiến thức nền tảng chuẩn mực. Đ&acirc;y l&agrave; điều m&agrave; kh&ocirc;ng phải trung t&acirc;m c&ocirc;ng nghệ th&ocirc;ng tin n&agrave;o tại Việt Nam cũng c&oacute; thể l&agrave;m được</p>\n\n<p>Phương ph&aacute;p học tập khoa học, hiệu quả</p>\n\n<p>Đối với mỗi đối tượng học vi&ecirc;n, SPEC sẽ &aacute;p dụng những phương ph&aacute;p học tập th&iacute;ch hợp nhất. Đặc biệt đối với kh&oacute;a học lập tr&igrave;nh web cho đối tượng học vi&ecirc;n từ 12-16 tuổi, c&aacute;c gi&aacute;o vi&ecirc;n chuy&ecirc;n nghiệp tại trung t&acirc;m sẽ mang đến cho c&aacute;c em h&agrave;nh tr&igrave;nh học tập ấn tượng. Kh&ocirc;ng chỉ học tập, trau dồi tri thức m&agrave; c&ograve;n c&oacute; những ph&uacute;t gi&acirc;y vừa học vừa chơi vui vẻ. Với c&aacute;c v&iacute; dụ vui nhộn, gần gũi, c&aacute;c b&agrave;i tập thực h&agrave;nh s&aacute;ng tạo, cuốn h&uacute;t,..chắc chắn sẽ truyền cảm hứng, gi&uacute;p c&aacute;c bạn nhỏ ng&agrave;y c&agrave;ng y&ecirc;u th&iacute;ch v&agrave; say m&ecirc; với bộ m&ocirc;n khoa học n&agrave;y hơn bao giờ hết.</p>\n\n<p>Dịch vụ chu đ&aacute;o, tận t&acirc;m</p>\n\n<ul>\n	<li style=\"list-style-type:initial\">Mức học ph&iacute; phải chăng, ph&ugrave; hợp với mọi học sinh</li>\n	<li style=\"list-style-type:initial\">Trẻ được học thử miễn ph&iacute; 3 buổi đầu ti&ecirc;n, trước khi đăng k&yacute; c&aacute;c kh&oacute;a học ch&iacute;nh thức</li>\n	<li style=\"list-style-type:initial\">Thời gian học tập linh hoạt.</li>\n	<li style=\"list-style-type:initial\">Trung t&acirc;m c&oacute; h&igrave;nh thức học bảo lưu &ldquo;miễn ph&iacute;&rdquo; trong v&ograve;ng 1 năm cho đến khi trẻ nắm vững về Java.</li>\n</ul>\n\n<h2><strong>Lộ tr&igrave;nh học</strong></h2>\n\n<h2 style=\"text-align:center\">&nbsp;</h2>\n</div>\n', 0, 1, b'1', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n    <meta http-equiv=\"content-style-type\" content=\"text/css\">\n    <meta http-equiv=\"content-language\" content=\"en-vi\">\n    <meta name=\"copyright\" content=\"spec.edu.vn\">\n    <meta name=\"keywords\" content=\"\">\n    <meta name=\"description\" content=\"\">\n    <meta property=\"og:site_name\" content=\"spec.edu.vn\">\n    <meta property=\"og:type\" content=\"website\">\n    <meta property=\"og:title\" content=\"\">\n    <meta property=\"og:description\" content=\"\">\n    <meta property=\"og:url\" content=\"https://spec.edu.vn/admin-topic\">\n    <meta name=”robots” content=”index,follow” >\n    <meta name=\"author\" content=\"SpecEdu\">\n    <meta name=\"googlebot\" content=\"index,follow,archive\">\n    <meta property=\"og:type\" content=\"article\">', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/5812130002.jpg', 9, 'bai-viet-front-end-reactjs', '', '', '', 'index,follow');
INSERT INTO `topic` (`id`, `title`, `create_date`, `introduct`, `content`, `view`, `id_user`, `deleted`, `meta_html`, `image_src`, `course_id`, `view_url`, `meta_title`, `meta_description`, `meta_keyword`, `meta_robot`) VALUES
(40, 'Giới thiệu về Trung tâm đào tạo lập trình SPEC', '2021-04-18', '<p>Giới thiệu về Trung t&acirc;m đ&agrave;o tạo lập tr&igrave;nh SPEC - Viện đ&agrave;o tạo những IT tốt nhất hiện nay.</p>\n', '<h1 style=\"text-align:center\"><strong><span style=\"background-color:#ffffff; color:#003163\">SPEC- VIỆN Đ&Agrave;O TẠO NHỮNG IT TRẺ XUẤT SẮC NHẤT HIỆN NAY</span></strong></h1>\n\n<p style=\"text-align:justify\"><i><span style=\"font-size:12.0pt\">Việc sử dụng th&agrave;nh thạo c&ocirc;ng nghệ th&ocirc;ng tin hay ng&ocirc;n ngữ lập tr&igrave;nh l&agrave; một trong những kỹ năng cần thiết đối với những người trẻ hiện nay. Thấu hiểu được sự cần thiết đ&oacute;, SPEC đ&atilde; kh&ocirc;ng ngừng ph&aacute;t triển để mang đến những kh&oacute;a học lập tr&igrave;nh hữu &iacute;ch v&agrave; ph&ugrave; hợp với mọi người, kể cả c&aacute;c bạn nhỏ.</span></i></p>\n\n<h2 style=\"text-align:justify\"><a name=\"_fop64y6g4k0i\"></a><strong><span style=\"font-size:12.0pt\">Mục ti&ecirc;u ph&aacute;t triển của SPEC</span></strong></h2>\n\n<p style=\"text-align:justify\"><span style=\"font-size:12.0pt\">L&agrave; một đơn vị&nbsp; gi&aacute;o dục uy t&iacute;n, c&oacute; nhiều năm kinh nghiệm trong đ&agrave;o tạo c&ocirc;ng nghệ th&ocirc;ng tin. Tuy nhi&ecirc;n SPEC lại kh&ocirc;ng đặt vấn đề lợi nhuận l&ecirc;n h&agrave;ng đầu. Ngược lại, điều m&agrave; trung t&acirc;m SPEC lu&ocirc;n ch&uacute; trọng nhất ch&iacute;nh l&agrave; việc mang đến cho ng&agrave;y c&agrave;ng nhiều người Việt những kiến thức về tin học hữu &iacute;ch nhất</span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:12.0pt\">Để l&agrave;m được điều đ&oacute;, SPEC lu&ocirc;n kh&ocirc;ng ngừng nỗ lực để cải tiến chất lượng giảng dạy, đa dạng h&oacute;a c&aacute;c kh&oacute;a học, &aacute;p dụng mức học ph&iacute; phải chăng,....Đ&oacute; l&agrave; l&yacute; do m&agrave; trong suốt những năm qua SPEC lu&ocirc;n nằm top những địa chỉ đ&agrave;o tạo tin học đ&aacute;ng tin cậy, được đ&ocirc;ng đảo học vi&ecirc;n tr&ecirc;n khắp cả nước tin tưởng lựa chọn</span></p>\n\n<h2 style=\"text-align:justify\"><a name=\"_wr5xwpzcyhjk\"></a><strong><span style=\"font-size:12.0pt\">Lợi &iacute;ch tuyệt vời từ c&aacute;c kh&oacute;a học lập tr&igrave;nh tại SPEC</span></strong></h2>\n\n<p style=\"text-align:justify\"><span style=\"font-size:12.0pt\">Đến với SPEC, c&aacute;c bạn học vi&ecirc;n c&oacute; thể lựa chọn một trong những kh&oacute;a học lập tr&igrave;nh cụ thể như sau: kh&oacute;a học lập tr&igrave;nh Scratch, Python,...D&ugrave; lựa chọn kh&oacute;a học n&agrave;o th&igrave; chắc chắn rằng chỉ sau một thời gian ngắn học tập v&agrave; r&egrave;n luyện tại đ&acirc;y, c&aacute;c bạn học vi&ecirc;n sẽ nhận thấy sự tiến bộ của bản th&acirc;n ở nhiều kỹ năng kh&aacute;c nhau như:</span></p>\n\n<p style=\"text-align:justify\"><!--[if !supportLists]--><span style=\"font-size:12.0pt\">●<span style=\"font-family:&quot;Times New Roman&quot;; font-size:7pt\">&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span style=\"font-size:12.0pt\">Sử dụng th&agrave;nh thạo m&aacute;y vi t&iacute;nh</span></p>\n\n<p style=\"text-align:justify\"><!--[if !supportLists]--><span style=\"font-size:12.0pt\">●<span style=\"font-family:&quot;Times New Roman&quot;; font-size:7pt\">&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span style=\"font-size:12.0pt\">C&oacute; tư duy lập tr&igrave;nh từ căn bản đến n&acirc;ng cao</span></p>\n\n<p style=\"text-align:justify\"><!--[if !supportLists]--><span style=\"font-size:12.0pt\">●<span style=\"font-family:&quot;Times New Roman&quot;; font-size:7pt\">&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span style=\"font-size:12.0pt\">R&egrave;n luyện t&iacute;nh ki&ecirc;n tr&igrave; v&agrave; tỉ mỉ trong giải quyết mọi c&ocirc;ng việc </span></p>\n\n<p style=\"text-align:justify\"><!--[if !supportLists]--><span style=\"font-size:12.0pt\">●<span style=\"font-family:&quot;Times New Roman&quot;; font-size:7pt\">&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span style=\"font-size:12.0pt\">Học c&aacute;ch vượt qua mọi thử th&aacute;ch v&agrave; lu&ocirc;n c&oacute; nhiều giải ph&aacute;p thay thế để c&oacute; thể đạt được mục ti&ecirc;u đ&atilde; đề ra</span></p>\n\n<p style=\"text-align:justify\"><!--[if !supportLists]--><span style=\"font-size:12.0pt\">●<span style=\"font-family:&quot;Times New Roman&quot;; font-size:7pt\">&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span style=\"font-size:12.0pt\">R&egrave;n luyện v&agrave; h&igrave;nh th&agrave;nh những kỹ năng mềm cần thiết cho c&ocirc;ng việc v&agrave; cuộc sống</span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:12.0pt\">Ch&iacute;nh v&igrave; vậy b&ecirc;n cạnh những tri thức khoa học, SPEC c&ograve;n thực sự mang lại cho c&aacute;c bạn học vi&ecirc;n nhiều kiến thức v&agrave; kỹ năng cần thiết trong cuộc sống. Từ đ&oacute; mở ra tương lai tươi s&aacute;ng v&agrave; tạo n&ecirc;n nhiều cơ hội việc l&agrave;m rộng mở hơn cả ở trong nước v&agrave; nước ngo&agrave;i.</span></p>\n\n<h2 style=\"text-align:justify\"><a name=\"_72kvwaimwx65\"></a><strong><span style=\"font-size:12.0pt\">Đ&aacute;nh gi&aacute; về chất lượng đ&agrave;o tạo tại SPEC</span></strong></h2>\n\n<p style=\"text-align:justify\"><span style=\"font-size:12.0pt\">Chất lượng gi&aacute;o dục ch&iacute;nh l&agrave; điều m&agrave; c&aacute;c bạn học vi&ecirc;n cũng nhiều bậc phụ huynh đặc biệt quan t&acirc;m. Đến với SPEC, chắc chắn rằng sẽ kh&ocirc;ng bao giờ l&agrave;m bạn thất vọng bởi:</span></p>\n\n<p style=\"text-align:justify\"><!--[if !supportLists]--><span style=\"font-size:12.0pt\">●<span style=\"font-family:&quot;Times New Roman&quot;; font-size:7pt\">&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span style=\"font-size:12.0pt\">Gi&aacute;o tr&igrave;nh đ&agrave;o tạo tại trung t&acirc;m lu&ocirc;n được bi&ecirc;n soạn cụ thể, tỉ mỉ. Đặc biệt với mỗi đối tượng học vi&ecirc;n kh&aacute;c nhau sẽ c&oacute; những b&agrave;i giảng ph&ugrave; hợp với nhận thức, khả năng tư duy,...để c&aacute;c học vi&ecirc;n nhanh ch&oacute;ng nắm bắt được những kiến thức cần thiết nhất hiệu quả.</span></p>\n\n<p style=\"text-align:justify\"><!--[if !supportLists]--><span style=\"font-size:12.0pt\">●<span style=\"font-family:&quot;Times New Roman&quot;; font-size:7pt\">&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span style=\"font-size:12.0pt\">Đội ngũ giảng vi&ecirc;n tại trung t&acirc;m đều l&agrave; những người được đ&agrave;o tạo b&agrave;i bản về c&ocirc;ng nghệ th&ocirc;ng tin. Đồng thời với những kiến thức thực tiễn s&acirc;u sắc lu&ocirc;n sẵn s&agrave;ng mang đến cho học vi&ecirc;n những tri thức hữu &iacute;ch nhất</span></p>\n\n<p style=\"text-align:justify\"><!--[if !supportLists]--><span style=\"font-size:12.0pt\">●<span style=\"font-family:&quot;Times New Roman&quot;; font-size:7pt\">&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span style=\"font-size:12.0pt\">Phương ph&aacute;p giảng dạy khoa học, hiệu quả. Mỗi giờ học đều l&agrave; những khoảng thời gian học tập hữu &iacute;ch v&agrave; l&ocirc;i cuốn. </span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:12.0pt\">Với những ưu điểm tuyệt vời tr&ecirc;n, SPEC chắc chắn l&agrave; địa chỉ học IT ho&agrave;n hảo m&agrave; c&aacute;c bạn học vi&ecirc;n kh&ocirc;ng n&ecirc;n bỏ qua. Để được tư vấn đăng k&yacute; c&aacute;c kh&oacute;a học ph&ugrave; hợp v&agrave; nhận nhiều ưu đ&atilde;i hấp dẫn h&atilde;y nhanh tay li&ecirc;n hệ với trung t&acirc;m ngay h&ocirc;m nay nh&eacute;.</span></p>\n\n<p style=\"text-align:justify\"><br />\n<strong>Về cơ cấu tổ chức ph&ograve;ng ban SPEC</strong></p>\n\n<p><span style=\"font-size:12pt\">●</span><span style=\"font-size:7pt\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:12pt\"><span style=\"color:#003163\">Trung t&acirc;m Đ&agrave;o tạo RDSIC</span> (Research and Development of Software In Construction), chuy&ecirc;n đ&agrave;o tạo c&aacute;c phần mềm trong lĩnh vực x&acirc;y dựng.</span></p>\n\n<p><span style=\"font-size:12pt\">●</span><span style=\"font-size:7pt\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:12pt\"><span style=\"color:#003163\">Trung t&acirc;m Đ&agrave;o tạo Lập tr&igrave;nh SPEC</span> (Software Programming Education Center), chuy&ecirc;n đ&agrave;o tạo c&aacute;c ng&ocirc;n ngữ lập tr&igrave;nh phổ biến cho trẻ em, học sinh, sinh vi&ecirc;n v&agrave; c&aacute;c doanh nghiệp.</span></p>\n\n<p><span style=\"font-size:12pt\">●</span><span style=\"font-size:7pt\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:12pt\"><span style=\"color:#003163\">Trung t&acirc;m SBIM</span> (Service of Building Information Modelling): Cung cấp c&aacute;c dịch vụ về BIM cho c&aacute;c c&ocirc;ng ty nước ngo&agrave;i (Signapore, Mỹ, Ch&acirc;u &Acirc;u,..)&nbsp;</span></p>\n\n<p><span style=\"font-size:12pt\">●</span><span style=\"font-size:7pt\">&nbsp; &nbsp; &nbsp;</span><span style=\"font-size:12pt\"><span style=\"color:#003163\">S&agrave;n thương mại Điện tử X&acirc;y Dựng Số</span>: Kết nối nh&agrave; thầu x&acirc;y dựng v&agrave; chủ đầu tư.</span></p>\n\n<p><span style=\"font-size:12pt\">●</span><span style=\"font-size:7pt\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:12pt\"><span style=\"color:#003163\">Trung t&acirc;m Lập tr&igrave;nh ứng dụng SPC</span>: Lập tr&igrave;nh c&aacute;c phần mềm, cung cấp c&aacute;c giải ph&aacute;p phần mềm ứng dụng trong lĩnh vực x&acirc;y dựng.</span></p>\n\n<p><span style=\"font-size:12pt\">●</span><span style=\"font-size:7pt\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:12pt\"><span style=\"color:#003163\">Ph&ograve;ng Khoa học C&ocirc;ng nghệ</span>: Tham gia tuyển chọn, thực hiện c&aacute;c nhiệm vụ về Khoa học C&ocirc;ng nghệ, c&aacute;c đề t&agrave;i nghi&ecirc;n cứu khoa học cấp bộ, cấp Nh&agrave; nước hoặc theo đơn đặt h&agrave;ng của c&aacute;c doanh nghiệp.</span></p>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:12pt\">●</span><span style=\"font-size:7pt\">&nbsp; &nbsp; &nbsp;</span><span style=\"font-size:12pt\"><span style=\"color:#003163\">Ph&ograve;ng t&agrave;i vụ</span>: Quản l&yacute; c&aacute;c hoạt động về t&agrave;i ch&iacute;nh, kế to&aacute;n của Viện.&nbsp;</span></p>\n', 0, 8, b'1', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n    <meta http-equiv=\"content-style-type\" content=\"text/css\">\n    <meta http-equiv=\"content-language\" content=\"en-vi\">\n    <meta name=\"copyright\" content=\"spec.edu.vn\">\n    <meta name=\"keywords\" content=\"Trung tâm đào tạo lập trình SPEC\">\n    <meta name=\"description\" content=\"Hệ thống đào tạo lập trình uy tín nhất cả nước\">\n    <meta property=\"og:site_name\" content=\"spec.edu.vn\">\n    <meta property=\"og:type\" content=\"website\">\n    <meta property=\"og:title\" content=\"Trung tâm đào tạo lập trình SPEC\">\n    <meta property=\"og:description\" content=\"Hệ thống đào tạo lập trình uy tín nhất cả nước\">\n    <meta property=\"og:url\" content=\"https://spec.edu.vn/admin-topic\">\n    <meta name=”robots” content=”index,follow” >\n    <meta name=\"author\" content=\"SpecEdu\">\n    <meta name=\"googlebot\" content=\"index,follow,archive\">\n    <meta property=\"og:type\" content=\"article\">', 'https://spec.edu.vn/client/image/logo.jpg', 13, 'gioi-thieu', 'Trung tâm đào tạo lập trình SPEC', 'Hệ thống đào tạo lập trình uy tín nhất cả nước', 'Trung tâm đào tạo lập trình SPEC', 'index,follow'),
(41, 'Chi tiết khóa học lập trình web tại SPEC', '2021-04-15', '<p><span lang=\"vi\" style=\"font-size: 14pt; line-height: 115%; font-family: Helvetica;\">Học\nlập trình web thực sự là xu hướng tất yếu trong xã hội hiện đại khi mọi nền tảng trong xã hội thế kỷ 21 đang dần hướng đến công nghệ onlline.</span><br></p>', '', 0, 8, b'0', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n    <meta http-equiv=\"content-style-type\" content=\"text/css\">\n    <meta http-equiv=\"content-language\" content=\"en-vi\">\n    <meta name=\"copyright\" content=\"spec.edu.vn\">\n    <meta name=\"keywords\" content=\"\">\n    <meta name=\"description\" content=\"\">\n    <meta property=\"og:site_name\" content=\"spec.edu.vn\">\n    <meta property=\"og:type\" content=\"website\">\n    <meta property=\"og:title\" content=\"\">\n    <meta property=\"og:description\" content=\"\">\n    <meta property=\"og:url\" content=\"https://spec.edu.vn/admin-topic\">\n    <meta name=”robots” content=”index,follow” >\n    <meta name=\"author\" content=\"SpecEdu\">\n    <meta name=\"googlebot\" content=\"index,follow,archive\">\n    <meta property=\"og:type\" content=\"article\">', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/5812130002.jpg', 9, 'Khoa-hoc-web', '', '', '', 'index,follow'),
(42, 'Chi tiết khóa học lập trình web tại SPEC', '2021-04-15', '<p><span lang=\"vi\" style=\"font-size: 14pt; line-height: 115%; font-family: Helvetica;\">Học\nlập trình web thực sự là xu hướng tất yếu trong xã hội hiện đại khi mọi nền tảng trong xã hội thế kỷ 21 đang dần hướng đến công nghệ onlline.</span><br></p>', '<h1 align=\"center\" style=\"text-align:center\"><font color=\"#003163\"><a name=\"_9ei0lyo31rx1\"></a><b style=\"\"><span lang=\"vi\" style=\"font-family: &quot;Times New Roman&quot;, serif;\"><span style=\"font-family: Helvetica;\">Chi tiết khóa học lập trình web tại\nSPEC</span><o:p></o:p></span></b></font></h1><p class=\"MsoNormal\" style=\"text-align:justify\"><i><span lang=\"vi\" style=\"font-size:14.0pt;line-height:115%;font-family:\n&quot;Times New Roman&quot;,serif;mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"font-family: Helvetica;\">Viện tin học\nxây dựng SPEC là đơn vị đào tạo uy tín tại Việt Nam với nhiều khóa học lập\ntrình hấp dẫn, luôn thu hút sự quan tâm của đông đảo các bạn học viên trên khắp\ncả nước. Hãy cùng chúng tôi khám phá chi tiết về những điểm đặc biệt của khóa\nhọc lập trình web tại trung tâm qua bài viết dưới đây nhé</span><o:p></o:p></span></i></p><h2 style=\"text-align:justify\"><font color=\"#003163\" style=\"background-color: rgb(255, 255, 255);\"><a name=\"_39arvdko4d8h\"></a><b style=\"\"><span lang=\"vi\" style=\"font-family: &quot;Times New Roman&quot;, serif;\">Mục tiêu của các khóa học lập trình web tại SPEC<o:p></o:p></span></b></font></h2><p class=\"MsoNormal\" style=\"text-align:justify\"><span lang=\"vi\" style=\"font-size:\n14.0pt;line-height:115%;font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;\"><span style=\"font-family: Helvetica;\">Thấu hiểu sự cần thiết và lợi ích tuyệt vời của việc tiếp\ncận các ngôn ngữ lập trình ngày từ sớm, SPEC luôn không ngừng nỗ lực mang đến\nnhững khóa học lập trình nói chung và lập trình web nói riêng với nhiều lợi ích\ntuyệt vời cho người học:</span><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-left:36.0pt;text-align:justify;text-indent:\n-18.0pt;mso-list:l0 level1 lfo2\"><!--[if !supportLists]--><span lang=\"vi\" style=\"font-size:14.0pt;line-height:115%;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;\">●<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;</span></span><span lang=\"vi\" style=\"font-size:14.0pt;line-height:115%;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;\"><font style=\"background-color: rgb(255, 255, 255);\" color=\"#000000\"><span style=\"font-family: Helvetica;\">Tạo cơ hội việc làm rộng mở. Trong\nthời đại công nghệ 4.0 hiện nay thì việc sử dụng thành thạo công nghệ thông tin\nnói chung và các ngôn ngữ lập trình nói riêng thực sự là điều vô cùng quan\ntrọng. Đây thực sự là kỹ năng cần thiết giúp bạn tự tin có được một công việc\nổn định trong nước cũng như khi ra nước ngoài.</span></font><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-left:36.0pt;text-align:justify;text-indent:\n-18.0pt;mso-list:l0 level1 lfo2\"><!--[if !supportLists]--><span lang=\"vi\" style=\"font-size:14.0pt;line-height:115%;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;\">●<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><span lang=\"vi\" style=\"font-size:14.0pt;line-height:115%;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"font-family: Helvetica;\">Việc học tập và sử dụng ngôn ngữ lập\ntrình giúp tăng khả năng tư duy và tính sáng tạo ở tất cả mọi người</span><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-left:36.0pt;text-align:justify;text-indent:\n-18.0pt;mso-list:l0 level1 lfo2\"><!--[if !supportLists]--><span lang=\"vi\" style=\"font-size:14.0pt;line-height:115%;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;\">●<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;<span style=\"font-family: Helvetica;\">&nbsp;</span></span></span><span lang=\"vi\" style=\"font-size:14.0pt;line-height:115%;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"font-family: Helvetica;\">Đặc biệt đối với trẻ nhỏ, việc tiếp\ncận sớm với công nghệ thông tin và ngôn ngữ lập trình web giúp rèn luyện khả\nnăng tư duy, kích thích sự khám phá thế giới. Đồng thời giúp bé trang bị những\nkỹ năng mềm cần thiết cho tương lai</span><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"text-align:justify\"><span lang=\"vi\" style=\"font-size:\n14.0pt;line-height:115%;font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;\"><span style=\"font-family: Helvetica;\">Với những mục tiêu đó, các khóa học lập trình web tại SPC\nđã và đang luôn thu hút được sự quan tâm của đông đảo học viên ở mọi lứa tuổi. </span><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"text-align:justify\"><span lang=\"vi\" style=\"font-size:\n14.0pt;line-height:115%;font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;mso-no-proof:yes\"><!--[if gte vml 1]><v:shapetype id=\"_x0000_t75\"\n coordsize=\"21600,21600\" o:spt=\"75\" o:preferrelative=\"t\" path=\"m@4@5l@4@11@9@11@9@5xe\"\n filled=\"f\" stroked=\"f\">\n <v:stroke joinstyle=\"miter\"/>\n <v:formulas>\n  <v:f eqn=\"if lineDrawn pixelLineWidth 0\"/>\n  <v:f eqn=\"sum @0 1 0\"/>\n  <v:f eqn=\"sum 0 0 @1\"/>\n  <v:f eqn=\"prod @2 1 2\"/>\n  <v:f eqn=\"prod @3 21600 pixelWidth\"/>\n  <v:f eqn=\"prod @3 21600 pixelHeight\"/>\n  <v:f eqn=\"sum @0 0 1\"/>\n  <v:f eqn=\"prod @6 1 2\"/>\n  <v:f eqn=\"prod @7 21600 pixelWidth\"/>\n  <v:f eqn=\"sum @8 21600 0\"/>\n  <v:f eqn=\"prod @7 21600 pixelHeight\"/>\n  <v:f eqn=\"sum @10 21600 0\"/>\n </v:formulas>\n <v:path o:extrusionok=\"f\" gradientshapeok=\"t\" o:connecttype=\"rect\"/>\n <o:lock v:ext=\"edit\" aspectratio=\"t\"/>\n</v:shapetype><v:shape id=\"image1.png\" o:spid=\"_x0000_i1025\" type=\"#_x0000_t75\"\n style=\'width:451.5pt;height:282.75pt;visibility:visible;mso-wrap-style:square\'>\n <v:imagedata src=\"file:///C:/Users/Admin/AppData/Local/Temp/msohtmlclip1/01/clip_image001.png\"\n  o:title=\"\"/>\n</v:shape><![endif]--><!--[if !vml]--><!--[endif]--></span><span lang=\"vi\" style=\"font-size:14.0pt;\nline-height:115%;font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;\"><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"text-align:justify\"><i><span lang=\"vi\" style=\"font-size: 14pt; line-height: 115%; font-family: Helvetica;\">Khóa học lập\ntrình web tại SPEC trang bị đầy đủ kiến thức từ cơ bản đến nâng cao.</span></i></p><p class=\"MsoNormal\" style=\"text-align: center;\"><img src=\"https://spec.edu.vn/uploadfileimage/spec/giangvien/5812130002.jpg\" style=\"width: 638.55px; height: 399.094px;\"><i><span lang=\"vi\" style=\"font-size:14.0pt;line-height:115%;font-family:\n&quot;Times New Roman&quot;,serif;mso-fareast-font-family:&quot;Times New Roman&quot;\"><br></span></i></p><p class=\"MsoNormal\" style=\"text-align:justify\"><i><span lang=\"vi\" style=\"font-size:14.0pt;line-height:115%;font-family:\n&quot;Times New Roman&quot;,serif;mso-fareast-font-family:&quot;Times New Roman&quot;\"><o:p></o:p></span></i></p><h2 style=\"text-align:justify\"><font color=\"#003163\" style=\"background-color: rgb(255, 255, 255);\"><a name=\"_v1r96kkoquye\"></a><b><span lang=\"vi\" style=\"font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;\">Những lợi ích tuyệt vời của các khóa học lập trình web tại\nSPEC<o:p></o:p></span></b></font></h2><p class=\"MsoNormal\" style=\"text-align:justify\"><span lang=\"vi\" style=\"font-size:\n14.0pt;line-height:115%;font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;\"><span style=\"font-family: Helvetica;\">Với mục tiêu lớn mang đến cho các học viên, SPEC luôn không\nngừng tạo ra môi trường học tập thuận lợi để học viên thỏa sức sáng tạo và thể\nhiện bản thân, cụ thể:</span><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-left:36.0pt;text-align:justify;text-indent:\n-18.0pt;mso-list:l1 level1 lfo1\"><!--[if !supportLists]--><span lang=\"vi\" style=\"font-size:14.0pt;line-height:115%;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;\">●<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;</span></span><span lang=\"vi\" style=\"font-size:14.0pt;line-height:115%;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"font-family: Helvetica;\">Các lớp học tại trung tâm đều bố trí\ntừ 8-15 học viên. Với số lượng đó, tạo ra không khí lớp học gần gũi, thân thiện\nvà tạo nhiều cơ hội thuận lợi để học viên và giảng viên có thể trao đổi, chia\nsẻ kiến thức</span><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-left:36.0pt;text-align:justify;text-indent:\n-18.0pt;mso-list:l1 level1 lfo1\"><!--[if !supportLists]--><span lang=\"vi\" style=\"font-size:14.0pt;line-height:115%;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;\">●<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><span lang=\"vi\" style=\"font-size:14.0pt;line-height:115%;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"font-family: Helvetica;\">Đội ngũ giảng viên tại trung tâm đều\nlà những người được đào tạo bài bản và có kiến thức thực tế sâu rộng</span><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-left:36.0pt;text-align:justify;text-indent:\n-18.0pt;mso-list:l1 level1 lfo1\"><!--[if !supportLists]--><span lang=\"vi\" style=\"font-size:14.0pt;line-height:115%;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;\">●<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;</span></span><span lang=\"vi\" style=\"font-size:14.0pt;line-height:115%;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"font-family: Helvetica;\">Giáo trình được thiết kế phù hợp với\ntừng độ tuổi của học viên với phương pháp sư phạm chuyên nghiệp, đem đến những\ngiờ học hiệu quả</span><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-left:36.0pt;text-align:justify;text-indent:\n-18.0pt;mso-list:l1 level1 lfo1\"><!--[if !supportLists]--><span lang=\"vi\" style=\"font-size:14.0pt;line-height:115%;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"font-family: Helvetica;\">●</span><span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: Helvetica;\">&nbsp;&nbsp;&nbsp;&nbsp;</span></span><span lang=\"vi\" style=\"font-size:14.0pt;line-height:115%;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"font-family: Helvetica;\">Dịch vụ chu đáo với việc lựa chọn\nthời gian học linh động, học phí phải chăng. Cam kết khi kết thúc khóa học mọi\nhọc viên đều nắm </span><span style=\"font-family: Helvetica;\">vững các kiến thức về lập trình web từ cơ bản đến nâng cao</span><o:p></o:p></span></p><p class=\"MsoTitle\"><a name=\"_9ei0lyo31rx1\"></a>\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n</p><p class=\"MsoNormal\" style=\"text-align:justify\"><span lang=\"vi\" style=\"font-size: 14pt; line-height: 115%; font-family: Helvetica;\">Học lập trình web thực sự là xu hướng tất yếu trong xã hội\nhiện&nbsp;</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Times New Roman&quot;, serif; font-size: 18.6667px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\"><span style=\"font-family: Helvetica;\"><span style=\"font-family: Helvetica;\">đại</span>. Tuy nhiên để có được những giờ học thú vị và hiệu quả nhất hãy liên hệ với trung tâm đào tạo tin học uy tín như SPEC ngay hôm na</span></span><span lang=\"vi\" style=\"font-size:\n14.0pt;line-height:115%;font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;\"><span style=\"font-family: Helvetica;\">y.</span><o:p></o:p></span></p>', 0, 8, b'0', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n    <meta http-equiv=\"content-style-type\" content=\"text/css\">\n    <meta http-equiv=\"content-language\" content=\"en-vi\">\n    <meta name=\"copyright\" content=\"spec.edu.vn\">\n    <meta name=\"keywords\" content=\"Khóa học Web cơ bản đến nâng cao\">\n    <meta name=\"description\" content=\"Nhưng lợi ích khi chọn học lập trình WEB lại trung tâm SPEC\">\n    <meta property=\"og:site_name\" content=\"spec.edu.vn\">\n    <meta property=\"og:type\" content=\"website\">\n    <meta property=\"og:title\" content=\"Khóa học lập trình Web\">\n    <meta property=\"og:description\" content=\"Nhưng lợi ích khi chọn học lập trình WEB lại trung tâm SPEC\">\n    <meta property=\"og:url\" content=\"https://spec.edu.vn/admin-topic\">\n    <meta name=”robots” content=”index,follow” >\n    <meta name=\"author\" content=\"SpecEdu\">\n    <meta name=\"googlebot\" content=\"index,follow,archive\">\n    <meta property=\"og:type\" content=\"article\">', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/5812130002.jpg', 9, 'Khoa-hoc-web', 'Khóa học lập trình Web', 'Nhưng lợi ích khi chọn học lập trình WEB lại trung tâm SPEC', 'Khóa học Web cơ bản đến nâng cao', 'index,follow'),
(43, 'Chi tiết khóa học lập trình web tại SPEC', '2021-04-23', '<p><span style=\"font-family:Helvetica; font-size:14pt\">Học lập tr&igrave;nh web thực sự l&agrave; xu hướng tất yếu trong x&atilde; hội hiện đại khi mọi nền tảng trong x&atilde; hội thế kỷ 21 đang dần hướng đến c&ocirc;ng nghệ onlline.</span></p>\n', '<h1 style=\"text-align:center\"><span style=\"font-family:Helvetica\">﻿</span><span style=\"color:#003163\"><strong><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"font-family:Helvetica\">Chi tiết kh&oacute;a học lập tr&igrave;nh web tại SPEC</span></span></strong></span></h1>\n\n<p style=\"text-align:left\"><i><span style=\"font-family:Helvetica; font-size:12pt\">Viện tin học x&acirc;y dựng SPEC l&agrave; đơn vị đ&agrave;o tạo uy t&iacute;n tại Việt Nam với nhiều kh&oacute;a học lập tr&igrave;nh hấp dẫn, lu&ocirc;n thu h&uacute;t sự quan t&acirc;m của đ&ocirc;ng đảo c&aacute;c bạn học vi&ecirc;n tr&ecirc;n khắp cả nước. H&atilde;y c&ugrave;ng ch&uacute;ng t&ocirc;i kh&aacute;m ph&aacute; chi tiết về những điểm đặc biệt của kh&oacute;a học lập tr&igrave;nh web tại trung t&acirc;m qua b&agrave;i viết dưới đ&acirc;y nh&eacute;</span></i></p>\n\n<p style=\"text-align:center\"><br />\n<img alt=\"\" height=\"351\" src=\"https://nguyenvanhieu.vn/wp-content/uploads/2018/08/hoc-lap-trinh-web-thi-phai-bat-%C4%91au-tu-dau.jpg\" width=\"586\" /></p>\n\n<h2 style=\"text-align:justify\"><span style=\"background-color:#ffffff; color:#003163\"><a name=\"_39arvdko4d8h\"></a><strong><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"font-family:Helvetica\">Mục ti&ecirc;u của c&aacute;c kh&oacute;a học lập tr&igrave;nh web tại SPEC</span></span></strong></span></h2>\n\n<p style=\"text-align:justify\"><span style=\"font-family:&quot;Times New Roman&quot;,serif; font-size:12.0pt\"><span style=\"font-family:Helvetica\">Thấu hiểu sự cần thiết v&agrave; lợi &iacute;ch tuyệt vời của việc tiếp cận c&aacute;c ng&ocirc;n ngữ lập tr&igrave;nh ng&agrave;y từ sớm, SPEC lu&ocirc;n kh&ocirc;ng ngừng nỗ lực mang đến những kh&oacute;a học lập tr&igrave;nh n&oacute;i chung v&agrave; lập tr&igrave;nh web n&oacute;i ri&ecirc;ng với nhiều lợi &iacute;ch tuyệt vời cho người học:</span></span></p>\n\n<p style=\"text-align:justify\"><!--[if !supportLists]--><span style=\"font-family:&quot;Times New Roman&quot;,serif; font-size:12.0pt\">●<span style=\"font-family:&quot;Times New Roman&quot;; font-size:7pt\">&nbsp;&nbsp;&nbsp;&nbsp;</span></span><span style=\"font-family:&quot;Times New Roman&quot;,serif; font-size:12.0pt\"><span style=\"font-family:Helvetica\">Tạo cơ hội việc l&agrave;m rộng mở. Trong thời đại c&ocirc;ng nghệ 4.0 hiện nay th&igrave; việc sử dụng th&agrave;nh thạo c&ocirc;ng nghệ th&ocirc;ng tin n&oacute;i chung v&agrave; c&aacute;c ng&ocirc;n ngữ lập tr&igrave;nh n&oacute;i ri&ecirc;ng thực sự l&agrave; điều v&ocirc; c&ugrave;ng quan trọng. Đ&acirc;y thực sự l&agrave; kỹ năng cần thiết gi&uacute;p bạn tự tin c&oacute; được một c&ocirc;ng việc ổn định trong nước cũng như khi ra nước ngo&agrave;i.</span></span></p>\n\n<p style=\"text-align:justify\"><!--[if !supportLists]--><span style=\"font-family:&quot;Times New Roman&quot;,serif; font-size:12.0pt\"><span style=\"font-family:Helvetica\">●</span><span style=\"font-family:&quot;Times New Roman&quot;; font-size:7pt\"><span style=\"font-family:Helvetica\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></span><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:12pt\">Việc học tập v&agrave; sử dụng ng&ocirc;n ngữ lập tr&igrave;nh gi&uacute;p tăng khả năng tư duy v&agrave; t&iacute;nh s&aacute;ng tạo ở tất cả mọi người</span></span></p>\n\n<p style=\"text-align:justify\"><!--[if !supportLists]--><span style=\"font-family:&quot;Times New Roman&quot;,serif; font-size:12.0pt\">●<span style=\"font-family:&quot;Times New Roman&quot;; font-size:7pt\">&nbsp;&nbsp;&nbsp;&nbsp;</span></span><span style=\"font-family:&quot;Times New Roman&quot;,serif; font-size:12.0pt\"><span style=\"font-family:Helvetica\">Đặc biệt đối với trẻ nhỏ, việc tiếp cận sớm với c&ocirc;ng nghệ th&ocirc;ng tin v&agrave; ng&ocirc;n ngữ lập tr&igrave;nh web gi&uacute;p r&egrave;n luyện khả năng tư duy, k&iacute;ch th&iacute;ch sự kh&aacute;m ph&aacute; thế giới. Đồng thời gi&uacute;p b&eacute; trang bị những kỹ năng mềm cần thiết cho tương lai</span></span></p>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n<p style=\"text-align:justify\"><span style=\"font-family:&quot;Times New Roman&quot;,serif; font-size:12.0pt\"><span style=\"font-family:Helvetica\">Với những mục ti&ecirc;u đ&oacute;, c&aacute;c kh&oacute;a học lập tr&igrave;nh web tại SPEC đ&atilde; v&agrave; đang lu&ocirc;n thu h&uacute;t được sự quan t&acirc;m của đ&ocirc;ng đảo học vi&ecirc;n ở mọi lứa tuổi.&nbsp;</span></span></p>\n\n<p style=\"text-align:center\"><img alt=\"\" height=\"336\" src=\"https://resources.mindx.edu.vn/uploads/images/hoc-lap-trinh-web-tu-co-ban-den-nang-cao.jpg\" width=\"610\" /></p>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n<h2 style=\"text-align:justify\"><span style=\"background-color:#ffffff; color:#003163\"><a name=\"_v1r96kkoquye\"></a><strong><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"font-family:Helvetica\">Những lợi &iacute;ch tuyệt vời của c&aacute;c kh&oacute;a học lập tr&igrave;nh web tại SPEC</span></span></strong></span></h2>\n\n<p style=\"text-align:justify\"><span style=\"font-family:&quot;Times New Roman&quot;,serif; font-size:12.0pt\"><span style=\"font-family:Helvetica\">Với mục ti&ecirc;u lớn mang đến cho c&aacute;c học vi&ecirc;n, SPEC lu&ocirc;n kh&ocirc;ng ngừng tạo ra m&ocirc;i trường học tập thuận lợi để học vi&ecirc;n thỏa sức s&aacute;ng tạo v&agrave; thể hiện bản th&acirc;n, cụ thể:</span></span></p>\n\n<p style=\"text-align:justify\"><!--[if !supportLists]--><span style=\"font-family:&quot;Times New Roman&quot;,serif; font-size:12.0pt\">●<span style=\"font-family:&quot;Times New Roman&quot;; font-size:7pt\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><span style=\"font-family:&quot;Times New Roman&quot;,serif; font-size:12.0pt\"><span style=\"font-family:Helvetica\">C&aacute;c lớp học tại trung t&acirc;m đều bố tr&iacute; từ 8-15 học vi&ecirc;n. Với số lượng đ&oacute;, tạo ra kh&ocirc;ng kh&iacute; lớp học gần gũi, th&acirc;n thiện v&agrave; tạo nhiều cơ hội thuận lợi để học vi&ecirc;n v&agrave; giảng vi&ecirc;n c&oacute; thể trao đổi, chia sẻ kiến thức</span></span></p>\n\n<p style=\"text-align:justify\"><!--[if !supportLists]--><span style=\"font-family:&quot;Times New Roman&quot;,serif; font-size:12.0pt\"><span style=\"font-family:Helvetica\">●</span><span style=\"font-family:Helvetica; font-size:7pt\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><span style=\"font-family:&quot;Times New Roman&quot;,serif; font-size:12.0pt\"><span style=\"font-family:Helvetica\">Đội ngũ giảng vi&ecirc;n tại trung t&acirc;m đều l&agrave; những người được đ&agrave;o tạo b&agrave;i bản v&agrave; c&oacute; kiến thức thực tế s&acirc;u rộng</span></span></p>\n\n<p style=\"text-align:justify\"><!--[if !supportLists]--><span style=\"font-family:&quot;Times New Roman&quot;,serif; font-size:12.0pt\"><span style=\"font-family:Helvetica\">●</span><span style=\"font-family:Helvetica; font-size:7pt\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><span style=\"font-family:&quot;Times New Roman&quot;,serif; font-size:12.0pt\"><span style=\"font-family:Helvetica\">Gi&aacute;o tr&igrave;nh được thiết kế ph&ugrave; hợp với từng độ tuổi của học vi&ecirc;n với phương ph&aacute;p sư phạm chuy&ecirc;n nghiệp, đem đến những giờ học hiệu quả.</span></span></p>\n\n<p style=\"text-align:justify\"><!--[if !supportLists]--><span style=\"font-family:&quot;Times New Roman&quot;,serif; font-size:12.0pt\"><span style=\"font-family:Helvetica\">●</span><span style=\"font-family:Helvetica; font-size:7pt\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><span style=\"font-family:&quot;Times New Roman&quot;,serif; font-size:12.0pt\"><span style=\"font-family:Helvetica\">Dịch vụ chu đ&aacute;o với việc lựa chọn thời gian học linh động, học ph&iacute; phải chăng. Cam kết khi kết th&uacute;c kh&oacute;a học mọi học vi&ecirc;n đều nắm vững c&aacute;c kiến thức về lập tr&igrave;nh web từ cơ bản đến n&acirc;ng cao.</span></span></p>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n<p style=\"text-align:justify\"><span style=\"font-family:&quot;Times New Roman&quot;,serif; font-size:12.0pt\"><span style=\"font-family:Helvetica\">Học lập tr&igrave;nh web thực sự l&agrave; xu hướng tất yếu trong x&atilde; hội hiện đại. Tuy nhi&ecirc;n để c&oacute; được những giờ học th&uacute; vị v&agrave; hiệu quả nhất h&atilde;y li&ecirc;n hệ với trung t&acirc;m đ&agrave;o tạo tin học uy t&iacute;n như SPEC ngay h&ocirc;m nay.</span></span></p>\n', 0, 8, b'1', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n    <meta http-equiv=\"content-style-type\" content=\"text/css\">\n    <meta http-equiv=\"content-language\" content=\"en-vi\">\n    <meta name=\"copyright\" content=\"spec.edu.vn\">\n    <meta name=\"keywords\" content=\"Khóa học Web cơ bản đến nâng cao\">\n    <meta name=\"description\" content=\"Nhưng lợi ích khi chọn học lập trình WEB lại trung tâm SPEC\">\n    <meta property=\"og:site_name\" content=\"spec.edu.vn\">\n    <meta property=\"og:type\" content=\"website\">\n    <meta property=\"og:title\" content=\"Khóa học lập trình Web\">\n    <meta property=\"og:description\" content=\"Nhưng lợi ích khi chọn học lập trình WEB lại trung tâm SPEC\">\n    <meta property=\"og:url\" content=\"http://spec.edu.vn/admin-topic\">\n    <meta name=”robots” content=”index,follow” >\n    <meta name=\"author\" content=\"SpecEdu\">\n    <meta name=\"googlebot\" content=\"index,follow,archive\">\n    <meta property=\"og:type\" content=\"article\">', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/5812130002.jpg', 9, 'Khoa-hoc-web', 'Khóa học lập trình Web', 'Nhưng lợi ích khi chọn học lập trình WEB lại trung tâm SPEC', 'Khóa học Web cơ bản đến nâng cao', 'index,follow'),
(44, 'Những lý do tạo nên sức hút của khóa học lập trình robot với trẻ nhỏ', '2021-05-12', '<p><span style=\"font-size:20pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Lập tr&igrave;nh robot l&agrave; một ng&agrave;nh khoa học c&ocirc;ng nghệ cao m&agrave; mọi quốc gia tr&ecirc;n thế giới đều khao kh&aacute;t l&agrave;m chủ v&agrave; chinh phục lĩnh vực n&agrave;y. Tuy nhi&ecirc;n, hiện nay ngay tại Việt Nam bạn c&oacute; thể tiếp cận với những kiến thức khoa học hữu &iacute;ch v&agrave; hiện đại n&agrave;y với những kh&oacute;a học lập tr&igrave;nh robot d&agrave;nh cho trẻ th&uacute; vị v&agrave; hấp dẫn tại Viện Tin học X&acirc;y dựng SPEC</span></span></span></span></p>\n', '<h1 style=\"text-align:center\"><span style=\"font-size:20pt\"><span style=\"font-family:Arial,sans-serif\"><a name=\"_t2q68f9vndzq\"></a><strong><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Những l&yacute; do tạo n&ecirc;n sức h&uacute;t của kh&oacute;a học lập tr&igrave;nh robot với trẻ nhỏ</span></strong></span></span></h1>\n\n<h1 style=\"text-align:justify\"><span style=\"font-size:20pt\"><span style=\"font-family:Arial,sans-serif\"><i><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Lập tr&igrave;nh robot l&agrave; một ng&agrave;nh khoa học c&ocirc;ng nghệ cao m&agrave; mọi quốc gia tr&ecirc;n thế giới đều khao kh&aacute;t l&agrave;m chủ v&agrave; chinh phục lĩnh vực n&agrave;y. Tuy nhi&ecirc;n, hiện nay ngay tại Việt Nam bạn c&oacute; thể tiếp cận với những kiến thức khoa học hữu &iacute;ch v&agrave; hiện đại n&agrave;y với những kh&oacute;a học lập tr&igrave;nh robot d&agrave;nh cho trẻ th&uacute; vị v&agrave; hấp dẫn tại Viện Tin học X&acirc;y dựng SPEC</span></span></i></span></span></h1>\n\n<h2 style=\"text-align:justify\"><span style=\"font-size:16pt\"><span style=\"font-family:Arial,sans-serif\"><a name=\"_4h6n2h9x3r0o\"></a><strong><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Kh&oacute;a học lập tr&igrave;nh robot mở ra tương lai tươi s&aacute;ng cho c&aacute;c bạn nhỏ</span></strong></span></span></h2>\n\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">C&ocirc;ng nghệ robot hiện nay đ&atilde; v&agrave; đang trở th&agrave;nh ti&ecirc;u chuẩn đ&aacute;nh gi&aacute; mức độ ph&aacute;t triển của một quốc gia. Bởi vậy m&agrave; việc đầu tư nguồn lực cho ph&aacute;t triển lĩnh vực n&agrave;y l&agrave; điều v&ocirc; c&ugrave;ng cần thiết.</span></span></span></span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Ch&iacute;nh v&igrave; vậy việc tiếp cận sớm với ng&ocirc;n ngữ lập tr&igrave;nh n&agrave;y ngay từ nhỏ sẽ gi&uacute;p c&aacute;c bạn c&oacute; được những kiến thức nền tảng vững chắc để từ đ&oacute; c&oacute; thể học tập v&agrave; ph&aacute;t triển trong lĩnh vực c&ocirc;ng nghệ th&ocirc;ng tin, khoa học kỹ thuật cao ở trong nước cũng như tại nước ngo&agrave;i</span></span></span></span></p>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"450\" src=\"https://spec.edu.vn/uploadfileimage/spec/baiviet/186194800demo.jpg\" width=\"600\" /></p>\n\n<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><i><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Học lập tr&igrave;nh robot đang l&agrave; xu hướng tr&ecirc;n to&agrave;n thế giới</span></i></span></span></p>\n\n<h2 style=\"text-align:justify\"><span style=\"font-size:16pt\"><span style=\"font-family:Arial,sans-serif\"><a name=\"_cvllp07tyqd7\"></a><strong><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Tăng khả năng tư duy v&agrave; t&iacute;nh s&aacute;ng tạo</span></strong></span></span></h2>\n\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Học ng&ocirc;n ngữ lập tr&igrave;nh kh&ocirc;ng chỉ l&agrave; những kiến thức kh&ocirc; khan v&agrave; cứng nhắc. Thực tế, bộ m&ocirc;n khoa học n&agrave;y đ&ograve;i hỏi c&aacute;c học vi&ecirc;n cần kh&ocirc;ng ngừng tư duy v&agrave; s&aacute;ng tạo để c&oacute; thể tạo ra những ứng dụng mới mẻ v&agrave; hữu &iacute;ch trong cuộc sống.</span></span></span></span></p>\n\n<h2 style=\"text-align:justify\"><span style=\"font-size:16pt\"><span style=\"font-family:Arial,sans-serif\"><a name=\"_kwx7fh3amoo9\"></a><strong><span style=\"font-family:&quot;Times New Roman&quot;,serif\">R&egrave;n luyện khả năng giải quyết c&aacute;c vấn đề linh hoạt</span></strong></span></span></h2>\n\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Khi tham gia c&aacute;c kh&oacute;a học lập tr&igrave;nh robot, b&ecirc;n cạnh những kiến thức cơ bản về m&ocirc;n học, th&ocirc;ng qua việc thực h&agrave;nh c&aacute;c b&eacute; cần phải lu&ocirc;n tư duy, đề ra c&aacute;c giải ph&aacute;p, hướng giải quyết c&aacute;c vấn đề c&oacute; thể ph&aacute;t sinh. Qua đ&oacute;, b&eacute; sẽ thực sự trưởng th&agrave;nh v&agrave; ch&iacute;n chắn hơn trong suy nghĩ v&agrave; h&agrave;nh động</span></span></span></span></p>\n\n<h2 style=\"text-align:justify\"><span style=\"font-size:16pt\"><span style=\"font-family:Arial,sans-serif\"><a name=\"_aqa3v87ek1dt\"></a><strong><span style=\"font-family:&quot;Times New Roman&quot;,serif\">R&egrave;n luyện những kỹ năng mềm cần thiết </span></strong></span></span></h2>\n\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Việc học tập ở trung t&acirc;m, với sự hướng dẫn v&agrave; phương ph&aacute;p gi&aacute;o dục hiện đại của c&aacute;c giảng vi&ecirc;n m&agrave; c&aacute;c bạn học vi&ecirc;n sẽ được r&egrave;n luyện những kỹ năng mềm cần thiết để trở th&agrave;nh những c&ocirc;ng d&acirc;n hiện đại trong thời đại 4.0 như: kỹ năng thuyết tr&igrave;nh, kỹ năng l&agrave;m việc nh&oacute;m,...</span></span></span></span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Với những lợi &iacute;ch tuyệt vời m&agrave; c&aacute;c kh&oacute;a học lập tr&igrave;nh robot đang ng&agrave;y c&agrave;ng cuốn h&uacute;t được sự quan t&acirc;m của c&aacute;c bậc phụ huynh v&agrave; c&aacute;c bạn nhỏ tại Việt Nam. Viện Tin học x&acirc;y dựng Spec tự h&agrave;o l&agrave; đơn vị uy t&iacute;n nhiều năm trong lĩnh vực đ&agrave;o tạo c&ocirc;ng nghệ th&ocirc;ng tin hứa hẹn mang đến kh&oacute;a học lập tr&igrave;nh n&oacute;i chung v&agrave; lập tr&igrave;nh robot n&oacute;i ri&ecirc;ng&nbsp; uy t&iacute;n, chất lượng với gi&aacute; th&agrave;nh phải chăng cho mọi học vi&ecirc;n. H&atilde;y nhanh tay đăng k&yacute; v&agrave; trải nghiệm những kh&oacute;a học &yacute; nghĩa n&agrave;y nh&eacute;.</span></span></span></span></p>\n', 0, 8, b'1', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n    <meta http-equiv=\"content-style-type\" content=\"text/css\">\n    <meta http-equiv=\"content-language\" content=\"en-vi\">\n    <meta name=\"copyright\" content=\"spec.edu.vn\">\n    <meta name=\"keywords\" content=\"Khóa học lập robot, robot , robot trẻ em\">\n    <meta name=\"description\" content=\"Lập trình robot là một ngành khoa học công nghệ cao mà mọi quốc gia trên thế giới đều khao khát làm chủ và chinh phục lĩnh vực này\">\n    <meta property=\"og:site_name\" content=\"spec.edu.vn\">\n    <meta property=\"og:type\" content=\"website\">\n    <meta property=\"og:title\" content=\"Những lý do tạo nên sức hút của khóa học lập trình robot với trẻ nhỏ\">\n    <meta property=\"og:description\" content=\"Lập trình robot là một ngành khoa học công nghệ cao mà mọi quốc gia trên thế giới đều khao khát làm chủ và chinh phục lĩnh vực này\">\n    <meta property=\"og:url\" content=\"http://spec.edu.vn/admin-topic\">\n    <meta name=”robots” content=”index,follow” >\n    <meta name=\"author\" content=\"SpecEdu\">\n    <meta name=\"googlebot\" content=\"index,follow,archive\">\n    <meta property=\"og:type\" content=\"article\">', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/186194800demo.jpg', 19, 'nhung-ly-do-tao-nen-suc-hut-cua-khoa-hoc-robot', 'Những lý do tạo nên sức hút của khóa học lập trình robot với trẻ nhỏ', 'Lập trình robot là một ngành khoa học công nghệ cao mà mọi quốc gia trên thế giới đều khao khát làm chủ và chinh phục lĩnh vực này', 'Khóa học lập robot, robot , robot trẻ em', 'index,follow');
INSERT INTO `topic` (`id`, `title`, `create_date`, `introduct`, `content`, `view`, `id_user`, `deleted`, `meta_html`, `image_src`, `course_id`, `view_url`, `meta_title`, `meta_description`, `meta_keyword`, `meta_robot`) VALUES
(45, 'Học lập trình đơn giản, hiệu quả cùng Minecraft', '2021-05-12', '<p><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Sử dụng ng&ocirc;n ngữ lập tr&igrave;nh l&agrave; một kỹ năng cần thiết đối với mọi người trong thời đại 4.0. Tuy nhi&ecirc;n, l&agrave;m sao để c&oacute; thể tiếp cận với bộ m&ocirc;n khoa học bậc cao n&agrave;y nhanh ch&oacute;ng v&agrave; hiệu quả l&agrave; băn khoăn của rất nhiều người. H&atilde;y c&ugrave;ng kh&aacute;m ph&aacute; về kh&oacute;a học Minecraft để thấy rằng việc học lập tr&igrave;nh thực tế l&agrave; điều kh&ocirc;ng qu&aacute; kh&oacute; khăn</span></span></span></span></p>\n', '<h1 style=\"text-align:center\"><span style=\"font-size:20pt\"><span style=\"font-family:Arial,sans-serif\"><a name=\"_8lbag0rar46e\"></a><strong><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Học lập tr&igrave;nh đơn giản, hiệu quả c&ugrave;ng Minecraft</span></strong></span></span></h1>\n\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><i><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Sử dụng ng&ocirc;n ngữ lập tr&igrave;nh l&agrave; một kỹ năng cần thiết đối với mọi người trong thời đại 4.0. Tuy nhi&ecirc;n, l&agrave;m sao để c&oacute; thể tiếp cận với bộ m&ocirc;n khoa học bậc cao n&agrave;y nhanh ch&oacute;ng v&agrave; hiệu quả l&agrave; băn khoăn của rất nhiều người. H&atilde;y c&ugrave;ng kh&aacute;m ph&aacute; về kh&oacute;a học Minecraft để thấy rằng việc học lập tr&igrave;nh thực tế l&agrave; điều kh&ocirc;ng qu&aacute; kh&oacute; khăn</span></span></i></span></span></p>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"397\" src=\"https://spec.edu.vn/uploadfileimage/spec/baiviet/6616186005.png\" width=\"660\" /></p>\n\n<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><i><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Minecraft l&agrave; ng&ocirc;n ngữ lập tr&igrave;nh th&iacute;ch hợp d&agrave;nh cho trẻ nhỏ</span></span></i></span></span></p>\n\n<h2 style=\"text-align:justify\"><span style=\"font-size:16pt\"><span style=\"font-family:Arial,sans-serif\"><a name=\"_vlbb5bpvfiqf\"></a><strong><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Lập tr&igrave;nh Minecraft ph&ugrave; hợp với tất cả mọi người</span></strong></span></span></h2>\n\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Minecraft l&agrave; ng&ocirc;n ngữ lập tr&igrave;nh được s&aacute;ng tạo v&agrave; ph&aacute;t triển bởi tập đo&agrave;n c&ocirc;ng nghệ h&agrave;ng đầu thế giới Microsoft. Tuy nhi&ecirc;n, thay v&igrave; những kiến thức phức tạp th&igrave; th&ocirc;ng qua việc x&acirc;y dựng thế giới ri&ecirc;ng đa dạng m&agrave;u sắc theo &yacute; tưởng của m&igrave;nh th&igrave; những điều cần biết về lập tr&igrave;nh sẽ được gợi mở. Ch&iacute;nh v&igrave; những ưu điểm về sự dễ học, dễ nhớ, h&igrave;nh ảnh, &acirc;m thanh l&ocirc;i cuốn m&agrave; Minecraft thực sự l&agrave; ng&ocirc;n ngữ lập tr&igrave;nh th&uacute; vị v&agrave; hấp dẫn tất cả mọi người, đặc biệt l&agrave; c&aacute;c bạn nhỏ từ 6-12 tuổi.</span></span></span></span></p>\n\n<h2 style=\"text-align:justify\"><span style=\"font-size:16pt\"><span style=\"font-family:Arial,sans-serif\"><a name=\"_kupnfl77yhsz\"></a><strong><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Lợi &iacute;ch của việc học lập tr&igrave;nh sớm </span></strong></span></span></h2>\n\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Thực tế, việc học ng&ocirc;n ngữ lập tr&igrave;nh Minecraft ngay từ nhỏ đang ng&agrave;y c&agrave;ng trở n&ecirc;n phổ biến. Đặc biệt tại c&aacute;c quốc gia ph&aacute;t triển ch&uacute;ng được đưa v&agrave;o chương tr&igrave;nh gi&aacute;o dục phổ th&ocirc;ng v&agrave; nhận được những đ&aacute;nh gi&aacute; t&iacute;ch cực. Bởi c&aacute;c nh&agrave; khoa học đ&atilde; chứng minh được những lợi &iacute;ch tuyệt vời của việc học lập tr&igrave;nh sớm đối với sự ph&aacute;t triển của con người </span></span></span></span></p>\n\n<ul>\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Đối với trẻ nhỏ, việc học tập sẽ gi&uacute;p c&aacute;c b&eacute; l&agrave;m quen với m&aacute;y t&iacute;nh v&agrave; nguồn tri thức khổng lồ từ internet</span></span></span></span></li>\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">B&ecirc;n cạnh đ&oacute;, việc học tốt ng&ocirc;n ngữ lập tr&igrave;nh Minecraft sẽ gi&uacute;p bạn tiếp tục học c&aacute;c ng&ocirc;n ngữ lập tr&igrave;nh kh&aacute;c dễ d&agrave;ng hơn bao giờ hết</span></span></span></span></li>\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Với sự sinh động, hấp dẫn của Minecraft th&igrave; chắc chắn sẽ khơi dậy t&igrave;nh y&ecirc;u, sự say m&ecirc; của tất cả mọi người đối với ng&ocirc;n ngữ lập tr&igrave;nh - kiến thức khoa học tưởng chừng kh&ocirc; khan v&agrave; cứng nhắc</span></span></span></span></li>\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Việc tiếp cận sớm với ng&ocirc;n ngữ lập tr&igrave;nh gi&uacute;p tăng khả năng tư duy linh hoạt, sự s&aacute;ng tạo kh&ocirc;ng ngừng của con người. Đồng thời r&egrave;n luyện khả năng giải quyết vấn đề linh hoạt, lu&ocirc;n đưa ra nhiều hướng xử l&yacute; kh&aacute;c nhau trong cuộc sống.</span></span></span></span></li>\n</ul>\n\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Với Minecraft việc học lập tr&igrave;nh của bạn sẽ trở n&ecirc;n v&ocirc; c&ugrave;ng đơn giản v&agrave; th&uacute; vị. Để đăng k&yacute; c&aacute;c kh&oacute;a học lập tr&igrave;nh Minecraft th&uacute; vị v&agrave; hữu &iacute;ch h&atilde;y li&ecirc;n hệ với Viện Tin học x&acirc;y dựng SPEC - địa chỉ đ&agrave;o tạo c&ocirc;ng nghệ th&ocirc;ng tin uy t&iacute;n h&agrave;ng đầu Việt Nam ngay h&ocirc;m nay. Trung t&acirc;m đang c&oacute; nhiều chương tr&igrave;nh ưu đ&atilde;i với c&aacute;c kh&oacute;a học lập tr&igrave;nh, đặc biệt d&agrave;nh cho c&aacute;c bạn nhỏ từ 6-12 tuổi v&ocirc; c&ugrave;ng hấp dẫn. </span></span></span></span></p>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n', 0, 8, b'1', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n    <meta http-equiv=\"content-style-type\" content=\"text/css\">\n    <meta http-equiv=\"content-language\" content=\"en-vi\">\n    <meta name=\"copyright\" content=\"spec.edu.vn\">\n    <meta name=\"keywords\" content=\"học lập trình đơn giản với minecraft, minecraft,học lập trình đơn giản\">\n    <meta name=\"description\" content=\"Sử dụng ngôn ngữ lập trình là một kỹ năng cần thiết đối với mọi người trong thời đại 4.0. Tuy nhiên, làm sao để có thể tiếp cận với bộ môn khoa học bậc cao này nhanh chóng và hiệu quả là băn khoăn của rất nhiều người\">\n    <meta property=\"og:site_name\" content=\"spec.edu.vn\">\n    <meta property=\"og:type\" content=\"website\">\n    <meta property=\"og:title\" content=\"Học lập trình đơn giản, hiệu quả cùng Minecraft\">\n    <meta property=\"og:description\" content=\"Sử dụng ngôn ngữ lập trình là một kỹ năng cần thiết đối với mọi người trong thời đại 4.0. Tuy nhiên, làm sao để có thể tiếp cận với bộ môn khoa học bậc cao này nhanh chóng và hiệu quả là băn khoăn của rất nhiều người\">\n    <meta property=\"og:url\" content=\"http://spec.edu.vn/admin-topic\">\n    <meta name=”robots” content=”index,follow” >\n    <meta name=\"author\" content=\"SpecEdu\">\n    <meta name=\"googlebot\" content=\"index,follow,archive\">\n    <meta property=\"og:type\" content=\"article\">', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/6616186005.png', 10, 'hoc-lap-trinh-don-gian-hieu-qua-cung-minecraft', 'Học lập trình đơn giản, hiệu quả cùng Minecraft', 'Sử dụng ngôn ngữ lập trình là một kỹ năng cần thiết đối với mọi người trong thời đại 4.0. Tuy nhiên, làm sao để có thể tiếp cận với bộ môn khoa học bậc cao này nhanh chóng và hiệu quả là băn khoăn của rất nhiều người', 'học lập trình đơn giản với minecraft, minecraft,học lập trình đơn giản', 'index,follow'),
(46, 'Khóa học lập trình Python cơ bản tại SPEC', '2021-05-12', '<p><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Học lập tr&igrave;nh đang l&agrave; xu hướng tất yếu của thời đại c&ocirc;ng nghệ 4.0. Đặc biệt đối với trẻ nhỏ việc tiếp cận với những ng&ocirc;n ngữ lập tr&igrave;nh đơn giản như Python thực sự sẽ mang đến những lợi &iacute;ch tuyệt vời. H&atilde;y c&ugrave;ng t&igrave;m hiểu về kh&oacute;a học lập tr&igrave;nh Python cơ bản tại SPEC- trung t&acirc;m gi&aacute;o dục uy t&iacute;n h&agrave;ng đầu tại Việt Nam hiện nay.</span></span></span></span></p>\n', '<h1 style=\"text-align:center\"><span style=\"font-size:20pt\"><span style=\"font-family:Arial,sans-serif\"><a name=\"_8ld7hbc6mktw\"></a><strong><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Kh&oacute;a học lập tr&igrave;nh Python cơ bản tại SPEC</span></strong></span></span></h1>\n\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Meta: Kh&oacute;a học lập tr&igrave;nh Python&nbsp; cơ bản tại SPEC gi&uacute;p bạn tiếp cận với những kiến thức lập tr&igrave;nh b&agrave;i bản bằng phương ph&aacute;p giảng dạy khoa học v&agrave; hiệu quả nhất.</span></span></span></span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">----------------------------------------------</span></span></span></span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><i><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Học lập tr&igrave;nh đang l&agrave; xu hướng tất yếu của thời đại c&ocirc;ng nghệ 4.0. Đặc biệt đối với trẻ nhỏ việc tiếp cận với những ng&ocirc;n ngữ lập tr&igrave;nh đơn giản như Python thực sự sẽ mang đến những lợi &iacute;ch tuyệt vời. H&atilde;y c&ugrave;ng t&igrave;m hiểu về kh&oacute;a học lập tr&igrave;nh Python cơ bản tại SPEC- trung t&acirc;m gi&aacute;o dục uy t&iacute;n h&agrave;ng đầu tại Việt Nam hiện nay</span></span></i></span></span></p>\n\n<h2 style=\"text-align:justify\"><span style=\"font-size:16pt\"><span style=\"font-family:Arial,sans-serif\"><a name=\"_ig7zshxqb83f\"></a><strong><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Nội dung kh&oacute;a học lập tr&igrave;nh Python cơ bản</span></strong></span></span></h2>\n\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Đến với trung t&acirc;m gi&aacute;o dục SPEC c&aacute;c bạn học vi&ecirc;n sẽ được đ&agrave;o tạo b&agrave;i bản v&agrave; chuy&ecirc;n nghiệp từ c&aacute;c kiến thức cơ bản đến n&acirc;ng cao về lập tr&igrave;nh Python, cụ thể như sau:</span></span></span></span></p>\n\n<ul>\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Học về c&aacute;c h&agrave;m cơ bản của Python v&agrave; ứng dụng l&agrave;m một phần mềm quản l&yacute; đơn giản tương t&aacute;c với kiểu dữ liệu list</span></span></span></span></li>\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Học lưu đồ thuật to&aacute;n, cấu tạo v&agrave; d&ugrave;ng h&agrave;m, l&agrave;m quen c&aacute;ch d&ugrave;ng thư d&ugrave;ng thư viện</span></span></span></span></li>\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Học dung class, oop cơ bản thư viện tkinter, tư duy UX/UI. Ứng dụng l&agrave;m giao diện cho trang web</span></span></span></span></li>\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Học pygame. l&agrave;m game sử dụng OOP n&acirc;ng cao</span></span></span></span></li>\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Tiếp cận Wordpress, thiết kế website, plugin, sideshow c&aacute;c thứ, ứng dụng l&agrave;m website đơn giản</span></span></span></span></li>\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Html, ứng dụng l&agrave;m web th&ocirc;ng tin</span></span></span></span></li>\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Framework, bootstrap</span></span></span></span></li>\n</ul>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"663\" src=\"https://spec.edu.vn/uploadfileimage/spec/baiviet/6136764001.png\" width=\"560\" /></p>\n\n<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><i><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Kh&oacute;a học Python tại Viện Tin học x&acirc;y dựng SPEC mang đến trải nghiệm hữu &iacute;ch cho bạn</span></span></i></span></span></p>\n\n<h2 style=\"text-align:justify\"><span style=\"font-size:16pt\"><span style=\"font-family:Arial,sans-serif\"><a name=\"_oxhqcp7pnedq\"></a><strong><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Đối tượng học lập tr&igrave;nh Python</span></strong></span></span></h2>\n\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Python l&agrave; ng&ocirc;n ngữ m&atilde; nguồn mở ho&agrave;n to&agrave;n miễn ph&iacute; mang đến nhiều tiện &iacute;ch cho người sử dụng. Đặc biệt Python c&ograve;n được đ&aacute;nh gi&aacute; l&agrave; đơn giản, dễ học v&igrave; vậy m&agrave; việc học ng&ocirc;n ngữ lập tr&igrave;nh n&agrave;y ph&ugrave; hợp với tất cả mọi người y&ecirc;u th&iacute;ch c&ocirc;ng nghệ, kể cả trẻ em. V&igrave; vậy c&aacute;c bậc phụ huynh ho&agrave;n to&agrave;n c&oacute; thể đăng k&yacute; v&agrave; cho c&aacute;c b&eacute; tham gia c&aacute;c kh&oacute;a học tại SPEC ngay h&ocirc;m nay.</span></span></span></span></p>\n\n<h2 style=\"text-align:justify\"><span style=\"font-size:16pt\"><span style=\"font-family:Arial,sans-serif\"><a name=\"_u3w4ds10vr7\"></a><strong><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Những lợi &iacute;ch của bạn khi tham gia kh&oacute;a học lập tr&igrave;nh Python cơ bản tại SPEC</span></strong></span></span></h2>\n\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">L&agrave; một trong những trung t&acirc;m gi&aacute;o dục uy t&iacute;n h&agrave;ng đầu tại Việt Nam hiện nay, mục ti&ecirc;u lớn nhất m&agrave; SPEC hướng đến ch&iacute;nh l&agrave; việc mang đến nguồn tri thức chuy&ecirc;n nghiệp v&agrave; b&agrave;i bản về ng&ocirc;n ngữ lập tr&igrave;nh đến với đ&ocirc;ng đảo mọi người. Ch&iacute;nh v&igrave; thế trung t&acirc;m lu&ocirc;n mang đến những dịch vụ v&agrave; ưu đ&atilde;i hấp dẫn d&agrave;nh cho người học, cụ thể</span></span></span></span></p>\n\n<ul>\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Mức học ph&iacute; phải chăng, ph&ugrave; hợp với mọi học sinh</span></span></span></span></li>\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Được học thử miễn ph&iacute; 3 buổi đầu ti&ecirc;n, trước khi đăng k&yacute; c&aacute;c kh&oacute;a học ch&iacute;nh thức</span></span></span></span></li>\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Thời gian học tập linh hoạt, ph&ugrave; hợp với kế hoạch học tập, sinh hoạt, l&agrave;m việc của bạn.</span></span></span></span></li>\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Đội ngũ giảng vi&ecirc;n chuy&ecirc;n nghiệp, c&oacute; phương ph&aacute;p sư phạm v&agrave; kiến thức thực tế s&acirc;u rộng.</span></span></span></span></li>\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Trung t&acirc;m c&oacute; h&igrave;nh thức học bảo lưu &ldquo;miễn ph&iacute;&rdquo; trong v&ograve;ng 1 năm cho đến khi bạn nắm vững kiến thức cần thiết</span></span></span></span></li>\n</ul>\n\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Học lập tr&igrave;nh n&oacute;i chung v&agrave; Python n&oacute;i ri&ecirc;ng đang l&agrave; xu hướng tất yếu của cuộc sống hiện đại. Để c&oacute; được kh&oacute;a học hiệu quả, &yacute; nghĩa với nhiều ưu đ&atilde;i hấp dẫn h&atilde;y li&ecirc;n hệ v&agrave; đăng k&yacute; ngay với SPEC- địa chỉ đ&agrave;o tạo tin học uy t&iacute;n h&agrave;ng đầu Việt Nam ngay h&ocirc;m nay nh&eacute;.</span></span></span></span></p>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n', 0, 8, b'1', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n    <meta http-equiv=\"content-style-type\" content=\"text/css\">\n    <meta http-equiv=\"content-language\" content=\"en-vi\">\n    <meta name=\"copyright\" content=\"spec.edu.vn\">\n    <meta name=\"keywords\" content=\"học lập trình python cơ bản, SPEC,học lập trình python\">\n    <meta name=\"description\" content=\"Học lập trình đang là xu hướng tất yếu của thời đại công nghệ 4.0. Đặc biệt đối với trẻ nhỏ việc tiếp cận với những ngôn ngữ lập trình đơn giản như Python thực sự sẽ mang đến những lợi ích tuyệt vời.\">\n    <meta property=\"og:site_name\" content=\"spec.edu.vn\">\n    <meta property=\"og:type\" content=\"website\">\n    <meta property=\"og:title\" content=\"Khóa học lập trình Python cơ bản tại SPEC\">\n    <meta property=\"og:description\" content=\"Học lập trình đang là xu hướng tất yếu của thời đại công nghệ 4.0. Đặc biệt đối với trẻ nhỏ việc tiếp cận với những ngôn ngữ lập trình đơn giản như Python thực sự sẽ mang đến những lợi ích tuyệt vời.\">\n    <meta property=\"og:url\" content=\"http://spec.edu.vn/admin-topic\">\n    <meta name=”robots” content=”index,follow” >\n    <meta name=\"author\" content=\"SpecEdu\">\n    <meta name=\"googlebot\" content=\"index,follow,archive\">\n    <meta property=\"og:type\" content=\"article\">', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/6136764001.png', 8, 'khoa-hoc-lap-trinh-python-co-ban-tai-SPEC', 'Khóa học lập trình Python cơ bản tại SPEC', 'Học lập trình đang là xu hướng tất yếu của thời đại công nghệ 4.0. Đặc biệt đối với trẻ nhỏ việc tiếp cận với những ngôn ngữ lập trình đơn giản như Python thực sự sẽ mang đến những lợi ích tuyệt vời.', 'học lập trình python cơ bản, SPEC,học lập trình python', 'index,follow'),
(47, 'Những điều cần lưu ý khi dạy lập trình cho bé', '2021-04-28', '<p><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Lập tr&igrave;nh l&agrave; bộ m&ocirc;n th&uacute; vị, đầy hấp dẫn với tất cả mọi người. Đặc biệt việc tiếp cận sớm với ng&ocirc;n ngữ lập tr&igrave;nh mang đến nhiều lợi &iacute;ch tuyệt vời cho b&eacute;. Tuy nhi&ecirc;n, l&agrave;m sao để việc học trở n&ecirc;n hiệu quả v&agrave; hữu &iacute;ch với độ tuổi của b&eacute;. H&atilde;y c&ugrave;ng ghi nhớ những vấn đề sau</span></span></span></span></p>\n', '<h1 style=\"text-align:center\"><span style=\"font-size:20pt\"><span style=\"font-family:Arial,sans-serif\"><a name=\"_dcusl5a7e9fz\"></a><strong><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Những điều cần lưu &yacute; khi dạy lập tr&igrave;nh cho b&eacute;</span></strong></span></span></h1>\n\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><i><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Lập tr&igrave;nh l&agrave; bộ m&ocirc;n th&uacute; vị, đầy hấp dẫn với tất cả mọi người. Đặc biệt việc tiếp cận sớm với ng&ocirc;n ngữ lập tr&igrave;nh mang đến nhiều lợi &iacute;ch tuyệt vời cho b&eacute;. Tuy nhi&ecirc;n, l&agrave;m sao để việc học trở n&ecirc;n hiệu quả v&agrave; hữu &iacute;ch với độ tuổi của b&eacute;. H&atilde;y c&ugrave;ng ghi nhớ những vấn đề sau</span></span></i></span></span></p>\n\n<h2 style=\"text-align:justify\"><span style=\"font-size:16pt\"><span style=\"font-family:Arial,sans-serif\"><a name=\"_kcsr4t3eyxeu\"></a><strong><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Cần lựa chọn ng&ocirc;n ngữ lập tr&igrave;nh ph&ugrave; hợp với độ tuổi</span></strong></span></span></h2>\n\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Ng&ocirc;n ngữ lập tr&igrave;nh được biết đến với những lợi &iacute;ch v&ocirc; c&ugrave;ng tuyệt vời đối với sự ph&aacute;t triển của trẻ. Kh&ocirc;ng chỉ mở ra nguồn tri thức khoa học qu&yacute; b&aacute;u m&agrave; c&ograve;n gi&uacute;p c&aacute;c b&eacute; r&egrave;n luyện những kỹ năng mềm cần thiết cho tương lai.</span></span></span></span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Nhưng ở độ tuổi của c&aacute;c b&eacute; việc tiếp thu tri thức v&ocirc; c&ugrave;ng nhanh nhạy, với khả năng ghi nhớ tốt. Tuy nhi&ecirc;n kh&aacute;c với việc học lập tr&igrave;nh ở người trưởng th&agrave;nh, c&aacute;c nh&agrave; khoa học đ&atilde; nghi&ecirc;n cứu v&agrave; tạo ra rất nhiều ng&ocirc;n ngữ lập tr&igrave;nh ph&ugrave; hợp với trẻ. Từ đ&oacute; gi&uacute;p b&eacute; c&oacute; được nền tảng vững chắc về lập tr&igrave;nh, gi&uacute;p qu&aacute; tr&igrave;nh học tập sau n&agrave;y trở n&ecirc;n dễ d&agrave;ng v&agrave; hiệu quả hơn. Đồng thời gi&uacute;p c&aacute;c b&eacute; hiểu biết hơn về c&aacute;ch hoạt động của m&aacute;y t&iacute;nh.</span></span></span></span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Một số ng&ocirc;n ngữ lập tr&igrave;nh phổ biến, được sử dụng rộng r&atilde;i phải kể đến như: Scratch, Minecraft, Python,....Đ&acirc;y l&agrave; những ng&ocirc;n ngữ lập tr&igrave;nh đơn giản, dễ học, dễ nhớ, c&oacute; hiệu ứng sinh động, hấp dẫn người d&ugrave;ng, ph&ugrave; hợp với lứa tuổi thanh thiếu nhi.</span></span></span></span></p>\n\n<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><img alt=\"\" height=\"478\" src=\"https://spec.edu.vn/uploadfileimage/spec/baiviet/6790268009.png\" width=\"800\" /></span></span></span></span></p>\n\n<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><i><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Lập tr&igrave;nh l&agrave; bộ m&ocirc;n được đưa v&agrave;o chương tr&igrave;nh gi&aacute;o dục tại nhiều quốc gia </span></span></i></span></span></p>\n\n<h2 style=\"text-align:justify\"><span style=\"font-size:16pt\"><span style=\"font-family:Arial,sans-serif\"><a name=\"_ykw194oamoeo\"></a><strong><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Lựa chọn địa chỉ dạy lập tr&igrave;nh uy t&iacute;n</span></strong></span></span></h2>\n\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Hiện nay, với kho t&agrave;ng tri thức rộng lớn tr&ecirc;n internet, bạn c&oacute; thể dễ d&agrave;ng tự học lập tr&igrave;nh từ c&aacute;c trang web hay video tr&ecirc;n mạng. Nhưng nếu nếu bạn muốn trẻ được học một c&aacute;ch b&agrave;i bản, khoa học h&atilde;y lựa chọn những kh&oacute;a học lập tr&igrave;nh b&agrave;i bản.</span></span></span></span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Tuy nhi&ecirc;n hiện nay xu hướng học lập tr&igrave;nh nở rộ với sự ra đời của rất nhiều trung t&acirc;m giảng dạy về lập tr&igrave;nh. Nhưng phụ huynh cần tỉnh t&aacute;o để chọn được một địa chỉ học lập tr&igrave;nh ph&ugrave; hợp v&agrave; c&oacute; thể khai ph&aacute; được tiềm năng của c&aacute;c b&eacute;.</span></span></span></span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Tại đ&acirc;y, với hệ thống gi&aacute;o tr&igrave;nh khoa học, được thiết kế ph&ugrave; hợp với độ tuổi của b&eacute;. Lộ tr&igrave;nh học tập được đề ra r&otilde; r&agrave;ng v&agrave; hợp l&yacute;. B&ecirc;n cạnh đ&oacute;, đội ngũ gi&aacute;o vi&ecirc;n giỏi v&agrave; gi&agrave;u kinh nghiệm sẽ lu&ocirc;n mang đến những giờ học l&yacute; th&uacute; v&agrave; hữu &iacute;ch nhất.</span></span></span></span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Dạy lập tr&igrave;nh cho b&eacute; l&agrave; xu hướng tất yếu của x&atilde; hội hiện đại. Tuy nhi&ecirc;n bạn cần lựa chọn ng&ocirc;n ngữ lập tr&igrave;nh v&agrave; nơi đ&agrave;o tạo th&iacute;ch hợp cho b&eacute; để mang đến những giờ học hiệu quả v&agrave; gi&uacute;p b&eacute; ph&aacute;t huy tối đa khả năng của m&igrave;nh. SPEC tự h&agrave;o l&agrave; đơn vị đ&agrave;o tạo tin học uy t&iacute;n h&agrave;ng đầu tại Việt Nam. H&atilde;y đến với trung t&acirc;m để được đăng k&yacute; những kh&oacute;a học lập tr&igrave;nh chuy&ecirc;n nghiệp với mức gi&aacute; phải chăng nh&eacute;.</span></span></span></span></p>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n', 0, 8, b'1', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n    <meta http-equiv=\"content-style-type\" content=\"text/css\">\n    <meta http-equiv=\"content-language\" content=\"en-vi\">\n    <meta name=\"copyright\" content=\"spec.edu.vn\">\n    <meta name=\"keywords\" content=\"lưu ý khi dạy lập trình cho bé, lưu ý lập trình, lập trình cho bé\">\n    <meta name=\"description\" content=\"Lập trình là bộ môn thú vị, đầy hấp dẫn với tất cả mọi người. Đặc biệt việc tiếp cận sớm với ngôn ngữ lập trình mang đến nhiều lợi ích tuyệt vời cho bé\">\n    <meta property=\"og:site_name\" content=\"spec.edu.vn\">\n    <meta property=\"og:type\" content=\"website\">\n    <meta property=\"og:title\" content=\"Những điều cần lưu ý khi dạy lập trình cho bé\">\n    <meta property=\"og:description\" content=\"Lập trình là bộ môn thú vị, đầy hấp dẫn với tất cả mọi người. Đặc biệt việc tiếp cận sớm với ngôn ngữ lập trình mang đến nhiều lợi ích tuyệt vời cho bé\">\n    <meta property=\"og:url\" content=\"https://spec.edu.vn/admin-topic\">\n    <meta name=”robots” content=”index,follow” >\n    <meta name=\"author\" content=\"SpecEdu\">\n    <meta name=\"googlebot\" content=\"index,follow,archive\">\n    <meta property=\"og:type\" content=\"article\">', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/6790268009.png', 9, 'nhung-dieu-can-luu-y-khi-day-lap-trinh-cho-be', 'Những điều cần lưu ý khi dạy lập trình cho bé', 'Lập trình là bộ môn thú vị, đầy hấp dẫn với tất cả mọi người. Đặc biệt việc tiếp cận sớm với ngôn ngữ lập trình mang đến nhiều lợi ích tuyệt vời cho bé', 'lưu ý khi dạy lập trình cho bé, lưu ý lập trình, lập trình cho bé', 'index,follow'),
(48, 'Top 7 khóa học lập trình hấp dẫn dành cho bé', '2021-04-28', '<p><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Dạy lập tr&igrave;nh cho b&eacute; đang được xem l&agrave; xu hướng to&agrave;n cầu, nhận được sự hưởng ứng nhiệt t&igrave;nh của đ&ocirc;ng đảo phụ huynh v&agrave; học sinh. Tuy nhi&ecirc;n, n&ecirc;n cho b&eacute; học ng&ocirc;n ngữ lập tr&igrave;nh n&agrave;o? B&agrave;i viết sau đ&acirc;y sẽ giới thiệu đến bạn top 7 kh&oacute;a học lập tr&igrave;nh hấp dẫn, được nhiều học vi&ecirc;n lựa chọn v&agrave; y&ecirc;u th&iacute;ch trong thời gian qua</span></span></span></span></p>\n', '<h1 style=\"text-align:center\"><span style=\"font-size:20pt\"><span style=\"font-family:Arial,sans-serif\"><a name=\"_zly34d6w7t3\"></a><strong><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Top 7 kh&oacute;a học lập tr&igrave;nh hấp dẫn d&agrave;nh cho b&eacute;</span></strong></span></span></h1>\n\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><i><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Dạy lập tr&igrave;nh cho b&eacute; đang được xem l&agrave; xu hướng to&agrave;n cầu, nhận được sự hưởng ứng nhiệt t&igrave;nh của đ&ocirc;ng đảo phụ huynh v&agrave; học sinh. Tuy nhi&ecirc;n, n&ecirc;n cho b&eacute; học ng&ocirc;n ngữ lập tr&igrave;nh n&agrave;o? B&agrave;i viết sau đ&acirc;y sẽ giới thiệu đến bạn top 7 kh&oacute;a học lập tr&igrave;nh hấp dẫn, được nhiều học vi&ecirc;n lựa chọn v&agrave; y&ecirc;u th&iacute;ch trong thời gian qua</span></span></i></span></span></p>\n\n<h2 style=\"text-align:justify\"><span style=\"font-size:16pt\"><span style=\"font-family:Arial,sans-serif\"><a name=\"_lqxqsi76qgk\"></a><strong><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Kh&oacute;a học lập tr&igrave;nh cho trẻ từ 7-12 tuổi</span></strong></span></span></h2>\n\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Ở độ tuổi c&ograve;n kh&aacute; nhỏ, ch&iacute;nh v&igrave; thế việc học lập tr&igrave;nh kh&ocirc;ng đặt nặng vấn đề truyền đạt những kiến thức khoa học kh&ocirc; cưng. Thay v&agrave;o đ&oacute;, hướng đến việc học lập tr&igrave;nh th&ocirc;ng qua những b&agrave;i học đơn giản, dễ hiểu, dễ nhớ với những h&igrave;nh ảnh v&agrave; b&agrave;i tập sinh động, hấp dẫn. Từ đ&oacute; gi&uacute;p c&aacute;c b&eacute; l&agrave;m quen v&agrave; sử dụng th&agrave;nh thạo m&aacute;y vi t&iacute;nh v&agrave; thỏa sức viết code để s&aacute;ng tạo ra những ứng dụng mới mẻ. Một số ng&ocirc;n ngữ lập tr&igrave;nh ph&ugrave; hợp với c&aacute;c b&eacute; từ 7-12 tuổi được c&aacute;c chuy&ecirc;n gia đề xuất như:</span></span></span></span></p>\n\n<ul>\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Lập tr&igrave;nh Scratch </span></span></span></span></li>\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Lập tr&igrave;nh MineCraft</span></span></span></span></li>\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Lập tr&igrave;nh Robot </span></span></span></span></li>\n</ul>\n\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Đ&acirc;y l&agrave; 3 ng&ocirc;n ngữ lập tr&igrave;nh d&agrave;nh cho trẻ được c&aacute;c nh&agrave; khoa học đ&aacute;nh gi&aacute; cao về nội dung, chất lượng. Với những h&igrave;nh ảnh, &acirc;m thanh gần gũi, đẹp mắt chắc chắn sẽ cuốn h&uacute;t c&aacute;c b&eacute; ngay từ những buổi học đầu ti&ecirc;n.</span></span></span></span></p>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"357\" src=\"https://spec.edu.vn/uploadfileimage/spec/baiviet/58949620011.jpg\" width=\"536\" /></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><i><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Dạy lập tr&igrave;nh cho b&eacute; l&agrave; xu hướng tại c&aacute;c nước ph&aacute;t triển tr&ecirc;n thế giới</span></span></i></span></span></p>\n\n<h2 style=\"text-align:justify\"><span style=\"font-size:16pt\"><span style=\"font-family:Arial,sans-serif\"><a name=\"_nwn8rba3zxen\"></a><strong><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Kh&oacute;a học lập tr&igrave;nh cho trẻ từ 12-16 tuổi</span></strong></span></span></h2>\n\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Đối với lứa tuổi từ 12-16, đ&acirc;y l&agrave; giai đoạn b&eacute; đ&atilde; kh&aacute; trưởng th&agrave;nh với nhận thức v&agrave; khả năng tư duy ho&agrave;n thiện. Bởi vậy, tại c&aacute;c kh&oacute;a học c&aacute;c giảng vi&ecirc;n kh&ocirc;ng chỉ tiếp lửa đam m&ecirc; với c&ocirc;ng nghệ cho c&aacute;c em m&agrave; c&ograve;n mang đến những kiến thức khoa học b&agrave;i bản. Từ đ&oacute;, gi&uacute;p c&aacute;c b&eacute; c&oacute; được nền tảng kiến thức vững chắc để c&oacute; thể vững bước tr&ecirc;n con đường học tập v&agrave; l&agrave;m việc trong lĩnh vực c&ocirc;ng nghệ th&ocirc;ng tin trong tương lai. Một số ng&ocirc;n ngữ lập tr&igrave;nh ph&ugrave; hợp với c&aacute;c b&eacute; ở độ tuổi n&agrave;y bao gồm:</span></span></span></span></p>\n\n<ul>\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Lập tr&igrave;nh Python</span></span></span></span></li>\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Lập tr&igrave;nh Web</span></span></span></span></li>\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Lập tr&igrave;nh Java</span></span></span></span></li>\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Lập tr&igrave;nh C++</span></span></span></span></li>\n</ul>\n\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">B&ecirc;n cạnh những kiến thức lập tr&igrave;nh từ cơ bản đến n&acirc;ng cao, c&aacute;c kh&oacute;a học c&ograve;n gi&uacute;p c&aacute;c b&eacute; r&egrave;n luyện c&aacute;c kỹ năng mềm cần thiết như: kỹ năng xử l&yacute; t&igrave;nh huống, kỹ năng thuyết tr&igrave;nh, l&agrave;m việc nh&oacute;m&hellip;.Đ&acirc;y l&agrave; những kỹ năng cần thiết v&agrave; quan trọng cần c&oacute; ở những chủ nh&acirc;n tương lai của đất nước trong thời đại c&ocirc;ng nghệ 4.0.</span></span></span></span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Tr&ecirc;n đ&acirc;y l&agrave; Top 7 kh&oacute;a học lập tr&igrave;nh hấp dẫn d&agrave;nh cho b&eacute;. Tuy nhi&ecirc;n, b&ecirc;n cạnh việc lựa chọn kh&oacute;a học ph&ugrave; hợp th&igrave; bạn cũng cần lựa chọn cho b&eacute; những địa chỉ dạy lập tr&igrave;nh uy t&iacute;n để trang bị cho b&eacute; những kiến thức b&agrave;i bản v&agrave; khoa học nhất. Viện Tin học x&acirc;y dựng SPEC tự h&agrave;o l&agrave; đơn vị c&oacute; nhiều năm uy t&iacute;n trong lĩnh vực đ&agrave;o tạo t&agrave;i năng c&ocirc;ng nghệ th&ocirc;ng tin tại Việt Nam. H&atilde;y li&ecirc;n hệ với trung t&acirc;m ngay h&ocirc;m nay để được đăng k&yacute; cho c&aacute;c b&eacute; những kh&oacute;a học hữu &iacute;ch v&agrave; &yacute; nghĩa nh&eacute;.</span></span></span></span></p>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n', 0, 8, b'1', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n    <meta http-equiv=\"content-style-type\" content=\"text/css\">\n    <meta http-equiv=\"content-language\" content=\"en-vi\">\n    <meta name=\"copyright\" content=\"spec.edu.vn\">\n    <meta name=\"keywords\" content=\"khóa học lập trình cho bé, lập trình cho bé, khóa học lập trình\">\n    <meta name=\"description\" content=\"Dạy lập trình cho bé đang được xem là xu hướng toàn cầu, nhận được sự hưởng ứng nhiệt tình của đông đảo phụ huynh và học sinh\">\n    <meta property=\"og:site_name\" content=\"spec.edu.vn\">\n    <meta property=\"og:type\" content=\"website\">\n    <meta property=\"og:title\" content=\"Top 7 khóa học lập trình hấp dẫn dành cho bé\">\n    <meta property=\"og:description\" content=\"Dạy lập trình cho bé đang được xem là xu hướng toàn cầu, nhận được sự hưởng ứng nhiệt tình của đông đảo phụ huynh và học sinh\">\n    <meta property=\"og:url\" content=\"https://spec.edu.vn/admin-topic\">\n    <meta name=”robots” content=”index,follow” >\n    <meta name=\"author\" content=\"SpecEdu\">\n    <meta name=\"googlebot\" content=\"index,follow,archive\">\n    <meta property=\"og:type\" content=\"article\">', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/58949620011.jpg', 9, 'top-7-khoa-hoc-lap-trinh-cho-be', 'Top 7 khóa học lập trình hấp dẫn dành cho bé', 'Dạy lập trình cho bé đang được xem là xu hướng toàn cầu, nhận được sự hưởng ứng nhiệt tình của đông đảo phụ huynh và học sinh', 'khóa học lập trình cho bé, lập trình cho bé, khóa học lập trình', 'index,follow');
INSERT INTO `topic` (`id`, `title`, `create_date`, `introduct`, `content`, `view`, `id_user`, `deleted`, `meta_html`, `image_src`, `course_id`, `view_url`, `meta_title`, `meta_description`, `meta_keyword`, `meta_robot`) VALUES
(49, 'Nên hay không việc dạy lập trình sớm cho trẻ?', '2021-04-28', '<p><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Ng&ocirc;n ngữ lập tr&igrave;nh hứa hẹn l&agrave; ng&ocirc;n ngữ chung v&agrave; phổ biến tr&ecirc;n thế giới trong thời đại c&ocirc;ng nghệ 4.0. Tuy nhi&ecirc;n, n&ecirc;n học lập tr&igrave;nh từ khi n&agrave;o? c&oacute; n&ecirc;n dạy lập tr&igrave;nh sớm cho trẻ em hay kh&ocirc;ng? l&agrave; thắc mắc của rất nhiều người, đặc biệt l&agrave; c&aacute;c bậc phụ huynh. H&atilde;y c&ugrave;ng đi t&igrave;m lời giải đ&aacute;p ch&iacute;nh x&aacute;c với sự tư vấn của c&aacute;c chuy&ecirc;n gia nh&eacute;</span></span><i><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">.</span></span></i></span></span></p>\n', '<h1 style=\"text-align:center\"><span style=\"font-size:20pt\"><span style=\"font-family:Arial,sans-serif\"><a name=\"_j54l7mljzs3k\"></a><strong><span style=\"font-family:&quot;Times New Roman&quot;,serif\">N&ecirc;n hay kh&ocirc;ng việc dạy lập tr&igrave;nh sớm cho trẻ?</span></strong></span></span></h1>\n\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><i><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Ng&ocirc;n ngữ lập tr&igrave;nh hứa hẹn l&agrave; ng&ocirc;n ngữ chung v&agrave; phổ biến tr&ecirc;n thế giới trong thời đại c&ocirc;ng nghệ 4.0. Tuy nhi&ecirc;n, n&ecirc;n học lập tr&igrave;nh từ khi n&agrave;o? c&oacute; n&ecirc;n dạy lập tr&igrave;nh sớm cho trẻ em hay kh&ocirc;ng? l&agrave; thắc mắc của rất nhiều người, đặc biệt l&agrave; c&aacute;c bậc phụ huynh. H&atilde;y c&ugrave;ng đi t&igrave;m lời giải đ&aacute;p ch&iacute;nh x&aacute;c với sự tư vấn của c&aacute;c chuy&ecirc;n gia nh&eacute;.</span></span></i></span></span></p>\n\n<h2 style=\"text-align:justify\"><span style=\"font-size:16pt\"><span style=\"font-family:Arial,sans-serif\"><a name=\"_fdhk5vk355r\"></a><strong><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Dạy lập tr&igrave;nh đang l&agrave; xu hướng trong lĩnh vực gi&aacute;o dục tr&ecirc;n thế giới</span></strong></span></span></h2>\n\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Hiện nay, việc nhiều người, đặc biệt l&agrave; c&aacute;c nhỏ say sưa viết code tr&ecirc;n m&aacute;y t&iacute;nh đ&atilde; kh&ocirc;ng c&ograve;n l&agrave; điều qu&aacute; xa lạ nữa. Bởi trong bối cảnh sự ph&aacute;t triển mạnh mẽ của khoa học c&ocirc;ng nghệ, đặc biệt l&agrave; c&ocirc;ng nghệ th&ocirc;ng tin th&igrave; việc học ng&ocirc;n ngữ lập tr&igrave;nh được xem l&agrave; điều v&ocirc; c&ugrave;ng cần thiết</span></span></span></span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Đặc biệt, tại nhiều quốc gia tr&ecirc;n thế giới việc học ng&ocirc;n ngữ lập tr&igrave;nh đ&atilde; được đưa v&agrave;o chương tr&igrave;nh gi&aacute;o dục phổ th&ocirc;ng trong nhiều năm qua. V&agrave; hiện nay, ở Việt Nam xu hướng n&agrave;y cũng được &aacute;p dụng v&agrave;o thực tiễn v&agrave; nhận được sự đồng thuận, đ&aacute;nh gi&aacute; cao của đ&ocirc;ng đảo c&aacute;c bậc phụ huynh v&agrave; học vi&ecirc;n tr&ecirc;n khắp cả nước.</span></span></span></span></p>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"666\" src=\"https://spec.edu.vn/uploadfileimage/spec/baiviet/4477425008.jpg\" width=\"1000\" /></p>\n\n<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><i><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Dạy lập tr&igrave;nh cho b&eacute; đang l&agrave; xu hướng chung tr&ecirc;n to&agrave;n cầu</span></span></i></span></span></p>\n\n<h2 style=\"text-align:justify\"><span style=\"font-size:16pt\"><span style=\"font-family:Arial,sans-serif\"><a name=\"_46s9jvq9stnc\"></a><strong><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Những lợi &iacute;ch của việc dạy lập tr&igrave;nh sớm cho trẻ</span></strong></span></span></h2>\n\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Theo c&aacute;c chuy&ecirc;n gia, việc tiếp cận sớm với ng&ocirc;n ngữ lập tr&igrave;nh thực sự mang đến nhiều lợi &iacute;ch tuyệt vời cho người học. Đặc biệt trong giai đoạn v&agrave;ng từ 6-12 tuổi được xem l&agrave; thời điểm c&oacute; thể học ng&ocirc;n ngữ lập tr&igrave;nh hiệu quả. Nhiều chuy&ecirc;n gia đ&atilde; s&aacute;ng tạo n&ecirc;n những ng&ocirc;n ngữ lập tr&igrave;nh ph&ugrave; hợp với lứa tuổi c&aacute;c b&eacute; như: Scratch, Minecraft,....Qua đ&oacute;, gi&uacute;p c&aacute;c b&eacute; r&egrave;n luyện v&agrave; ph&aacute;t triển rất nhiều kỹ năng cần thiết cho cuộc sống như:</span></span></span></span></p>\n\n<ul>\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Khả năng tư duy, s&aacute;ng tạo kh&ocirc;ng ngừng</span></span></span></span></li>\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Trau dồi niềm say m&ecirc;, y&ecirc;u th&iacute;ch với khoa học v&agrave; sự k&iacute;ch th&iacute;ch tr&iacute; t&ograve; m&ograve; về kh&aacute;m ph&aacute; thế giới</span></span></span></span></li>\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">r&egrave;n luyện kỹ năng mềm cần thiết cho trẻ</span></span></span></span></li>\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Mở ra cơ hội học tập v&agrave; l&agrave;m việc trong lĩnh vực c&ocirc;ng nghệ th&ocirc;ng tin, c&ocirc;ng nghệ cao tại Việt Nam v&agrave; tr&ecirc;n thế giới.</span></span></span></span></li>\n</ul>\n\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Ch&iacute;nh v&igrave; vậy m&agrave; việc dạy lập tr&igrave;nh sớm cho trẻ l&agrave; nền tảng vững chắc cho b&eacute; trong tương lai m&agrave; c&aacute;c bậc phụ huynh kh&ocirc;ng n&ecirc;n bỏ qua.</span></span></span></span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Arial,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">N&ecirc;n hay kh&ocirc;ng việc dạy lập tr&igrave;nh sớm cho trẻ? Chắc chắn bạn đ&atilde; c&oacute; được c&acirc;u trả lời ch&iacute;nh x&aacute;c nhất phải kh&ocirc;ng n&agrave;o. Tuy nhi&ecirc;n, đối với lứa tuổi của c&aacute;c b&eacute; để việc học tập hiệu quả v&agrave; mang lại những lợi &iacute;ch tuyệt vời như mong muốn cần lựa chọn những địa chỉ dạy học uy t&iacute;n, c&oacute; chất lượng gi&aacute;o dục tốt như Viện tin học X&acirc;y dựng SPEC để trao gửi niềm tin.</span></span></span></span></p>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n', 0, 8, b'1', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n    <meta http-equiv=\"content-style-type\" content=\"text/css\">\n    <meta http-equiv=\"content-language\" content=\"en-vi\">\n    <meta name=\"copyright\" content=\"spec.edu.vn\">\n    <meta name=\"keywords\" content=\"lập trình cho bé, dạy lập trình sớm\">\n    <meta name=\"description\" content=\"gôn ngữ lập trình hứa hẹn là ngôn ngữ chung và phổ biến trên thế giới trong thời đại công nghệ 4.0. Tuy nhiên, nên học lập trình từ khi nào? có nên dạy lập trình sớm cho trẻ em hay không? là thắc mắc của rất nhiều người, đặc biệt là các bậc phụ huynh\">\n    <meta property=\"og:site_name\" content=\"spec.edu.vn\">\n    <meta property=\"og:type\" content=\"website\">\n    <meta property=\"og:title\" content=\"Nên hay không việc dạy lập trình sớm cho trẻ?\">\n    <meta property=\"og:description\" content=\"gôn ngữ lập trình hứa hẹn là ngôn ngữ chung và phổ biến trên thế giới trong thời đại công nghệ 4.0. Tuy nhiên, nên học lập trình từ khi nào? có nên dạy lập trình sớm cho trẻ em hay không? là thắc mắc của rất nhiều người, đặc biệt là các bậc phụ huynh\">\n    <meta property=\"og:url\" content=\"https://spec.edu.vn/admin-topic\">\n    <meta name=”robots” content=”index,follow” >\n    <meta name=\"author\" content=\"SpecEdu\">\n    <meta name=\"googlebot\" content=\"index,follow,archive\">\n    <meta property=\"og:type\" content=\"article\">', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/4477425008.jpg', 9, 'nen-hay-khong-viec-day-lap-trinh-som-cho-tre', 'Nên hay không việc dạy lập trình sớm cho trẻ?', 'gôn ngữ lập trình hứa hẹn là ngôn ngữ chung và phổ biến trên thế giới trong thời đại công nghệ 4.0. Tuy nhiên, nên học lập trình từ khi nào? có nên dạy lập trình sớm cho trẻ em hay không? là thắc mắc của rất nhiều người, đặc biệt là các bậc phụ huynh', 'lập trình cho bé, dạy lập trình sớm', 'index,follow'),
(50, 'GIỚI THIỆU PHẦN MỀM RSO (Restrict Software Openings)', '2021-05-12', '<p>&nbsp;Phần mềm&nbsp;RSO - Phần mềm quản l&yacute;&nbsp;học online hiệu quả</p>\n', '<p style=\"text-align:center\"><span style=\"font-size:22px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>PHẦN MỀM QUẢN L&Yacute; HỌC TRỰC TUYẾN RSO&nbsp;</strong><strong> </strong></span></span></p>\n\n<p style=\"text-align:center\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:16px\"><strong>Restrict software openings</strong></span></span></p>\n\n<p><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:20px\"><strong><span style=\"color:black\">I. Thực trạng việc học online của học sinh, sinh vi&ecirc;n.</span></strong></span></span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-size:13.0pt\"><span style=\"color:black\">Dịch bệnh COVID-19 khiến cho nhiều hoạt động bị ngừng trệ,</span></span>&nbsp;<span style=\"font-size:13.0pt\"><span style=\"color:black\">đặc biệt l&agrave; ng&agrave;nh gi&aacute;o dục v&igrave; phải thực hiện gi&atilde;n c&aacute;ch x&atilde; hội kh&aacute; l&acirc;u.</span></span>&nbsp;<span style=\"font-size:13.0pt\"><span style=\"color:black\">Để khắc phục kh&oacute; khăn giai đoạn đầu, ng&agrave;nh gi&aacute;o dục đ&atilde; đề xuất giải ph&aacute;p l&ugrave;i thời gian kết th&uacute;c năm học.</span></span>&nbsp;<span style=\"font-size:13.0pt\"><span style=\"color:black\">Nhưng t&igrave;nh h&igrave;nh dịch COVID-19 vẫn diễn biến phức tạp v&agrave; kh&oacute; lường n&ecirc;n nhiều trường đẩy mạnh triển khai &aacute;p dụng phương ph&aacute;p dạy v&agrave; học online để đảm bảo tiến độ học tập của học sinh, sinh vi&ecirc;n.</span></span></span></span></span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-size:13.0pt\"><span style=\"color:black\">&ldquo;Việc dạy v&agrave; học online trong t&igrave;nh h&igrave;nh dịch bệnh COVID-19 l&agrave; một giải ph&aacute;p tốt.</span></span>&nbsp;<span style=\"font-size:13.0pt\"><span style=\"color:black\">N&oacute; kh&ocirc;ng chỉ gi&uacute;p người học tiếp cận được kiến thức trong thời gian gi&atilde;n c&aacute;ch x&atilde; hội m&agrave; c&ograve;n tạo điều kiện cho giảng vi&ecirc;n tự trau dồi v&agrave; ph&aacute;t triển những kỹ năng dạy học mới trong giai đoạn &lsquo;đặc th&ugrave;&rsquo;&rdquo;</span></span>&nbsp;<span style=\"font-size:13.0pt\"><span style=\"color:black\">- ThS Huỳnh Minh Tuấn, giảng vi&ecirc;n Khoa BC&amp;TT</span></span>&nbsp;<span style=\"font-size:13.0pt\"><span style=\"color:black\">Trường ĐH KHXH&amp;NV</span></span>&nbsp;<span style=\"font-size:13.0pt\"><span style=\"color:black\">ĐHQG-HCM, cho biết.</span></span></span></span></span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-size:13.0pt\"><span style=\"color:black\">Theo ThS Huỳnh Minh Tuấn, để &aacute;p dụng hiệu quả việc dạy v&agrave; học online, cần c&oacute; thời gian chuẩn bị cơ sở vật chất, học liệu... v&agrave; phải tập huấn kh&ocirc;ng chỉ cho người dạy m&agrave; cả người học. Việc &aacute;p dụng phương ph&aacute;p n&agrave;y v&agrave;o giai đoạn đại dịch chỉ mang t&iacute;nh t&igrave;nh thế, thiếu c&aacute;c điều kiện tiền đề n&ecirc;n kh&oacute; thể đem lại chất lượng tối ưu.</span></span></span></span></span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-size:13.0pt\"><span style=\"color:black\">H&igrave;nh thức dạy v&agrave; học online đang được c&aacute;c trường đại học th&uacute;c đẩy ph&aacute;t triển nhằm đ&aacute;p ứng nhu cầu học tập ng&agrave;y c&agrave;ng đa dạng của mọi đối tượng người học.</span></span>&nbsp;<span style=\"font-size:13.0pt\"><span style=\"color:black\">Dạy v&agrave; học online</span></span>&nbsp;<span style=\"font-size:13.0pt\"><span style=\"color:black\">l&agrave; một xu thế tất yếu m&agrave; c&aacute;c nước tr&ecirc;n thế giới cũng như Việt Nam hướng tới.</span></span>&nbsp;<span style=\"font-size:13.0pt\"><span style=\"color:black\">Trong thời đại 4.0 hiện</span></span>&nbsp;<span style=\"font-size:13.0pt\"><span style=\"color:black\">nay, nhiều người c&oacute; xu hướng lựa chọn học online</span></span>&nbsp;<span style=\"font-size:13.0pt\"><span style=\"color:black\">bởi c&aacute;ch học thuận tiện, linh hoạt v&ecirc;̀ thời gian l&acirc;̃n địa đi&ecirc;̉m.</span></span></span></span></span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-size:13.0pt\"><span style=\"color:#333333\">Học trực tuyến đem lại cho ch&uacute;ng ta rất nhiều lợi &iacute;ch tuy nhi&ecirc;n n&oacute; cũng vẫn c&ograve;n rất nhiều vẫn đề bất cập, nổi cộm trong số đ&oacute; phải kể đến vấn đề thiếu tập trung v&agrave; dễ bị ph&acirc;n t&acirc;m của c&aacute;c bạn học sinh trong qu&aacute; tr&igrave;nh học online khiến cho việc học kh&ocirc;ng thực sự trở n&ecirc;n hi&ecirc;u quả. </span><span style=\"background-color:white\"><span style=\"color:#222222\">Nguy&ecirc;n nh&acirc;n kh&ocirc;ng phải v&igrave; bạn lười biếng hay ham vui, m&agrave; do n&atilde;o bộ của bạn đang bị chi phối, đ&atilde; điều khiển h&agrave;nh vi v&agrave; &yacute; thức của bạn.&nbsp;</span></span></span><span style=\"color:black\"><a href=\"http://dec.neu.edu.vn/\"><strong><span style=\"font-size:13.0pt\"><span style=\"background-color:white\"><span style=\"color:black\">Học trực tuyến</span></span></span></strong></a></span><span style=\"font-size:13.0pt\"><span style=\"background-color:white\"><span style=\"color:#222222\">&nbsp;l&agrave; bạn thường xuy&ecirc;n phải l&agrave;m việc với m&aacute;y t&iacute;nh hoặc smartphone, bạn rất dễ bị ph&acirc;n t&acirc;m khi c&oacute; một tin nhắn đến, một cuộc gọi điện hay bạn nh&igrave;n thấy một b&agrave;i b&aacute;o th&uacute; vị hiển thị tr&ecirc;n m&agrave;n h&igrave;nh. C&oacute; những thứ &ldquo;hấp dẫn&rdquo; bạn nhiều hơn l&agrave; việc học khi bạn đang ngồi trước m&agrave;n h&igrave;nh m&aacute;y t&iacute;nh. </span></span></span></span></span><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"background-color:white\"><span style=\"color:#222222\"> </span></span></span></span></span></p>\n\n<p class=\"image-align-center\"><img alt=\"1\" height=\"427\" src=\"https://spec.edu.vn/uploadfileimage/spec/baiviet/3279760001.jpg\" width=\"640\" /></p>\n\n<p style=\"text-align:center\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:18px\"><span style=\"background-color:white\"><i><span style=\"background-color:white\"><span style=\"color:#222222\">Học sinh chơi game trong l&uacute;c học online</span></span></i></span></span></span></p>\n\n<p style=\"text-align:center\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><i><span style=\"background-color:white\"><span style=\"color:#222222\"><img alt=\"2\" height=\"630\" src=\"https://spec.edu.vn/uploadfileimage/spec/baiviet/1883201002.jpg\" width=\"840\" /></span></span></i></span></span></span></p>\n\n<p style=\"text-align:center\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:18px\"><span style=\"background-color:white\"><i><span style=\"background-color:white\"><span style=\"color:#222222\">Học sinh chơi game trong giờ thực h&agrave;nh tin học</span></span></i></span></span></span></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:justify\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-size:13.0pt\"><span style=\"background-color:white\"><span style=\"color:#222222\">V&agrave; để giải quyết vấn đề nan giải n&agrave;y th&igrave; nh&agrave; ph&aacute;t h&agrave;nh mới đ&acirc;y đ&atilde; tạo ra một phần mềm c&oacute; t&ecirc;n l&agrave; <strong>RSO</strong> (</span></span></span><i><span style=\"font-size:13.0pt\"><span style=\"color:black\">Restrict Software Openings) </span></span></i><span style=\"font-size:13.0pt\"><span style=\"color:black\">với c&aacute;c t&iacute;nh năng v&ocirc; c&ugrave;ng hữu dụng, n&oacute; gi&uacute;p c&aacute;c bậc phụ huynh, gi&aacute;o vi&ecirc;n hay những người quản l&yacute; c&oacute; thể kiểm so&aacute;t được việc truy cập của con c&aacute;i, học sinh hay nh&acirc;n vi&ecirc;n của m&igrave;nh trong qu&aacute; tr&igrave;nh sử dụng m&aacute;y t&iacute;nh th&ocirc;ng qua việc giới hạn c&aacute;c phần mềm v&agrave; trang web được ph&eacute;p truy cập. Do đ&oacute;, cũng kh&ocirc;ng phải qu&aacute; tự tin khi cho rằng phần mềm n&agrave;y ch&iacute;nh l&agrave; liều thuốc để chữa trị chứng thiếu tập tung của c&aacute;c bạn nhỏ khi học tập trực tuyến.</span></span></span></span></span></p>\n\n<p class=\"image-align-center\"><img alt=\"3\" height=\"449\" src=\"https://spec.edu.vn/uploadfileimage/spec/baiviet/1277522003.jpg\" width=\"665\" /></p>\n\n<p style=\"text-align:center\"><br />\n&nbsp;</p>\n\n<p class=\"image-align-center\"><img alt=\"4\" height=\"576\" src=\"https://spec.edu.vn/uploadfileimage/spec/baiviet/6124702004.jpg\" width=\"768\" /></p>\n\n<p style=\"text-align:center\"><br />\n&nbsp;</p>\n\n<p><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:20px\"><strong><span style=\"color:black\">II. T&iacute;nh năng phần mềm.</span></strong></span></span></p>\n\n<p><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:11pt\"><span style=\"font-size:13.0pt\"><span style=\"color:black\">Phần mềm RSO hỗ trợ v&agrave; đem lại rất nhiều lời &iacute;ch cho thầy c&ocirc; v&agrave; c&aacute;c bậc phụ huynh trong việc kiểm so&aacute;t việc học của c&aacute;c bạn học sinh. N&oacute; cho ph&eacute;p người d&ugrave;ng giới hạn c&aacute;c t&aacute;c vụ m&agrave; người kh&aacute;c chỉ c&oacute; thể sử dụng tr&ecirc;n m&aacute;y t&iacute;nh của m&igrave;nh. Về cơ bản t&iacute;nh năng của phần mềm RSO c&oacute; thể được chia ra l&agrave;m 2 &yacute; ch&iacute;nh:</span></span></span></span></p>\n\n<ul>\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:11pt\"><strong><span style=\"font-size:13.0pt\"><span style=\"color:black\">Giới hạn c&aacute;c phần mềm được ph&eacute;p truy cập khi sử dụng m&aacute;y t&iacute;nh.</span></span></strong><br />\n	<span style=\"font-size:13.0pt\"><span style=\"color:black\">&nbsp;Phần mềm RSO sẽ ngăn chặn việc con c&aacute;i v&agrave; học sinh của bạn truy cập v&agrave;o c&aacute;c phần mềm, ứng dụng kh&aacute;c m&agrave; bạn kh&ocirc;ng mong muốn. V&iacute; dụ như h&igrave;nh b&ecirc;n dưới, d&aacute;nh s&aacute;ch c&aacute;c phần mềm được ph&eacute;p cho chạy bao gồm: Google Chrome, Win Word, Outlook, MicRSOoft Photos v&agrave; một số phần mềm để cho m&aacute;y t&iacute;nh hoạt động. Từ đ&oacute;, nếu bạn truy cập v&agrave;o c&aacute;c phần mềm nằm ngo&agrave;i danh s&aacute;ch n&agrave;y m&aacute;y t&iacute;nh sẽ kh&ocirc;ng cho ph&eacute;p.</span></span></span></span>\n\n	<p class=\"image-align-center\"><img alt=\"5\" height=\"591\" src=\"https://spec.edu.vn/uploadfileimage/spec/baiviet/8940425005.png\" width=\"851\" /></p>\n	<br />\n	&nbsp;</li>\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:11pt\"><strong><span style=\"font-size:13.0pt\"><span style=\"color:black\">Giới hạn c&aacute;c trang web được ph&eacute;p truy cập khi sử dụng m&aacute;y t&iacute;nh.</span></span></strong><br />\n	<span style=\"font-size:13.0pt\"><span style=\"color:black\">Như ch&uacute;ng ta đ&atilde; biết th&igrave; việc kiểm so&aacute;t được người kh&aacute;c c&oacute; thể truy cập v&agrave;o c&aacute;c trang web n&agrave;o đ&atilde; l&agrave; một việc v&ocirc; c&ugrave;ng kh&oacute; khăn với ch&uacute;ng ta. Tuy nhi&ecirc;n, phần mềm RSO đ&atilde; c&oacute; thể giải quyết được vấn đề đ&oacute;. V&iacute; dụ như h&igrave;nh b&ecirc;n dưới, giống như việc ngăn chặn truy cập c&aacute;c phần mềm th&igrave; c&aacute;ch thức hoạt động cũng việc ngăn chặn c&aacute;c trang web cũng tương tự như vậy. Ta c&oacute; thể thấy, danh s&aacute;ch c&aacute;c trang web được ph&eacute;p truy cập bao gồm: facebook. Từ đ&oacute; nếu bạn truy cập v&agrave;o một trang web kh&aacute;c nằm ngo&agrave;i danh s&aacute;ch, m&aacute;y t&iacute;nh sẽ thực hiện tao t&aacute;c ngăn chặn v&agrave; hiện thị một th&ocirc;ng b&aacute;o &ldquo;Trang web kh&ocirc;ng được ph&eacute;p truy cập&rdquo; đối với người d&ugrave;ng.</span></span></span></span>\n	<p class=\"image-align-center\"><img alt=\"6\" height=\"581\" src=\"https://spec.edu.vn/uploadfileimage/spec/baiviet/3318820006.png\" width=\"851\" /></p>\n\n	<p>&nbsp;</p>\n	</li>\n</ul>\n\n<p><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:11pt\"><span style=\"font-size:13.0pt\"><span style=\"color:black\">Từ 2 t&iacute;nh năng cơ bản tr&ecirc;n của phần mềm RSO, ta c&oacute; thể thấy rằng n&oacute; đ&atilde; giải quyết hầu hết mối lo lắng của c&aacute;c bậc phụ huynh mỗi khi con em ch&uacute;ng ta sử dụng m&aacute;y t&iacute;nh, gi&uacute;p c&aacute;c em c&oacute; thể tập trung hơn v&agrave; tiếp thu được kiến thức một c&aacute;ch trọn vẹn khi học trực tuyến. Kh&ocirc;ng chỉ vậy, phần mềm c&oacute; thể được &aacute;p dụng một c&aacute;ch ph&ugrave; hợp trong qu&aacute; tr&igrave;nh giảng dạy của c&aacute;c thầy c&ocirc; hay c&aacute;c trung t&acirc;m đ&agrave;o tạo, bằng việc giới hạn chỉ sử dụng c&aacute;c phần mềm, trang web phục vụ cho việc học. C&oacute; thể lấy một v&iacute; dụ đơn giản như trong m&ocirc;i trường học đường, để thầy c&ocirc; c&oacute; thể kiểm so&aacute;t được việc truy cập ở từng m&aacute;y của c&aacute;c em học sinh l&agrave; rất kh&oacute;, tuy nhi&ecirc;n giờ đ&acirc;y khi c&oacute; phần mềm n&agrave;y, c&aacute;c thầy c&ocirc; đ&atilde; c&oacute; thể y&ecirc;n t&acirc;m giảng dạy m&agrave; chắn chắn rằng học sinh của m&igrave;nh đang lắng nghe v&agrave; thực h&agrave;nh.</span></span></span></span></p>\n\n<p><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:11pt\"><span style=\"font-size:13.0pt\"><span style=\"color:black\">Tr&ecirc;n đ&acirc;y l&agrave; 2 t&iacute;nh năng ch&iacute;nh cơ bản của Phần mềm RSO. Trong tương lai, nh&agrave; ph&aacute;t h&agrave;nh chắc chắn sẽ tiếp tục c&oacute; th&ecirc;m những bản cập nhật v&agrave; bổ sung v&agrave;o đ&oacute; c&aacute;c t&iacute;nh năng hưu &iacute;ch kh&aacute;c phục vụ tối ưu cho qu&aacute; tr&igrave;nh kiểm so&aacute;t truy cập tr&ecirc;n m&aacute;y t&iacute;nh.</span></span></span></span></p>\n\n<p><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:20px\"><strong><span style=\"color:black\">III. Li&ecirc;n hệ mua.</span></strong></span></span></p>\n\n<p><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:11pt\"><span style=\"font-size:13.0pt\"><span style=\"color:black\">Nếu bạn cảm thấy hứng th&uacute; với phần mềm RSO hay n&oacute; thực sự hữu &iacute;ch với bạn th&igrave; c&oacute; thể li&ecirc;n hệ mua phần mềm với ch&uacute;ng t&ocirc;i qua &hellip;&hellip; </span></span></span></span></p>\n\n<p><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:20px\"><strong><span style=\"color:black\">IV. Dịch vụ cung cấp.</span></strong></span></span></p>\n\n<p><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:11pt\"><span style=\"font-size:13.0pt\"><span style=\"color:black\">Với ti&ecirc;u ch&iacute; đặt lợi &iacute;ch v&agrave; trải nghiệm của người d&ugrave;ng l&ecirc;n h&agrave;ng đầu khi mua v&agrave; sử dụng phần mềm. Ch&iacute;nh v&igrave; vậy, nh&agrave; ph&aacute;t h&agrave;nh đ&atilde; cũng cấp rất nhiều dịch vụ ưu đ&atilde;i v&agrave; c&oacute; lợi cho kh&aacute;ch h&agrave;ng đi k&egrave;m với phần mềm RSO. Dưới đ&acirc;y, ch&uacute;ng t&ocirc;i xin ph&eacute;p được liệt k&ecirc; ra c&aacute;c dịch vụ để kh&aacute;ch h&agrave;ng c&oacute; thể tham khảo lựa chọn c&oacute; n&ecirc;n mua hay kh&ocirc;ng: </span></span></span></span></p>\n\n<ul>\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:11pt\"><span style=\"font-size:13.0pt\"><span style=\"color:black\">Đầu ti&ecirc;n, khi tải về v&agrave; c&agrave;i đặt phần mềm RSO, kh&aacute;ch h&agrave;ng sẽ được cấp một m&atilde; code để c&oacute; thể được sử dụng thử trong v&ograve;ng một tuần. Điều n&agrave;y thực thực sự rất hữu &iacute;ch cho những kh&aacute;c h&agrave;ng n&agrave;o đang ph&acirc;n v&acirc;n về quyết định c&oacute; n&ecirc;n mua phần mềm hay kh&ocirc;ng. Tuy l&agrave; bản d&ugrave;ng thử, nhưng kh&aacute;ch h&agrave;ng vẫn sẽ được trải nghiệm đầy đủ c&aacute;c t&iacute;nh năng của phần mềm. Sau khi thời hạn sử dụng thử phần mềm đ&atilde; kết th&uacute;c, phần mềm sẽ tự động gửi một th&ocirc;ng b&aacute;o đến cho kh&aacute;c h&agrave;ng để họ biết v&agrave; nếu kh&aacute;c h&agrave;ng muốn mua c&oacute; thể li&ecirc;n hệ mua qua c&aacute;c k&ecirc;nh th&ocirc;ng tin m&agrave; ch&uacute;ng t&ocirc;i đ&atilde; cung cấp ở mục &ldquo;Li&ecirc;n hệ mua&rdquo; b&ecirc;n tr&ecirc;n. Dựa tr&ecirc;n một số khảo s&aacute;t của c&ocirc;ng ty, ch&uacute;ng t&ocirc;i thấy rằng tr&ecirc;n 90% kh&aacute;ch h&agrave;ng qua qu&aacute; tr&igrave;nh d&ugrave;ng thử đ&atilde; cảm thấy rất h&agrave;i l&ograve;ng v&agrave; tiếp tục mua phần mềm để sử dụng. Do đ&oacute; ch&uacute;ng t&ocirc;i rất tự tin rằng phần mềm sẽ l&agrave;m đ&aacute;p ứng được những nhu cầu m&agrave; bạn cần.</span></span></span></span><br />\n	&nbsp;</li>\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:11pt\"><span style=\"font-size:13.0pt\"><span style=\"color:black\">B&ecirc;n cạnh việc cho ph&eacute;p d&ugrave;ng thử sử dụng phần mềm trong thời hạn 1 tuần th&igrave; nh&agrave; ph&aacute;t h&agrave;nh cũng hỗ trợ ch&uacute;ng ta trong việc c&agrave;i đặt phần mềm. Nếu được y&ecirc;u cầu, kh&aacute;ch h&agrave;ng sẽ được nh&acirc;n vi&ecirc;n hỗ trợ đến c&agrave;i đặt v&agrave; hướng dẫn sử dụng tận nh&agrave;. Điều n&agrave;y c&oacute; lẽ kh&oacute; ở đ&acirc;u c&oacute; thể cung cấp được dịch vụ n&agrave;y như ở b&ecirc;n ch&uacute;ng t&ocirc;i. Kh&ocirc;ng chỉ vậy, c&aacute;c video v&agrave; b&agrave;i viết hướng dẫn sử dụng v&agrave; c&agrave;i đặt cũng được gửi đến cho kh&aacute;ch h&agrave;ng để loại trừ c&aacute;c khả năng v&ocirc; t&igrave;nh gỡ c&agrave;i đặt, hay l&acirc;u ng&agrave;y qu&ecirc;n c&aacute;ch sử dụng phần mềm m&agrave; kh&ocirc;ng tiện gọi c&aacute;c nh&acirc;n vi&ecirc;n hỗ trợ đến.</span></span></span></span></li>\n</ul>\n\n<p><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:20px\"><strong><span style=\"color:black\">V. Hướng dẫn sử dụng.</span></strong></span></span></p>\n\n<div data-oembed-url=\"https://www.youtube.com/embed/7zWNvkKbtOU\">\n<div style=\"max-width:320px;margin:auto;\"><!-- You\'re using demo endpoint of Iframely API commercially. Max-width is limited to 320px. Please get your own API key at https://iframely.com. -->\n<div style=\"left: 0; width: 100%; height: 0; position: relative; padding-bottom: 56.25%;\"><iframe allow=\"encrypted-media; accelerometer; clipboard-write; gyroscope; picture-in-picture\" allowfullscreen=\"\" scrolling=\"no\" src=\"https://www.youtube.com/embed/7zWNvkKbtOU?rel=0\" style=\"border: 0; top: 0; left: 0; width: 100%; height: 100%; position: absolute;\" tabindex=\"-1\"></iframe></div>\n</div>\n</div>\n\n<p><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:18px\"><span style=\"color:#000000\">Để quản l&yacute; c&aacute;c trang web bạn cho ch&eacute;p truy cập tr&ecirc;n google chrome, H&atilde;y mở chrome v&agrave; c&agrave;i th&ecirc;m c&ocirc;ng cụ cho ph&eacute;p chrome của bạn mở th&agrave;nh nhiều tab ri&ecirc;ng biệt th&ocirc;ng qua c&ocirc;ng cụ New tab, New window: Tải xuống&nbsp;<a href=\"https://chrome.google.com/webstore/detail/new-tab-new-window/dndlcbaomdoggooaficldplkcmkfpgff\">tại đ&acirc;y</a></span></span></span></p>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"398\" src=\"https://spec.edu.vn/uploadfileimage/spec/baiviet/227092500Screenshotxs2021-05-04xs135149.png\" width=\"600\" /></p>\n\n<p><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:11pt\"><span style=\"font-size:13.0pt\"><span style=\"color:black\">Khi tải về v&agrave; ho&agrave;n tất qu&aacute; tr&igrave;nh c&agrave;i đặt phần mềm, icon của phần mềm sẽ được hiện tr&ecirc;n m&agrave;n h&igrave;nh m&aacute;y t&iacute;nh.</span></span></span></span></p>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"401\" src=\"https://spec.edu.vn/uploadfileimage/spec/baiviet/311856300123.png\" width=\"546\" /></p>\n\n<p>&nbsp;</p>\n\n<p><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:11pt\"><span style=\"font-size:13.0pt\"><span style=\"color:black\">Để c&oacute; thể sử dụng phần mềm RSO, kh&aacute;ch h&agrave;ng c&oacute; thể l&agrave;m theo c&aacute;c bước hướng dẫn sau đ&acirc;y: </span></span></span></span></p>\n\n<ul>\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:11pt\"><strong><span style=\"font-size:13.0pt\"><span style=\"color:black\">Bước 1:</span></span></strong><span style=\"font-size:13.0pt\"><span style=\"color:black\"> Bật c&aacute;c phần mềm m&agrave; bạn muốn RSO cho ph&eacute;p chạy.<br />\n	V&iacute; dụ ở h&igrave;nh dưới ch&uacute;ng t&ocirc;i muốn RSO cho ph&eacute;p truy cập 3 phần mềm l&agrave; Google Chrome, Paint, Win Word v&agrave; ngăn chặn c&aacute;c phần mềm kh&aacute;c v&igrave; vậy ch&uacute;ng t&ocirc;i đ&atilde; bật sẵn 3 phần mềm đ&oacute; l&ecirc;n.</span></span></span><br />\n	&nbsp;</span>\n\n	<p class=\"image-align-center\"><img alt=\"7\" height=\"722\" src=\"https://spec.edu.vn/uploadfileimage/spec/baiviet/8637796008.png\" width=\"1284\" /></p>\n	<br />\n	&nbsp;</li>\n</ul>\n\n<ul>\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:11pt\"><strong><span style=\"font-size:13.0pt\"><span style=\"color:black\">Bước 2:</span></span></strong><span style=\"font-size:13.0pt\"><span style=\"color:black\"> Khởi động phần mềm bằng c&aacute;ch click đ&uacute;p v&agrave;o biểu tượng phần mềm RSO tr&ecirc;n m&agrave;n h&igrave;nh.<br />\n	Sau khi giao diện phần mềm hiện ra ta c&oacute; thể thấy n&oacute; giống như h&igrave;nh b&ecirc;n dưới.</span></span></span></span></li>\n</ul>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"587\" src=\"https://spec.edu.vn/uploadfileimage/spec/baiviet/2234846009.png\" width=\"851\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<ul>\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:11pt\"><strong><span style=\"font-size:13.0pt\"><span style=\"color:black\">Bước 3:</span></span></strong><span style=\"font-size:13.0pt\"><span style=\"color:black\"> Click v&agrave;o dấu cộng &ldquo;<strong>+</strong>&rdquo; ở phần &ldquo;<strong>Danh s&aacute;ch trang web cho ph&eacute;p truy cập</strong>&rdquo; rồi nhập c&aacute;c trang web m&agrave; bạn cho ph&eacute;p người d&ugrave;ng kh&aacute;c truy cập v&agrave;o &ocirc; ph&iacute;a dưới mục &ldquo;<strong>Nhập t&ecirc;n trang web cho ph&eacute;p</strong>&rdquo;. Sau đ&oacute; click v&agrave;o &ldquo;<strong>th&ecirc;m&rdquo;</strong>. Sau khi ho&agrave;n tất thao t&aacute;c th&ecirc;m bạn click v&agrave;o &ldquo;<strong>tho&aacute;t</strong>&rdquo;. Nếu lỡ nhập nhầm trang web bạn cũng c&oacute; thể chọn trang web đ&oacute; rồi click dấu &ldquo;<strong>-</strong>&ldquo; để x&oacute;a.</span></span></span></span>\n\n	<p class=\"image-align-center\"><img alt=\"\" height=\"587\" src=\"https://spec.edu.vn/uploadfileimage/spec/baiviet/55194290010.png\" width=\"851\" /></p>\n	<br />\n	<p class=\"image-align-center\"><img alt=\"\" height=\"588\" src=\"https://spec.edu.vn/uploadfileimage/spec/baiviet/95852700011.png\" width=\"851\" /></p>\n	<br />\n	&nbsp;</li>\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:11pt\"><strong><span style=\"font-size:13.0pt\"><span style=\"color:black\">Bước 4:</span></span></strong><span style=\"font-size:13.0pt\"><span style=\"color:black\"> Khi qu&aacute; tr&igrave;nh th&ecirc;m trang web cho ph&eacute;p đ&atilde; ho&agrave;n tất, bạn Click v&agrave;o mục &ldquo;<strong>Bắt đầu kiểm so&aacute;t</strong>&rdquo;, sau đ&oacute; một hộp thoại y&ecirc;u cầu bạn đăng nhập sẽ hiện ra. Bạn nhập đầy đủ th&ocirc;ng tin đăng nhập bao gồm t&agrave;i khoản v&agrave; mật khẩu rồi click v&agrave;o &ldquo;<strong>Đăng k&iacute;</strong>&rdquo; -&gt; click v&agrave;o &ldquo;<strong>Đăng nhập</strong>&rdquo; -&gt; click v&agrave;o &ldquo;<strong>Bắt đầu</strong>&rdquo; để tiến h&agrave;nh việc kiểm so&aacute;t truy cập.</span></span></span><br />\n	&nbsp;</span>\n	<p class=\"image-align-center\"><img alt=\"\" height=\"588\" src=\"https://spec.edu.vn/uploadfileimage/spec/baiviet/49022540012.png\" width=\"851\" /></p>\n	<br />\n	<p class=\"image-align-center\"><img alt=\"\" height=\"591\" src=\"https://spec.edu.vn/uploadfileimage/spec/baiviet/63116360013.png\" width=\"852\" /></p>\n	<br />\n	<p class=\"image-align-center\"><img alt=\"\" height=\"588\" src=\"https://spec.edu.vn/uploadfileimage/spec/baiviet/44403870014.png\" width=\"852\" /></p>\n	<br />\n	<br />\n	&nbsp;</li>\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:11pt\"><strong><span style=\"font-size:13.0pt\"><span style=\"color:black\">Bước 5:</span></span></strong><span style=\"font-size:13.0pt\"><span style=\"color:black\"> Sau khi phần mềm đ&atilde; bắt đầu hoạt động bạn c&oacute; thể click v&agrave;o &ldquo;<strong>X</strong>&rdquo; ở g&oacute;c phải ph&iacute;a tr&ecirc;n giao diện phần để để tắt hoặc ẩn n&oacute;. Tiếp đ&oacute;, một hộp thoại sẽ hiện ra hỏi bạn c&oacute; muốn phần mềm n&agrave;y chạy ngầm hay kh&ocirc;ng. Nếu muốn n&oacute; chạy ngầm th&igrave; chọn &ldquo;<strong>Yes</strong>&rdquo; v&agrave; ngược lại nếu muốn tắt n&oacute; th&igrave; chọn &ldquo;<strong>No</strong>&rdquo;.</span></span></span></span>\n	<p class=\"image-align-center\"><img alt=\"\" height=\"588\" src=\"https://spec.edu.vn/uploadfileimage/spec/baiviet/89750710015.png\" width=\"847\" /></p>\n	<br />\n	<p class=\"image-align-center\"><img alt=\"\" height=\"588\" src=\"https://spec.edu.vn/uploadfileimage/spec/baiviet/89750710015.png\" width=\"847\" /></p>\n	<br />\n	<span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:11pt\"><span style=\"font-size:13.0pt\"><span style=\"color:black\"><i>(đ&acirc;y l&agrave; th&ocirc;ng b&aacute;o sẽ hiện ra khi bạn click v&agrave;o phần mềm v&agrave; trang web kh&ocirc;ng được cho ph&eacute;p)</i></span></span></span></span><br />\n	&nbsp;</li>\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:11pt\"><strong><span style=\"font-size:13.0pt\"><span style=\"color:black\">Bước 6:</span></span></strong><span style=\"font-size:13.0pt\"><span style=\"color:black\"> Sau khi ho&agrave;n tất qu&aacute; tr&igrave;nh kiểm so&aacute;t việc truy cập v&agrave; bạn muốn dừng việc kiểm so&aacute;t n&agrave;y lại v&agrave; tắt ho&agrave;n to&agrave;n phần mềm RSO th&igrave; h&atilde;y v&agrave;o <strong>Task Manager</strong> -&gt; t&igrave;m đến mục <strong>Restrict Software Openings</strong> v&agrave; click chuột phải v&agrave;o n&oacute; -&gt; Chọn <strong>End Task.</strong></span></span></span></span>\n	<p class=\"image-align-center\"><img alt=\"\" height=\"1080\" src=\"https://spec.edu.vn/uploadfileimage/spec/baiviet/5445480017.png\" width=\"1920\" /></p>\n\n	<p class=\"image-align-center\"><img alt=\"\" height=\"1080\" src=\"https://spec.edu.vn/uploadfileimage/spec/baiviet/47677490018.png\" width=\"1920\" /></p>\n\n	<p>&nbsp;</p>\n	</li>\n</ul>\n\n<p style=\"text-align:center\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:11pt\"><strong><span style=\"font-size:15.0pt\"><span style=\"color:red\">Cảm ơn qu&yacute; kh&aacute;ch h&agrave;ng đ&atilde; tin tưởng v&agrave; sử dụng phần mềm của ch&uacute;ng t&ocirc;i!!!</span></span></strong></span></span></p>\n\n<p><br />\n&nbsp;</p>\n', 0, 8, b'0', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n    <meta http-equiv=\"content-style-type\" content=\"text/css\">\n    <meta http-equiv=\"content-language\" content=\"en-vi\">\n    <meta name=\"copyright\" content=\"spec.edu.vn\">\n    <meta name=\"keywords\" content=\"Phần mềm quản lý học online\">\n    <meta name=\"description\" content=\"Phần mềm quản lý học online\">\n    <meta property=\"og:site_name\" content=\"spec.edu.vn\">\n    <meta property=\"og:type\" content=\"website\">\n    <meta property=\"og:title\" content=\"Phần mềm quản lý học online\">\n    <meta property=\"og:description\" content=\"Phần mềm quản lý học online\">\n    <meta property=\"og:url\" content=\"http://spec.edu.vn/admin-topic\">\n    <meta name=”robots” content=”index,follow” >\n    <meta name=\"author\" content=\"SpecEdu\">\n    <meta name=\"googlebot\" content=\"index,follow,archive\">\n    <meta property=\"og:type\" content=\"article\">', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/2234846009.png', 21, 'phan-mem-quan-ly-hoc-online', 'Phần mềm quản lý học online', 'Phần mềm quản lý học online', 'Phần mềm quản lý học online', 'index,follow');
INSERT INTO `topic` (`id`, `title`, `create_date`, `introduct`, `content`, `view`, `id_user`, `deleted`, `meta_html`, `image_src`, `course_id`, `view_url`, `meta_title`, `meta_description`, `meta_keyword`, `meta_robot`) VALUES
(51, 'Phần mềm chặn game máy tính và game online trên window 7, 8, 10 & 11', '2022-01-21', '<p>Làm như thế nào để chặn game online trên máy tính Windows 7, 8. 10, 11? Dưới đây là câu trả lời. Phần mềm GoodChild là phần mềm chặn game online, game máy tính cực kỳ hiệu quả. Phần mềm sẽ chạy ngầm và khởi động cùng window, người dùng cần có password để mở hoặc gỡ phần mềm. Phần mềm GoodChild cho phép theo dõi lịch sử truy cập và có thể điểu khiển phần mềm từ xa trên điện thoại.</p>\n', '<p style=\"text-align:center\"><span style=\"font-size:22px\"><span style=\"color:#e67e22\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>PHẦN MỀM CHẶN GAME MÁY TÍNH VÀ GAME ONLINE TRÊN WINDOWS 7, 10 &amp; 11</strong></span></span></span></p>\n\n<p style=\"text-align:center\"><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">Sản phẩm phần mềm được xây dựng bởi Viện tin học Xây dựng - Trường Đại học Xây dựng</span></span></p>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"216\" src=\"https://spec.edu.vn/uploadfileimage/spec/giangvien/577000000KM.jpg\" width=\"400\" /></p>\n\n<p><span style=\"font-size:18px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"color:#e74c3c\"><strong>Mô tả:</strong></span></span></span></p>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"10\" src=\"https://spec.edu.vn/uploadfileimage/spec/giangvien/393000000Duongke.png\" width=\"547\" /></p>\n\n<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">Phần mềm tự động chạy khi khởi động windows. Bảo mật tuyệt đối. Theo dõi lịch sử kể cả web ẩn danh. Cần có password để có thể gỡ bỏ phần mềm cũng như thêm danh sách website được phép truy cập. Có thể điều khiển phần mềm từ điện thoại hoặc máy tính cá nhân.</span></span></p>\n\n<p><span style=\"font-size:18px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"color:#e74c3c\"><strong>Chức năng phần mềm:</strong></span></span></span></p>\n\n<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">- Chặn website độc hại (web người lớn, web đen, web có nội dung độc hại) và website game online. Chặn toàn bộ bất cứ website nào bố mẹ muốn, thậm chí cả youtube, facebook.</span></span></p>\n\n<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">- Chặn mở game đã cài trên máy tính.</span></span></p>\n\n<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">- Chặn không cho chạy các phần mềm game copy từ USB vào máy tính.</span></span></p>\n\n<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">- Kiểm soát trình duyệt web ẩn danh.</span></span></p>\n\n<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">- Điều khiển phần mềm(Bật - tắt, cho phép cho phép truy cập trang web) từ thiết bị di động của phụ huynh.</span></span></p>\n\n<p><span style=\"font-size:18px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"color:#e74c3c\"><strong>Liên hệ mua:</strong></span></span></span></p>\n\n<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"color:#e67e22\"><strong>Khuyến mại từ ngày 11/11/2021 đến 02/02/2022: Dùng thử miễn phí 7 ngày, không hài lòng không trả tiền.<br />\nGiảm từ <s>799.000 đ</s> còn 499.000 đ, bảo hành và nâng cấp 5 năm. </strong></span></span></span></p>\n\n<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"color:#000000\">Đường dẫn tải </span><span style=\"color:black\">phần mềm </span><span style=\"background-color:white\"><span style=\"color:#222222\">GoodChild:<ins><strong><a href=\"https://drive.google.com/drive/u/1/folders/19XLXMLYjq4sm7WebixAEsvmWngqdGvSD\">GoodChild v2.1.0</a> </strong></ins></span></span></span></span></p>\n\n<p><code><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"background-color:white\"><span style=\"color:#222222\">pass giải nén: spec</span></span></span></span></code></p>\n\n<p><code><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"background-color:white\"><span style=\"color:#222222\">Mọi thắc mắc xin liên hệ với chúng tôi theo số hotline:</span></span></span></span></code></p>\n\n<p><span style=\"font-size:20px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><a href=\"tel:0914388841\"><span style=\"color:#e74c3c\">0914388841</span></a></span></span><span style=\"font-size:18px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"color:#e67e22\"> </span></span></span><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">hoặc<span style=\"color:#e67e22\">&nbsp; </span></span></span><span style=\"font-size:20px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><a href=\"tel:0989427809\"><span style=\"color:#e74c3c\">0989427809</span></a></span></span></p>\n\n<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">Email:&nbsp;</span></span><span style=\"font-size:20px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><a href=\"mailto:RDSIC@nuce.edu.vn?subject=%E1%BB%A8ng%20d%E1%BB%A5ng%20goodChild&amp;body=Xin%20ch%C3%A0o%20b%E1%BA%A1n%2C%20t%C3%B4i%20mu%E1%BB%91n%20bi%E1%BA%BFt%20th%C3%AAm%20th%C3%B4ng%20tin%20v%E1%BB%81%20%E1%BB%A9ng%20d%E1%BB%A5ng%20n%C3%A0y.\"><span style=\"color:#e67e22\">RDSIC@nuce.edu.vn</span></a></span></span></p>\n\n<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">Thời gian làm việc:&nbsp;&nbsp;</span></span><strong><span style=\"color:#e67e22\"><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">8h-12h, 14h-17h, 20h-22h</span></span></span></strong></p>\n\n<p><span style=\"font-size:18px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"color:#e74c3c\"><strong>Ưu đãi khi mua:</strong></span></span></span></p>\n\n<table border=\"1\" cellpadding=\"1\" cellspacing=\"0\">\n	<tbody>\n		<tr>\n			<td style=\"width:113px\"><span style=\"font-size:18px\">Từ 2 key</span></td>\n			<td style=\"text-align:left; width:384px\"><span style=\"font-size:18px\">Giảm 5% giá sản phẩm</span></td>\n		</tr>\n		<tr>\n			<td style=\"width:113px\"><span style=\"font-size:18px\">Từ 5 key&nbsp;</span></td>\n			<td style=\"width:384px\"><span style=\"font-size:18px\">Giảm 10% giá sản phẩm</span></td>\n		</tr>\n	</tbody>\n</table>\n\n<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong><strong><strong><strong><img alt=\"\" height=\"10\" src=\"https://spec.edu.vn/uploadfileimage/spec/giangvien/393000000Duongke.png\" width=\"547\" /></strong></strong></strong></strong></span></span></p>\n\n<p><span style=\"font-size:18px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong><span style=\"color:black\">I. Thực trạng việc học online của học sinh, sinh viên.</span></strong></span></span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"background-color:white\"><span style=\"color:black\">- Dịch bệnh COVID-19 khiến cho nhiều hoạt động bị ngừng trệ,</span>&nbsp;<span style=\"color:black\">đặc biệt là ngành giáo dục vì phải thực hiện giãn cách xã hội khá lâu.</span>&nbsp;<span style=\"color:black\">Để khắc phục khó khăn giai đoạn đầu, ngành giáo dục đã đề xuất giải pháp lùi thời gian kết thúc năm học.</span>&nbsp;<span style=\"color:black\">Nhưng tình hình dịch COVID-19 vẫn diễn biến phức tạp và khó lường nên nhiều trường đẩy mạnh triển khai áp dụng phương pháp dạy và học online để đảm bảo tiến độ học tập của học sinh, sinh viên.</span></span></span></span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"background-color:white\"><span style=\"color:black\">- </span><span style=\"color:#333333\">Học trực tuyến đem lại cho chúng ta rất nhiều lợi ích tuy nhiên nó cũng vẫn còn rất nhiều vẫn đề bất cập, nổi cộm trong số đó phải kể đến vấn đề thiếu tập trung và dễ bị phân tâm của các bạn học sinh trong quá trình học online khiến cho việc học không thực sự trở nên hiêu quả. </span><span style=\"background-color:white\"><span style=\"color:#222222\">Nguyên nhân không phải vì bạn lười biếng hay ham vui, mà do não bộ của bạn đang bị chi phối, đã điều khiển hành vi và ý thức của bạn. <strong>Học trực tuyến</strong></span></span><span style=\"background-color:white\"><span style=\"color:#222222\">&nbsp;là bạn thường xuyên phải làm việc với máy tính hoặc smartphone, bạn rất dễ bị phân tâm khi có một tin nhắn đến, một cuộc gọi điện hay bạn nhìn thấy một bài báo thú vị hiển thị trên màn hình. Có những thứ “hấp dẫn” bạn nhiều hơn là việc học khi bạn đang ngồi trước màn hình máy tính. </span></span></span></span></span></p>\n\n<p style=\"text-align:center\"><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"background-color:white\"><span style=\"background-color:white\"><span style=\"color:#222222\"><img alt=\"\" height=\"267\" src=\"https://spec.edu.vn/uploadfileimage/spec/giangvien/3729800001.jpg\" width=\"400\" /> </span></span></span></span></span></p>\n\n<p style=\"text-align:center\"><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"background-color:white\"><i><span style=\"background-color:white\"><span style=\"color:#222222\">Hình 1. Học sinh chơi game trong lúc học online</span></span></i></span></span></span></p>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"300\" src=\"https://spec.edu.vn/uploadfileimage/spec/giangvien/7494067002.jpg\" width=\"400\" /></p>\n\n<p style=\"text-align:center\"><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"background-color:white\"><i><span style=\"background-color:white\"><span style=\"color:#222222\">Hình 2. Học sinh chơi game trong giờ thực hành tin học</span></span></i></span></span></span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"background-color:white\"><span style=\"color:black\">- </span><span style=\"background-color:white\"><span style=\"color:#222222\">Và để giải quyết vấn đề nan giải này thì nhà phát hành mới đây đã tạo ra một phần mềm có tên là <strong>GoodChild</strong></span></span><i><span style=\"color:black\">&nbsp;</span></i><span style=\"color:black\">với các tính năng vô cùng hữu dụng, nó giúp các bậc phụ huynh, giáo viên hay những người quản lý có thể kiểm soát được việc truy cập của con cái, học sinh hay nhân viên của mình trong quá trình sử dụng máy tính thông qua việc giới hạn các phần mềm và trang web được phép truy cập. Do đó, cũng không phải quá tự tin khi cho rằng phần mềm này chính là liều thuốc để chữa trị chứng thiếu tập tung của các bạn nhỏ khi học tập trực tuyến.</span></span></span></span></p>\n\n<p style=\"text-align:center\"><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"background-color:white\"><span style=\"color:#333333\"><img alt=\"\" height=\"270\" src=\"https://spec.edu.vn/uploadfileimage/spec/giangvien/7055872003.jpg\" width=\"400\" /></span></span></span></span></p>\n\n<p><span style=\"font-size:18px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong><span style=\"color:black\">II. Tính năng phần mềm.</span></strong></span></span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"background-color:white\"><span style=\"color:black\">- </span></span><span style=\"color:black\">Phần mềm </span><span style=\"background-color:white\"><span style=\"color:#222222\">GoodChild</span></span> <span style=\"color:black\">hỗ trợ và đem lại rất nhiều lời ích cho thầy cô và các bậc phụ huynh trong việc kiểm soát việc học của các bạn học sinh. Nó cho phép người dùng giới hạn các tác vụ mà người khác chỉ có thể sử dụng trên máy tính của mình. Về cơ bản tính năng của phần mềm </span><span style=\"background-color:white\"><span style=\"color:#222222\">GoodChild</span></span> <span style=\"color:black\">có thể được chia ra làm 2 ý chính:</span></span></span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong><span style=\"color:black\">&nbsp;1.Giới hạn các phần mềm được phép truy cập khi sử dụng máy tính.</span></strong><br />\n<span style=\"color:black\">- Phần mềm </span><span style=\"background-color:white\"><span style=\"color:#222222\">GoodChild</span></span> <span style=\"color:black\">sẽ ngăn chặn việc con cái và học sinh của bạn truy cập vào các phần mềm, ứng dụng khác mà bạn không mong muốn. Ví dụ như hình bên dưới, dánh sách các phần mềm được phép cho chạy bao gồm: Google Chrome, Win Word, Outlook, Microsoft Photos và một số phần mềm để cho máy tính hoạt động. Từ đó, nếu bạn truy cập vào các phần mềm nằm ngoài danh sách này máy tính sẽ không cho phép. Tức là phần mềm đã chặn toàn bộ game trên máy tính. Chặn con cài thêm game vào máy. Chặn chạy game từ USB hoặc copy game từ USB vào máy tính.</span></span></span></p>\n\n<div>\n<p class=\"image-align-center\"><img alt=\"\" height=\"256\" src=\"https://spec.edu.vn/uploadfileimage/spec/baiviet/5088110001.jpg\" width=\"400\" /></p>\n</div>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong><span style=\"color:black\">2.Giới hạn các trang web được phép truy cập khi sử dụng máy tính.</span></strong><br />\n<span style=\"color:black\">- Như chúng ta đã biết thì việc kiểm soát được người khác có thể truy cập vào các trang web nào đã là một việc vô cùng khó khăn với chúng ta. Tuy nhiên, phần mềm </span><span style=\"background-color:white\"><span style=\"color:#222222\">GoodChild</span></span> <span style=\"color:black\">đã có thể giải quyết được vấn đề đó. Ví dụ như hình bên dưới, giống như việc ngăn chặn truy cập các phần mềm thì cách thức hoạt động cũng việc ngăn chặn các trang web cũng tương tự như vậy. Ta có thể thấy, danh sách các trang web được phép truy cập bao gồm: facebook. Từ đó nếu bạn truy cập vào một trang web khác nằm ngoài danh sách, máy tính sẽ thực hiện thao tác ngăn chặn và hiện thị một thông báo “Trang web không được phép truy cập” đối với người dùng. Tức là phần mềm đã chặn toàn bộ website độc hại, web có nội dung người lớn, web có nội dung nhảm nhí. Một số bố mẹ đã chặn luôn Youtube và Facebook vì con chưa đủ 13 tuổi để sử dụng theo điều khoản của Youtube và Facebook.</span></span></span></p>\n\n<div>\n<p class=\"image-align-center\"><img alt=\"\" height=\"256\" src=\"https://spec.edu.vn/uploadfileimage/spec/baiviet/5859820002.jpg\" width=\"400\" /></p>\n</div>\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong><span style=\"color:black\">3.Chặn các trang web theo từ khóa.</span></strong></span></span></p>\n\n<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">- Để tránh tính tình trạng máy tính bị sử dụng truy cập vào những trang web đen, web độc hại, các trang game online cụ thể, GoodChild đã cung cấp cho người dùng một số tiện ích mở rộng có thể chặn truy cập vào website. Phụ huynh có thể nhập các từ khóa mà phụ huynh không muốn con truy cập vào GoodChild, và GoodChild sẽ chặn toàn bộ các trang web liên quan đến các từ khóa đó. Tính năng này giúp phụ huynh không cần phải biết hết các trang cháu được dùng mà vẫn sẽ chặn được các trang web không mong muốn.</span></span></p>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"267\" src=\"https://spec.edu.vn/uploadfileimage/spec/baiviet/912000000Chặnxsweb.jpg\" width=\"400\" /></p>\n\n<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong><span style=\"color:black\">4.Theo dõi lịch sử truy cập web&nbsp;ẩn danh.</span></strong></span></span></p>\n\n<p><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:16px\">- Phần mềm có thể theo dõi lịch sử truy cập hàng ngày của con mình trên máy tính hoặc trên điện thoại của phụ huynh. Kể cả khi con sử dụng các tài khoản gmail khác hoặc sử dụng các tab ẩn danh trong google chrome phần mềm goodchild cũng sẽ phát hiện ra và gửi thông báo đến thiết bị của phụ huynh xem hôm nay con đang vào các trang web độc hai nào giúp phụ huynh kịp thời phát hiện và khuyên bảo lại con mình.</span></span></p>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"256\" src=\"https://spec.edu.vn/uploadfileimage/spec/giangvien/543398200Screenshotxs2021-10-05xs141052.png\" width=\"400\" /></p>\n\n<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong><span style=\"color:black\">5.Điều khiển phần mềm, kiểm soát máy tính từ xa.</span></strong></span></span></p>\n\n<p><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:16px\">- Phần mềm goodchild sẽ kiểm soát rất chặt chẽ các phần mềm và trang web mà con có thể truy cập nên sẽ có nhiều trường hợp con cần vào các trang mới cô giáo gửi cho mà phụ huynh không thể kịp thời ở bên cạnh để điều khiển phần mềm cho con tiếp tục học. Nắm được khó khăn đó, đội ngũ phần mềm Goodchild đã cho ra mắt chức năng mới cho phép phụ huynh điều khiển máy tính của con ngay trên các thiết bị của phụ huynh từ xa. Chỉ cần đăng nhập tài khoản mà trung tâm đã cung cấp miễn phí, phụ huynh có thể cho phép phần mềm, trang web mà con đang cần. Ngoài ra phụ huynh có thể kiểm soát lịch sử truy cập web để kịp thời khuyên bảo con mình hoặc tùy chỉnh lại phần mềm để chặn các trang web đó.</span></span></p>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"244\" src=\"https://spec.edu.vn/uploadfileimage/spec/baiviet/146000000Theoxsdõi.png\" width=\"400\" /></p>\n\n<p><span style=\"font-size:18px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong><span style=\"color:black\">IV. Tổng kết.</span></strong></span></span></p>\n\n<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"color:black\">- Từ 5 tính năng cơ bản trên của phần mềm </span><span style=\"background-color:white\"><span style=\"color:#222222\">GoodChild</span></span><span style=\"color:black\">, ta có thể thấy rằng nó đã giải quyết hầu hết mối lo lắng của các bậc phụ huynh mỗi khi con em chúng ta sử dụng máy tính, giúp các em có thể tập trung hơn và tiếp thu được kiến thức một cách trọn vẹn khi học trực tuyến. Không chỉ vậy, phần mềm có thể được áp dụng một cách phù hợp trong quá trình giảng dạy của các thầy cô hay các trung tâm đào tạo, bằng việc giới hạn chỉ sử dụng các phần mềm, trang web phục vụ cho việc học. Có thể lấy một ví dụ đơn giản như trong môi trường học đường, để thầy cô có thể kiểm soát được việc truy cập ở từng máy của các em học sinh là rất khó, tuy nhiên giờ đây khi có phần mềm này, các thầy cô đã có thể yên tâm giảng dạy mà chắn chắn rằng học sinh của mình đang lắng nghe và thực hành.</span>Chặn hoặc cho phép các phần mềm chạy trên máy tính. Phần mềm chỉ cho phép các phầm mềm hoạt động khi người sử dụng cho phép chạy trong goodchild. Những ứng dụng không được cho phép sẽ bị goodchild chặn và liệt kê ở trong danh sách chặn của goodchild.</span></span></p>\n\n<p><span style=\"font-size:18px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong><span style=\"color:black\">V. Dịch vụ cung cấp.</span></strong></span></span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"color:black\">Với tiêu chí đặt lợi ích và trải nghiệm của người dùng lên hàng đầu khi mua và sử dụng phần mềm. Chính vì vậy, nhà phát hành đã cũng cấp rất nhiều dịch vụ ưu đãi và có lợi cho khách hàng đi kèm với phần mềm </span><span style=\"background-color:white\"><span style=\"color:#222222\">GoodChild</span></span><span style=\"color:black\">. Dưới đây, chúng tôi xin phép được liệt kê ra các dịch vụ để khách hàng có thể tham khảo lựa chọn có nên mua hay không: </span></span></span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"color:black\">- Đầu tiên, khi tải về và cài đặt phần mềm </span><span style=\"background-color:white\"><span style=\"color:#222222\">GoodChild</span></span><span style=\"color:black\">, khách hàng sẽ được cấp một mã code để có thể được sử dụng thử trong vòng một tuần. Điều này thực thực sự rất hữu ích cho những khác hàng nào đang phân vân về quyết định có nên mua phần mềm hay không. Tuy là bản dùng thử, nhưng khách hàng vẫn sẽ được trải nghiệm đầy đủ các tính năng của phần mềm. Sau khi thời hạn sử dụng thử phần mềm đã kết thúc, phần mềm sẽ tự động gửi một thông báo đến cho khác hàng để họ biết và nếu khác hàng muốn mua có thể liên hệ mua qua các kênh thông tin mà chúng tôi đã cung cấp ở mục “Liên hệ mua” bên trên. Dựa trên một số khảo sát của công ty, chúng tôi thấy rằng trên 90% khách hàng qua quá trình dùng thử đã cảm thấy rất hài lòng và tiếp tục mua phần mềm để sử dụng. Do đó chúng tôi rất tự tin rằng phần mềm sẽ làm đáp ứng được những nhu cầu mà bạn cần.</span></span></span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"color:black\">- Bên cạnh việc cho phép dùng thử sử dụng phần mềm trong thời hạn 1 tuần thì nhà phát hành cũng hỗ trợ chúng ta trong việc cài đặt phần mềm. Nếu được yêu cầu, khách hàng sẽ được nhân viên hỗ trợ đến cài đặt và hướng dẫn sử dụng tận nhà. Điều này có lẽ khó ở đâu có thể cung cấp được dịch vụ này như ở bên chúng tôi. Không chỉ vậy, các video và bài viết hướng dẫn sử dụng và cài đặt cũng được gửi đến cho khách hàng để loại trừ ác khả năng vô tình gỡ cài đặt, hay lâu ngày quên cách sử dụng phần mềm mà không tiện gọi các nhân viên hỗ trợ đến.</span></span></span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:18px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong><span style=\"color:black\">V. Hướng dẫn cài đặt và sử dụng.</span></strong></span></span></p>\n\n<p style=\"text-align:justify\"><ins><span style=\"font-size:16px\"><a href=\"https://spec.edu.vn/detail-topic/53/huong-dan-cai-dat-va-su-dung-phan-mem-goodchild\"><span style=\"color:#e67e22\"><span style=\"font-family:Arial,Helvetica,sans-serif\">&gt;&gt;<strong>Hướng dẫn cài đặt và sử dụng phần mềm GoodChild</strong></span></span></a></span></ins></p>\n\n<p style=\"text-align:justify\"><ins><span style=\"font-size:16px\"><a href=\"https://spec.edu.vn/detail-topic/52/cac-tinh-nang-noi-bat-cua-phan-mem-good-child\"><span style=\"color:#e67e22\"><span style=\"font-family:Arial,Helvetica,sans-serif\">&gt;&gt;<strong>Các tính năng nổi bật của phần mềm Goodchild</strong></span></span></a></span></ins></p>\n\n<p><strong><span style=\"color:red\">Cảm ơn quý khách hàng đã tin tưởng và sử dụng phần mềm của chúng tôi!!!</span></strong></p>\n', 0, 4, b'1', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n    <meta http-equiv=\"content-style-type\" content=\"text/css\">\n    <meta http-equiv=\"content-language\" content=\"en-vi\">\n    <meta name=\"copyright\" content=\"spec.edu.vn\">\n    <meta name=\"keywords\" content=\"Phần mềm chặn game máy tính, chặn game online, chặn youtube, chặn game online\">\n    <meta name=\"description\" content=\"Làm như thế nào để chặn game online trên máy tính Windows 7, 8. 10, 11? Phần mềm GoodChild là phần mềm chặn game online, game máy tính cực kỳ hiệu quả trên máy tính window. Phần mềm sẽ chạy ngầm và khởi động cùng window, người dùng cần có password để mở hoặc gỡ phần mềm. Phần mềm GoodChild cho phép theo dõi lịch sử truy cập và có thể điểu khiển phần mềm từ xa trên điện thoại.\">\n    <meta property=\"og:site_name\" content=\"spec.edu.vn\">\n    <meta property=\"og:type\" content=\"website\">\n    <meta property=\"og:title\" content=\"Phần mềm chặn game máy tính, game onlie tốt nhất 2022\">\n    <meta property=\"og:description\" content=\"Làm như thế nào để chặn game online trên máy tính Windows 7, 8. 10, 11? Phần mềm GoodChild là phần mềm chặn game online, game máy tính cực kỳ hiệu quả trên máy tính window. Phần mềm sẽ chạy ngầm và khởi động cùng window, người dùng cần có password để mở hoặc gỡ phần mềm. Phần mềm GoodChild cho phép theo dõi lịch sử truy cập và có thể điểu khiển phần mềm từ xa trên điện thoại.\">\n    <meta property=\"og:url\" content=\"https://spec.edu.vn/admin-topic\">\n    <meta name=”robots” content=”index,follow” >\n    <meta name=\"author\" content=\"SpecEdu\">\n    <meta name=\"googlebot\" content=\"index,follow,archive\">\n    <meta property=\"og:type\" content=\"article\">', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/281000000KM.jpg', 24, 'phan-mem-chan-game-may-tinh-va-game-online', 'Phần mềm chặn game máy tính, game onlie tốt nhất 2022', 'Làm như thế nào để chặn game online trên máy tính Windows 7, 8. 10, 11? Phần mềm GoodChild là phần mềm chặn game online, game máy tính cực kỳ hiệu quả trên máy tính window. Phần mềm sẽ chạy ngầm và khởi động cùng window, người dùng cần có password để mở hoặc gỡ phần mềm. Phần mềm GoodChild cho phép theo dõi lịch sử truy cập và có thể điểu khiển phần mềm từ xa trên điện thoại.', 'Phần mềm chặn game máy tính, chặn game online, chặn youtube, chặn game online', 'index,follow'),
(52, 'Các tính năng nổi bật của GoodChild với các phần mềm khác', '2021-12-24', '<p><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Đi c&ugrave;ng với việc học online đ&oacute; l&agrave; hiện tượng trẻ em lạm dụng Internet, sử dụng Internet kh&ocirc;ng đ&uacute;ng mục đ&iacute;ch (chơi game, lang thang tr&ecirc;n diễn đ&agrave;n, web đen, &hellip;). Hiểu được vấn đề n&agrave;y nhiều nh&agrave; ph&aacute;t triển đ&atilde; ph&aacute;t triển c&aacute;c phần mềm hỗ trợ phụ huynh kiểm so&aacute;t thời gian v&agrave; kh&ocirc;ng gian Internet của con em m&igrave;nh. </span></span></p>\n', '<p style=\"text-align:center\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:22px\"><strong>C&Aacute;C T&Iacute;NH NĂNG NỔI BẬT GOODCHILD VỚI C&Aacute;C PHẦN MỀM KH&Aacute;C</strong></span></span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><ins><span style=\"font-size:11pt\"><strong><span style=\"font-size:14.0pt\">Tầm quan trọng của GoodChild</span></strong></span></ins></span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:11pt\"><span style=\"font-size:14.0pt\">&nbsp; &nbsp;Trước diễn biến căng thẳng của dịch bệnh th&igrave; hầu hết c&aacute;c đơn vị gi&aacute;o dục đ&atilde; chuyển hướng sang học online. Đi c&ugrave;ng với việc học online đ&oacute; l&agrave; hiện tượng trẻ em lạm dụng Internet, sử dụng Internet kh&ocirc;ng đ&uacute;ng mục đ&iacute;ch (chơi game, lang thang tr&ecirc;n diễn đ&agrave;n, web đen, &hellip;). Hiểu được vấn đề n&agrave;y nhiều nh&agrave; ph&aacute;t triển đ&atilde; ph&aacute;t triển c&aacute;c phần mềm hỗ trợ phụ huynh kiểm so&aacute;t thời gian v&agrave; kh&ocirc;ng gian Internet của con em m&igrave;nh. Vậy trước nhiều phần mềm th&igrave; phụ huynh n&ecirc;n chọn phần mền n&agrave;o cho ph&ugrave; hợp với con em m&igrave;nh. Sau đ&acirc;y l&agrave; so s&aacute;nh giữa GoodChild v&agrave; một số phần mềm quản l&yacute; trẻ em kh&aacute;c.</span></span></span></p>\n\n<p class=\"image-align-center\"><img alt=\"Phần mềm hỗ trợ học zoom\" height=\"351\" src=\"https://spec.edu.vn/uploadfileimage/spec/baiviet/922985200dffdficture1.png\" width=\"554\" /></p>\n\n<p style=\"text-align:justify\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><ins><span style=\"font-size:11pt\"><strong><span style=\"font-size:14.0pt\">Ưu điểm khi d&ugrave;ng phần mềm GoodChild</span></strong></span></ins></span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:11pt\"><span style=\"font-size:14.0pt\">&nbsp; &nbsp;C&aacute;c phần mềm quản l&yacute; tr&ecirc;n thị trường hiện tại c&oacute; c&aacute;c chức năng chặn truy cập c&aacute;c trang web, chặn theo nh&oacute;m. Tuy c&ugrave;ng c&oacute; t&iacute;nh năng giống nhau l&agrave; quản l&yacute; trẻ em sử dụng Internet nhưng c&aacute;ch thức hoạt động của GoodChild ho&agrave;n to&agrave;n cải tiến so với c&aacute;c phần mềm kh&aacute;c. Hầu hết c&aacute;c phần mềm sẽ tự chặn c&aacute;c web đen m&agrave; trước đ&oacute; người d&ugrave;ng đ&atilde; truy cập, c&ograve;n những web kh&aacute;c th&igrave; người d&ugrave;ng phải th&ecirc;m nếu như bỏ s&oacute;t bất cứ trang web n&agrave;o th&igrave; con em m&igrave;nh c&oacute; thể truy cập v&agrave;o trang web đ&oacute; từ đ&oacute; dẫn đến những trang web kh&ocirc;ng mong muốn tiếp theo c&oacute; thể được truy cập. </span></span></span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:11pt\"><span style=\"font-size:14.0pt\">&nbsp; &nbsp;Một số phần mềm mang t&iacute;nh chất theo d&otilde;i, chụp m&agrave;n h&igrave;nh m&aacute;y t&iacute;nh, kh&oacute;a m&aacute;y t&iacute;nh theo giờ, kh&oacute;a internet theo giờ, cũng ph&aacute;t huy được hiệu quả, dần đưa trẻ v&agrave;o nề nếp học tập, l&agrave;m việc. D&ugrave; vậy, cũng kh&ocirc;ng tr&aacute;nh khỏi khiến trẻ c&oacute; cảm gi&aacute;c bị theo d&otilde;i v&agrave; thấp thỏm kh&ocirc;ng biết c&aacute;c h&agrave;nh vi của m&igrave;nh c&oacute; bị bố mẹ ph&aacute;t hiện hay kh&ocirc;ng.</span></span></span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:11pt\"><span style=\"font-size:14.0pt\">&nbsp; &nbsp;Hiểu được vấn đề tr&ecirc;n GoodChild c&oacute; 1 thay đổi lớn. Phụ huynh sẽ <strong>liệt k&ecirc; c&aacute;c trang web cho ph&eacute;p th&igrave; con m&igrave;nh mới c&oacute; thể truy cập v&agrave; sử dụng được, c&ograve;n lại to&agrave;n bộ c&aacute;c trang web kh&aacute;c sẽ bị chặn ho&agrave;n to&agrave;n</strong>. Điều n&agrave;y đ&atilde; khắc phục được vấn để nan giải m&agrave; c&aacute;c phần mềm kh&aacute;c kh&ocirc;ng l&agrave;m được. </span></span></span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:11pt\"><span style=\"font-size:14.0pt\">&nbsp; &nbsp;Ngo&agrave;i ra, một điều nổi bật so với c&aacute;c phần mềm kh&aacute;c. L&agrave; GoodChild c&ograve;n đảm bảo được vấn đề bảo mật khi <strong>chỉ nhập mật khẩu m&agrave; phụ huynh đ&atilde; đặt từ trước th&igrave; GoodChild mới cho ph&eacute;p tắt hoặc th&ecirc;m một phần mềm, trang web</strong> v&agrave;o danh s&aacute;ch cho ph&eacute;p. Điều n&agrave;y gi&uacute;p phụ huynh ho&agrave;n to&agrave;n c&oacute; thể y&ecirc;n t&acirc;m khi giao thiết bị cho con m&igrave;nh sử dụng m&agrave; kh&ocirc;ng cần lo lắng con m&igrave;nh sẽ tắt hoặc c&agrave;i đặt lại GoodChild.</span></span></span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:11pt\"><span style=\"font-size:14.0pt\">&nbsp; &nbsp; Điểm kh&aacute;c biệt tiếp theo m&agrave; c&aacute;c phần mềm kh&aacute;c kh&ocirc;ng c&oacute;, đ&oacute; l&agrave; <strong>GoodChild c&oacute; thể chặn được phần mềm tải về m&aacute;y</strong> (Li&ecirc;n Qu&acirc;n, FreeFire, Li&ecirc;n Minh Huyền Thoại, FiFa, &hellip;) những tựa game đồ họa hấp dẫn m&agrave; rất nhiều trẻ em hứng th&uacute;. C&oacute; nhiều người đ&atilde; nghiện những tựa game n&agrave;y, c&oacute; thể chơi nhiều giờ đồng hồ li&ecirc;n tục. Nếu việc n&agrave;y xảy ra với con em bạn th&igrave; n&oacute; sẽ ảnh hưởng đến kết quả học tập. Nhưng bạn c&oacute; thể y&ecirc;n t&acirc;m để GoodChild gi&uacute;p bạn, chỉ GoodChild c&oacute; t&iacute;nh năng n&agrave;y, GoodChild sẽ gi&uacute;p bạn ngăn chặn kh&ocirc;ng cho con em m&igrave;nh tiếp x&uacute;c với những thứ đ&oacute;.</span></span></span></p>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"477\" src=\"https://spec.edu.vn/uploadfileimage/spec/baiviet/777113800sdfsdfsdfe.png\" width=\"600\" /></p>\n\n<p style=\"text-align:justify\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:11pt\"><span style=\"font-size:14.0pt\">&nbsp; &nbsp; Với việc <strong>lưu lại lịch sử những phần mềm, web đ&atilde; chặn</strong> phụ huynh c&oacute; thể dễ d&agrave;ng nắm được con em m&igrave;nh đ&atilde; l&agrave;m những g&igrave; tr&ecirc;n chiếc m&aacute;y t&iacute;nh. Tuy nhi&ecirc;n với th&ocirc;ng b&aacute;o đ&atilde; chăn phần mềm th&igrave; con em của bạn sẽ kh&ocirc;ng c&ograve;n cảm gi&aacute;c bị theo d&otilde;i, mặc d&ugrave; trẻ em l&agrave;m g&igrave; đều c&oacute; lịch sử v&agrave; bạn c&oacute; thể xem lại. Khi nh&igrave;n thấy th&ocirc;ng b&aacute;o trẻ em sẽ hiểu rằng phần mềm n&agrave;y kh&ocirc;ng được truy cập, v&agrave; t&acirc;m l&yacute; của trẻ em sẽ rất thoải m&aacute;i chứ kh&ocirc;ng phải lo sợ c&oacute; ai đang theo d&otilde;i m&igrave;nh.</span></span></span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><ins><span style=\"font-size:11pt\"><span style=\"font-size:14.0pt\"><strong>Tiết kiệm hơn khi sử dụng GoodChild</strong></span></span></ins></span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:11pt\"><span style=\"font-size:14.0pt\">&nbsp;&nbsp;&nbsp;&nbsp;Với gi&aacute; th&agrave;nh hợp l&yacute; (chỉ 400.000 đồng) bạn đ&atilde; được sử dụng v&agrave; <strong>bảo h&agrave;nh trọn đời</strong> phần mềm hữu &iacute;ch như GoodChild. Hơn nữa việc sử dụng phần mềm cũng rất dễ d&agrave;ng, ph&ugrave; hợp với tất cả c&aacute;c gia đ&igrave;nh. Th&ecirc;m v&agrave;o đ&oacute; đằng sau phần mềm GoodChild l&agrave; một đội ngũ nh&acirc;n vi&ecirc;n kĩ thuật nhiệt t&igrave;nh, lu&ocirc;n lu&ocirc;n sẵn s&agrave;ng gi&uacute;p đỡ khi phụ huynh gặp kh&oacute; khăn trong việc sử dụng.</span></span></span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:11pt\"><span style=\"font-size:14.0pt\">&nbsp;&nbsp;&nbsp;&nbsp;Với những điều kể tr&ecirc;n dường như GoodChild đ&atilde; chiếm được l&ograve;ng tin của c&aacute;c bậc phụ huynh. Họ tin rằng GoodChild sẽ gi&uacute;p họ quản l&yacute; được thời gian v&agrave; kh&ocirc;ng gian mạng của con em họ một c&aacute;ch tốt nhất, để từ đ&oacute; l&agrave; tiền đề cho con em họ c&oacute; một m&ocirc;i trường l&agrave;nh mạnh, ph&aacute;t triển tốt. Vậy th&igrave; c&ograve;n trần trừ g&igrave; m&agrave; kh&ocirc;ng để GoodChild phục vụ bạn.</span></span></span></p>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n<p><ins><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><strong><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"color:black\">Li&ecirc;n hệ mua</span></span></span></strong></span></span></ins></p>\n\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"color:black\">&nbsp; &nbsp;Sau 7 ng&agrave;y d&ugrave;ng miễn ph&iacute;, nếu bạn cảm thấy hứng th&uacute; với phần mềm </span></span></span><span style=\"font-size:13.0pt\"><span style=\"background-color:white\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"color:#222222\">GoodChild</span></span></span></span> <span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"color:black\">hay n&oacute; thực sự hữu &iacute;ch với bạn th&igrave; c&oacute; thể li&ecirc;n hệ mua phần mềm với ch&uacute;ng t&ocirc;i. Gi&aacute; k&iacute;ch hoạt v&agrave; bảo h&agrave;nh&nbsp;trọn đời&nbsp;phần mềm</span></span></span></span></span></p>\n\n<p><span style=\"font-size:18px\"><span style=\"color:#e67e22\"><strong>Khuyến mại&nbsp;từ ng&agrave;y 9/9/2021 đến 10/10/2021:<br />\nGiảm từ <s>799.000 đ</s> c&ograve;n 499.000 đ, bảo h&agrave;nh v&agrave; n&acirc;ng cấp&nbsp;5 năm.</strong></span></span><span style=\"font-size:18px\"><span style=\"color:#e67e22\"><strong> D&ugrave;ng thử miễn ph&iacute; 7 ng&agrave;y, kh&ocirc;ng h&agrave;i l&ograve;ng kh&ocirc;ng trả tiền.</strong></span></span></p>\n\n<p><span style=\"color:#000000; font-family:Arial,sans-serif\"><span style=\"font-size:17.3333px\">Đường dẫn tải&nbsp;</span></span><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"color:black\">phần mềm </span></span></span><span style=\"font-size:13.0pt\"><span style=\"background-color:white\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"color:#222222\">GoodChild:<ins><strong><a href=\"https://drive.google.com/drive/u/1/folders/1Sog2CiSnIT13eeDrSv1yFz8Tctsp1Om2\">GoodChild v2.0.5</a></strong></ins></span></span></span></span></span></span></p>\n\n<p>&nbsp;</p>\n\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:13.0pt\"><span style=\"background-color:white\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"color:#222222\"><ins><strong>Li&ecirc;n hệ để nhận tư vấn:&nbsp;</strong></ins></span></span></span></span></span></span><span style=\"font-size:16px\"><ins><a href=\"tel:0914388841\">0914388841</a>&nbsp;hoặc&nbsp;&nbsp;<a href=\"tel:0989427809\">0989427809</a>&nbsp;</ins></span></p>\n', 0, 8, b'1', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n    <meta http-equiv=\"content-style-type\" content=\"text/css\">\n    <meta http-equiv=\"content-language\" content=\"en-vi\">\n    <meta name=\"copyright\" content=\"spec.edu.vn\">\n    <meta name=\"keywords\" content=\"GoodChild, phần mềm chặn ứng dụng, phần mềm hỗ trợ học zoom, học zoom, spec learning, spec, chặn phần mềm nguy hại\">\n    <meta name=\"description\" content=\"GoodChild có thể chặn được phần mềm tải về máy (Liên Quân, FreeFire, Liên Minh Huyền Thoại, FiFa, …) những tựa game đồ họa hấp dẫn mà rất nhiều trẻ em hứng thú. \">\n    <meta property=\"og:site_name\" content=\"spec.edu.vn\">\n    <meta property=\"og:type\" content=\"website\">\n    <meta property=\"og:title\" content=\"Tính năng nổi bật phầm mềm GoodChild\">\n    <meta property=\"og:description\" content=\"GoodChild có thể chặn được phần mềm tải về máy (Liên Quân, FreeFire, Liên Minh Huyền Thoại, FiFa, …) những tựa game đồ họa hấp dẫn mà rất nhiều trẻ em hứng thú. \">\n    <meta property=\"og:url\" content=\"https://spec.edu.vn/admin-topic\">\n    <meta name=”robots” content=”index,follow” >\n    <meta name=\"author\" content=\"SpecEdu\">\n    <meta name=\"googlebot\" content=\"index,follow,archive\">\n    <meta property=\"og:type\" content=\"article\">', 'https://spec.edu.vn/uploadfileimage/spec/baiviet/922985200dffdficture1.png', 25, 'cac-tinh-nang-noi-bat-cua-phan-mem-good-child', 'Tính năng nổi bật phầm mềm GoodChild', 'GoodChild có thể chặn được phần mềm tải về máy (Liên Quân, FreeFire, Liên Minh Huyền Thoại, FiFa, …) những tựa game đồ họa hấp dẫn mà rất nhiều trẻ em hứng thú. ', 'GoodChild, phần mềm chặn ứng dụng, phần mềm hỗ trợ học zoom, học zoom, spec learning, spec, chặn phần mềm nguy hại', 'index,follow');
INSERT INTO `topic` (`id`, `title`, `create_date`, `introduct`, `content`, `view`, `id_user`, `deleted`, `meta_html`, `image_src`, `course_id`, `view_url`, `meta_title`, `meta_description`, `meta_keyword`, `meta_robot`) VALUES
(53, 'Hướng dẫn cài đặt và sử dụng phần mềm GoodChild', '2022-01-21', '', '<p style=\"text-align:center\"><span style=\"font-size:22px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong><span style=\"color:#e67e22\">PHẦN MỀM CHẶN GAME TRÊN MÁY TÍNH VÀ GAME ONLINE TRÊN WINDOWS 10,11</span></strong></span></span></p>\n\n<p style=\"text-align:center\"><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">Sản phẩm phần mềm được xây dựng bởi Viện tin học Xây dựng - Trường Đại học Xây dựng</span></span></p>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"216\" src=\"https://spec.edu.vn/uploadfileimage/spec/giangvien/577000000KM.jpg\" width=\"400\" /></p>\n\n<p><span style=\"font-size:18px\"><span style=\"color:#e74c3c\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>Mô tả:</strong></span></span></span></p>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"10\" src=\"https://spec.edu.vn/uploadfileimage/spec/giangvien/393000000Duongke.png\" width=\"547\" /></p>\n\n<p><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:16px\">Phần mềm tự động chạy khi khởi động windows. Bảo mật tuyệt đối. Theo dõi lịch sử kể cả web ẩn danh. Cần có password để có thể gỡ bỏ phần mềm cũng như thêm danh sách website được phép truy cập. Có thể điều khiển phần mềm từ điện thoại hoặc máy tính cá nhân.</span></span></p>\n\n<p><span style=\"color:#e74c3c\"><span style=\"font-size:18px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>Chức năng phần mềm:</strong></span></span></span></p>\n\n<p><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:16px\">- Chặn website độc hại (web người lớn, web đen, web có nội dung độc hại) và website game online. Chặn toàn bộ bất cứ website nào bố mẹ muốn, thậm chí cả youtube, facebook.</span></span></p>\n\n<p><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:16px\">- Chặn mở game đã cài trên máy tính.</span></span></p>\n\n<p><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:16px\">- Chặn không cho chạy các phần mềm game copy từ USB vào máy tính.</span></span></p>\n\n<p><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:16px\">- Kiểm soát trình duyệt web ẩn danh.</span></span></p>\n\n<p><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:16px\">- Điều khiển phần mềm(Bật - tắt, cho phép cho phép truy cập trang web) từ thiết bị di động của phụ huynh.</span></span></p>\n\n<p><span style=\"color:#e74c3c\"><span style=\"font-size:18px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>Liên hệ mua:</strong></span></span></span></p>\n\n<p><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:16px\"><strong>Khuyến mại từ ngày 11/11/2021 đến 02/02/2022:<br />\nGiảm từ&nbsp;<s>799.000 đ</s>&nbsp;còn 499.000 đ, bảo hành và nâng cấp 5 năm. Dùng thử miễn phí 7 ngày, không hài lòng không trả tiền.</strong></span></span></p>\n\n<p><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:16px\">Đường dẫn tải&nbsp;phần mềm&nbsp;GoodChild:<ins><strong><a href=\"https://drive.google.com/drive/u/1/folders/19XLXMLYjq4sm7WebixAEsvmWngqdGvSD\">GoodChild v2.1.0</a></strong></ins></span></span></p>\n\n<p><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:16px\"><code>pass giải nén: spec</code></span></span></p>\n\n<p><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:16px\"><code>Mọi thắc mắc xin liên hệ với chúng tôi theo số hotline:</code></span></span></p>\n\n<p><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:16px\"><a href=\"tel:0914388841\">0914388841</a>&nbsp;hoặc&nbsp;&nbsp;<a href=\"tel:0989427809\">0989427809</a></span></span></p>\n\n<p><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:16px\">Email:&nbsp;<a href=\"mailto:RDSIC@nuce.edu.vn?subject=%E1%BB%A8ng%20d%E1%BB%A5ng%20goodChild&amp;body=Xin%20ch%C3%A0o%20b%E1%BA%A1n%2C%20t%C3%B4i%20mu%E1%BB%91n%20bi%E1%BA%BFt%20th%C3%AAm%20th%C3%B4ng%20tin%20v%E1%BB%81%20%E1%BB%A9ng%20d%E1%BB%A5ng%20n%C3%A0y.\">RDSIC@nuce.edu.vn</a></span></span></p>\n\n<p><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:16px\">Thời gian làm việc:&nbsp;&nbsp;<strong>8h-12h, 14h-17h, 20h-22h</strong></span></span></p>\n\n<p><span style=\"color:#e74c3c\"><span style=\"font-size:18px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>Ưu đãi khi mua:</strong></span></span></span></p>\n\n<table border=\"1\" cellpadding=\"1\" cellspacing=\"0\">\n	<tbody>\n		<tr>\n			<td><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:16px\">Từ 2 key</span></span></td>\n			<td><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:16px\">Giảm 5% giá sản phẩm</span></span></td>\n		</tr>\n		<tr>\n			<td><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:16px\">Từ 5 key&nbsp;</span></span></td>\n			<td><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:16px\">Giảm 10% giá sản phẩm</span></span></td>\n		</tr>\n	</tbody>\n</table>\n\n<p><span style=\"font-size:18px\"><span style=\"color:#e74c3c\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>Cài đặt và sử dụng.</strong></span></span></span></p>\n\n<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"color:#000000\">Khi tải về và hoàn tất quá trình cài đặt phần mềm, icon của phần mềm sẽ được hiện trên màn hình máy tính.&nbsp;Để có thể sử dụng phần mềm GoodChild, khách hàng có thể làm theo các bước hướng dẫn sau đây:</span></span></span></p>\n\n<div data-oembed-url=\"https://www.youtube.com/watch?v=7KvSVswN4dM&amp;t=2s\" data-widget=\"embed\">\n<div style=\"left: 0; width: 100%; height: 0; position: relative; padding-bottom: 56.25%;\"><iframe allow=\"accelerometer; clipboard-write; encrypted-media; gyroscope; picture-in-picture;\" allowfullscreen=\"\" scrolling=\"no\" src=\"https://www.youtube.com/embed/7KvSVswN4dM?rel=0&amp;start=2\" style=\"top: 0; left: 0; width: 100%; height: 100%; position: absolute; border: 0;\" tabindex=\"-1\"></iframe></div>\n</div>\n\n<p>&nbsp;</p>\n\n<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><a name=\"_Toc82722346\"><span style=\"color:#000000\"><strong>B</strong></span></a><span style=\"color:#000000\"><strong>ước 1 : Chọn ngôn ngữ của chrome là tiếng anh:</strong></span></span></span></p>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"342\" src=\"https://spec.edu.vn/uploadfileimage/spec/giangvien/532030800fdsfd-min.png\" width=\"608\" /></p>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"347\" src=\"https://spec.edu.vn/uploadfileimage/spec/giangvien/344235500dsfsdfre-min.png\" width=\"608\" /></p>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"345\" src=\"https://spec.edu.vn/uploadfileimage/spec/giangvien/234818700fdsdsffwe-min.png\" width=\"608\" /></p>\n\n<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"color:#000000\"><img alt=\"\" height=\"344\" src=\"https://spec.edu.vn/uploadfileimage/spec/giangvien/878143700sdfewew-min.png\" width=\"608\" /></span></span></span></p>\n\n<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><a name=\"_Toc82722347\"><span style=\"color:#000000\"><strong>B</strong></span></a><span style=\"color:#000000\"><strong>ước 2: bật các phần mềm mà bạn cho phép con bạn sử dụng.</strong></span></span></span></p>\n\n<ul>\n	<li>\n	<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"color:#000000\">Ví dụ ở hình dưới chúng tôi muốn <strong>GoodChild</strong> cho phép truy cập 3 phần mềm là Google Chrome, PowerPoint, Word và ngăn chặn các phần mềm khác vì vậy chúng tôi đã bật sẵn 3 phần mềm đó lên.</span></span></span></p>\n	</li>\n</ul>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"342\" src=\"https://spec.edu.vn/uploadfileimage/spec/giangvien/256038900dsfdfss-min.png\" width=\"608\" /></p>\n\n<p>&nbsp;</p>\n\n<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><a name=\"_Toc82722348\"><span style=\"color:#000000\"><strong>Bước </strong></span></a><span style=\"color:#000000\"><strong>3:</strong> Khởi động phần mềm bằng cách click đúp vào biểu tượng phần mềm <strong>GoodChild</strong> trên màn hình.Sau khi giao diện phần mềm hiện ra ta có thể thấy nó giống như hình bên dưới.</span></span></span></p>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"389\" src=\"https://spec.edu.vn/uploadfileimage/spec/giangvien/427633300sdfsdf-min.png\" width=\"608\" /></p>\n\n<p>&nbsp;</p>\n\n<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><a name=\"_Toc82722349\"><span style=\"color:#000000\"><strong>Bước </strong></span></a><span style=\"color:#000000\"><strong>4:</strong> Nếu người dùng muốn bổ sung phần mềm cho phép chạy, hãy bật phần mềm đó nên và bấm nút <strong>Reset</strong> bên cạnh Chương trình. Danh sách này sẽ được cố định ở mọi lần người dùng mở phần mềm lên</span></span></span></p>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"389\" src=\"https://spec.edu.vn/uploadfileimage/spec/giangvien/607471300sfsdfsdf-min.png\" width=\"608\" /></p>\n\n<ul>\n	<li>\n	<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"color:#000000\">Bạn muốn xóa phầm mềm cho phép chạy khỏi GoodChild, thì chọn vào phần mềm bạn muốn xóa rồi Click vào “ <strong>-</strong> ”</span></span></span></p>\n	</li>\n</ul>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"390\" src=\"https://spec.edu.vn/uploadfileimage/spec/giangvien/809621700sfadsfasd-min.png\" width=\"599\" /></p>\n\n<ul>\n	<li>\n	<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"color:#000000\">Khi muốn thêm phần mềm đã bị chặn vào phần mềm cho phép chạy click vào ô như trong hình</span></span></span></p>\n	</li>\n</ul>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"385\" src=\"https://spec.edu.vn/uploadfileimage/spec/giangvien/2930542001ewes-min.png\" width=\"601\" /></p>\n\n<ul>\n	<li>\n	<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"color:#000000\">Sau chọn phềm mềm bị chặn mà bạn muốn cho phép chạy rồi bấm <strong>“cho phép chạy phần mềm”</strong></span></span></span></p>\n	</li>\n</ul>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"388\" src=\"https://spec.edu.vn/uploadfileimage/spec/giangvien/8268751002dfweds-min.png\" width=\"595\" /></p>\n\n<ul>\n	<li>\n	<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"color:#000000\">Đối với các trang web bị chặn ta cũng làm tương tự</span></span></span></p>\n	</li>\n</ul>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"373\" src=\"https://spec.edu.vn/uploadfileimage/spec/giangvien/1661778003sefsdsf-min.png\" width=\"593\" /></p>\n\n<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><a name=\"_Toc82722350\"><span style=\"color:#000000\"><strong>Bước </strong></span></a><span style=\"color:#000000\"><strong>5:</strong> Chọn chế độ quản lý trang web</span></span></span></p>\n\n<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"color:#000000\"><strong>Chỉ cho phép chạy các trang web theo từ khóa:</strong></span></span></span></p>\n\n<ul>\n	<li>\n	<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"color:#000000\">Vào phần cài đặt chọn 1 trong 2 chế độ “Chỉ cho phép các trang web”</span></span></span></p>\n	</li>\n	<li>\n	<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"color:#000000\">Sau khi chọn xong thì lưu cài đặt.</span></span></span></p>\n	</li>\n</ul>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"373\" src=\"https://spec.edu.vn/uploadfileimage/spec/giangvien/3121332004sdffgd-min.png\" width=\"574\" /></p>\n\n<ul>\n	<li>\n	<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"color:#000000\">Click vào dấu cộng “<strong> + </strong>” ở phần “Danh sách trang web cho phép truy cập” rồi nhập các trang web mà bạn cho phép con truy cập vào ô phía dưới mục&nbsp;“Nhập tên trang web”. Còn lại tất cả các trang web khác sẽ bị chặn.</span></span></span></p>\n	</li>\n</ul>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"372\" src=\"https://spec.edu.vn/uploadfileimage/spec/giangvien/6951090005sdfefsd-min.png\" width=\"583\" /></p>\n\n<ul>\n	<li>\n	<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"color:#000000\">Sau đó click vào “<strong>T</strong><strong>hêm</strong>”. Sau khi hoàn tất thao tác thêm bạn click vào “<strong>T</strong><strong>hoát</strong>”. Nếu lỡ nhập nhầm trang web bạn cũng có thể chọn trang web đó rồi click vào “ <strong>xóa</strong> “ để xóa.</span></span></span></p>\n	</li>\n</ul>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"371\" src=\"https://spec.edu.vn/uploadfileimage/spec/giangvien/9140912006dfgdfg-min.png\" width=\"578\" /></p>\n\n<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"color:#000000\"><strong>Chỉ chặn các trang web theo từ khóa:</strong></span></span></span></p>\n\n<ul>\n	<li>\n	<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"color:#000000\">Vào phần cài đặt chọn 1 trong 2 chế độ “Chỉ chặn các trang web”</span></span></span></p>\n	</li>\n	<li>\n	<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"color:#000000\">Sau khi chọn xong thì lưu cài đặt.</span></span></span></p>\n	</li>\n</ul>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"373\" src=\"https://spec.edu.vn/uploadfileimage/spec/giangvien/903355007dsfdsfsdf-min.png\" width=\"574\" /></p>\n\n<ul>\n	<li>\n	<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"color:#000000\">Click vào dấu cộng “<strong> + </strong>” ở phần “<strong>Danh sách trang web bị </strong><strong>chặn</strong>” rồi nhập các trang web mà bạn cho phép người dùng khác truy cập vào ô phía dưới mục “<strong>Nhập tên trang web</strong>”.</span></span></span></p>\n	</li>\n</ul>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"374\" src=\"https://spec.edu.vn/uploadfileimage/spec/giangvien/125000008dfsdfsd-min.png\" width=\"579\" /></p>\n\n<ul>\n	<li>\n	<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"color:#000000\">Sau đó click vào “<strong>T</strong><strong>hêm</strong>”. Sau khi hoàn tất thao tác thêm bạn click vào “<strong>T</strong><strong>hoát</strong>”. Nếu lỡ nhập nhầm trang web bạn cũng có thể chọn trang web đó rồi click vào “ <strong>X</strong><strong>óa</strong> “ để xóa.</span></span></span></p>\n	</li>\n</ul>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"372\" src=\"https://spec.edu.vn/uploadfileimage/spec/giangvien/9292254009đfsdfsdf-min.png\" width=\"576\" /></p>\n\n<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><a name=\"_Toc82722352\"><span style=\"color:#000000\"><strong>Bước </strong></span></a><span style=\"color:#000000\"><strong>6: Ẩn GoodChild khỏi phần gỡ cài đặt</strong></span></span></span></p>\n\n<ul>\n	<li>\n	<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"color:#000000\">Click vào cài đặt rồi chọn “ <strong>Ẩn trong control panel</strong> ”.</span></span></span></p>\n	</li>\n</ul>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"372\" src=\"https://spec.edu.vn/uploadfileimage/spec/giangvien/50136850010sdfsdfresdf-min.png\" width=\"580\" /></p>\n\n<ul>\n	<li>\n	<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"color:#000000\">Sau khi&nbsp; chọn xong phền mềm hiện ra ta có thể thấy nó giống như hình bên dưới. Rồi ta bỏ dấu “&nbsp; <strong>√</strong>&nbsp;” tại phần <strong>GoodChild</strong> . Sau khi ta ẩn đi thì không thể gỡ tại Control Panel nữa.</span></span></span></p>\n	</li>\n</ul>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"373\" src=\"https://spec.edu.vn/uploadfileimage/spec/giangvien/7395683001dewedsd-min.png\" width=\"499\" /></p>\n\n<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><a name=\"_Toc82722354\"><span style=\"color:#000000\"><strong>Bước 9</strong></span></a><span style=\"color:#000000\"><strong> : Chọn Google Chrome làm trình duyện web mặc định</strong></span></span></span></p>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"308\" src=\"https://spec.edu.vn/uploadfileimage/spec/giangvien/2512667008fdfgrd-min.png\" width=\"543\" /></p>\n\n<p>&nbsp;</p>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"306\" src=\"https://spec.edu.vn/uploadfileimage/spec/giangvien/505343009dfsdfew-min.png\" width=\"544\" /></p>\n\n<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><a name=\"_Toc82722355\"><span style=\"color:#000000\"><strong>Bước 10</strong></span></a><span style=\"color:#000000\"><strong> : Cài đặt giờ kiểm soát( nếu muốn )</strong></span></span></span></p>\n\n<ul>\n	<li>\n	<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"color:#000000\">Click vào Đặt giờ. Sau đó ta có thể thấy nó giống như hình bên dưới.</span></span></span></p>\n	</li>\n</ul>\n\n<ul>\n	<li>\n	<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"color:#000000\">Lưu ý : Tại 2 ô bắt đầu và kết thúc không được đặt là 00 giờ<br />\n	VD Từ&nbsp;&nbsp; 00:10:10<br />\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Đến 00:50:50</span></span></span></p>\n	</li>\n</ul>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"349\" src=\"https://spec.edu.vn/uploadfileimage/spec/giangvien/25867920010fsdfewfsd-min.png\" width=\"544\" /></p>\n\n<ul>\n	<li>\n	<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"color:#000000\">Sau khi bạn nhập phần giờ kiếm soát mong muốn rồi Click vào “ lưu”.</span></span></span></p>\n	</li>\n	<li>\n	<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"color:#000000\">Rồi tích vào khung giờ bạn muốn kiểm soát. Sau đó Click “ Thoát”.</span></span></span></p>\n	</li>\n</ul>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"355\" src=\"https://spec.edu.vn/uploadfileimage/spec/giangvien/66536410011sdfsdfew-min.png\" width=\"551\" /></p>\n\n<ul>\n	<li>\n	<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"color:#000000\">Nếu lỡ nhập nhầm thời gian bạn cũng có thể chọn thời gian đó rồi click vào “ <strong>xóa</strong> “ để xóa.</span></span></span></p>\n	</li>\n</ul>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"361\" src=\"https://spec.edu.vn/uploadfileimage/spec/giangvien/73770290012fsdferxv-min.png\" width=\"560\" /></p>\n\n<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong><a name=\"_Toc82722356\"><span style=\"color:#000000\">Bước 11</span></a><span style=\"color:#000000\"> </span></strong><span style=\"color:#000000\">: Khi quá trình thêm trang web cho phép đã hoàn tất, bạn Click vào mục “<strong>Bắt đầu kiểm soát</strong>”, sau đó một hộp thoại yêu cầu bạn đăng nhập sẽ hiện ra.</span></span></span></p>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"357\" src=\"https://spec.edu.vn/uploadfileimage/spec/giangvien/91969860013dsfesdf-min.png\" width=\"533\" /></p>\n\n<ul>\n	<li>\n	<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"color:#000000\">Bạn nhập đầy đủ thông tin đăng nhập bao gồm tài khoản và mật khẩu rồi click vào “<strong>Đăng kí</strong>”</span></span></span></p>\n	</li>\n</ul>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"364\" src=\"https://spec.edu.vn/uploadfileimage/spec/giangvien/63428740014sdfewsd-min.png\" width=\"529\" /></p>\n\n<ul>\n	<li>\n	<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"color:#000000\">Sau khi đăng ký tài khoản dùng thử 7 ngày xong. Bạn đăng ký 1 mật khẩu để quản lý phần mềm. Mật khẩu này để cấp chép cho phần mềm chạy, tắt hoặc gỡ phần mềm.</span></span></span></p>\n	</li>\n</ul>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"388\" src=\"https://spec.edu.vn/uploadfileimage/spec/giangvien/13577360015sfsdfsdf-min.png\" width=\"608\" /></p>\n\n<ul>\n	<li>\n	<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"color:#000000\">Click vào “<strong>Đăng nhập</strong>” để tiến hành việc kiểm soát truy cập.</span></span></span></p>\n	</li>\n</ul>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"392\" src=\"https://spec.edu.vn/uploadfileimage/spec/giangvien/35483890016dfersd-min.png\" width=\"608\" /></p>\n\n<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong><a name=\"_Toc82722357\"><span style=\"color:#000000\">Bước 12</span></a></strong><span style=\"color:#000000\"> : Đổi mật khẩu GoodChild</span></span></span></p>\n\n<ul>\n	<li>\n	<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"color:#000000\">Vào phần “<strong>cài đặt”</strong> -&gt; chọn “<strong>đổi mật khẩu”</strong></span></span></span></p>\n	</li>\n	<li>\n	<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"color:#000000\">Nhập “<strong>mật khẩu cũ”</strong> và “<strong>mật khẩu mới”</strong> của bạn vào, sau đó bấm “<strong>xác nhận ”</strong> để đổi mật khẩu&nbsp;</span></span></span></p>\n	</li>\n</ul>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"370\" src=\"https://spec.edu.vn/uploadfileimage/spec/giangvien/84594970017dgrđsf-min.png\" width=\"576\" /></p>\n\n<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong><a name=\"_Toc82722358\"><span style=\"color:#000000\">Bước 13</span></a></strong><span style=\"color:#000000\"> : Tắt hẳn phần mềm GoodChild</span></span></span></p>\n\n<ul>\n	<li>\n	<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"color:#000000\">Vào phần cài đặt và chọn “ <strong>tắt phần mềm</strong>”</span></span></span></p>\n	</li>\n</ul>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"374\" src=\"https://spec.edu.vn/uploadfileimage/spec/giangvien/97125370018gdfgdfg-min.png\" width=\"577\" /></p>\n\n<ul>\n	<li>\n	<p><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"color:#000000\">Tiếp đó, một hộp thoại sẽ hiện ra hỏi bạn có muốn phần mềm này chạy ngầm hay không. Nếu muốn nó chạy ngầm thì chọn “ <strong>Có</strong>” và ngược lại nếu muốn tắt hẳn nó thì chọn “ <strong>Không </strong>”.</span></span></span></p>\n	</li>\n</ul>\n\n<p class=\"image-align-center\"><img alt=\"\" height=\"372\" src=\"https://spec.edu.vn/uploadfileimage/spec/giangvien/61973260019dfgdfg-min.png\" width=\"579\" /></p>\n\n<p><span style=\"color:#e74c3c\"><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>Cảm ơn quý khách hàng đã tin tưởng và sử dụng phần mềm của chúng tôi!!!</strong></span></span></span></p>\n', 0, 4, b'1', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n    <meta http-equiv=\"content-style-type\" content=\"text/css\">\n    <meta http-equiv=\"content-language\" content=\"en-vi\">\n    <meta name=\"copyright\" content=\"spec.edu.vn\">\n    <meta name=\"keywords\" content=\"phanmemgoodchild, goodchild, huong dan cai dat, hướng dẫn, phần mềm chặn game, chặn game, máy tính\">\n    <meta name=\"description\" content=\"Hướng dẫn cài đặt và sử dụng phần mềm Goodchilds\">\n    <meta property=\"og:site_name\" content=\"spec.edu.vn\">\n    <meta property=\"og:type\" content=\"website\">\n    <meta property=\"og:title\" content=\"Hướng dẫn cài đặt phần mềm GoodChild\">\n    <meta property=\"og:description\" content=\"Hướng dẫn cài đặt và sử dụng phần mềm Goodchilds\">\n    <meta property=\"og:url\" content=\"https://spec.edu.vn/admin-topic\">\n    <meta name=”robots” content=”index,follow” >\n    <meta name=\"author\" content=\"SpecEdu\">\n    <meta name=\"googlebot\" content=\"index,follow,archive\">\n    <meta property=\"og:type\" content=\"article\">', 'https://spec.edu.vn/uploadfileimage/spec/giangvien/djksdjsd.png', 25, 'huong-dan-cai-dat-va-su-dung-phan-mem-goodchild', 'Hướng dẫn cài đặt phần mềm GoodChild', 'Hướng dẫn cài đặt và sử dụng phần mềm Goodchilds', 'phanmemgoodchild, goodchild, huong dan cai dat, hướng dẫn, phần mềm chặn game, chặn game, máy tính', 'index,follow');

-- --------------------------------------------------------

--
-- Table structure for table `topic_has_tag`
--

CREATE TABLE `topic_has_tag` (
  `id_topic` int NOT NULL,
  `id_tag` int NOT NULL,
  `deleted` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `topic_has_tag`
--

INSERT INTO `topic_has_tag` (`id_topic`, `id_tag`, `deleted`) VALUES
(16, 3, b'1'),
(18, 3, b'1'),
(18, 4, b'1'),
(38, 3, b'1'),
(39, 19, b'1'),
(40, 3, b'1'),
(41, 20, b'1'),
(42, 20, b'1'),
(43, 20, b'1'),
(44, 21, b'1'),
(44, 22, b'1'),
(44, 24, b'1'),
(45, 21, b'1'),
(45, 23, b'1'),
(46, 4, b'1'),
(46, 21, b'1'),
(47, 21, b'1'),
(47, 24, b'1'),
(48, 21, b'1'),
(48, 24, b'1'),
(49, 21, b'1'),
(49, 24, b'1'),
(50, 25, b'1'),
(50, 27, b'1'),
(50, 28, b'1'),
(51, 25, b'1'),
(51, 27, b'1'),
(51, 28, b'1'),
(51, 29, b'1'),
(51, 30, b'1'),
(51, 31, b'1'),
(51, 32, b'1'),
(51, 33, b'1'),
(51, 34, b'1'),
(51, 35, b'1'),
(51, 36, b'1'),
(51, 37, b'1'),
(51, 38, b'1'),
(51, 39, b'1'),
(51, 40, b'1'),
(51, 41, b'1'),
(51, 42, b'1'),
(51, 43, b'1'),
(51, 44, b'1'),
(51, 45, b'1'),
(51, 46, b'1'),
(51, 47, b'1'),
(51, 48, b'1'),
(51, 49, b'1'),
(51, 50, b'1'),
(51, 51, b'1'),
(51, 52, b'1'),
(51, 53, b'1'),
(51, 54, b'1'),
(51, 55, b'1'),
(51, 56, b'1'),
(51, 57, b'1'),
(51, 58, b'1'),
(51, 59, b'1'),
(51, 60, b'1'),
(51, 61, b'1'),
(51, 62, b'1'),
(51, 63, b'1'),
(51, 64, b'1'),
(51, 65, b'1'),
(51, 66, b'1'),
(51, 67, b'1'),
(51, 68, b'1'),
(51, 69, b'1'),
(51, 70, b'1'),
(51, 71, b'1'),
(51, 72, b'1'),
(51, 73, b'1'),
(51, 74, b'1'),
(51, 75, b'1'),
(51, 76, b'1'),
(51, 77, b'1'),
(51, 78, b'1'),
(51, 79, b'1'),
(51, 80, b'1'),
(51, 81, b'1'),
(51, 82, b'1'),
(51, 83, b'1'),
(51, 84, b'1'),
(51, 85, b'1'),
(51, 86, b'1'),
(51, 87, b'1'),
(51, 88, b'1'),
(51, 89, b'1'),
(51, 90, b'1'),
(51, 91, b'1'),
(51, 92, b'1'),
(51, 93, b'1'),
(51, 94, b'1'),
(51, 95, b'1'),
(51, 96, b'1'),
(51, 97, b'1'),
(51, 98, b'1'),
(51, 99, b'1'),
(51, 100, b'1'),
(51, 101, b'1'),
(51, 102, b'1'),
(51, 103, b'1'),
(51, 104, b'1'),
(51, 105, b'1'),
(51, 106, b'1'),
(51, 107, b'1'),
(51, 108, b'1'),
(51, 109, b'1'),
(51, 110, b'1'),
(51, 111, b'1'),
(51, 112, b'1'),
(51, 113, b'1'),
(51, 114, b'1'),
(51, 115, b'1'),
(51, 116, b'1'),
(51, 117, b'1'),
(51, 118, b'1'),
(51, 119, b'1'),
(51, 120, b'1'),
(51, 121, b'1'),
(51, 122, b'1'),
(51, 123, b'1'),
(51, 124, b'1'),
(51, 125, b'1'),
(51, 126, b'1'),
(51, 127, b'1'),
(51, 128, b'1'),
(51, 129, b'1'),
(51, 130, b'1'),
(51, 131, b'1'),
(51, 132, b'1'),
(51, 133, b'1'),
(51, 134, b'1'),
(51, 135, b'1'),
(51, 136, b'1'),
(51, 137, b'1'),
(51, 138, b'1'),
(51, 139, b'1'),
(51, 140, b'1'),
(51, 141, b'1'),
(51, 142, b'1'),
(51, 143, b'1'),
(51, 144, b'1'),
(51, 145, b'1'),
(51, 146, b'1'),
(51, 147, b'1'),
(51, 148, b'1'),
(51, 149, b'1'),
(51, 150, b'1'),
(51, 151, b'1'),
(51, 152, b'1'),
(51, 153, b'1'),
(51, 154, b'1'),
(51, 155, b'1'),
(51, 156, b'1'),
(51, 157, b'1'),
(51, 158, b'1'),
(51, 159, b'1'),
(51, 160, b'1'),
(51, 161, b'1'),
(51, 162, b'1'),
(51, 163, b'1'),
(51, 164, b'1'),
(51, 165, b'1'),
(51, 166, b'1'),
(51, 167, b'1'),
(51, 168, b'1'),
(51, 169, b'1'),
(51, 170, b'1'),
(51, 171, b'1'),
(51, 172, b'1'),
(51, 173, b'1'),
(51, 174, b'1'),
(51, 175, b'1'),
(51, 176, b'1'),
(51, 177, b'1'),
(51, 178, b'1'),
(51, 179, b'1'),
(51, 180, b'1'),
(51, 181, b'1'),
(51, 182, b'1'),
(51, 183, b'1'),
(51, 184, b'1'),
(51, 185, b'1'),
(51, 186, b'1'),
(51, 187, b'1'),
(51, 188, b'1'),
(51, 189, b'1'),
(51, 190, b'1'),
(51, 191, b'1'),
(51, 192, b'1'),
(51, 193, b'1'),
(51, 194, b'1'),
(51, 195, b'1'),
(51, 196, b'1'),
(51, 197, b'1'),
(51, 198, b'1'),
(51, 199, b'1'),
(51, 200, b'1'),
(51, 201, b'1'),
(51, 202, b'1'),
(51, 203, b'1'),
(51, 204, b'1'),
(51, 205, b'1'),
(51, 206, b'1'),
(51, 207, b'1'),
(51, 208, b'1'),
(51, 209, b'1'),
(51, 210, b'1'),
(51, 211, b'1'),
(51, 212, b'1'),
(51, 213, b'1'),
(51, 214, b'1'),
(51, 215, b'1'),
(51, 216, b'1'),
(51, 217, b'1'),
(51, 218, b'1'),
(51, 219, b'1'),
(51, 220, b'1'),
(51, 221, b'1'),
(51, 222, b'1'),
(51, 223, b'1'),
(51, 224, b'1'),
(51, 225, b'1'),
(51, 226, b'1'),
(51, 227, b'1'),
(51, 228, b'1'),
(51, 229, b'1'),
(51, 230, b'1'),
(51, 231, b'1'),
(51, 232, b'1'),
(51, 233, b'1'),
(51, 234, b'1'),
(51, 235, b'1'),
(51, 236, b'1'),
(51, 237, b'1'),
(51, 238, b'1'),
(51, 239, b'1'),
(51, 240, b'1'),
(51, 241, b'1'),
(51, 242, b'1'),
(51, 243, b'1'),
(51, 244, b'1'),
(51, 245, b'1'),
(51, 246, b'1'),
(51, 247, b'1'),
(51, 248, b'1'),
(51, 249, b'1'),
(51, 250, b'1'),
(51, 251, b'1'),
(51, 252, b'1'),
(51, 253, b'1'),
(51, 254, b'1'),
(51, 255, b'1'),
(51, 256, b'1'),
(51, 257, b'1'),
(51, 258, b'1'),
(51, 259, b'1'),
(51, 260, b'1'),
(51, 261, b'1'),
(51, 262, b'1'),
(51, 263, b'1'),
(51, 264, b'1'),
(51, 265, b'1'),
(51, 266, b'1'),
(51, 267, b'1'),
(51, 268, b'1'),
(51, 269, b'1'),
(51, 270, b'1'),
(51, 271, b'1'),
(51, 272, b'1'),
(51, 273, b'1'),
(51, 274, b'1'),
(51, 275, b'1'),
(51, 276, b'1'),
(51, 277, b'1'),
(51, 278, b'1'),
(51, 279, b'1'),
(51, 280, b'1'),
(51, 281, b'1'),
(51, 282, b'1'),
(51, 283, b'1'),
(51, 284, b'1'),
(51, 285, b'1'),
(51, 286, b'1'),
(51, 287, b'1'),
(51, 288, b'1'),
(51, 289, b'1'),
(51, 290, b'1'),
(51, 291, b'1'),
(51, 292, b'1'),
(51, 293, b'1'),
(51, 294, b'1'),
(51, 295, b'1'),
(51, 296, b'1'),
(51, 297, b'1'),
(51, 298, b'1'),
(51, 299, b'1'),
(51, 300, b'1'),
(51, 301, b'1'),
(51, 302, b'1'),
(51, 303, b'1'),
(51, 304, b'1'),
(51, 305, b'1'),
(51, 306, b'1'),
(51, 307, b'1'),
(51, 308, b'1'),
(51, 309, b'1'),
(51, 310, b'1'),
(51, 311, b'1'),
(51, 312, b'1'),
(51, 313, b'1'),
(51, 314, b'1'),
(51, 315, b'1'),
(51, 316, b'1'),
(51, 317, b'1'),
(51, 318, b'1'),
(51, 319, b'1'),
(51, 320, b'1'),
(51, 321, b'1'),
(51, 322, b'1'),
(51, 323, b'1'),
(51, 324, b'1'),
(51, 325, b'1'),
(51, 326, b'1'),
(51, 327, b'1'),
(51, 328, b'1'),
(51, 329, b'1'),
(51, 330, b'1'),
(51, 331, b'1'),
(51, 332, b'1'),
(51, 333, b'1'),
(51, 334, b'1'),
(51, 335, b'1'),
(51, 336, b'1'),
(51, 337, b'1'),
(51, 338, b'1'),
(51, 339, b'1'),
(51, 340, b'1'),
(51, 341, b'1'),
(51, 342, b'1'),
(51, 343, b'1'),
(51, 344, b'1'),
(51, 345, b'1'),
(51, 346, b'1'),
(51, 347, b'1'),
(51, 348, b'1'),
(51, 349, b'1'),
(51, 350, b'1'),
(51, 351, b'1'),
(51, 352, b'1'),
(51, 353, b'1'),
(51, 354, b'1'),
(51, 355, b'1'),
(51, 356, b'1'),
(51, 357, b'1'),
(51, 358, b'1'),
(51, 359, b'1'),
(51, 360, b'1'),
(51, 361, b'1'),
(51, 362, b'1'),
(51, 363, b'1'),
(51, 364, b'1'),
(51, 365, b'1'),
(51, 366, b'1'),
(51, 367, b'1'),
(51, 368, b'1'),
(51, 380, b'1'),
(51, 381, b'1'),
(51, 382, b'1'),
(51, 383, b'1'),
(51, 384, b'1'),
(51, 385, b'1'),
(51, 386, b'1'),
(51, 387, b'1'),
(51, 388, b'1'),
(51, 389, b'1'),
(51, 390, b'1'),
(51, 391, b'1'),
(51, 392, b'1'),
(51, 393, b'1'),
(51, 394, b'1'),
(51, 395, b'1'),
(51, 396, b'1'),
(51, 397, b'1'),
(51, 398, b'1'),
(51, 399, b'1'),
(51, 400, b'1'),
(51, 401, b'1'),
(51, 402, b'1'),
(51, 403, b'1'),
(51, 404, b'1'),
(51, 405, b'1'),
(51, 406, b'1'),
(51, 407, b'1'),
(51, 408, b'1'),
(51, 409, b'1'),
(51, 410, b'1'),
(51, 411, b'1'),
(51, 412, b'1'),
(51, 413, b'1'),
(51, 414, b'1'),
(51, 415, b'1'),
(51, 416, b'1'),
(51, 417, b'1'),
(51, 418, b'1'),
(51, 419, b'1'),
(51, 420, b'1'),
(51, 421, b'1'),
(51, 422, b'1'),
(51, 423, b'1'),
(51, 424, b'1'),
(51, 425, b'1'),
(51, 426, b'1'),
(51, 427, b'1'),
(51, 428, b'1'),
(51, 429, b'1'),
(51, 430, b'1'),
(51, 431, b'1'),
(51, 432, b'1'),
(51, 433, b'1'),
(51, 434, b'1'),
(51, 435, b'1'),
(51, 436, b'1'),
(51, 437, b'1'),
(51, 438, b'1'),
(51, 439, b'1'),
(51, 440, b'1'),
(51, 441, b'1'),
(51, 442, b'1'),
(51, 443, b'1'),
(51, 444, b'1'),
(51, 445, b'1'),
(51, 446, b'1'),
(51, 447, b'1'),
(51, 448, b'1'),
(51, 449, b'1'),
(51, 450, b'1'),
(51, 451, b'1'),
(51, 452, b'1'),
(51, 453, b'1'),
(51, 454, b'1'),
(51, 455, b'1'),
(51, 456, b'1'),
(51, 457, b'1'),
(51, 458, b'1'),
(51, 459, b'1'),
(51, 460, b'1'),
(51, 461, b'1'),
(51, 462, b'1'),
(51, 463, b'1'),
(51, 464, b'1'),
(51, 465, b'1'),
(51, 466, b'1'),
(51, 467, b'1'),
(51, 468, b'1'),
(51, 469, b'1'),
(51, 470, b'1'),
(51, 471, b'1'),
(51, 472, b'1'),
(51, 473, b'1'),
(51, 474, b'1'),
(51, 475, b'1'),
(51, 476, b'1'),
(51, 477, b'1'),
(51, 478, b'1'),
(51, 479, b'1'),
(51, 480, b'1'),
(51, 481, b'1'),
(51, 482, b'1'),
(51, 483, b'1'),
(51, 484, b'1'),
(51, 485, b'1'),
(51, 486, b'1'),
(51, 487, b'1'),
(51, 488, b'1'),
(51, 489, b'1'),
(51, 490, b'1'),
(51, 491, b'1'),
(51, 492, b'1'),
(51, 493, b'1'),
(51, 494, b'1'),
(51, 495, b'1'),
(51, 496, b'1'),
(51, 497, b'1'),
(51, 498, b'1'),
(51, 499, b'1'),
(51, 500, b'1'),
(51, 501, b'1'),
(51, 502, b'1'),
(51, 503, b'1'),
(51, 504, b'1'),
(51, 505, b'1'),
(51, 506, b'1'),
(51, 507, b'1'),
(51, 508, b'1'),
(51, 509, b'1'),
(51, 510, b'1'),
(51, 511, b'1'),
(51, 512, b'1'),
(51, 513, b'1'),
(51, 514, b'1'),
(51, 515, b'1'),
(51, 516, b'1'),
(51, 517, b'1'),
(51, 518, b'1'),
(51, 519, b'1'),
(51, 520, b'1'),
(51, 521, b'1'),
(51, 522, b'1'),
(51, 523, b'1'),
(51, 524, b'1'),
(51, 525, b'1'),
(51, 526, b'1'),
(51, 527, b'1'),
(51, 528, b'1'),
(51, 529, b'1'),
(51, 530, b'1'),
(51, 531, b'1'),
(51, 532, b'1'),
(51, 533, b'1'),
(51, 534, b'1'),
(51, 535, b'1'),
(51, 536, b'1'),
(51, 537, b'1'),
(51, 538, b'1'),
(51, 539, b'1'),
(51, 540, b'1'),
(51, 541, b'1'),
(51, 542, b'1'),
(51, 543, b'1'),
(51, 544, b'1'),
(51, 545, b'1'),
(51, 546, b'1'),
(51, 547, b'1'),
(51, 548, b'1'),
(51, 549, b'1'),
(51, 550, b'1'),
(51, 551, b'1'),
(51, 552, b'1'),
(51, 553, b'1'),
(51, 554, b'1'),
(51, 555, b'1'),
(51, 556, b'1'),
(51, 557, b'1'),
(51, 558, b'1'),
(51, 559, b'1'),
(51, 560, b'1'),
(51, 561, b'1'),
(51, 562, b'1'),
(51, 563, b'1'),
(51, 564, b'1'),
(51, 565, b'1'),
(51, 566, b'1'),
(51, 567, b'1'),
(51, 568, b'1'),
(51, 569, b'1'),
(51, 570, b'1'),
(51, 571, b'1'),
(51, 572, b'1'),
(51, 573, b'1'),
(51, 574, b'1'),
(51, 575, b'1'),
(51, 576, b'1'),
(51, 577, b'1'),
(51, 578, b'1'),
(51, 579, b'1'),
(51, 580, b'1'),
(51, 581, b'1'),
(51, 582, b'1'),
(51, 583, b'1'),
(51, 584, b'1'),
(51, 585, b'1'),
(51, 586, b'1'),
(51, 587, b'1'),
(51, 588, b'1'),
(51, 589, b'1'),
(51, 590, b'1'),
(51, 591, b'1'),
(51, 592, b'1'),
(51, 593, b'1'),
(51, 594, b'1'),
(51, 595, b'1'),
(51, 596, b'1'),
(51, 597, b'1'),
(51, 598, b'1'),
(51, 599, b'1'),
(51, 600, b'1'),
(51, 601, b'1'),
(51, 602, b'1'),
(51, 603, b'1'),
(51, 604, b'1'),
(51, 605, b'1'),
(51, 606, b'1'),
(51, 607, b'1'),
(51, 608, b'1'),
(51, 609, b'1'),
(51, 610, b'1'),
(51, 611, b'1'),
(51, 612, b'1'),
(51, 613, b'1'),
(51, 614, b'1'),
(51, 615, b'1'),
(51, 616, b'1'),
(51, 617, b'1'),
(51, 618, b'1'),
(51, 619, b'1'),
(51, 620, b'1'),
(51, 621, b'1'),
(51, 622, b'1'),
(51, 623, b'1'),
(51, 624, b'1'),
(51, 625, b'1'),
(51, 626, b'1'),
(51, 627, b'1'),
(51, 628, b'1'),
(51, 629, b'1'),
(51, 630, b'1'),
(51, 631, b'1'),
(51, 632, b'1'),
(51, 633, b'1'),
(51, 634, b'1'),
(51, 635, b'1'),
(51, 636, b'1'),
(51, 637, b'1'),
(51, 638, b'1'),
(51, 639, b'1'),
(51, 640, b'1'),
(51, 641, b'1'),
(51, 642, b'1'),
(51, 643, b'1'),
(51, 644, b'1'),
(51, 645, b'1'),
(51, 646, b'1'),
(51, 647, b'1'),
(51, 648, b'1'),
(51, 649, b'1'),
(51, 650, b'1'),
(51, 651, b'1'),
(51, 652, b'1'),
(51, 653, b'1'),
(51, 654, b'1'),
(51, 655, b'1'),
(51, 656, b'1'),
(51, 657, b'1'),
(51, 658, b'1'),
(51, 659, b'1'),
(51, 660, b'1'),
(51, 661, b'1'),
(51, 662, b'1'),
(51, 663, b'1'),
(51, 664, b'1'),
(51, 665, b'1'),
(51, 666, b'1'),
(51, 667, b'1'),
(51, 668, b'1'),
(51, 669, b'1'),
(51, 670, b'1'),
(51, 671, b'1'),
(51, 672, b'1'),
(51, 673, b'1'),
(51, 674, b'1'),
(51, 675, b'1'),
(51, 676, b'1'),
(51, 677, b'1'),
(51, 678, b'1'),
(51, 679, b'1'),
(51, 680, b'1'),
(51, 681, b'1'),
(51, 682, b'1'),
(51, 683, b'1'),
(51, 684, b'1'),
(51, 685, b'1'),
(51, 686, b'1'),
(51, 687, b'1'),
(51, 688, b'1'),
(51, 689, b'1'),
(51, 690, b'1'),
(51, 691, b'1'),
(51, 692, b'1'),
(51, 693, b'1'),
(51, 694, b'1'),
(51, 695, b'1'),
(51, 696, b'1'),
(51, 697, b'1'),
(51, 698, b'1'),
(51, 699, b'1'),
(51, 700, b'1'),
(51, 701, b'1'),
(51, 702, b'1'),
(51, 703, b'1'),
(51, 704, b'1'),
(51, 705, b'1'),
(51, 706, b'1'),
(51, 707, b'1'),
(51, 708, b'1'),
(51, 709, b'1'),
(51, 710, b'1'),
(51, 711, b'1'),
(51, 712, b'1'),
(51, 713, b'1'),
(51, 714, b'1'),
(51, 715, b'1'),
(51, 716, b'1'),
(51, 717, b'1'),
(51, 718, b'1'),
(51, 719, b'1'),
(51, 720, b'1'),
(51, 721, b'1'),
(51, 722, b'1'),
(51, 723, b'1'),
(51, 724, b'1'),
(51, 725, b'1'),
(51, 726, b'1'),
(51, 727, b'1'),
(51, 728, b'1'),
(51, 729, b'1'),
(51, 730, b'1'),
(51, 731, b'1'),
(51, 732, b'1'),
(51, 733, b'1'),
(51, 734, b'1'),
(51, 735, b'1'),
(51, 736, b'1'),
(51, 737, b'1'),
(51, 738, b'1'),
(51, 739, b'1'),
(51, 740, b'1'),
(51, 741, b'1'),
(51, 742, b'1'),
(51, 743, b'1'),
(51, 744, b'1'),
(51, 745, b'1'),
(51, 746, b'1'),
(51, 747, b'1'),
(51, 748, b'1'),
(51, 749, b'1'),
(51, 750, b'1'),
(51, 751, b'1'),
(51, 752, b'1'),
(51, 753, b'1'),
(51, 754, b'1'),
(51, 755, b'1'),
(51, 756, b'1'),
(51, 757, b'1'),
(51, 758, b'1'),
(51, 759, b'1'),
(51, 760, b'1'),
(51, 761, b'1'),
(51, 762, b'1'),
(51, 763, b'1'),
(51, 764, b'1'),
(51, 765, b'1'),
(51, 766, b'1'),
(51, 767, b'1'),
(51, 768, b'1'),
(51, 769, b'1'),
(51, 770, b'1'),
(51, 771, b'1'),
(51, 772, b'1'),
(51, 773, b'1'),
(51, 774, b'1'),
(51, 775, b'1'),
(51, 776, b'1'),
(51, 777, b'1'),
(51, 778, b'1'),
(51, 779, b'1'),
(51, 780, b'1'),
(51, 781, b'1'),
(51, 782, b'1'),
(51, 783, b'1'),
(51, 784, b'1'),
(51, 785, b'1'),
(51, 786, b'1'),
(51, 787, b'1'),
(51, 788, b'1'),
(51, 789, b'1'),
(51, 790, b'1'),
(51, 791, b'1'),
(51, 792, b'1'),
(51, 793, b'1'),
(51, 794, b'1'),
(51, 795, b'1'),
(51, 796, b'1'),
(51, 797, b'1'),
(51, 798, b'1'),
(51, 799, b'1'),
(51, 800, b'1'),
(51, 801, b'1'),
(51, 802, b'1'),
(51, 803, b'1'),
(51, 804, b'1'),
(51, 805, b'1'),
(51, 806, b'1'),
(51, 807, b'1'),
(51, 808, b'1'),
(51, 809, b'1'),
(51, 810, b'1'),
(51, 811, b'1'),
(51, 812, b'1'),
(51, 813, b'1'),
(51, 814, b'1'),
(51, 815, b'1'),
(51, 816, b'1'),
(51, 817, b'1'),
(51, 818, b'1'),
(51, 819, b'1'),
(51, 820, b'1'),
(51, 821, b'1'),
(51, 822, b'1'),
(51, 823, b'1'),
(51, 824, b'1'),
(51, 825, b'1'),
(51, 826, b'1'),
(51, 827, b'1'),
(51, 828, b'1'),
(51, 829, b'1'),
(51, 830, b'1'),
(51, 831, b'1'),
(51, 832, b'1'),
(51, 833, b'1'),
(51, 834, b'1'),
(51, 835, b'1'),
(51, 836, b'1'),
(51, 837, b'1'),
(51, 838, b'1'),
(51, 839, b'1'),
(51, 840, b'1'),
(51, 841, b'1'),
(51, 842, b'1'),
(51, 843, b'1'),
(51, 844, b'1'),
(51, 845, b'1'),
(51, 846, b'1'),
(51, 847, b'1'),
(51, 848, b'1'),
(51, 849, b'1'),
(51, 850, b'1'),
(51, 851, b'1'),
(51, 852, b'1'),
(51, 853, b'1'),
(51, 854, b'1'),
(51, 855, b'1'),
(51, 856, b'1'),
(51, 857, b'1'),
(51, 858, b'1'),
(51, 859, b'1'),
(51, 860, b'1'),
(51, 861, b'1'),
(51, 862, b'1'),
(51, 863, b'1'),
(51, 864, b'1'),
(51, 865, b'1'),
(51, 866, b'1'),
(51, 867, b'1'),
(51, 868, b'1'),
(51, 869, b'1'),
(51, 870, b'1'),
(51, 871, b'1'),
(51, 872, b'1'),
(51, 873, b'1'),
(51, 874, b'1'),
(51, 875, b'1'),
(51, 876, b'1'),
(51, 877, b'1'),
(51, 878, b'1'),
(51, 879, b'1'),
(51, 880, b'1'),
(51, 881, b'1'),
(51, 882, b'1'),
(51, 883, b'1'),
(51, 884, b'1'),
(51, 885, b'1'),
(51, 886, b'1'),
(51, 887, b'1'),
(51, 888, b'1'),
(51, 889, b'1'),
(51, 890, b'1'),
(51, 891, b'1'),
(51, 892, b'1'),
(51, 893, b'1'),
(51, 894, b'1'),
(51, 895, b'1'),
(51, 896, b'1'),
(51, 897, b'1'),
(51, 898, b'1'),
(51, 899, b'1'),
(51, 900, b'1'),
(51, 901, b'1'),
(51, 902, b'1'),
(51, 903, b'1'),
(51, 904, b'1'),
(51, 905, b'1'),
(51, 906, b'1'),
(51, 907, b'1'),
(51, 908, b'1'),
(51, 909, b'1'),
(51, 910, b'1'),
(51, 911, b'1'),
(51, 912, b'1'),
(51, 913, b'1'),
(51, 914, b'1'),
(51, 915, b'1'),
(51, 916, b'1'),
(51, 917, b'1'),
(51, 918, b'1'),
(51, 919, b'1'),
(51, 920, b'1'),
(51, 921, b'1'),
(51, 922, b'1'),
(51, 923, b'1'),
(51, 924, b'1'),
(51, 925, b'1'),
(51, 926, b'1'),
(51, 927, b'1'),
(51, 928, b'1'),
(51, 929, b'1'),
(51, 930, b'1'),
(51, 931, b'1'),
(51, 932, b'1'),
(51, 933, b'1'),
(51, 934, b'1'),
(51, 935, b'1'),
(51, 936, b'1'),
(51, 937, b'1'),
(51, 938, b'1'),
(51, 939, b'1'),
(51, 940, b'1'),
(51, 941, b'1'),
(51, 942, b'1'),
(51, 943, b'1'),
(51, 944, b'1'),
(51, 945, b'1'),
(51, 946, b'1'),
(51, 947, b'1'),
(51, 948, b'1'),
(51, 949, b'1'),
(51, 950, b'1'),
(51, 951, b'1'),
(51, 952, b'1'),
(51, 953, b'1'),
(51, 954, b'1'),
(51, 955, b'1'),
(51, 956, b'1'),
(51, 957, b'1'),
(51, 958, b'1'),
(51, 959, b'1'),
(51, 960, b'1'),
(51, 961, b'1'),
(51, 962, b'1'),
(52, 38, b'1'),
(53, 369, b'1'),
(53, 370, b'1'),
(53, 371, b'1'),
(53, 372, b'1'),
(53, 373, b'1'),
(53, 374, b'1'),
(53, 375, b'1'),
(53, 376, b'1'),
(53, 377, b'1'),
(53, 378, b'1'),
(53, 379, b'1');

-- --------------------------------------------------------

--
-- Table structure for table `type_education`
--

CREATE TABLE `type_education` (
  `id` int NOT NULL COMMENT 'Loại hình giáo dục(vd: online or offline)',
  `name` varchar(255) NOT NULL,
  `sub_content` varchar(255) NOT NULL,
  `deleted` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `type_education`
--

INSERT INTO `type_education` (`id`, `name`, `sub_content`, `deleted`) VALUES
(1, 'Lập trình căn bản', 'Định hướng lập trình viên làm quen nhanh chóng với lập trình', b'1'),
(2, 'Học trực tuyến', 'Hệ thống đảm bảo người dùng có thể truy cập bất cứ đâu', b'1'),
(3, 'Đào tạo thiếu nhi', 'Kích thích sự sáng tạo, năng động và tiếp thu công nghệ ', b'1'),
(4, 'Đào tạo doanh nghiệp', 'Đào tạo và hợp tác tích cực với các doanh nghiệp', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone_number` varchar(45) NOT NULL,
  `address` varchar(100) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `deleted` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `phone_number`, `address`, `email`, `password`, `deleted`) VALUES
(1, 'Đỗ Xuân Hiếu', '0987654321', 'Hà nội', 'hieupc@gmail.com', '123456', b'1'),
(2, 'Đỗ Thị Ánh Nguyệt', '0987654321', 'Hà nam', 'DoThiAnhNguyet', 'rdsic1234', b'1'),
(3, 'Nguyễn Thanh Khương', '0987654321', 'Hà nội', 'NguyenThanhKhuong', 'rdsic1234', b'1'),
(4, 'Nguyễn Tuấn Anh', '0987654321', 'Hà nội', 'NguyenTuanAnh', 'rdsic1234', b'1'),
(8, 'Đỗ Quốc Hoàng', '0987654321', 'Hà nội', 'DoQuocHoang', 'rdsic1234', b'1'),
(9, 'Lê Thu Thảo', '0987654321', 'Hà nội', 'LeThuThao', 'rdsic1234', b'1'),
(10, 'Trần Anh Bình', '0987654321', 'Hà nội', 'TranAnhBinh', 'rdsic1234', b'1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address_company`
--
ALTER TABLE `address_company`
  ADD PRIMARY KEY (`id`,`id_company`),
  ADD KEY `fk_address_company_company1_idx` (`id_company`);

--
-- Indexes for table `address_company_has_course`
--
ALTER TABLE `address_company_has_course`
  ADD PRIMARY KEY (`id_addr`,`id_course`),
  ADD KEY `fk_address_company_has_course_course1_idx` (`id_course`);

--
-- Indexes for table `advisory_infor`
--
ALTER TABLE `advisory_infor`
  ADD PRIMARY KEY (`id`,`id_course`,`id_address_company`),
  ADD KEY `fk_advisory_infor_course1_idx` (`id_course`),
  ADD KEY `fk_advisory_infor_address_company1_idx` (`id_address_company`);

--
-- Indexes for table `big_category`
--
ALTER TABLE `big_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`,`id_small_category`,`id_user`,`theme_id`,`teacher_id`),
  ADD KEY `fk_course_small_category1_idx` (`id_small_category`),
  ADD KEY `fk_course_user1_idx` (`id_user`),
  ADD KEY `fk_course_theme1_idx` (`theme_id`),
  ADD KEY `fk_course_Teacher1_idx` (`teacher_id`);

--
-- Indexes for table `course_has_student`
--
ALTER TABLE `course_has_student`
  ADD PRIMARY KEY (`id_course`,`id_students`),
  ADD KEY `fk_course_has_student_students1_idx` (`id_students`);

--
-- Indexes for table `course_has_type_education`
--
ALTER TABLE `course_has_type_education`
  ADD PRIMARY KEY (`course_id`,`type_education_id`),
  ADD KEY `fk_course_has_type_education_type_education1_idx` (`type_education_id`);

--
-- Indexes for table `folder_image`
--
ALTER TABLE `folder_image`
  ADD PRIMARY KEY (`value`);

--
-- Indexes for table `group_student`
--
ALTER TABLE `group_student`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`,`folder_image_value`),
  ADD KEY `fk_image_folder_image1_idx` (`folder_image_value`);

--
-- Indexes for table `phan_mem`
--
ALTER TABLE `phan_mem`
  ADD PRIMARY KEY (`id`,`user_id`),
  ADD KEY `fk_phan_mem_user1_idx` (`user_id`);

--
-- Indexes for table `small_category`
--
ALTER TABLE `small_category`
  ADD PRIMARY KEY (`id`,`id_big_category`),
  ADD KEY `fk_small_category_big_category_idx` (`id_big_category`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`,`id_address`,`user_id`,`group_student_id`),
  ADD KEY `fk_students_address_company1_idx` (`id_address`),
  ADD KEY `fk_students_user1_idx` (`user_id`),
  ADD KEY `fk_students_group_student1_idx` (`group_student_id`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `theme`
--
ALTER TABLE `theme`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `topic`
--
ALTER TABLE `topic`
  ADD PRIMARY KEY (`id`,`id_user`,`course_id`),
  ADD KEY `fk_topic_admin1_idx` (`id_user`),
  ADD KEY `fk_topic_course1_idx` (`course_id`);

--
-- Indexes for table `topic_has_tag`
--
ALTER TABLE `topic_has_tag`
  ADD PRIMARY KEY (`id_topic`,`id_tag`),
  ADD KEY `fk_topic_has_tag_tag1_idx` (`id_tag`);

--
-- Indexes for table `type_education`
--
ALTER TABLE `type_education`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address_company`
--
ALTER TABLE `address_company`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `advisory_infor`
--
ALTER TABLE `advisory_infor`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'bang nhan thong tin yeu cau tu van cua phu huynh', AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `big_category`
--
ALTER TABLE `big_category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `group_student`
--
ALTER TABLE `group_student`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'Nhom hoc vien dang ky khoa hoc', AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=305;

--
-- AUTO_INCREMENT for table `phan_mem`
--
ALTER TABLE `phan_mem`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `small_category`
--
ALTER TABLE `small_category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=963;

--
-- AUTO_INCREMENT for table `teacher`
--
ALTER TABLE `teacher`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `topic`
--
ALTER TABLE `topic`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `type_education`
--
ALTER TABLE `type_education`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'Loại hình giáo dục(vd: online or offline)', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address_company`
--
ALTER TABLE `address_company`
  ADD CONSTRAINT `fk_address_company_company1` FOREIGN KEY (`id_company`) REFERENCES `company` (`id`);

--
-- Constraints for table `address_company_has_course`
--
ALTER TABLE `address_company_has_course`
  ADD CONSTRAINT `fk_address_company_has_course_address_company1` FOREIGN KEY (`id_addr`) REFERENCES `address_company` (`id`),
  ADD CONSTRAINT `fk_address_company_has_course_course1` FOREIGN KEY (`id_course`) REFERENCES `course` (`id`);

--
-- Constraints for table `advisory_infor`
--
ALTER TABLE `advisory_infor`
  ADD CONSTRAINT `fk_advisory_infor_address_company1` FOREIGN KEY (`id_address_company`) REFERENCES `address_company` (`id`),
  ADD CONSTRAINT `fk_advisory_infor_course1` FOREIGN KEY (`id_course`) REFERENCES `course` (`id`);

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `fk_course_small_category1` FOREIGN KEY (`id_small_category`) REFERENCES `small_category` (`id`),
  ADD CONSTRAINT `fk_course_Teacher1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`),
  ADD CONSTRAINT `fk_course_theme1` FOREIGN KEY (`theme_id`) REFERENCES `theme` (`id`),
  ADD CONSTRAINT `fk_course_user1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Constraints for table `course_has_student`
--
ALTER TABLE `course_has_student`
  ADD CONSTRAINT `fk_course_has_student_course1` FOREIGN KEY (`id_course`) REFERENCES `course` (`id`),
  ADD CONSTRAINT `fk_course_has_student_students1` FOREIGN KEY (`id_students`) REFERENCES `students` (`id`);

--
-- Constraints for table `course_has_type_education`
--
ALTER TABLE `course_has_type_education`
  ADD CONSTRAINT `fk_course_has_type_education_course1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  ADD CONSTRAINT `fk_course_has_type_education_type_education1` FOREIGN KEY (`type_education_id`) REFERENCES `type_education` (`id`);

--
-- Constraints for table `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `fk_image_folder_image1` FOREIGN KEY (`folder_image_value`) REFERENCES `folder_image` (`value`);

--
-- Constraints for table `phan_mem`
--
ALTER TABLE `phan_mem`
  ADD CONSTRAINT `fk_phan_mem_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `small_category`
--
ALTER TABLE `small_category`
  ADD CONSTRAINT `fk_small_category_big_category` FOREIGN KEY (`id_big_category`) REFERENCES `big_category` (`id`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `fk_students_address_company1` FOREIGN KEY (`id_address`) REFERENCES `address_company` (`id`),
  ADD CONSTRAINT `fk_students_group_student1` FOREIGN KEY (`group_student_id`) REFERENCES `group_student` (`id`),
  ADD CONSTRAINT `fk_students_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `topic`
--
ALTER TABLE `topic`
  ADD CONSTRAINT `fk_topic_admin1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `fk_topic_course1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`);

--
-- Constraints for table `topic_has_tag`
--
ALTER TABLE `topic_has_tag`
  ADD CONSTRAINT `fk_topic_has_tag_tag1` FOREIGN KEY (`id_tag`) REFERENCES `tag` (`id`),
  ADD CONSTRAINT `fk_topic_has_tag_topic1` FOREIGN KEY (`id_topic`) REFERENCES `topic` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
