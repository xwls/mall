/*
Navicat MySQL Data Transfer

Source Server         : hwua@localhost
Source Server Version : 50555
Source Host           : localhost:3306
Source Database       : mall

Target Server Type    : MYSQL
Target Server Version : 50555
File Encoding         : 65001

Date: 2018-01-15 14:24:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `aid` int(6) NOT NULL AUTO_INCREMENT,
  `addr` varchar(200) NOT NULL,
  `name` varchar(20) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `mid` int(6) NOT NULL,
  PRIMARY KEY (`aid`),
  KEY `fk_address_mid` (`mid`),
  CONSTRAINT `fk_address_mid` FOREIGN KEY (`mid`) REFERENCES `member` (`mid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `img` varchar(200) NOT NULL,
  `href` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES ('3', 'static/images/main-banner3-1140x400.jpg', 'product?pid=42');
INSERT INTO `banner` VALUES ('4', 'static/images/main-banner4-1140x400.jpg', 'product?pid=5');
INSERT INTO `banner` VALUES ('5', 'static/images/main-banner5-1140x400.jpg', 'product?pid=41');

-- ----------------------------
-- Table structure for brand
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand` (
  `bid` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES ('1', '戴尔');
INSERT INTO `brand` VALUES ('2', '华硕');
INSERT INTO `brand` VALUES ('3', '联想');
INSERT INTO `brand` VALUES ('4', '苹果');
INSERT INTO `brand` VALUES ('5', '小米');
INSERT INTO `brand` VALUES ('6', '三星');
INSERT INTO `brand` VALUES ('7', '锤子');
INSERT INTO `brand` VALUES ('9', '荣耀');
INSERT INTO `brand` VALUES ('10', '一加');
INSERT INTO `brand` VALUES ('11', '谷歌');
INSERT INTO `brand` VALUES ('12', '华为');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `mid` int(6) NOT NULL,
  `pid` int(6) NOT NULL,
  `quantity` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cart_mid` (`mid`),
  KEY `fk_cart_pid` (`pid`),
  CONSTRAINT `fk_cart_mid` FOREIGN KEY (`mid`) REFERENCES `member` (`mid`) ON DELETE CASCADE,
  CONSTRAINT `fk_cart_pid` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cid` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '笔记本电脑');
INSERT INTO `category` VALUES ('2', '手机');
INSERT INTO `category` VALUES ('3', '平板');

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `mid` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `tel` varchar(11) NOT NULL,
  `gender` int(1) DEFAULT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('18', 'test', '123456', 'haha@haha.com', '12345678910', '1');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `pid` int(6) NOT NULL AUTO_INCREMENT,
  `cid` int(6) DEFAULT NULL,
  `bid` int(6) DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
  `original_price` double(10,2) DEFAULT NULL,
  `price` double(10,2) NOT NULL,
  `img_url` varchar(200) DEFAULT NULL,
  `inventory` int(5) DEFAULT NULL,
  `sales_volume` int(5) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `fk_product_cid` (`cid`),
  KEY `fk_product_bid` (`bid`),
  CONSTRAINT `fk_product_bid` FOREIGN KEY (`bid`) REFERENCES `brand` (`bid`) ON DELETE CASCADE,
  CONSTRAINT `fk_product_cid` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('3', '1', '1', '戴尔DELL XPS13-9360-R3609S 13.3英寸轻薄窄边框笔记本电脑(i5-8250U 8G 256GSSD IPS Win10)无忌银', '【轻薄窄边框】8代CPU、固态硬盘高端配备、全高清ips显示屏、超长续航无忧体验、轻薄便携优雅不失质感！', '7999.00', '7499.00', 'static/images/59f156f1N704c1c7a.jpg', '10000', '0');
INSERT INTO `product` VALUES ('4', '1', '1', '戴尔DELL灵越游匣15PR-6748B 15.6英寸游戏笔记本电脑(i7-7700HQ 8G 128GSSD+1T GTX1050 4G独显 IPS)黑', '【GTX1050 4G独显】吃鸡利器瞄准4G独显游戏本,升级版IPS全高清防眩光显示屏拒绝掉帧,WASD方向键颜色加持,三大出风口立体散热！', '7499.00', '6699.00', 'static/images/59f056fdN0d933610.jpg', '10000', '0');
INSERT INTO `product` VALUES ('5', '1', '2', '华硕(ASUS) 飞行堡垒四代FX63VD 15.6英寸游戏笔记本电脑(i5-7300HQ 8G 128GSSD+1T GTX1050 4G独显 IPS)黑色', '【限时促销开启！华硕游戏新机驾到！四代飞行堡垒！IPS屏+双风扇更新换代！】', '6299.00', '5798.00', 'static/images/5a045008N8366cb4b.jpg', '10000', '0');
INSERT INTO `product` VALUES ('6', '1', '3', '联想(Lenovo)拯救者R720 15.6英寸游戏笔记本电脑(i5-7300HQ 8G 1T+128G SSD GTX1050Ti 4G IPS 黑)', '【吃鸡利器，4G大显存，Nvme协议Pcie固态硬盘】GTX1050Ti就选拯救者！', '6599.00', '6399.00', 'static/images/59ffd41dN90ac91a2.jpg', '10000', '0');
INSERT INTO `product` VALUES ('7', '1', '4', 'Apple MacBook Pro 13.3英寸笔记本电脑 深空灰色（2017新款Core i5处理器/8GB内存/256GB硬盘 MPXT2CH/A）', '七代Intel处理器，性能更强劲，做图设计，影音娱乐，面面俱到！（此款无touchbar）', '11888.00', '10988.00', 'static/images/593959d6Ne88adf93.jpg', '10000', '0');
INSERT INTO `product` VALUES ('8', '1', '4', 'Apple MacBook Pro 15.4英寸笔记本电脑 银色(Core i7 处理器/16GB内存/256GB SSD闪存/Retina屏 MJLQ2CH/A)', '全面专业的选择！15.4英寸Retina显示屏，丰富的外设接口，大容量固态硬盘！', '14288.00', '12868.00', 'static/images/5631d2b6N8fa76f15.jpg', '10000', '0');
INSERT INTO `product` VALUES ('9', '1', '5', '小米(MI)Air 13.3英寸全金属轻薄笔记本(i5-7200U 8G 256G PCle SSD MX150 2G独显 FHD 指纹识别 Win10）银', '【i5 MX150 2G显存】全高清窄边框 8G内存 256固态硬盘 支持指纹识别 预装WIN10系统', '5499.00', '5199.00', 'static/images/595dd5a5Nc3a7dab5.jpg', '10000', '0');
INSERT INTO `product` VALUES ('10', '1', '5', '小米(MI)Pro 15.6英寸金属轻薄笔记本(i5-8250U 8G 256GSSD MX150 2G独显 FHD 指纹识别 预装office)深空灰', '【告别显示器轻装上阵】【15.6英寸MX150轻薄本】第八代酷睿I5处理器 256G固态硬盘疾速启动 MX150 2G独显 高效指纹识别 预装正版Office', '5599.00', '5499.00', 'static/images/59b62c9cN36ac48fa.jpg', '10000', '0');
INSERT INTO `product` VALUES ('12', '2', '4', 'Apple iPhone 8 (A1863) 64GB 金色 移动联通电信4G手机', '下单立减389元！成交价5499元！赠碎屏险，半年碎屏换新机！', '5888.00', '5499.00', 'static/images/59b85847N20776d8e.jpg', '10000', '0');
INSERT INTO `product` VALUES ('13', '2', '4', 'Apple 苹果 iPhone X 全面屏手机 深空灰色 全网通 64GB', '【原封国行正品 全国联保】送钢化膜+保护壳 全面屏，科技全绽放。', '8588.00', '8588.00', 'static/images/59ec3325N906f107e.jpg', '10000', '0');
INSERT INTO `product` VALUES ('14', '2', '5', '小米MIX2 全网通 6GB+64GB 黑色 移动联通电信4G手机 双卡双待', '赠小米自拍杆+米粉卡（内含100元话费）小米Mix2，全面屏2.0震撼来袭，四曲面陶瓷机身，骁龙835处理器！', '3299.00', '3299.00', 'static/images/59bb872eNf44497eb.jpg', '10000', '0');
INSERT INTO `product` VALUES ('15', '2', '5', '小米6 全网通 6GB+128GB 陶瓷黑尊享版 移动联通电信4G手机 双卡双待', '购机得米粉卡（内含100元话费）！小米6变焦双摄，拍人更美！5.15”屏幕，四曲面机身，骁龙835处理器！', '2999.00', '2599.00', 'static/images/597ae1efNc6dd8fe4.jpg', '10000', '0');
INSERT INTO `product` VALUES ('16', '2', '6', '三星 Galaxy S8（SM-G9500）4GB+64GB 谜夜黑 移动联通电信4G手机 双卡双待', '【白条12期免息！购机送无线快充+配件大礼包！】好评破4万！全视曲面屏，骁龙835芯片！', '5688.00', '5688.00', 'static/images/59119ddbNd25bdd22.jpg', '10000', '0');
INSERT INTO `product` VALUES ('17', '2', '6', '三星 Galaxy Note8（SM-N9500）6GB+64GB 谜夜黑 移动联通电信4G手机 双卡双待', '【下单赠原厂立式快充+移动电源，白条12期免息！】后置防抖双摄像头，S Pen全面升级！', '6988.00', '6988.00', 'static/images/59c8c01dNa767345a.jpg', '10000', '0');
INSERT INTO `product` VALUES ('18', '2', '6', '三星 Galaxy S7 edge（G9350）4GB+32GB 铂光金 移动联通电信4G手机 双卡双待', '【白条12期免息！】曲面旗舰，好评破8.8万！', '2699.00', '2588.00', 'static/images/56d51a42Nd86f1c8e.jpg', '10000', '0');
INSERT INTO `product` VALUES ('19', '2', '7', '锤子 坚果 Pro 2 浅金色 6+64GB 全网通 移动联通电信4G手机 双卡双待', '已售罄，下次抢购时间11月23日10：00。下单成功用户将于11月20日起陆续开始发货，温馨提醒：已激活手机不支持7天无理由退货', '2299.00', '2299.00', 'static/images/5a0bbcc9N73ee46d2.jpg', '10000', '0');
INSERT INTO `product` VALUES ('20', '2', '7', '锤子 坚果Pro 64GB 酒红色 全网通 移动联通电信4G手机 双卡双待', '火热抢购中，货量有限，欲购从速。 温馨提醒：已激活产品不支持7天无理由退货。', '1499.00', '1499.00', 'static/images/5911bac3N5d51d2aa.jpg', '10000', '0');
INSERT INTO `product` VALUES ('21', '2', '9', '荣耀9 全网通 标配版 4GB+64GB 海鸥灰 移动联通电信4G手机 双卡双待', '下单立减100！领券再减200！低至1999！2000万变焦双摄，3D曲面极光玻璃，美得有声有色！', '2299.00', '2299.00', 'static/images/593e4a5dN7fb3dedc.jpg', '10000', '0');
INSERT INTO `product` VALUES ('41', '2', '5', '小米5X 全网通 4GB+64GB 红色 移动联通电信4G手机 双卡双待', '直降100元！仅限28号一天！购机得保护壳+保护膜+米粉卡（内含100元话费）！5.5”屏幕，轻薄金属机身！光学变焦双摄，拍人更美！', '1499.00', '1399.00', 'static/images/59ef3791N3c271276.jpg', '10000', '0');
INSERT INTO `product` VALUES ('42', '2', '5', '小米 红米5A 全网通版 2GB+16GB 铂银灰 移动联通电信4G手机 双卡双待', '红米5A轻巧手感，5英寸屏幕，高通骁龙处理器，1300万摄像头！', '599.00', '599.00', 'static/images/59e45c2cN73ba0b81.jpg', '10000', '0');
