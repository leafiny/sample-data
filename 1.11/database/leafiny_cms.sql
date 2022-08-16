/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET net_read_timeout=600;

--
-- Table structure for table `admin_user`
--

DROP TABLE IF EXISTS `admin_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(32) DEFAULT NULL,
  `lastname` varchar(32) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `username` varchar(40) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `is_admin` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_user`
--

LOCK TABLES `admin_user` WRITE;
/*!40000 ALTER TABLE `admin_user` DISABLE KEYS */;
INSERT INTO `admin_user` VALUES (1,'Leafiny','Demo','contact@example.com','leafiny','$2y$10$AYN8xezzgpPCr.KHMiH3BeWUVG27frOV5117mwP.juQbmbmCUG/IC',1,'2020-12-01 14:53:30','2020-12-01 14:58:55');
/*!40000 ALTER TABLE `admin_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_user_resources`
--

DROP TABLE IF EXISTS `admin_user_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_user_resources` (
  `resource_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `resource` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`resource_id`),
  UNIQUE KEY `user_id` (`user_id`,`resource`),
  CONSTRAINT `admin_user_resources_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_user_resources`
--

LOCK TABLES `admin_user_resources` WRITE;
/*!40000 ALTER TABLE `admin_user_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_user_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute`
--

DROP TABLE IF EXISTS `attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute` (
  `attribute_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `entity_type` varchar(255) NOT NULL,
  `input_type` varchar(255) NOT NULL DEFAULT 'text',
  `option_qty` int(11) NOT NULL DEFAULT 0,
  `is_filterable` int(11) NOT NULL DEFAULT 0,
  `show_in_list` int(11) NOT NULL DEFAULT 0,
  `position` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`attribute_id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute`
--

LOCK TABLES `attribute` WRITE;
/*!40000 ALTER TABLE `attribute` DISABLE KEYS */;
INSERT INTO `attribute` VALUES (1,'Color','color','catalog_product','multiselect',8,1,1,10),(2,'Exposure','exposure','catalog_product','select',3,1,1,20),(4,'Leaves','leaves','catalog_product','select',3,1,1,30);
/*!40000 ALTER TABLE `attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_entity_value`
--

DROP TABLE IF EXISTS `attribute_entity_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_entity_value` (
  `attribute_id` int(10) unsigned NOT NULL,
  `attribute_code` varchar(255) NOT NULL,
  `attribute_label` varchar(255) NOT NULL,
  `attribute_position` int(11) NOT NULL DEFAULT 0,
  `option_id` int(11) NOT NULL DEFAULT 0,
  `option_custom` varchar(255) DEFAULT NULL,
  `option_label` varchar(255) DEFAULT NULL,
  `option_position` int(11) NOT NULL DEFAULT 0,
  `entity_type` varchar(255) NOT NULL,
  `entity_id` int(10) unsigned NOT NULL,
  `language` varchar(5) NOT NULL DEFAULT 'en_US',
  UNIQUE KEY `attribute_id` (`attribute_id`,`option_id`,`entity_type`,`entity_id`,`language`),
  CONSTRAINT `attribute_entity_value_ibfk_1` FOREIGN KEY (`attribute_id`) REFERENCES `attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_entity_value`
--

LOCK TABLES `attribute_entity_value` WRITE;
/*!40000 ALTER TABLE `attribute_entity_value` DISABLE KEYS */;
INSERT INTO `attribute_entity_value` VALUES (1,'color','Color',10,1,'#fefff4','White',10,'catalog_product',28,'en_US'),(1,'color','Color',10,2,'#fae03c','Yellow',20,'catalog_product',16,'en_US'),(1,'color','Color',10,2,'#fae03c','Yellow',20,'catalog_product',21,'en_US'),(1,'color','Color',10,2,'#fae03c','Yellow',20,'catalog_product',27,'en_US'),(1,'color','Color',10,3,'#e64980','Pink',30,'catalog_product',26,'en_US'),(1,'color','Color',10,4,'#f03e3e','Red',40,'catalog_product',8,'en_US'),(1,'color','Color',10,4,'#f03e3e','Red',40,'catalog_product',17,'en_US'),(1,'color','Color',10,4,'#f03e3e','Red',40,'catalog_product',20,'en_US'),(1,'color','Color',10,4,'#f03e3e','Red',40,'catalog_product',23,'en_US'),(1,'color','Color',10,5,'#7b68ee','Purple',50,'catalog_product',7,'en_US'),(1,'color','Color',10,5,'#7b68ee','Purple',50,'catalog_product',18,'en_US'),(1,'color','Color',10,5,'#7b68ee','Purple',50,'catalog_product',19,'en_US'),(1,'color','Color',10,5,'#7b68ee','Purple',50,'catalog_product',22,'en_US'),(1,'color','Color',10,6,'#f76707','Orange',60,'catalog_product',11,'en_US'),(1,'color','Color',10,6,'#f76707','Orange',60,'catalog_product',13,'en_US'),(1,'color','Color',10,6,'#f76707','Orange',60,'catalog_product',25,'en_US'),(1,'color','Color',10,7,'#2f9e44','Green',70,'catalog_product',6,'en_US'),(1,'color','Color',10,7,'#2f9e44','Green',70,'catalog_product',12,'en_US'),(1,'color','Color',10,7,'#2f9e44','Green',70,'catalog_product',14,'en_US'),(1,'color','Color',10,7,'#2f9e44','Green',70,'catalog_product',15,'en_US'),(1,'color','Color',10,7,'#2f9e44','Green',70,'catalog_product',24,'en_US'),(1,'color','Color',10,8,'#000000','Black',80,'catalog_product',4,'en_US'),(1,'color','Color',10,8,'#000000','Black',80,'catalog_product',9,'en_US'),(1,'color','Color',10,8,'#000000','Black',80,'catalog_product',10,'en_US'),(2,'exposure','Exposure',20,9,NULL,'Partial shade',10,'catalog_product',7,'en_US'),(2,'exposure','Exposure',20,9,NULL,'Partial shade',10,'catalog_product',9,'en_US'),(2,'exposure','Exposure',20,9,NULL,'Partial shade',10,'catalog_product',10,'en_US'),(2,'exposure','Exposure',20,9,NULL,'Partial shade',10,'catalog_product',14,'en_US'),(2,'exposure','Exposure',20,9,NULL,'Partial shade',10,'catalog_product',15,'en_US'),(2,'exposure','Exposure',20,9,NULL,'Partial shade',10,'catalog_product',16,'en_US'),(2,'exposure','Exposure',20,9,NULL,'Partial shade',10,'catalog_product',17,'en_US'),(2,'exposure','Exposure',20,9,NULL,'Partial shade',10,'catalog_product',20,'en_US'),(2,'exposure','Exposure',20,9,NULL,'Partial shade',10,'catalog_product',25,'en_US'),(2,'exposure','Exposure',20,9,NULL,'Partial shade',10,'catalog_product',27,'en_US'),(2,'exposure','Exposure',20,10,NULL,'Shade',20,'catalog_product',4,'en_US'),(2,'exposure','Exposure',20,10,NULL,'Shade',20,'catalog_product',6,'en_US'),(2,'exposure','Exposure',20,10,NULL,'Shade',20,'catalog_product',18,'en_US'),(2,'exposure','Exposure',20,10,NULL,'Shade',20,'catalog_product',21,'en_US'),(2,'exposure','Exposure',20,10,NULL,'Shade',20,'catalog_product',23,'en_US'),(2,'exposure','Exposure',20,11,NULL,'Sun',3,'catalog_product',8,'en_US'),(2,'exposure','Exposure',20,11,NULL,'Sun',3,'catalog_product',11,'en_US'),(2,'exposure','Exposure',20,11,NULL,'Sun',3,'catalog_product',12,'en_US'),(2,'exposure','Exposure',20,11,NULL,'Sun',3,'catalog_product',13,'en_US'),(2,'exposure','Exposure',20,11,NULL,'Sun',3,'catalog_product',19,'en_US'),(2,'exposure','Exposure',20,11,NULL,'Sun',3,'catalog_product',22,'en_US'),(2,'exposure','Exposure',20,11,NULL,'Sun',3,'catalog_product',24,'en_US'),(2,'exposure','Exposure',20,11,NULL,'Sun',3,'catalog_product',26,'en_US'),(2,'exposure','Exposure',20,11,NULL,'Sun',3,'catalog_product',28,'en_US'),(4,'leaves','Leaves',30,15,NULL,'Deciduous',10,'catalog_product',11,'en_US'),(4,'leaves','Leaves',30,15,NULL,'Deciduous',10,'catalog_product',13,'en_US'),(4,'leaves','Leaves',30,15,NULL,'Deciduous',10,'catalog_product',24,'en_US'),(4,'leaves','Leaves',30,15,NULL,'Deciduous',10,'catalog_product',27,'en_US'),(4,'leaves','Leaves',30,15,NULL,'Deciduous',10,'catalog_product',28,'en_US'),(4,'leaves','Leaves',30,16,NULL,'Evergreen',20,'catalog_product',4,'en_US'),(4,'leaves','Leaves',30,16,NULL,'Evergreen',20,'catalog_product',6,'en_US'),(4,'leaves','Leaves',30,16,NULL,'Evergreen',20,'catalog_product',7,'en_US'),(4,'leaves','Leaves',30,16,NULL,'Evergreen',20,'catalog_product',8,'en_US'),(4,'leaves','Leaves',30,16,NULL,'Evergreen',20,'catalog_product',9,'en_US'),(4,'leaves','Leaves',30,16,NULL,'Evergreen',20,'catalog_product',12,'en_US'),(4,'leaves','Leaves',30,16,NULL,'Evergreen',20,'catalog_product',14,'en_US'),(4,'leaves','Leaves',30,16,NULL,'Evergreen',20,'catalog_product',15,'en_US'),(4,'leaves','Leaves',30,16,NULL,'Evergreen',20,'catalog_product',16,'en_US'),(4,'leaves','Leaves',30,16,NULL,'Evergreen',20,'catalog_product',17,'en_US'),(4,'leaves','Leaves',30,16,NULL,'Evergreen',20,'catalog_product',18,'en_US'),(4,'leaves','Leaves',30,16,NULL,'Evergreen',20,'catalog_product',21,'en_US'),(4,'leaves','Leaves',30,16,NULL,'Evergreen',20,'catalog_product',23,'en_US'),(4,'leaves','Leaves',30,16,NULL,'Evergreen',20,'catalog_product',25,'en_US'),(4,'leaves','Leaves',30,17,NULL,'Semi-evergreen',30,'catalog_product',10,'en_US'),(4,'leaves','Leaves',30,17,NULL,'Semi-evergreen',30,'catalog_product',19,'en_US'),(4,'leaves','Leaves',30,17,NULL,'Semi-evergreen',30,'catalog_product',20,'en_US'),(4,'leaves','Leaves',30,17,NULL,'Semi-evergreen',30,'catalog_product',22,'en_US'),(4,'leaves','Leaves',30,17,NULL,'Semi-evergreen',30,'catalog_product',26,'en_US');
/*!40000 ALTER TABLE `attribute_entity_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_option`
--

DROP TABLE IF EXISTS `attribute_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int(10) unsigned NOT NULL,
  `label` varchar(255) NOT NULL,
  `custom` varchar(255) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`option_id`),
  KEY `attribute_id` (`attribute_id`),
  CONSTRAINT `attribute_option_ibfk_1` FOREIGN KEY (`attribute_id`) REFERENCES `attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_option`
--

LOCK TABLES `attribute_option` WRITE;
/*!40000 ALTER TABLE `attribute_option` DISABLE KEYS */;
INSERT INTO `attribute_option` VALUES (1,1,'White','#fefff4',10),(2,1,'Yellow','#fae03c',20),(3,1,'Pink','#e64980',30),(4,1,'Red','#f03e3e',40),(5,1,'Purple','#7b68ee',50),(6,1,'Orange','#f76707',60),(7,1,'Green','#2f9e44',70),(8,1,'Black','#000000',80),(9,2,'Partial shade',NULL,10),(10,2,'Shade',NULL,20),(11,2,'Sun',NULL,3),(15,4,'Deciduous',NULL,10),(16,4,'Evergreen',NULL,20),(17,4,'Semi-evergreen',NULL,30);
/*!40000 ALTER TABLE `attribute_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_option_translate`
--

DROP TABLE IF EXISTS `attribute_option_translate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_option_translate` (
  `option_id` int(10) unsigned NOT NULL,
  `label` varchar(255) NOT NULL,
  `language` varchar(5) NOT NULL DEFAULT 'en_US',
  KEY `option_id` (`option_id`),
  CONSTRAINT `attribute_option_translate_ibfk_1` FOREIGN KEY (`option_id`) REFERENCES `attribute_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_option_translate`
--

LOCK TABLES `attribute_option_translate` WRITE;
/*!40000 ALTER TABLE `attribute_option_translate` DISABLE KEYS */;
INSERT INTO `attribute_option_translate` VALUES (1,'Blanc','fr_FR'),(1,'White','en_US'),(2,'Jaune','fr_FR'),(2,'Yellow','en_US'),(3,'Rose','fr_FR'),(3,'Pink','en_US'),(4,'Rouge','fr_FR'),(4,'Red','en_US'),(5,'Violet','fr_FR'),(5,'Purple','en_US'),(6,'Orange','fr_FR'),(6,'Orange','en_US'),(7,'Vert','fr_FR'),(7,'Green','en_US'),(8,'Noir','fr_FR'),(8,'Black','en_US'),(9,'Mi-ombre','fr_FR'),(9,'Partial shade','en_US'),(10,'Ombre','fr_FR'),(10,'Shade','en_US'),(11,'Soleil','fr_FR'),(11,'Sun','en_US'),(15,'Caduc','fr_FR'),(15,'Deciduous','en_US'),(16,'Persistant','fr_FR'),(16,'Evergreen','en_US'),(17,'Semi-persistant','fr_FR'),(17,'Semi-evergreen','en_US');
/*!40000 ALTER TABLE `attribute_option_translate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_translate`
--

DROP TABLE IF EXISTS `attribute_translate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_translate` (
  `attribute_id` int(10) unsigned NOT NULL,
  `label` varchar(255) NOT NULL,
  `language` varchar(5) NOT NULL DEFAULT 'en_US',
  KEY `attribute_id` (`attribute_id`),
  CONSTRAINT `attribute_translate_ibfk_1` FOREIGN KEY (`attribute_id`) REFERENCES `attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_translate`
--

LOCK TABLES `attribute_translate` WRITE;
/*!40000 ALTER TABLE `attribute_translate` DISABLE KEYS */;
INSERT INTO `attribute_translate` VALUES (4,'Leaves','en_US'),(4,'Feuillages','fr_FR'),(2,'Exposure','en_US'),(2,'Exposition','fr_FR'),(1,'Color','en_US'),(1,'Couleur','fr_FR');
/*!40000 ALTER TABLE `attribute_translate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_post`
--

DROP TABLE IF EXISTS `blog_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_post` (
  `post_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `path_key` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT '',
  `meta_title` varchar(255) DEFAULT '',
  `meta_description` varchar(255) DEFAULT '',
  `canonical` varchar(255) DEFAULT NULL,
  `robots` varchar(255) DEFAULT NULL,
  `intro` text DEFAULT NULL,
  `content` text DEFAULT NULL,
  `language` varchar(5) DEFAULT 'en_US',
  `status` int(11) NOT NULL DEFAULT 0,
  `breadcrumb` int(11) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `publish_date` date DEFAULT NULL,
  `inline_css` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`post_id`),
  UNIQUE KEY `path_key` (`path_key`,`language`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_post`
--

LOCK TABLES `blog_post` WRITE;
/*!40000 ALTER TABLE `blog_post` DISABLE KEYS */;
INSERT INTO `blog_post` VALUES (3,'crepe-myrtle-the-perfect-summer-flowering-tree','Crepe myrtle: the perfect summer flowering tree','Crepe myrtle: the perfect summer flowering tree',NULL,NULL,NULL,'Crepe myrtle (Lagerstroemia indica) is a tree or a tall shrub with a lot to offer gardeners. First up are its beautiful flowers in pink, heliotrope (a bright pink), red, mauve or vibrant white to enjoy from late spring well into autumn. And there’s no need to wait years for your beautiful blossoms, as these trees flower while young.','<p>One of the reasons for their long blooming period is that the crinkled, crepe-like flowers that give the plant its common name are tough and resistant to both heat and rain. No matter what the season throws at them, crepe myrtles keep on looking good.</p>\r\n<p>While they are particularly pretty when they are in flower, crepe myrtles look good year-round. As well as summer flowers, taller varieties offer welcome shade - and, as the long flowering season ends, their small leaves colour gold and red for autumn, even in temperate and coastal zones.</p>\r\n<p>They also look good in the colder months. After their leaves fall, their bare branches and smooth silvery trunk becomes a lovely feature through winter.</p>\r\n<p>Crepe myrtles grow in full sun or with part shade and tolerate everything from heat to frost. Dark leaf forms, such as the \'Diamonds in the Dark\' series, will produce darker foliage tones in full sun.</p>\r\n<p>Potted crepe myrtles can be planted at any time of the year. New-season stock generally arrives during winter, when trees are dormant, but some prefer to wait until summer so that they can choose their ideal plant based on flower colour.</p>\r\n<h3 id=\"colourfuloptions\">Colourful options</h3>\r\n<p>There are many varieties of crepe myrtle available on the market. For a traditional small to medium garden tree for shade, privacy or as a garden feature, look for varieties in the \'Indian Summer\' series including ‘Acoma’ (white flowers), ‘Zuni’ (dark lavender), ‘Biloxi’ (pink) and ‘Tuscarora’ (heliotrope).</p>\r\n<p>The \'Diamonds in the Dark\' series has burgundy-red, almost black leaves with contrasting white, pink, purple or red flowers. The plants grow to a compact 3m high and 2.5m wide that makes them ideal as a small specimen tree, container tree or to plant together as a hedge or screen. Varieties include ‘Best Red’, ‘Blush’, ‘Pure White’ and ‘Crimson Red’.</p>\r\n<p>Crepe myrtles are also available as large shrubs just over 1m high. These smaller varieties suit small gardens or courtyards and can even be planted in containers. Look for named varieties and plant the colour and size that suits your needs. The \'Infinitini\' series offers a dwarf range that includes blooms in Bright Pink, Magenta, Orchid and Watermelon.</p>\r\n<h3 id=\"maintainingcrepemyrtles\">Maintaining crepe myrtles</h3>\r\n<p>When planting, select a well-drained spot with good air circulation and allow plenty of space for their branches to spread to minimise any need for hard pruning. Traditionally crepe myrtles were pruned hard in winter, cutting all the branches back to the main stem to encourage tall, straight, flowering branches. Unpruned trees develop a naturally elegant shape and still bloom prolifically so today most crepe myrtles are left unpruned. The range of compact varieties also means that pruning isn’t needed to maintain plant size in a small space.</p>\r\n<p>Do, however, give small plants a light trim after flowering to remove spent flower heads. If the plants produce suckering growth at their base, this should also be pruned away to reveal a slender clear trunk.</p>\r\n<p>Feed crepe myrtles in spring as new growth resumes. Although these trees are drought-hardy, new plantings should be watered well through their first few summers. Also provide extra water to older trees if late spring and summer is particularly dry.</p>','en_US',1,9,'Leafiny','2020-04-05',NULL,'2021-02-03 16:19:28','2021-02-03 16:20:08'),(4,'7-steps-to-veggie-garden-soil-prep','7 steps to veggie garden soil prep','7 steps to veggie garden soil prep',NULL,NULL,NULL,'Any experienced gardener will tell you that it’s all about the soil. But what does that mean? Soil provides air, moisture, nutrients and anchorage for our plants, all of which are needed to make them flourish. The better the soil is adapted to plant roots, the better the growth. Not many soils are ideal for growing productive plants without a bit of soil prep before planting begins.','<p><strong>Our 7 soil prep steps:</strong> follow these seven steps to create excellent planting soil in your vegetable garden.</p>\r\n<h3 id=\"step1cleanandclear\">Step 1: Clean and clear</h3>\r\n<p>To get started, remove all the weeds, unwanted plants and debris in the soil including roots, surface stones and rubbish. Pull weeds out by hand or dig them out. This preparation gets rid of impediments to growth but also removes sources of pests and diseases and reduces competition for moisture and nutrients. To remove persistent weeds, cut down or treat the weeds with an organic herbicide then cover the cleared area with clear plastic. The sun heats up the soil beneath the cover and kills the weed seeds preventing regrowth.</p>\r\n<h3 id=\"step2watchandwait\">Step 2: Watch and wait</h3>\r\n<p>If there’s time between soil preparation and planting, water the cleared soil then wait. This break allows weed seeds in the soil to germinate. As they appear turn them into the soil using a spade or chip them out with a hoe. Cover the area with a layer of organic mulch to prevent more weed growth. When it is time to plant, move aside the mulch to ready the planting area.</p>\r\n<h3 id=\"step3greenmanure\">Step 3: Green manure</h3>\r\n<p>If the soil isn’t going to be used for a season, plant a green manure crop rather than leave the soil fallow. A green manure crop is a legume crop such as fava beans that put nitrogen into the soil while it grows. The crop is then cut down before flowering and dug in thoroughly before the soil is planted.</p>\r\n<h3 id=\"step4dumpthelumps\">Step 4: Dump the lumps</h3>\r\n<p>Most soils contain hard bits such as stones and clods. These can impede plant roots making it hard for them to penetrate the soil. In a large vegetable space it may be necessary to rotary hoe the soil, especially if it is hard to dig. In a small area simply giving it a light dig with a spade followed by raking it level will locate any subsurface problems and create a soil that’s receptive to sowing seed or planting seedlings. Don’t overwork the soil as you will destroy natural organisms and structure. Never dig soil when it is wet. Clay soils that are hard to dig can be treated with gypsum, which is dug or watered into the soil.</p>\r\n<h3 id=\"step5addnutrients\">Step 5: Add nutrients</h3>\r\n<p>Most soils benefit from the addition of fertiliser before planting. Spread pelletised or granular fertiliser following the instructions on the packet and lightly dig or rake it in. Alternatively, add a layer of organic matter such as compost or animal manure and work it in to the soil. Ideally leave soils for a week after adding fresh manure and before planting. If digging is hard for you, spread organic matter over the soil surface then allow the natural processes such as earthworm activity and rain to combine it with the existing soil. Liquid composts are a no-dig way to incorporate organic material prior to planting and can improve soil structure.</p>\r\n<h3 id=\"step6addwater\">Step 6: Add water</h3>\r\n<p>After adding nutrients, water the soil. Check that water is penetrating and soaking into the soil. If the water fails to soak in, water it over with a soil wetting agent. Hose-on products are easy ways to apply soil wetters to a large area, or use a watering can for a smaller bed.</p>\r\n<h3 id=\"step7createplantingrows\">Step 7: Create planting rows</h3>\r\n<p>Most vegetables are easier to manage if they are planted in rows. Space the rows according to the needs of each crop. As a rule of thumb, large growers need more space between each row but follow the spacing information on the seed packet or seedling label. Also leave space to access the row for tending the crop. To create a planting row for seeds – also known as a drill - lay down a tool such as a rake with a long handle on the prepared soil. Push it down to make a depression. For plants that need a greater planting depth such as potatoes or asparagus, dig a planting trench. Some vegies such as pumpkin and zucchini do well in mounds. To create a planting mound, just add lots of well-rotted compost or manure and dig it in.</p>','en_US',1,9,'Leafiny','2020-08-18',NULL,'2021-02-03 16:25:30','2021-02-03 16:26:27'),(5,'hardy-plants-for-outdoor-pots','Hardy plants for outdoor pots','Hardy plants for outdoor pots',NULL,NULL,NULL,'Gardens and plants in outdoor containers may have taken a battering from the elements through last summer\'s drought and blazing heat, but now is not the time to throw in the trowel. Those extreme conditions actually revealed many plants that thrive with little fuss, even when it is hot and dry. Here are a few basic care tips and our top choices for tough outdoor plants to keep your garden looking great all year round, whatever the new season brings.','<h3 id=\"pottingmixmatters\">Potting mix matters</h3>\r\n<p>To keep plants growing well in containers, use a good quality, water-wise potting mix. If the plant has outgrown its pot (for example, the pot is full of roots, hard to wet or prone to blowing over), you should re-pot into a new, larger container with fresh potting mix. Gently wash the old mix away from the roots first.</p>\r\n<p>It is also vital to water pots regularly so they don’t dry out completely. Potting mixes that dry out to the point that they start to shrink away from the sides of the container will be hard to re-wet and may become water repellent. The plants in them will dieback or may even die. To recover a plant that’s dried out to this point, try soaking the entire container in a large bucket of water and using a liquid soil wetting agent, such as Wettasoil or Saturaid. Also consider re-potting into a new container.</p>\r\n<h3 id=\"checkthelocation\">Check the location</h3>\r\n<p>If a plant is struggling and not looking good, examine the area where it is situated. It may be in a spot that’s too hot (for example, facing the full heat of the western sun in summer), or reflected heat from nearby hot surfaces such as paving, walls or metal fences may be burning the plant. A little extra protection may make a lot of difference to the ability of your plant to survive. Try gentle pruning, then water well to get the plant to put on new growth over the cooler months.</p>\r\n<h3 id=\"dontneglect\">Don\'t neglect!</h3>\r\n<p>Where plants have died over summer, consider replacing them with a more these drought- and heat-hardy option. No matter how tough your plant is, though, it must be watered and protected when it is first planted until it becomes established in its new situation. Also remember to water when conditions are extremely hot and dry.</p>','en_US',1,9,'Leafiny','2020-12-10',NULL,'2021-02-03 16:31:45','2021-02-03 16:31:45'),(6,'how-to-recognise-treat-and-prevent-heat-damage-in-plants','How to recognise, treat and prevent heat damage in plants','How to recognise, treat and prevent heat damage in plants',NULL,NULL,NULL,'After months of extreme temperatures and scorching winds, many gardens have suffered so much heat damage that they look as if someone held a blowtorch over them. New growth is dry and brown, fruit may be cooked on the plant, and lawns have disappeared.','<p>The natural reaction to seeing burnt leaves and stems is to get out the secateurs or pruners and cut everything back. This is not the best approach while hot conditions are still on the horizon. Pruning encourages new growth, which in turn will be burnt by hot and dry conditions.</p>\r\n<p>The old burnt growth will continue to serve a purpose through the remaining hot weather, in that it will protect foliage and stems lower down the plant. By preventing those lower parts of the plant from heat damage, you\'re ensuring that when conditions improve, they can produce new shoots and help the plant to recover. Even dry lawns are giving protection to the root systems so that when the rain returns the grass can regrow.</p>\r\n<h3 id=\"preventingmoreheatdamage\">Preventing more heat damage</h3>\r\n<p>The best way to protect susceptible plants from heat damage is to shade them. This can be in the form of temporary covers on extreme heatwave days, such as old sheets that are removed when the sun goes down, or more permanent shading from shadecloth screens or sails. Potted plants can be moved into a shaded spot on a verandah or patio, or otherwise placed under trees while heat-wave conditions persist.</p>\r\n<p>It is also important to provide as much water to plants as possible. By providing shade, the plants are able to take up water to keep their leaves hydrated and cool throughout the day. While observing Sydney\'s current water restrictions, water plants that are likely to be heat-affected in the early morning and also in the evening wherever possible.</p>\r\n<p>Persistent hot weather can also lead to hydrophobic soils – these are soils that resist water so that it runs off rather than soaking in. Always check that soil and potting mix is absorbing water and that the moisture is soaking to the root zone. Where water is not soaking in, apply a soil wetting agent. Those products that are mixed up in a watering can or applied as a hose-on application, should change the hydrophobic nature of the soil immediately but repeat applications may be needed.</p>\r\n<h3 id=\"reflectedheat\">Reflected heat</h3>\r\n<p>Another source of heat that can burn plants is reflected heat from hard surfaces such as paving, paths, metal fences and the walls of buildings and garden structures. This type of heat can cause damage to low growth on plants. It can even heat up pots causing damage to the plant’s root system. Reflected heat can be extremely damaging, and often goes unnoticed until the damage appears.</p>\r\n<p>To reduce damage from reflected heat, move potted plants away from hot surfaces. Cover surfaces near permanent plantings with cardboard (such as flattened boxes) or by laying down shadecloth or old carpeting. It may look strange, but it is a temporary strategy to reduce plant damage. Also place cardboard or shadecloth between a hot metal fence and the plants growing next to the fence.</p>\r\n<p>Longer term, consider establishing climbing plants or a dense planting of shrubs along the fence to shade it and reduce reflected heat. Painting paths or hard surfaces and covering some areas of paving with groundcover plants (such as heat-loving, prostrate herbs) can also help reduce reflected heat in the future.</p>\r\n<p>Un-mulched soils also absorb heat during warm and sunny conditions. Bare soils may be hotter than the air temperature by 10C or more. Simply feeling the surface of bare earth on a hot day will reveal how hot soil can become. This excess heating not only robs soils of moisture, it can also cook the root systems of plants growing in those soils leading to dieback and even plant death.</p>\r\n<p>The solution is to cover soils with a 5cm layer of coarse mulch. In fire-prone areas select non-flammable materials such as pebbles, gravel or recycled glass.</p>','en_US',1,9,'Leafiny','2021-01-15',NULL,'2021-02-03 16:37:06','2021-02-03 16:37:06');
/*!40000 ALTER TABLE `blog_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_post_category`
--

DROP TABLE IF EXISTS `blog_post_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_post_category` (
  `category_id` int(10) unsigned NOT NULL,
  `post_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `category_id` (`category_id`,`post_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `blog_post_category_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `blog_post_category_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `blog_post` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_post_category`
--

LOCK TABLES `blog_post_category` WRITE;
/*!40000 ALTER TABLE `blog_post_category` DISABLE KEYS */;
INSERT INTO `blog_post_category` VALUES (9,3),(9,4),(9,5),(9,6);
/*!40000 ALTER TABLE `blog_post_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_post_comment`
--

DROP TABLE IF EXISTS `blog_post_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_post_comment` (
  `post_id` int(10) unsigned NOT NULL,
  `comment_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `post_id` (`post_id`,`comment_id`),
  KEY `comment_id` (`comment_id`),
  CONSTRAINT `blog_post_comment_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `blog_post` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `blog_post_comment_ibfk_2` FOREIGN KEY (`comment_id`) REFERENCES `social_comment` (`comment_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_post_comment`
--

LOCK TABLES `blog_post_comment` WRITE;
/*!40000 ALTER TABLE `blog_post_comment` DISABLE KEYS */;
INSERT INTO `blog_post_comment` VALUES (6,8);
/*!40000 ALTER TABLE `blog_post_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product`
--

DROP TABLE IF EXISTS `catalog_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product` (
  `product_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `path_key` varchar(255) NOT NULL,
  `sku` varchar(255) NOT NULL,
  `weight` decimal(12,2) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(12,2) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `language` varchar(5) NOT NULL DEFAULT 'en_US',
  `meta_title` varchar(255) DEFAULT '',
  `meta_description` varchar(255) DEFAULT '',
  `canonical` varchar(255) DEFAULT NULL,
  `robots` varchar(255) DEFAULT NULL,
  `breadcrumb` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `special_price` decimal(10,2) DEFAULT NULL,
  `options` text DEFAULT NULL,
  `tax_rule_id` int(10) unsigned DEFAULT NULL,
  `price_type` varchar(8) DEFAULT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `allow_backorders` int(1) NOT NULL DEFAULT 0,
  `max_allowed_quantity` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `path_key` (`path_key`,`language`),
  UNIQUE KEY `sku` (`sku`,`language`),
  KEY `tax_rule_id` (`tax_rule_id`),
  CONSTRAINT `catalog_product_ibfk_1` FOREIGN KEY (`tax_rule_id`) REFERENCES `commerce_tax_rule` (`rule_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product`
--

LOCK TABLES `catalog_product` WRITE;
/*!40000 ALTER TABLE `catalog_product` DISABLE KEYS */;
INSERT INTO `catalog_product` VALUES (4,'black-cardinal-philodendron','LFY0001',NULL,'Black Cardinal Philodendron',36.99,'<p>If you\'re looking for something lush and green in your home or garden, planting this dramatic Philodendron will add that tropical feel. A hardy, low maintenance variety that has strikingly large, glossy foliage in shades of chocolate, burgundy and deep bottle-green, complemented by deep red stems.</p>\r\n<p>It makes a lovely addition to an outdoor shaded area or add to a decorative pot and grow indoors. Very little care required once established. Clean the large leaves with a damp cloth.</p>',1,'en_US','Black Cardinal Philodendron',NULL,NULL,NULL,11,'2021-02-03 14:26:38','2022-03-24 09:27:45',NULL,NULL,1,'excl_tax',100,0,NULL),(6,'birds-nest-fern-antiquum','LFY0002',NULL,'Birds Nest Fern Antiquum',19.99,'<p>A hardy fern producing beautiful ruffled leaf margins that are a glossy light to dark green. The elongated leaves with their wavy edges, isn\'t your typical looking fern but it\'s what makes this an eye-catching plant. Plant in a shaded outdoor garden area, fernery or decorative pot. It thrives in a warm, shaded position where it\'s protected from frost. A low maintenance plant that requires very little care once established.</p>',1,'en_US','Birds Nest Fern Antiquum',NULL,NULL,NULL,11,'2021-02-03 14:28:49','2022-03-24 09:27:45',NULL,NULL,1,'excl_tax',100,0,NULL),(7,'calathea-assorted','LFY0003',NULL,'Calathea Assorted',24.99,'<p>A very popular indoor plant famous for their wide, green, colorful leaves. These wide leaves make them popular as well as their hardiness indoors.</p>',1,'en_US','Calathea Assorted',NULL,NULL,NULL,11,'2021-02-03 14:30:51','2022-03-24 09:27:45',NULL,NULL,1,'excl_tax',100,0,NULL),(8,'anthurium-princess-ariana','LFY0004',NULL,'Anthurium Princess Ariana',49.99,'<p>A spectacular tropical plant with heart-shaped leaves and striking flower spathes in hot pink. Ideal as a colourful indoor specimen plant. Suitable for outdoor sheltered sites in tropical areas. Grow in a sheltered position outdoors or indoors in a well lit position.</p>',1,'en_US','Anthurium Princess Ariana',NULL,NULL,NULL,11,'2021-02-03 14:32:21','2022-03-24 09:27:45',NULL,NULL,1,'excl_tax',99,0,NULL),(9,'anthurium-love-black','LFY0005',NULL,'Anthurium Love Black',47.99,'<p>Anthurium is a stylish and romantic plant that fits into any interior style. They are strong with prolonged flowering throughout the year. Fantastic beautiful plant with lots of flowers!</p>',1,'en_US','Anthurium Love Black',NULL,NULL,NULL,11,'2021-02-03 14:35:29','2022-03-24 09:27:45',NULL,NULL,1,'excl_tax',100,0,NULL),(10,'begonia-iron-cross','LFY0006',NULL,'Begonia Iron Cross',29.99,'<p>An attractive, reddish-brown iron cross pattern in the centre of the leaves makes this an interesting but easy to grow indoor plant. With contrasting bright-green, bristly, puckered leaves and sprays of pinkish-white flowers, that appear in spring and summer, makes this a wonderful plant in feature pots or decorative containers.</p>',1,'en_US','Begonia Iron Cross',NULL,NULL,NULL,11,'2021-02-03 14:45:05','2022-03-24 09:27:45',NULL,NULL,1,'excl_tax',100,0,NULL),(11,'afourer-mandarin','LFY0007',NULL,'Afourer Mandarin',49.99,'<p>Our Afourer Mandarin is a delicious mandarin with a rich, orange coloured flesh. It has a low seed count and a smooth, thin rind that peels easily. The mandarins grow to a medium size on a tree that\'s moderate in height and vigour. Its sweet, juicy flavour can be picked and enjoyed straight from the tree making it popular with growers.</p>\r\n<p>Protect from strong winds especially during flowering or while fruit is forming.</p>',1,'en_US','Afourer Mandarin',NULL,NULL,NULL,12,'2021-02-03 14:56:50','2022-03-24 09:27:45',NULL,NULL,1,'excl_tax',99,0,NULL),(12,'apple-golden-delicious-dwarf','LFY0008',NULL,'Apple Golden Delicious Dwarf',59.99,'<p>Golden Delicious Dwarf Apples have a lovely green foliage with pretty, white blossoms followed by sweet flavoured fruit.  The fruit has a delicate aromatic fragrance, with pale-green to yellow coloured skin and a creamy-green crisp flesh. Since it’s a dwarf variety on a dwarf rootstock it means it’s a small tree making it great for large tubs or smaller gardens.</p>',1,'en_US','Apple Golden Delicious Dwarf',NULL,NULL,NULL,12,'2021-02-03 14:58:08','2022-03-24 09:27:45',NULL,NULL,1,'excl_tax',100,0,NULL),(13,'apricot-moorpark','LFY0009',NULL,'Apricot Moorpark',69.99,'<p>One of the most popular home garden apricots because of its rich, sweet flavour and delicate aroma. Best eaten freshly picked from the tree, it\'s also excellent for preserves, jam, drying, juicing and stewing. Grafted on a dwarf root stock.</p>',1,'en_US','Apricot Moorpark',NULL,NULL,NULL,12,'2021-02-03 14:59:36','2022-03-24 09:27:45',NULL,NULL,1,'excl_tax',100,0,NULL),(14,'baby-spinach','LFY0010',NULL,'Baby Spinach',5.29,'<p>This popular leafy, green vegetable has small, edible, sweet tasting green leaves that can be picked as required. Ideal for full sun and part shade in gardens, window boxes and pots.</p>',1,'en_US','Baby Spinach',NULL,NULL,NULL,12,'2021-02-03 15:00:59','2022-03-24 09:27:45',NULL,NULL,1,'excl_tax',100,0,NULL),(15,'basil-sweet','LFY0011',NULL,'Basil Sweet',4.59,'<p>An annual herb with large, aromatic green leaves and small white flowers in summer. Ideal planted in a warm location either in herb gardens or pots and containers. Both the stems and leaves can be used in cooking as the stems are more flavoursome than the leaves and can be included in stews and casseroles, the leaves can also be used in salads, tomato dishes, sauces, pesto and pasta dishes.</p>',1,'en_US','Basil Sweet',NULL,NULL,NULL,12,'2021-02-03 15:55:41','2022-03-24 09:27:45',NULL,NULL,1,'excl_tax',100,0,NULL),(16,'bay-tree-miles-choice','LFY0012',NULL,'Bay Tree Miles Choice',89.95,'<p>Very hardy, evergreen small tree that can easily be pruned to size and shape has deep green, glossy, aromatic leaves with clusters of small fluffy yellow flowers in Spring. Ideal for full sun in gardens as a feature tree, topiary, hedging and pots. Leaves used as a herb in cooking.</p>',1,'en_US','Bay Tree Miles Choice',NULL,NULL,NULL,12,'2021-02-03 15:56:56','2022-03-24 09:27:45',NULL,NULL,1,'excl_tax',100,0,NULL),(17,'abelia-kaleidoscope','LFY0013',NULL,'Abelia Kaleidoscope',20.99,'<p>Add a touch of the tropics to your garden with this hardy, evergreen shrub. The Abelia Kaleidoscope brings dynamic colour to your outdoor landscape with its varied foliage throughout the year. Starting in spring, this plant has bright yellow, light green centered foliage that intensifies to a golden yellow with deep green markings in the summer months. By autumn, this combination turns to a bright orange, and changes again to a fiery red throughout the winter months. Dainty, white flowers also appear during summer. It is easy to grow and maintain, and perfect for both commercial and home garden schemes.</p>',1,'en_US','Abelia Kaleidoscope',NULL,NULL,NULL,13,'2021-02-03 15:58:40','2022-03-24 09:27:45',NULL,NULL,1,'excl_tax',100,0,NULL),(18,'alternanthera-brazillian-red-hot','LFY0014',NULL,'Alternanthera Brazillian Red Hot',15.99,'<p>Brighten up your garden all year round, with a rich display of attention grabbing groundcover. The Alternanthera Brazilian Red Hot produces hot pink foliage that creates an excellent contrast in any outdoor space. It makes an ideal feature shrub for garden beds, containers and patio pots.</p>',1,'en_US','Alternanthera Brazillian Red Hot',NULL,NULL,NULL,13,'2021-02-03 16:00:03','2022-03-24 09:27:45',NULL,NULL,1,'excl_tax',100,0,NULL),(19,'anise-hyssop','LFY0015',NULL,'Anise Hyssop',19.99,'<p>Fill your garden with a majestic display of foliage and flowers. The Anise Hyssop produces long, flowering stems that are topped with large, showy, floral spikes. With aromatic foliage when crushed or handled, this plant is tough, dry tolerant and fast growing. It is rich in nectar and attracts birds and butterflies when it flowers from summer to autumn.</p>',1,'en_US','Anise Hyssop',NULL,NULL,NULL,13,'2021-02-03 16:01:13','2022-03-24 09:27:45',NULL,NULL,1,'excl_tax',100,0,NULL),(20,'bougainvillea-temple-fire','LFY0016',NULL,'Bougainvillea Temple Fire',26.99,'<p>Add a point of interest to your garden with this spectacular show stopper. The Bougainvillea Temple Fire is a miniature, bushy shrub that produces coppery toned buds that flower into red purple bracts for most of the year. It is a smaller bred plant that is ideal for conservatories, patio pots, rockeries and garden beds.</p>',1,'en_US','Bougainvillea Temple Fire',NULL,NULL,NULL,13,'2021-02-03 16:02:55','2022-03-24 09:27:45',NULL,NULL,1,'excl_tax',100,0,NULL),(21,'coprosma-green-gold','LFY0017',NULL,'Coprosma Green & Gold',14.99,'<p>A very hardy and attractive evergreen shrub with large, glossy green leaves that have delightful gold edges. Ideal for hedging.</p>',1,'en_US','Coprosma Green & Gold',NULL,NULL,NULL,13,'2021-02-03 16:04:06','2022-03-24 09:27:45',NULL,NULL,1,'excl_tax',100,0,NULL),(22,'duranta-geisha-girl','LFY0018',NULL,'Duranta Geisha Girl',14.99,'<p>A tough and drought hardy shrub with sprays of deep purple blue flowers with white centres. With a long flowering season it creates a spectacular show. Ideal for hedging and screening or as a talking point in the garden.</p>',1,'en_US','Duranta Geisha Girl',NULL,NULL,NULL,13,'2021-02-03 16:05:28','2022-03-24 09:27:45',NULL,NULL,1,'excl_tax',100,0,NULL),(23,'acer-autumn-blaze','LFY0019',NULL,'Acer Autumn Blaze',149.99,'<p>Excellent autumn colouring. Very adaptable medium growing tree, for large yards, around buildings and avenue planting.</p>',1,'en_US','Acer Autumn Blaze',NULL,NULL,NULL,15,'2021-02-03 16:08:39','2022-03-24 09:27:45',NULL,NULL,1,'excl_tax',100,0,NULL),(24,'acer-negundo-kellys-gold','LFY0020',NULL,'Acer Negundo Kellys Gold',109.99,'<p>An attractive and hardy deciduous tree, Acer Negundo Kelly\'s Gold has vibrant yellow-green foliage which ages to a rich golden yellow in autumn. It has an upright, open shape making a great feature tree, and eventually a lovely shade tree and is best suited to larger gardens, driveway borders, or streetscapes.</p>',1,'en_US','Acer Negundo Kellys Gold',NULL,NULL,NULL,15,'2021-02-03 16:09:43','2022-04-08 13:36:07',89.00,NULL,1,'excl_tax',100,0,NULL),(25,'acer-palmatum','LFY0021',NULL,'Acer Palmatum',14.99,'<p>A treasured feature tree for their simple elegance and breathtaking, beautifully coloured autumn leaves. Its smooth attractive bark and fresh new spring growth will be a striking addition to your garden year-round. The trees take on a graceful shape as they mature. It\'s suited to garden beds or can be planted in large pots for patios or courtyards where the foliage can be viewed and appreciated up close. It can also be shaped into a bonsai.</p>',1,'en_US','Acer Palmatum',NULL,NULL,NULL,15,'2021-02-03 16:10:49','2022-03-24 09:27:45',NULL,NULL,1,'excl_tax',100,0,NULL),(26,'cherry-blossom-blireana','LFY0022',NULL,'Cherry Blossom Blireana',69.99,'<p>A flowering plum tree that makes an excellent show of lots of double-pink flowers followed by attractive bronzy-purple foliage. It\'s beautiful as an ornamental tree or in repeat planting for long driveways, avenues or screening.</p>',1,'en_US','Cherry Blossom Blireana',NULL,NULL,NULL,15,'2021-02-03 16:12:08','2022-03-24 09:27:45',NULL,NULL,1,'excl_tax',100,0,NULL),(27,'fraxinus-excelsior-aurea','LFY0023',NULL,'Fraxinus Excelsior Aurea',119.99,'<p>A large deciduous spreading tree with a rounded crown of greenish-yellow leaves which turn a brilliant golden yellow in autumn. In winter distinctive black buds contrast beautifuuly with the yellow branches.</p>',1,'en_US','Fraxinus Excelsior Aurea',NULL,NULL,NULL,15,'2021-02-03 16:13:45','2022-04-08 13:35:41',96.00,NULL,1,'excl_tax',100,0,NULL),(28,'lagerstroemia-natchez','LFY0024',NULL,'Lagerstroemia Natchez',23.99,'<p>Commonly called Crepe Myrtle, this stunning deciduous tree has green foliage crowned with masses of beautiful, white frilly flowers that appear in summer. The contrasting autumn foliage will also create a vivid display of colour in your garden. It can be grown as a hedge to line your front yard or used as a border, fence or beautiful feature tree.</p>',1,'en_US','Lagerstroemia Natchez',NULL,NULL,NULL,15,'2021-02-03 16:14:51','2022-03-24 09:27:45',NULL,NULL,1,'excl_tax',90,0,NULL);
/*!40000 ALTER TABLE `catalog_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_category`
--

DROP TABLE IF EXISTS `catalog_product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_category` (
  `category_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `category_id` (`category_id`,`product_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `catalog_product_category_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `catalog_product_category_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `catalog_product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_category`
--

LOCK TABLES `catalog_product_category` WRITE;
/*!40000 ALTER TABLE `catalog_product_category` DISABLE KEYS */;
INSERT INTO `catalog_product_category` VALUES (8,4),(8,6),(8,7),(8,8),(8,9),(8,10),(8,11),(8,12),(8,13),(8,14),(8,15),(8,16),(8,17),(8,18),(8,19),(8,20),(8,21),(8,22),(8,23),(8,24),(8,25),(8,26),(8,27),(8,28),(11,4),(11,6),(11,7),(11,8),(11,9),(11,10),(12,11),(12,12),(12,13),(12,14),(12,15),(12,16),(13,17),(13,18),(13,19),(13,20),(13,21),(13,22),(15,23),(15,24),(15,25),(15,26),(15,27),(15,28);
/*!40000 ALTER TABLE `catalog_product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `path_key` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `content` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `show_in_menu` int(11) NOT NULL DEFAULT 1,
  `language` varchar(5) NOT NULL DEFAULT 'en_US',
  `meta_title` varchar(255) DEFAULT '',
  `meta_description` varchar(255) DEFAULT '',
  `canonical` varchar(255) DEFAULT NULL,
  `robots` varchar(255) DEFAULT NULL,
  `inline_css` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `path_key` (`path_key`,`language`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (5,NULL,'contact','Contact',40,NULL,1,1,'en_US',NULL,NULL,'contact.html',NULL,NULL,'2020-12-01 15:53:44','2021-02-03 14:19:57'),(8,NULL,'products','Products',10,'<p>Looking for plants, pots, homewares, outdoor furniture and garden accessories? We\'re the home and garden people.</p>',1,1,'en_US','Products',NULL,NULL,NULL,NULL,'2021-02-03 14:17:04','2021-02-03 14:17:04'),(9,NULL,'garden-advice','Garden Advice',20,'<p>Discover garden tips, pest solutions and inspiration for your home.</p>',1,1,'en_US','Garden Advice',NULL,NULL,NULL,NULL,'2021-02-03 14:18:28','2021-02-03 14:18:28'),(10,NULL,'services','Services',30,NULL,1,1,'en_US','Services',NULL,NULL,NULL,'.blocks p {\r\ntext-align:center;\r\nmargin-bottom:0.6em;\r\n}\r\n\r\n.block-list-content {\r\nmin-height:230px;\r\n}','2021-02-03 14:19:50','2021-02-05 16:35:21'),(11,8,'indoor','Indoor',10,NULL,1,1,'en_US','Indoor',NULL,NULL,NULL,NULL,'2021-02-03 14:20:26','2021-02-03 14:20:26'),(12,8,'edible','Edible',20,NULL,1,1,'en_US','Edible',NULL,NULL,NULL,NULL,'2021-02-03 14:20:42','2021-02-03 14:20:42'),(13,8,'shrubs','Shrubs',30,NULL,1,1,'en_US','Shrubs',NULL,NULL,NULL,NULL,'2021-02-03 14:21:29','2021-02-03 14:21:29'),(15,8,'trees','Trees',40,NULL,1,1,'en_US','Trees',NULL,NULL,NULL,NULL,'2021-02-03 14:22:35','2021-02-03 16:07:27'),(16,NULL,'contact','Contact',40,NULL,1,1,'fr_FR',NULL,NULL,'contact.html',NULL,NULL,'2022-04-29 08:02:13','2022-04-29 08:02:13');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_block`
--

DROP TABLE IF EXISTS `cms_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_block` (
  `block_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `path_key` varchar(255) NOT NULL,
  `content` text DEFAULT NULL,
  `language` varchar(5) NOT NULL DEFAULT 'en_US',
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `position` int(11) DEFAULT 0,
  PRIMARY KEY (`block_id`),
  UNIQUE KEY `path_key` (`path_key`,`language`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_block`
--

LOCK TABLES `cms_block` WRITE;
/*!40000 ALTER TABLE `cms_block` DISABLE KEYS */;
INSERT INTO `cms_block` VALUES (3,'copyright','<p>Leafiny © {{ \"now\"|date(\"Y\") }}</p>','en_US',1,'2020-12-01 14:53:30','2021-03-02 08:39:36',0),(4,'copyright','<p>Leafiny © {{ \"now\"|date(\"Y\") }}</p>','fr_FR',1,'2020-12-01 14:53:30','2021-03-02 08:39:22',0),(5,'footer-links','<ul><li><a href=\"{{ page.getBaseUrl }}\">Home</a></li><li><a href=\"{{ page.getBaseUrl }}privacy-policy.html\">Privacy Policy</a></li><li><a href=\"{{ page.getBaseUrl }}contact.html\">Contact</a><br></li></ul>','en_US',1,'2020-12-01 14:53:30','2020-12-01 14:53:30',0),(6,'footer-links','<ul><li><a href=\"{{ page.getBaseUrl }}\">Accueil</a></li><li><a href=\"{{ page.getBaseUrl }}confidentialite.html\">Politique de confidentialité</a></li><li><a href=\"{{ page.getBaseUrl }}contact.html\">Contact</a><br></li></ul>','fr_FR',1,'2020-12-01 14:53:30','2020-12-01 14:53:30',0),(9,'service-garden-design','<p><strong>Garden Design</strong></p>\r\n<p><img src=\"{{ page.getMediaUrl }}gallery/garden-601d423a260cb.png\" alt=\"\" /></p>\r\n<p>Planning and preparation are the key elements to getting the best results from your new garden. Engage the services of a Garden Designer through our company.</p>','en_US',1,'2021-02-03 16:40:10','2022-05-03 21:10:45',10),(10,'service-landscape','<p><strong>Landscape construction & maintenance</strong></p>\r\n<p><img src=\"{{ page.getMediaUrl }}gallery/lanscape-601d423a2557a.png\" alt=\"\" /></p>\r\n<p>Got a vision in your head? Let us help you achieve the garden of your dreams – no matter whether you need a retaining wall, a new entertaining area or a set-and-forget irrigation system.</p>','en_US',1,'2021-02-03 16:41:10','2021-02-05 13:06:46',0),(11,'service-garden-care','<p><strong>Garden Care</strong></p>\r\n<p><img src=\"{{ page.getMediaUrl }}gallery/care-601d424c9c430.png\" alt=\"\" /></p>\r\n<p>Even the most avid gardeners get behind - and there’s nothing worse than trudging outside to do something that was once a joy, but now feels more like a chore. Enjoy your garden and let us take care of the rest.</p>','en_US',1,'2021-02-03 16:41:45','2021-02-05 13:06:20',0),(12,'service-rainwater-tank-installation','<p><strong>Rainwater Tank Installation</strong></p>\r\n<p><img src=\"{{ page.getMediaUrl }}gallery/water-601d741fb86b3.png\" alt=\"\" /></p>\r\n<p>The average household uses thousands of litres of drinking water each week – but there are other options available. A rainwater tank will capture and store water falling on your roof, to be used in a variety of ways.</p>','en_US',1,'2021-02-03 16:42:35','2021-02-05 16:37:35',0),(13,'service-timber-decking','<p><strong>Timber Decking</strong></p>\r\n<p><img src=\"{{ page.getMediaUrl }}gallery/wood-601d74165623e.png\" alt=\"\" /></p>\r\n<p>A timber deck is the solution to a range of living space dilemmas – more practical entertaining space, living space, room for the children to play – without the financial or mental headache of renovations.</p>','en_US',1,'2021-02-03 16:43:45','2021-02-05 16:37:17',0),(14,'service-professional-tree-services','<p><strong>Professional Tree Services</strong></p>\r\n<p><img src=\"{{ page.getMediaUrl }}gallery/tree-601d424c9d5b7.png\" alt=\"\" /></p>\r\n<p>Keeping your trees well-maintained and healthy not only enhances the value of your property, but also eliminates potential risks. We can tidy and prune your trees, as well as performing complete removal.</p>','en_US',1,'2021-02-03 16:44:11','2021-02-05 13:05:40',0);
/*!40000 ALTER TABLE `cms_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_block_category`
--

DROP TABLE IF EXISTS `cms_block_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_block_category` (
  `category_id` int(10) unsigned NOT NULL,
  `block_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `category_id` (`category_id`,`block_id`),
  KEY `block_id` (`block_id`),
  CONSTRAINT `cms_block_category_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cms_block_category_ibfk_2` FOREIGN KEY (`block_id`) REFERENCES `cms_block` (`block_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_block_category`
--

LOCK TABLES `cms_block_category` WRITE;
/*!40000 ALTER TABLE `cms_block_category` DISABLE KEYS */;
INSERT INTO `cms_block_category` VALUES (10,9),(10,10),(10,11),(10,12),(10,13),(10,14);
/*!40000 ALTER TABLE `cms_block_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_page`
--

DROP TABLE IF EXISTS `cms_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_page` (
  `page_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `path_key` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT '',
  `meta_title` varchar(255) DEFAULT '',
  `meta_description` varchar(255) DEFAULT '',
  `canonical` varchar(255) DEFAULT NULL,
  `robots` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `language` varchar(5) DEFAULT 'en_US',
  `status` int(11) NOT NULL DEFAULT 0,
  `breadcrumb` int(11) DEFAULT NULL,
  `inline_css` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`page_id`),
  UNIQUE KEY `path_key` (`path_key`,`language`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_page`
--

LOCK TABLES `cms_page` WRITE;
/*!40000 ALTER TABLE `cms_page` DISABLE KEYS */;
INSERT INTO `cms_page` VALUES (6,'privacy-policy','Privacy Policy','Privacy Policy',NULL,NULL,NULL,'<p>When you use our services, you\'re trusting us with your <strong>information</strong>.</p>','en_US',1,NULL,NULL,'2021-02-03 16:38:38','2021-02-03 16:38:38');
/*!40000 ALTER TABLE `cms_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_page_category`
--

DROP TABLE IF EXISTS `cms_page_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_page_category` (
  `category_id` int(10) unsigned NOT NULL,
  `page_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `category_id` (`category_id`,`page_id`),
  KEY `page_id` (`page_id`),
  CONSTRAINT `cms_page_category_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cms_page_category_ibfk_2` FOREIGN KEY (`page_id`) REFERENCES `cms_page` (`page_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_page_category`
--

LOCK TABLES `cms_page_category` WRITE;
/*!40000 ALTER TABLE `cms_page_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_page_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commerce_cart_rule`
--

DROP TABLE IF EXISTS `commerce_cart_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_cart_rule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `conditions` text DEFAULT NULL,
  `discount` decimal(5,2) DEFAULT 0.00,
  `option` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `expire` datetime DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT 0,
  `stop_rules_processing` int(11) NOT NULL DEFAULT 0,
  `has_coupon` int(11) NOT NULL DEFAULT 0,
  `coupon_number` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`rule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commerce_cart_rule`
--

LOCK TABLES `commerce_cart_rule` WRITE;
/*!40000 ALTER TABLE `commerce_cart_rule` DISABLE KEYS */;
INSERT INTO `commerce_cart_rule` VALUES (1,'Free shipping standard','Free shipping on standard method when subtotal is greater than 100',1,'[{\"field\":\"sale:incl_tax_subtotal_with_discount\",\"operator\":\"ge\",\"values\":[\"100\"]},{\"field\":\"sale:shipping_method\",\"operator\":\"eq\",\"values\":[\"standard\"]}]',100.00,NULL,'percent_shipping',NULL,10,0,0,0,'2022-04-06 13:47:38'),(2,'Free Gift','Gift added to the cart when subtotal is greater than 50',1,'[{\"field\":\"sale:incl_tax_subtotal\",\"operator\":\"ge\",\"values\":[\"50\"]}]',NULL,'LFY0007','free_gift',NULL,10,0,0,0,'2022-04-06 13:50:06'),(3,'Additional discount Indoor','20% additional discount if a product in Indoor category',1,'[{\"field\":\"product:category_ids\",\"operator\":\"eq\",\"values\":[\"11\"]}]',20.00,NULL,'percent_subtotal','2050-04-01 12:00:00',10,0,0,0,'2022-04-06 13:52:12'),(4,'Coupon newsletter','5% discount coupon sent in the newsletter',1,NULL,5.00,NULL,'percent_subtotal',NULL,20,0,1,1,'2022-04-06 13:54:04');
/*!40000 ALTER TABLE `commerce_cart_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commerce_cart_rule_coupon`
--

DROP TABLE IF EXISTS `commerce_cart_rule_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_cart_rule_coupon` (
  `coupon_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rule_id` int(10) unsigned NOT NULL,
  `code` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `used` int(10) unsigned NOT NULL DEFAULT 0,
  `limit` int(10) unsigned NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`coupon_id`),
  UNIQUE KEY `code` (`code`),
  KEY `rule_id` (`rule_id`),
  CONSTRAINT `commerce_cart_rule_coupon_ibfk_1` FOREIGN KEY (`rule_id`) REFERENCES `commerce_cart_rule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commerce_cart_rule_coupon`
--

LOCK TABLES `commerce_cart_rule_coupon` WRITE;
/*!40000 ALTER TABLE `commerce_cart_rule_coupon` DISABLE KEYS */;
INSERT INTO `commerce_cart_rule_coupon` VALUES (1,4,'LEAFINY5',1,1,1000,'2022-04-06 13:54:37');
/*!40000 ALTER TABLE `commerce_cart_rule_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commerce_sale`
--

DROP TABLE IF EXISTS `commerce_sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_sale` (
  `sale_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sale_increment_id` varchar(255) DEFAULT NULL,
  `sale_currency` char(3) DEFAULT NULL,
  `sale_comment` text DEFAULT NULL,
  `incl_tax_subtotal` decimal(10,2) DEFAULT NULL,
  `incl_tax_shipping` decimal(10,2) DEFAULT NULL,
  `incl_tax_discount` decimal(10,2) DEFAULT NULL,
  `excl_tax_subtotal` decimal(10,2) DEFAULT NULL,
  `excl_tax_shipping` decimal(10,2) DEFAULT NULL,
  `excl_tax_discount` decimal(10,2) DEFAULT NULL,
  `tax_subtotal` decimal(10,2) DEFAULT NULL,
  `tax_shipping` decimal(10,2) DEFAULT NULL,
  `tax_discount` decimal(10,2) DEFAULT NULL,
  `incl_tax_total` decimal(10,2) DEFAULT NULL,
  `excl_tax_total` decimal(10,2) DEFAULT NULL,
  `tax_total` decimal(10,2) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `customer` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT 'cart',
  `status` varchar(255) DEFAULT NULL,
  `shipping_method` varchar(255) DEFAULT NULL,
  `total_weight` decimal(10,2) DEFAULT NULL,
  `total_qty` int(11) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `payment_title` varchar(255) DEFAULT NULL,
  `payment_ref` varchar(255) DEFAULT NULL,
  `payment_state` varchar(255) DEFAULT NULL,
  `payment_data` text DEFAULT NULL,
  `invoice_increment_id` varchar(255) DEFAULT NULL,
  `agreements` int(11) NOT NULL DEFAULT 0,
  `language` varchar(5) NOT NULL DEFAULT 'en_US',
  `key` varchar(255) NOT NULL,
  `rule_ids` varchar(255) DEFAULT NULL,
  `coupon_code` varchar(255) DEFAULT NULL,
  `coupon_id` int(11) DEFAULT NULL,
  `coupon_rule_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `incl_tax_subtotal_with_discount` decimal(10,2) DEFAULT NULL,
  `excl_tax_subtotal_with_discount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`sale_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commerce_sale`
--

LOCK TABLES `commerce_sale` WRITE;
/*!40000 ALTER TABLE `commerce_sale` DISABLE KEYS */;
INSERT INTO `commerce_sale` VALUES (1,'OR1000001','USD',NULL,169.94,0.00,42.49,169.94,0.00,42.49,0.00,0.00,0.00,127.45,127.45,0.00,'john@example.com','John Doe','order','shipped','standard',0.00,7,'bank_transfer','Bank Transfer','624d9cc1c5337','pending','{\"redirect\":\"http:\\/\\/localhost.leafiny.en\\/checkout\\/order\\/complete\\/\"}','IN1000001',1,'en_US','3TETWTYMQNNuzIMM22klAMjckV0Djzj0jMjjN0RAU03OYZujMN','2,3,1,4','LEAFINY5',1,4,'2022-04-06 13:59:29','2022-04-06 13:58:56',NULL,NULL);
/*!40000 ALTER TABLE `commerce_sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commerce_sale_address`
--

DROP TABLE IF EXISTS `commerce_sale_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_sale_address` (
  `address_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sale_id` int(10) unsigned NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `company` varchar(255) NOT NULL DEFAULT '',
  `firstname` varchar(255) NOT NULL DEFAULT '',
  `lastname` varchar(255) NOT NULL DEFAULT '',
  `street_1` varchar(255) NOT NULL DEFAULT '',
  `street_2` varchar(255) NOT NULL DEFAULT '',
  `postcode` varchar(255) NOT NULL DEFAULT '',
  `telephone` varchar(255) NOT NULL DEFAULT '',
  `state_code` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `country_code` varchar(2) NOT NULL DEFAULT '',
  `same_as_shipping` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`address_id`),
  UNIQUE KEY `sale_id` (`sale_id`,`type`),
  CONSTRAINT `commerce_sale_address_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `commerce_sale` (`sale_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commerce_sale_address`
--

LOCK TABLES `commerce_sale_address` WRITE;
/*!40000 ALTER TABLE `commerce_sale_address` DISABLE KEYS */;
INSERT INTO `commerce_sale_address` VALUES (1,1,'shipping','','John','Doe','8901 Stewart Rd','','77554','(409) 356-9044','','Galveston','US',1),(2,1,'billing','','John','Doe','8901 Stewart Rd','','77554','(409) 356-9044','','Galveston','US',1);
/*!40000 ALTER TABLE `commerce_sale_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commerce_sale_history`
--

DROP TABLE IF EXISTS `commerce_sale_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_sale_history` (
  `history_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sale_id` int(10) unsigned NOT NULL,
  `status_code` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `operator` varchar(255) DEFAULT 'System',
  `mail_sent` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`history_id`),
  KEY `sale_id` (`sale_id`),
  CONSTRAINT `commerce_sale_history_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `commerce_sale` (`sale_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commerce_sale_history`
--

LOCK TABLES `commerce_sale_history` WRITE;
/*!40000 ALTER TABLE `commerce_sale_history` DISABLE KEYS */;
INSERT INTO `commerce_sale_history` VALUES (1,1,'pending_payment','Pending Payment','Your order has been registered, payment is pending','System',0,'2022-04-06 13:59:29'),(2,1,'processing','Processing','Your order is being prepared','Leafiny Demo',0,'2022-04-06 13:59:58'),(3,1,'shipped','Shipped','The package has been shipped\n\nTracking number: 1A2572U612\n\nTracking URL: https://example.com/tracking?number=1A2572U612','Leafiny Demo',0,'2022-04-06 14:00:58');
/*!40000 ALTER TABLE `commerce_sale_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commerce_sale_item`
--

DROP TABLE IF EXISTS `commerce_sale_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_sale_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `product_sku` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_path` varchar(255) DEFAULT NULL,
  `sale_id` int(10) unsigned NOT NULL,
  `qty` int(11) NOT NULL,
  `max_qty` int(11) NOT NULL,
  `incl_tax_unit` decimal(10,2) DEFAULT NULL,
  `excl_tax_unit` decimal(10,2) DEFAULT NULL,
  `incl_tax_row` decimal(10,2) DEFAULT NULL,
  `excl_tax_row` decimal(10,2) DEFAULT NULL,
  `weight_unit` decimal(10,2) DEFAULT NULL,
  `weight_row` decimal(10,2) DEFAULT NULL,
  `tax_rule_id` int(10) unsigned DEFAULT NULL,
  `tax_percent` decimal(5,2) DEFAULT NULL,
  `tax_amount_unit` decimal(10,2) DEFAULT NULL,
  `tax_amount_row` decimal(10,2) DEFAULT NULL,
  `custom_incl_tax_unit` decimal(10,2) DEFAULT NULL,
  `custom_excl_tax_unit` decimal(10,2) DEFAULT NULL,
  `discount_excl_tax_unit` decimal(10,2) DEFAULT NULL,
  `discount_incl_tax_unit` decimal(10,2) DEFAULT NULL,
  `discount_excl_tax_row` decimal(10,2) DEFAULT NULL,
  `discount_incl_tax_row` decimal(10,2) DEFAULT NULL,
  `discount_tax_unit` decimal(10,2) DEFAULT NULL,
  `discount_tax_row` decimal(10,2) DEFAULT NULL,
  `options` text DEFAULT NULL,
  `can_update` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`item_id`),
  KEY `sale_id` (`sale_id`),
  CONSTRAINT `commerce_sale_item_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `commerce_sale` (`sale_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commerce_sale_item`
--

LOCK TABLES `commerce_sale_item` WRITE;
/*!40000 ALTER TABLE `commerce_sale_item` DISABLE KEYS */;
INSERT INTO `commerce_sale_item` VALUES (1,28,'LFY0024','Lagerstroemia Natchez','lagerstroemia-natchez',1,5,95,23.99,23.99,119.95,119.95,NULL,0.00,1,0.00,0.00,0.00,NULL,NULL,6.00,6.00,29.99,29.99,0.00,0.00,NULL,1),(3,11,'LFY0007','Afourer Mandarin','afourer-mandarin',1,1,100,0.00,0.00,0.00,0.00,NULL,0.00,1,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'{\"free_gift\":2}',1),(4,8,'LFY0004','Anthurium Princess Ariana','anthurium-princess-ariana',1,1,100,49.99,49.99,49.99,49.99,NULL,0.00,1,0.00,0.00,0.00,NULL,NULL,12.50,12.50,12.50,12.50,0.00,0.00,NULL,1);
/*!40000 ALTER TABLE `commerce_sale_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commerce_sale_shipment`
--

DROP TABLE IF EXISTS `commerce_sale_shipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_sale_shipment` (
  `shipment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sale_id` int(10) unsigned NOT NULL,
  `shipping_method` varchar(255) DEFAULT NULL,
  `tracking_number` varchar(255) DEFAULT NULL,
  `tracking_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`shipment_id`),
  KEY `sale_id` (`sale_id`),
  CONSTRAINT `commerce_sale_shipment_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `commerce_sale` (`sale_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commerce_sale_shipment`
--

LOCK TABLES `commerce_sale_shipment` WRITE;
/*!40000 ALTER TABLE `commerce_sale_shipment` DISABLE KEYS */;
INSERT INTO `commerce_sale_shipment` VALUES (1,1,'standard','1A2572U612','https://example.com/tracking?number=1A2572U612','2022-04-06 14:00:58');
/*!40000 ALTER TABLE `commerce_sale_shipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commerce_sale_status`
--

DROP TABLE IF EXISTS `commerce_sale_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_sale_status` (
  `status_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `language` varchar(5) NOT NULL DEFAULT 'en_US',
  `comment` text DEFAULT NULL,
  PRIMARY KEY (`status_id`),
  UNIQUE KEY `code` (`code`,`language`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commerce_sale_status`
--

LOCK TABLES `commerce_sale_status` WRITE;
/*!40000 ALTER TABLE `commerce_sale_status` DISABLE KEYS */;
INSERT INTO `commerce_sale_status` VALUES (1,'pending_payment','Pending Payment','en_US','Your order has been registered, payment is pending'),(2,'pending','Pending','en_US','Your order is pending'),(3,'processing','Processing','en_US','Your order is being prepared'),(4,'shipped','Shipped','en_US','The package has been shipped'),(5,'canceled','Canceled','en_US','The order has been canceled'),(6,'refunded','Refunded','en_US','The order has been refunded');
/*!40000 ALTER TABLE `commerce_sale_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commerce_shipping`
--

DROP TABLE IF EXISTS `commerce_shipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_shipping` (
  `shipping_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `tax_rule_id` int(10) unsigned DEFAULT NULL,
  `price_type` varchar(8) DEFAULT NULL,
  `countries` text DEFAULT NULL,
  `states` text DEFAULT NULL,
  `postcodes` text DEFAULT NULL,
  `price_lines` int(11) NOT NULL DEFAULT 1,
  `priority` int(11) NOT NULL DEFAULT 0,
  `tracking_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`shipping_id`),
  UNIQUE KEY `method` (`method`),
  KEY `tax_rule_id` (`tax_rule_id`),
  CONSTRAINT `commerce_shipping_ibfk_1` FOREIGN KEY (`tax_rule_id`) REFERENCES `commerce_tax_rule` (`rule_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commerce_shipping`
--

LOCK TABLES `commerce_shipping` WRITE;
/*!40000 ALTER TABLE `commerce_shipping` DISABLE KEYS */;
INSERT INTO `commerce_shipping` VALUES (1,'Standard','standard',1,'excl_tax','*','*','*',1,10,'https://example.com/tracking?number={tracking_number}'),(2,'Express','express',1,'excl_tax','*','*','*',1,20,'https://example.com/tracking?number={tracking_number}');
/*!40000 ALTER TABLE `commerce_shipping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commerce_shipping_price`
--

DROP TABLE IF EXISTS `commerce_shipping_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_shipping_price` (
  `shipping_id` int(10) unsigned NOT NULL,
  `weight_from` decimal(10,2) NOT NULL DEFAULT 0.00,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  KEY `shipping_id` (`shipping_id`),
  CONSTRAINT `commerce_shipping_price_ibfk_1` FOREIGN KEY (`shipping_id`) REFERENCES `commerce_shipping` (`shipping_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commerce_shipping_price`
--

LOCK TABLES `commerce_shipping_price` WRITE;
/*!40000 ALTER TABLE `commerce_shipping_price` DISABLE KEYS */;
INSERT INTO `commerce_shipping_price` VALUES (1,0.00,5.90),(2,0.00,12.90);
/*!40000 ALTER TABLE `commerce_shipping_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commerce_tax`
--

DROP TABLE IF EXISTS `commerce_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_tax` (
  `tax_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rule_id` int(10) unsigned DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `tax_percent` decimal(5,2) DEFAULT NULL,
  `country_code` varchar(2) DEFAULT NULL,
  `state_code` varchar(10) DEFAULT NULL,
  `postcode` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`tax_id`),
  KEY `rule_id` (`rule_id`),
  CONSTRAINT `commerce_tax_ibfk_1` FOREIGN KEY (`rule_id`) REFERENCES `commerce_tax_rule` (`rule_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commerce_tax`
--

LOCK TABLES `commerce_tax` WRITE;
/*!40000 ALTER TABLE `commerce_tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `commerce_tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commerce_tax_rule`
--

DROP TABLE IF EXISTS `commerce_tax_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_tax_rule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commerce_tax_rule`
--

LOCK TABLES `commerce_tax_rule` WRITE;
/*!40000 ALTER TABLE `commerce_tax_rule` DISABLE KEYS */;
INSERT INTO `commerce_tax_rule` VALUES (1,'Default');
/*!40000 ALTER TABLE `commerce_tax_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_message`
--

DROP TABLE IF EXISTS `contact_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_message` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `is_open` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_message`
--

LOCK TABLES `contact_message` WRITE;
/*!40000 ALTER TABLE `contact_message` DISABLE KEYS */;
INSERT INTO `contact_message` VALUES (2,'John Doe','contact@example.com','Hello,\r\n\r\nThis is a great website!',1,'2020-12-01 15:52:28');
/*!40000 ALTER TABLE `contact_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_setup`
--

DROP TABLE IF EXISTS `core_setup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_setup` (
  `file` varchar(255) NOT NULL,
  UNIQUE KEY `file` (`file`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_setup`
--

LOCK TABLES `core_setup` WRITE;
/*!40000 ALTER TABLE `core_setup` DISABLE KEYS */;
INSERT INTO `core_setup` VALUES ('Leafiny_Attribute::210.upgrade.sql'),('Leafiny_Backend::100.upgrade.sql'),('Leafiny_Blog::200.upgrade.sql'),('Leafiny_Blog::201.upgrade.sql'),('Leafiny_Blog::202.upgrade.sql'),('Leafiny_Blog::203.upgrade.sql'),('Leafiny_CartRule::510.upgrade.sql'),('Leafiny_Catalog::200.upgrade.sql'),('Leafiny_Category::100.upgrade.sql'),('Leafiny_Category::101.upgrade.sql'),('Leafiny_Cms::200.upgrade.sql'),('Leafiny_Cms::201.upgrade.sql'),('Leafiny_Cms::202.upgrade.sql'),('Leafiny_Commerce::500.upgrade.sql'),('Leafiny_Commerce::501.upgrade.sql'),('Leafiny_Contact::100.upgrade.sql'),('Leafiny_Gallery::200.upgrade.sql'),('Leafiny_Gallery::201.upgrade.sql'),('Leafiny_Gallery::202.upgrade.sql'),('Leafiny_Gallery::203.upgrade.sql'),('Leafiny_Log::100.upgrade.sql'),('Leafiny_Redirect::100.upgrade.sql'),('Leafiny_Rewrite::100.upgrade.sql'),('Leafiny_Search::100.upgrade.sql'),('Leafiny_Social::100.upgrade.sql'),('Leafiny_Social::101.upgrade.sql');
/*!40000 ALTER TABLE `core_setup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_group`
--

DROP TABLE IF EXISTS `gallery_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gallery_group` (
  `group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `path_key` varchar(255) NOT NULL,
  `language` varchar(5) NOT NULL DEFAULT 'en_US',
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_group`
--

LOCK TABLES `gallery_group` WRITE;
/*!40000 ALTER TABLE `gallery_group` DISABLE KEYS */;
INSERT INTO `gallery_group` VALUES (1,'icons','en_US','Icons','folder',1,'2021-02-05 13:03:54','2021-02-05 13:03:54'),(2,'home-banner','en_US','Home banner','folder',1,'2022-08-01 12:40:55','2022-08-01 12:40:55');
/*!40000 ALTER TABLE `gallery_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_group_category`
--

DROP TABLE IF EXISTS `gallery_group_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gallery_group_category` (
  `category_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `category_id` (`category_id`,`group_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `gallery_group_category_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `gallery_group_category_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `gallery_group` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_group_category`
--

LOCK TABLES `gallery_group_category` WRITE;
/*!40000 ALTER TABLE `gallery_group_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `gallery_group_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_image`
--

DROP TABLE IF EXISTS `gallery_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gallery_image` (
  `image_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned NOT NULL,
  `entity_type` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `text` text DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 1,
  `status` int(11) NOT NULL DEFAULT 1,
  `class_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_image`
--

LOCK TABLES `gallery_image` WRITE;
/*!40000 ALTER TABLE `gallery_image` DISABLE KEYS */;
INSERT INTO `gallery_image` VALUES (9,4,'catalog_product','gallery/black-cardinal-philodendron-601ab29e225d9.jpg',NULL,NULL,NULL,1,1,NULL),(10,6,'catalog_product','gallery/birds-nest-fern-antiquum-601ab34169113.jpg',NULL,NULL,NULL,1,1,NULL),(11,7,'catalog_product','gallery/calathea-assorted-601ab39b94c6a.jpg',NULL,NULL,NULL,1,1,NULL),(12,8,'catalog_product','gallery/anthurium-princess-ariana-601ab3f5838e7.jpg',NULL,NULL,NULL,1,1,NULL),(13,9,'catalog_product','gallery/anthurium-love-black-601ab4b1e9803.jpg',NULL,NULL,NULL,1,1,NULL),(14,10,'catalog_product','gallery/begonia-iron-cross-601ab6f1d8f7d.jpg',NULL,NULL,NULL,1,1,NULL),(15,11,'catalog_product','gallery/afourer-mandarin-601ab9b23e2c9.jpg',NULL,NULL,NULL,1,1,NULL),(16,12,'catalog_product','gallery/apple-golden-delicious-dwarf-601aba00ac24d.jpg',NULL,NULL,NULL,1,1,NULL),(17,13,'catalog_product','gallery/apricot-moorpark-601aba5809358.jpg',NULL,NULL,NULL,1,1,NULL),(18,14,'catalog_product','gallery/baby-spinach-601abaabb8c03.jpg',NULL,NULL,NULL,1,1,NULL),(19,15,'catalog_product','gallery/basil-sweet-601ac77d5eb16.jpg',NULL,NULL,NULL,1,1,NULL),(20,16,'catalog_product','gallery/bay-tree-miles-choice-601ac7c822349.jpg',NULL,NULL,NULL,1,1,NULL),(21,17,'catalog_product','gallery/abelia-kaleidoscope-601ac830bdc70.jpg',NULL,NULL,NULL,1,1,NULL),(22,18,'catalog_product','gallery/alternanthera-brazillian-red-hot-601ac88385245.jpg',NULL,NULL,NULL,1,1,NULL),(23,19,'catalog_product','gallery/anise-hyssop-601ac8c9a2d01.jpg',NULL,NULL,NULL,1,1,NULL),(24,20,'catalog_product','gallery/bougainvillea-temple-fire-601ac92fbedf7.jpg',NULL,NULL,NULL,1,1,NULL),(25,21,'catalog_product','gallery/coprosma-green-gold-601ac9763bfbb.jpg',NULL,NULL,NULL,1,1,NULL),(26,22,'catalog_product','gallery/duranta-geisha-girl-601ac9c8c6d11.jpg',NULL,NULL,NULL,1,1,NULL),(27,23,'catalog_product','gallery/acer-autumn-blaze-601aca873397f.jpg',NULL,NULL,NULL,1,1,NULL),(28,24,'catalog_product','gallery/acer-negundo-kellys-gold-601acac781e9f.jpg',NULL,NULL,NULL,1,1,NULL),(29,25,'catalog_product','gallery/acer-palmatum-601acb0926713.jpg',NULL,NULL,NULL,1,1,NULL),(30,26,'catalog_product','gallery/cherry-blossom-blireana-601acb58cd0c8.jpg',NULL,NULL,NULL,1,1,NULL),(31,27,'catalog_product','gallery/fraxinus-excelsior-aurea-601acbb9b8a5b.jpg',NULL,NULL,NULL,1,1,NULL),(32,28,'catalog_product','gallery/lagerstroemia-natchez-601acbfb45d6f.jpg',NULL,NULL,NULL,1,1,NULL),(33,3,'blog_post','gallery/post-crepe-myrtle-601acd10844d6.jpg',NULL,NULL,NULL,1,1,NULL),(34,4,'blog_post','gallery/post-soil-header-601ace7ad57b1.jpg',NULL,NULL,NULL,1,1,NULL),(37,5,'blog_post','gallery/post-pot-cluster-octavia-carrying-pot-601ad5e379647.jpg',NULL,NULL,NULL,1,1,NULL),(39,6,'blog_post','gallery/post-heat-damage-header-601ad62d433bb.jpg',NULL,NULL,NULL,1,1,NULL),(42,1,'gallery_group','gallery/lanscape-601d423a2557a.png',NULL,NULL,NULL,3,1,NULL),(43,1,'gallery_group','gallery/garden-601d423a260cb.png',NULL,NULL,NULL,4,1,NULL),(44,1,'gallery_group','gallery/care-601d424c9c430.png',NULL,NULL,NULL,1,1,NULL),(45,1,'gallery_group','gallery/tree-601d424c9d5b7.png',NULL,NULL,NULL,1,1,NULL),(46,1,'gallery_group','gallery/wood-601d74165623e.png',NULL,NULL,NULL,5,1,NULL),(47,1,'gallery_group','gallery/water-601d741fb86b3.png',NULL,NULL,NULL,6,1,NULL),(50,2,'gallery_group','gallery/home-banner-1-62e8c885f4136.jpg','Speical Offer','/products.html',NULL,1,1,'banner-1'),(51,2,'gallery_group','gallery/home-banner-2-62e8c8860087e.jpg','Special Offer','/products.html',NULL,2,1,'banner-2');
/*!40000 ALTER TABLE `gallery_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_message`
--

DROP TABLE IF EXISTS `log_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_message` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message` text DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=284 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_message`
--

LOCK TABLES `log_message` WRITE;
/*!40000 ALTER TABLE `log_message` DISABLE KEYS */;
INSERT INTO `log_message` VALUES (106,'Object category with id 8 has been saved',6,'2021-02-03 14:17:04'),(107,'Object category with id 9 has been saved',6,'2021-02-03 14:18:28'),(108,'Object category with id 10 has been saved',6,'2021-02-03 14:19:50'),(109,'Object category with id 5 has been saved',6,'2021-02-03 14:19:57'),(110,'Object category with id 11 has been saved',6,'2021-02-03 14:20:26'),(111,'Object category with id 12 has been saved',6,'2021-02-03 14:20:42'),(112,'Object category with id 13 has been saved',6,'2021-02-03 14:21:29'),(113,'Object category with id 14 has been saved',6,'2021-02-03 14:21:59'),(114,'Object category with id 15 has been saved',6,'2021-02-03 14:22:35'),(115,'Object catalog_product with id 4 has been saved',6,'2021-02-03 14:26:38'),(116,'Object catalog_product with id 4 has been saved',6,'2021-02-03 14:28:47'),(117,'Object catalog_product with id 6 has been saved',6,'2021-02-03 14:28:50'),(119,'Object catalog_product with id 7 has been saved',6,'2021-02-03 14:30:51'),(121,'Object catalog_product with id 8 has been saved',6,'2021-02-03 14:32:39'),(122,'Object catalog_product with id 9 has been saved',6,'2021-02-03 14:35:29'),(126,'Object catalog_product with id 11 has been saved',6,'2021-02-03 14:56:50'),(131,'Object catalog_product with id 15 has been saved',6,'2021-02-03 15:55:41'),(136,'Object catalog_product with id 20 has been saved',6,'2021-02-03 16:02:55'),(137,'Object catalog_product with id 21 has been saved',6,'2021-02-03 16:04:06'),(138,'Object catalog_product with id 22 has been saved',6,'2021-02-03 16:05:28'),(139,'Object category with id 14 has been deleted',6,'2021-02-03 16:07:21'),(140,'Object category with id 15 has been saved',6,'2021-02-03 16:07:27'),(141,'Object catalog_product with id 23 has been saved',6,'2021-02-03 16:08:39'),(142,'Object catalog_product with id 24 has been saved',6,'2021-02-03 16:09:43'),(143,'Object catalog_product with id 25 has been saved',6,'2021-02-03 16:10:49'),(144,'Object catalog_product with id 26 has been saved',6,'2021-02-03 16:12:08'),(145,'Object catalog_product with id 27 has been saved',6,'2021-02-03 16:13:45'),(146,'Object catalog_product with id 28 has been saved',6,'2021-02-03 16:14:51'),(147,'Object blog_post with id 3 has been saved',6,'2021-02-03 16:19:28'),(148,'Object blog_post with id 3 has been saved',6,'2021-02-03 16:20:08'),(149,'Object blog_post with id 4 has been saved',6,'2021-02-03 16:25:30'),(155,'Object cms_block with id 9 has been saved',6,'2021-02-03 16:40:11'),(156,'Object cms_block with id 10 has been saved',6,'2021-02-03 16:41:10'),(158,'Object cms_block with id 12 has been saved',6,'2021-02-03 16:42:35'),(162,'Object cms_block with id 14 has been saved',6,'2021-02-03 16:44:25'),(163,'Object social_comment with id 8 has been saved',6,'2021-02-03 16:46:41'),(164,'Object redirect with id 1 has been saved',6,'2021-02-03 16:48:08'),(165,'Object redirect with id 2 has been saved',6,'2021-02-03 16:48:43'),(166,'User Leafiny Demo is connected to backend',6,'2021-02-03 16:49:55'),(167,'Cache successfully flushed for config',6,'2021-02-03 16:50:43'),(168,'Object blog_post with id 5 has been saved',6,'2021-02-03 16:57:07'),(169,'Object blog_post with id 6 has been saved',6,'2021-02-03 16:57:31'),(170,'Object blog_post with id 6 has been saved',6,'2021-02-03 16:58:21'),(171,'Cache successfully flushed for config',6,'2021-02-03 16:58:42'),(172,'Cache successfully flushed for config',6,'2021-02-05 11:09:58'),(173,'Cache successfully flushed for config',6,'2021-02-05 13:03:31'),(174,'Object gallery_group with id 1 has been saved',6,'2021-02-05 13:03:54'),(175,'Object gallery_group with id 1 has been saved',6,'2021-02-05 13:04:12'),(176,'Object cms_block with id 13 has been saved',6,'2021-02-05 13:05:05'),(177,'Object cms_block with id 14 has been saved',6,'2021-02-05 13:05:40'),(178,'Object cms_block with id 12 has been saved',6,'2021-02-05 13:06:01'),(179,'Object cms_block with id 11 has been saved',6,'2021-02-05 13:06:20'),(180,'Object cms_block with id 10 has been saved',6,'2021-02-05 13:06:46'),(181,'Object cms_block with id 9 has been saved',6,'2021-02-05 13:07:02'),(182,'Cache successfully flushed for config',6,'2021-02-05 13:08:53'),(183,'Cache successfully flushed for config',6,'2021-02-05 13:09:25'),(184,'Object cms_page with id 7 has been saved',6,'2021-02-05 13:11:00'),(185,'Object cms_page with id 7 has been deleted',6,'2021-02-05 13:11:09'),(186,'Object category with id 10 has been saved',6,'2021-02-05 16:33:44'),(187,'Object cms_block with id 9 has been saved',6,'2021-02-05 16:34:10'),(188,'Object category with id 10 has been saved',6,'2021-02-05 16:35:21'),(189,'Object gallery_group with id 1 has been saved',6,'2021-02-05 16:36:47'),(190,'Object cms_block with id 13 has been saved',6,'2021-02-05 16:37:17'),(191,'Object cms_block with id 12 has been saved',6,'2021-02-05 16:37:35'),(192,'Object cms_block with id 4 has been saved',6,'2021-03-02 08:39:22'),(193,'Object cms_block with id 3 has been saved',6,'2021-03-02 08:39:36'),(194,'Cache successfully flushed for fpc',6,'2021-03-02 08:39:52'),(195,'Cache successfully flushed for config',6,'2021-03-02 08:40:51'),(196,'Object cart_rule with id 1 has been saved',6,'2022-03-24 10:36:02'),(197,'Object cart_rule with id 1 has been saved',6,'2022-03-24 10:36:28'),(198,'Object shipping with id 1 has been saved',6,'2022-03-24 10:38:21'),(199,'Object shipping with id 1 has been saved',6,'2022-03-24 10:39:36'),(200,'Object shipping with id 2 has been saved',6,'2022-03-24 10:40:01'),(201,'Object shipping with id 1 has been saved',6,'2022-03-24 10:40:07'),(202,'Object cart_rule with id 2 has been saved',6,'2022-03-24 10:46:32'),(203,'Object cart_rule with id 2 has been saved',6,'2022-03-24 10:47:30'),(204,'Object sale_history with id 2 has been saved',6,'2022-03-28 15:53:33'),(205,'Object sale_history with id 3 has been saved',6,'2022-03-28 15:53:37'),(206,'User Leafiny Demo is connected to backend',6,'2022-04-01 12:21:39'),(207,'Object admin_user with id 2 has been deleted',6,'2022-04-01 12:21:53'),(208,'User Leafiny Demo is connected to backend',6,'2022-04-01 12:22:45'),(209,'Object shipping with id 1 has been saved',6,'2022-04-06 13:34:14'),(210,'Object shipping with id 2 has been saved',6,'2022-04-06 13:34:50'),(211,'Object cart_rule with id 1 has been saved',6,'2022-04-06 13:47:38'),(212,'Object cart_rule with id 2 has been saved',6,'2022-04-06 13:50:06'),(213,'Object cart_rule with id 3 has been saved',6,'2022-04-06 13:52:12'),(214,'Object cart_rule with id 4 has been saved',6,'2022-04-06 13:54:04'),(215,'Object cart_rule with id 4 has been saved',6,'2022-04-06 13:54:37'),(216,'Object cart_rule with id 2 has been saved',6,'2022-04-06 13:55:51'),(217,'Object cart_rule with id 3 has been saved',6,'2022-04-06 13:57:19'),(218,'Object sale_history with id 2 has been saved',6,'2022-04-06 13:59:58'),(219,'Object sale_history with id 3 has been saved',6,'2022-04-06 14:00:58'),(220,'Object cart_rule with id 3 has been saved',6,'2022-04-06 15:05:39'),(221,'Object cart_rule with id 1 has been saved',6,'2022-04-07 12:42:43'),(222,'Object tax_rule with id 2 has been deleted',6,'2022-04-08 13:34:33'),(223,'Object catalog_product with id 27 has been saved',6,'2022-04-08 13:35:41'),(224,'Object catalog_product with id 24 has been saved',6,'2022-04-08 13:36:07'),(225,'Cache successfully flushed for search',6,'2022-04-26 10:01:45'),(226,'Cache successfully flushed for search',6,'2022-04-27 14:37:39'),(227,'Object category with id 16 has been saved',6,'2022-04-29 08:02:13'),(228,'Cache successfully flushed for search',6,'2022-05-02 08:49:59'),(229,'Object cms_block with id 9 has been saved',6,'2022-05-03 21:09:46'),(230,'Object cms_block with id 9 has been saved',6,'2022-05-03 21:10:45'),(232,'Object attribute with id 1 has been saved',6,'2022-07-20 11:44:03'),(234,'Object attribute with id 2 has been saved',6,'2022-07-20 11:46:30'),(235,'Object attribute with id 3 has been saved',6,'2022-07-20 11:47:16'),(236,'Object attribute with id 3 has been saved',6,'2022-07-20 11:49:23'),(238,'Object attribute with id 4 has been saved',6,'2022-07-20 11:53:42'),(240,'Object catalog_product with id 28 has been saved',6,'2022-07-20 11:56:53'),(242,'Object catalog_product with id 26 has been saved',6,'2022-07-20 11:57:41'),(244,'Object catalog_product with id 24 has been saved',6,'2022-07-20 11:58:47'),(269,'Object attribute with id 4 has been saved',6,'2022-07-27 21:56:35'),(270,'Object attribute with id 2 has been saved',6,'2022-07-27 21:56:39'),(271,'Object attribute with id 1 has been saved',6,'2022-07-27 21:56:44'),(272,'User Leafiny Demo is connected to backend',6,'2022-08-01 12:40:29'),(273,'Object gallery_group with id 2 has been saved',6,'2022-08-01 12:40:55'),(274,'Objects cms_block with ids 2,1 have been deleted',6,'2022-08-01 12:42:53'),(275,'Object gallery_group with id 2 has been saved',6,'2022-08-01 12:46:52'),(276,'Object gallery_group with id 2 has been saved',6,'2022-08-01 15:41:06'),(277,'Object gallery_group with id 2 has been saved',6,'2022-08-01 15:41:10'),(278,'Object gallery_group with id 2 has been saved',6,'2022-08-01 15:41:16'),(279,'Object gallery_group with id 2 has been saved',6,'2022-08-01 15:41:24'),(280,'User Leafiny Demo is connected to backend',6,'2022-08-02 06:46:24'),(281,'Object gallery_group with id 2 has been saved',6,'2022-08-02 06:47:34'),(282,'Object gallery_group with id 2 has been saved',6,'2022-08-02 06:48:16'),(283,'User Leafiny Demo is connected to backend',6,'2022-08-03 06:53:24');
/*!40000 ALTER TABLE `log_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_fulltext`
--

DROP TABLE IF EXISTS `search_fulltext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_fulltext` (
  `search_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `object_type` varchar(32) DEFAULT NULL,
  `object_id` int(10) unsigned NOT NULL,
  `language` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`search_id`),
  UNIQUE KEY `object_type` (`object_type`,`object_id`),
  FULLTEXT KEY `content` (`content`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_fulltext`
--

LOCK TABLES `search_fulltext` WRITE;
/*!40000 ALTER TABLE `search_fulltext` DISABLE KEYS */;
INSERT INTO `search_fulltext` VALUES (1,'LFY0001 Products Indoor Black Cardinal Philodendron <p>If you\'re looking for something lush and green in your home or garden, planting this dramatic Philodendron will add that tropical feel. A hardy, low maintenance variety that has strikingly large, glossy foliage in shades of chocolate, burgundy and deep bottle-green, complemented by deep red stems.</p>\r\n<p>It makes a lovely addition to an outdoor shaded area or add to a decorative pot and grow indoors. Very little care required once established. Clean the large leaves with a damp cloth.</p>','catalog_product',4,'en_US'),(2,'LFY0002 Products Indoor Birds Nest Fern Antiquum <p>A hardy fern producing beautiful ruffled leaf margins that are a glossy light to dark green. The elongated leaves with their wavy edges, isn\'t your typical looking fern but it\'s what makes this an eye-catching plant. Plant in a shaded outdoor garden area, fernery or decorative pot. It thrives in a warm, shaded position where it\'s protected from frost. A low maintenance plant that requires very little care once established.</p>','catalog_product',6,'en_US'),(3,'LFY0003 Products Indoor Calathea Assorted <p>A very popular indoor plant famous for their wide, green, colorful leaves. These wide leaves make them popular as well as their hardiness indoors.</p>','catalog_product',7,'en_US'),(4,'LFY0004 Products Indoor Anthurium Princess Ariana <p>A spectacular tropical plant with heart-shaped leaves and striking flower spathes in hot pink. Ideal as a colourful indoor specimen plant. Suitable for outdoor sheltered sites in tropical areas. Grow in a sheltered position outdoors or indoors in a well lit position.</p>','catalog_product',8,'en_US'),(5,'LFY0005 Products Indoor Anthurium Love Black <p>Anthurium is a stylish and romantic plant that fits into any interior style. They are strong with prolonged flowering throughout the year. Fantastic beautiful plant with lots of flowers!</p>','catalog_product',9,'en_US'),(6,'LFY0006 Products Indoor Begonia Iron Cross <p>An attractive, reddish-brown iron cross pattern in the centre of the leaves makes this an interesting but easy to grow indoor plant. With contrasting bright-green, bristly, puckered leaves and sprays of pinkish-white flowers, that appear in spring and summer, makes this a wonderful plant in feature pots or decorative containers.</p>','catalog_product',10,'en_US'),(7,'LFY0007 Products Edible Afourer Mandarin <p>Our Afourer Mandarin is a delicious mandarin with a rich, orange coloured flesh. It has a low seed count and a smooth, thin rind that peels easily. The mandarins grow to a medium size on a tree that\'s moderate in height and vigour. Its sweet, juicy flavour can be picked and enjoyed straight from the tree making it popular with growers.</p>\r\n<p>Protect from strong winds especially during flowering or while fruit is forming.</p>','catalog_product',11,'en_US'),(8,'LFY0008 Products Edible Apple Golden Delicious Dwarf <p>Golden Delicious Dwarf Apples have a lovely green foliage with pretty, white blossoms followed by sweet flavoured fruit.  The fruit has a delicate aromatic fragrance, with pale-green to yellow coloured skin and a creamy-green crisp flesh. Since it’s a dwarf variety on a dwarf rootstock it means it’s a small tree making it great for large tubs or smaller gardens.</p>','catalog_product',12,'en_US'),(9,'LFY0009 Products Edible Apricot Moorpark <p>One of the most popular home garden apricots because of its rich, sweet flavour and delicate aroma. Best eaten freshly picked from the tree, it\'s also excellent for preserves, jam, drying, juicing and stewing. Grafted on a dwarf root stock.</p>','catalog_product',13,'en_US'),(10,'LFY0010 Products Edible Baby Spinach <p>This popular leafy, green vegetable has small, edible, sweet tasting green leaves that can be picked as required. Ideal for full sun and part shade in gardens, window boxes and pots.</p>','catalog_product',14,'en_US'),(11,'LFY0011 Products Edible Basil Sweet <p>An annual herb with large, aromatic green leaves and small white flowers in summer. Ideal planted in a warm location either in herb gardens or pots and containers. Both the stems and leaves can be used in cooking as the stems are more flavoursome than the leaves and can be included in stews and casseroles, the leaves can also be used in salads, tomato dishes, sauces, pesto and pasta dishes.</p>','catalog_product',15,'en_US'),(12,'LFY0012 Products Edible Bay Tree Miles Choice <p>Very hardy, evergreen small tree that can easily be pruned to size and shape has deep green, glossy, aromatic leaves with clusters of small fluffy yellow flowers in Spring. Ideal for full sun in gardens as a feature tree, topiary, hedging and pots. Leaves used as a herb in cooking.</p>','catalog_product',16,'en_US'),(13,'LFY0013 Products Shrubs Abelia Kaleidoscope <p>Add a touch of the tropics to your garden with this hardy, evergreen shrub. The Abelia Kaleidoscope brings dynamic colour to your outdoor landscape with its varied foliage throughout the year. Starting in spring, this plant has bright yellow, light green centered foliage that intensifies to a golden yellow with deep green markings in the summer months. By autumn, this combination turns to a bright orange, and changes again to a fiery red throughout the winter months. Dainty, white flowers also appear during summer. It is easy to grow and maintain, and perfect for both commercial and home garden schemes.</p>','catalog_product',17,'en_US'),(14,'LFY0014 Products Shrubs Alternanthera Brazillian Red Hot <p>Brighten up your garden all year round, with a rich display of attention grabbing groundcover. The Alternanthera Brazilian Red Hot produces hot pink foliage that creates an excellent contrast in any outdoor space. It makes an ideal feature shrub for garden beds, containers and patio pots.</p>','catalog_product',18,'en_US'),(15,'LFY0015 Products Shrubs Anise Hyssop <p>Fill your garden with a majestic display of foliage and flowers. The Anise Hyssop produces long, flowering stems that are topped with large, showy, floral spikes. With aromatic foliage when crushed or handled, this plant is tough, dry tolerant and fast growing. It is rich in nectar and attracts birds and butterflies when it flowers from summer to autumn.</p>','catalog_product',19,'en_US'),(16,'LFY0016 Products Shrubs Bougainvillea Temple Fire <p>Add a point of interest to your garden with this spectacular show stopper. The Bougainvillea Temple Fire is a miniature, bushy shrub that produces coppery toned buds that flower into red purple bracts for most of the year. It is a smaller bred plant that is ideal for conservatories, patio pots, rockeries and garden beds.</p>','catalog_product',20,'en_US'),(17,'LFY0017 Products Shrubs Coprosma Green & Gold <p>A very hardy and attractive evergreen shrub with large, glossy green leaves that have delightful gold edges. Ideal for hedging.</p>','catalog_product',21,'en_US'),(18,'LFY0018 Products Shrubs Duranta Geisha Girl <p>A tough and drought hardy shrub with sprays of deep purple blue flowers with white centres. With a long flowering season it creates a spectacular show. Ideal for hedging and screening or as a talking point in the garden.</p>','catalog_product',22,'en_US'),(19,'LFY0019 Products Trees Acer Autumn Blaze <p>Excellent autumn colouring. Very adaptable medium growing tree, for large yards, around buildings and avenue planting.</p>','catalog_product',23,'en_US'),(20,'LFY0020 Products Trees Acer Negundo Kellys Gold <p>An attractive and hardy deciduous tree, Acer Negundo Kelly\'s Gold has vibrant yellow-green foliage which ages to a rich golden yellow in autumn. It has an upright, open shape making a great feature tree, and eventually a lovely shade tree and is best suited to larger gardens, driveway borders, or streetscapes.</p>','catalog_product',24,'en_US'),(21,'LFY0021 Products Trees Acer Palmatum <p>A treasured feature tree for their simple elegance and breathtaking, beautifully coloured autumn leaves. Its smooth attractive bark and fresh new spring growth will be a striking addition to your garden year-round. The trees take on a graceful shape as they mature. It\'s suited to garden beds or can be planted in large pots for patios or courtyards where the foliage can be viewed and appreciated up close. It can also be shaped into a bonsai.</p>','catalog_product',25,'en_US'),(22,'LFY0022 Products Trees Cherry Blossom Blireana <p>A flowering plum tree that makes an excellent show of lots of double-pink flowers followed by attractive bronzy-purple foliage. It\'s beautiful as an ornamental tree or in repeat planting for long driveways, avenues or screening.</p>','catalog_product',26,'en_US'),(23,'LFY0023 Products Trees Fraxinus Excelsior Aurea <p>A large deciduous spreading tree with a rounded crown of greenish-yellow leaves which turn a brilliant golden yellow in autumn. In winter distinctive black buds contrast beautifuuly with the yellow branches.</p>','catalog_product',27,'en_US'),(24,'LFY0024 Products Trees Lagerstroemia Natchez <p>Commonly called Crepe Myrtle, this stunning deciduous tree has green foliage crowned with masses of beautiful, white frilly flowers that appear in summer. The contrasting autumn foliage will also create a vivid display of colour in your garden. It can be grown as a hedge to line your front yard or used as a border, fence or beautiful feature tree.</p>','catalog_product',28,'en_US');
/*!40000 ALTER TABLE `search_fulltext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_words`
--

DROP TABLE IF EXISTS `search_words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_words` (
  `word` varchar(255) NOT NULL,
  `language` varchar(5) DEFAULT NULL,
  UNIQUE KEY `word` (`word`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_words`
--

LOCK TABLES `search_words` WRITE;
/*!40000 ALTER TABLE `search_words` DISABLE KEYS */;
INSERT INTO `search_words` VALUES ('abelia','en_US'),('acer','en_US'),('afourer','en_US'),('alternanthera','en_US'),('anise','en_US'),('anthurium','en_US'),('antiquum','en_US'),('apple','en_US'),('apricot','en_US'),('ariana','en_US'),('assorted','en_US'),('aurea','en_US'),('autumn','en_US'),('baby','en_US'),('basil','en_US'),('begonia','en_US'),('birds','en_US'),('black','en_US'),('blaze','en_US'),('blireana','en_US'),('blossom','en_US'),('bougainvillea','en_US'),('brazillian','en_US'),('calathea','en_US'),('cardinal','en_US'),('cherry','en_US'),('choice','en_US'),('coprosma','en_US'),('cross','en_US'),('delicious','en_US'),('duranta','en_US'),('dwarf','en_US'),('excelsior','en_US'),('fern','en_US'),('fire','en_US'),('fraxinus','en_US'),('geisha','en_US'),('girl','en_US'),('gold','en_US'),('golden','en_US'),('green','en_US'),('hyssop','en_US'),('iron','en_US'),('kaleidoscope','en_US'),('kellys','en_US'),('lagerstroemia','en_US'),('love','en_US'),('mandarin','en_US'),('miles','en_US'),('moorpark','en_US'),('natchez','en_US'),('negundo','en_US'),('nest','en_US'),('palmatum','en_US'),('philodendron','en_US'),('princess','en_US'),('spinach','en_US'),('sweet','en_US'),('temple','en_US'),('tree','en_US');
/*!40000 ALTER TABLE `search_words` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_comment`
--

DROP TABLE IF EXISTS `social_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_comment` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `note` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `language` varchar(5) NOT NULL DEFAULT 'en_US',
  `ip_address` varchar(255) DEFAULT NULL,
  `referer` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `entity_id` int(10) unsigned NOT NULL,
  `entity_type` varchar(255) NOT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_comment`
--

LOCK TABLES `social_comment` WRITE;
/*!40000 ALTER TABLE `social_comment` DISABLE KEYS */;
INSERT INTO `social_comment` VALUES (8,NULL,'John Doe','Thank you very much for this article!',NULL,1,'en_US','82.64.11.51','How to recognise, treat and prevent heat damage in plants',NULL,'2021-02-03 16:46:34','2022-07-27 21:52:55',6,'blog_post');
/*!40000 ALTER TABLE `social_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_redirect`
--

DROP TABLE IF EXISTS `url_redirect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_redirect` (
  `redirect_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source_identifier` varchar(255) NOT NULL,
  `target_identifier` varchar(255) NOT NULL,
  `redirect_type` int(11) NOT NULL DEFAULT 301,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`redirect_id`),
  UNIQUE KEY `source_identifier` (`source_identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_redirect`
--

LOCK TABLES `url_redirect` WRITE;
/*!40000 ALTER TABLE `url_redirect` DISABLE KEYS */;
INSERT INTO `url_redirect` VALUES (1,'/lfy0024.html','/lagerstroemia-natchez.html',301,'2020-12-01 15:53:44'),(2,'/lfy0023.html','/fraxinus-excelsior-aurea.html',301,'2021-02-03 16:48:43');
/*!40000 ALTER TABLE `url_redirect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_rewrite`
--

DROP TABLE IF EXISTS `url_rewrite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_rewrite` (
  `rewrite_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source_identifier` varchar(255) NOT NULL,
  `target_identifier` varchar(255) NOT NULL,
  `object_type` varchar(32) DEFAULT NULL,
  `is_system` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`rewrite_id`),
  UNIQUE KEY `source_identifier` (`source_identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_rewrite`
--

LOCK TABLES `url_rewrite` WRITE;
/*!40000 ALTER TABLE `url_rewrite` DISABLE KEYS */;
INSERT INTO `url_rewrite` VALUES (81,'/contact.html','/contact.html','category',1),(82,'/products.html','/category/products.html','category',1),(83,'/garden-advice.html','/category/garden-advice.html','category',1),(86,'/services.html','/category/services.html','category',1),(88,'/indoor.html','/category/indoor.html','category',1),(91,'/edible.html','/category/edible.html','category',1),(94,'/shrubs.html','/category/shrubs.html','category',1),(95,'/palms-tropical.html','/category/palms-tropical.html','category',1),(98,'/trees.html','/category/trees.html','category',1),(99,'/birds-nest-fern-antiquum.html','/product/birds-nest-fern-antiquum.html','catalog_product',1),(100,'/black-cardinal-philodendron.html','/product/black-cardinal-philodendron.html','catalog_product',1),(103,'/calathea-assorted.html','/product/calathea-assorted.html','catalog_product',1),(104,'/anthurium-princess-ariana.html','/product/anthurium-princess-ariana.html','catalog_product',1),(108,'/anthurium-love-black.html','/product/anthurium-love-black.html','catalog_product',1),(113,'/begonia-iron-cross.html','/product/begonia-iron-cross.html','catalog_product',1),(116,'/afourer-mandarin.html','/product/afourer-mandarin.html','catalog_product',1),(119,'/apple-golden-delicious-dwarf.html','/product/apple-golden-delicious-dwarf.html','catalog_product',1),(122,'/apricot-moorpark.html','/product/apricot-moorpark.html','catalog_product',1),(125,'/baby-spinach.html','/product/baby-spinach.html','catalog_product',1),(129,'/basil-sweet.html','/product/basil-sweet.html','catalog_product',1),(132,'/bay-tree-miles-choice.html','/product/bay-tree-miles-choice.html','catalog_product',1),(135,'/abelia-kaleidoscope.html','/product/abelia-kaleidoscope.html','catalog_product',1),(138,'/alternanthera-brazillian-red-hot.html','/product/alternanthera-brazillian-red-hot.html','catalog_product',1),(141,'/anise-hyssop.html','/product/anise-hyssop.html','catalog_product',1),(144,'/bougainvillea-temple-fire.html','/product/bougainvillea-temple-fire.html','catalog_product',1),(147,'/coprosma-green-gold.html','/product/coprosma-green-gold.html','catalog_product',1),(148,'/duranta-geisha-girl.html','/product/duranta-geisha-girl.html','catalog_product',1),(150,'/acer-autumn-blaze.html','/product/acer-autumn-blaze.html','catalog_product',1),(153,'/acer-negundo-kellys-gold.html','/product/acer-negundo-kellys-gold.html','catalog_product',1),(156,'/acer-palmatum.html','/product/acer-palmatum.html','catalog_product',1),(159,'/cherry-blossom-blireana.html','/product/cherry-blossom-blireana.html','catalog_product',1),(162,'/fraxinus-excelsior-aurea.html','/product/fraxinus-excelsior-aurea.html','catalog_product',1),(163,'/lagerstroemia-natchez.html','/product/lagerstroemia-natchez.html','catalog_product',1),(164,'/crepe-myrtle-the-perfect-summer-flowering-tree.html','/post/crepe-myrtle-the-perfect-summer-flowering-tree.html','blog_post',1),(166,'/7-steps-to-veggie-garden-soil-prep.html','/post/7-steps-to-veggie-garden-soil-prep.html','blog_post',1),(171,'/hardy-plants-for-outdoor-pots.html','/post/hardy-plants-for-outdoor-pots.html','blog_post',1),(172,'/how-to-recognise-treat-and-prevent-heat-damage-in-plants.html','/post/how-to-recognise-treat-and-prevent-heat-damage-in-plants.html','blog_post',1),(173,'/privacy-policy.html','/page/privacy-policy.html','cms_page',1),(178,'/test-page.html','/page/test-page.html','cms_page',1);
/*!40000 ALTER TABLE `url_rewrite` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-03  8:54:13
