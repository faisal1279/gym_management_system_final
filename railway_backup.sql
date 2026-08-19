-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: gym_management_system
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

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

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance` (
  `attendance_id` binary(16) NOT NULL,
  `date` date DEFAULT NULL,
  `present` bit(1) NOT NULL,
  `member_id` binary(16) DEFAULT NULL,
  PRIMARY KEY (`attendance_id`),
  UNIQUE KEY `UKgqs5mhd9qaa7u6s59e47tgqjr` (`member_id`,`date`),
  CONSTRAINT `FK7rj8q8pe272ib4mrpiudofhgy` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES ('kÚSjyGıüÕM`£qüY','2026-02-08','','ª52zIÔA…ûu{\Z¡iÙù'),('–| ﬁ«[Eπæß\0|GÏZR','2026-02-08','','oÅBtaE\r´5úÍK@É'),('‘3ØUyHM◊æ¬fôA™c','2026-02-06','','oÅBtaE\r´5úÍK@É'),('È*ﬁ!Ñå@>ìB≥!]iÆ','2026-02-06','','ª52zIÔA…ûu{\Z¡iÙù');
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog` (
  `id` binary(16) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `content` varchar(5000) DEFAULT NULL,
  `cover_image` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `published` bit(1) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `author_id` binary(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5cbqmw37fdmu9y8t96exf19es` (`author_id`),
  CONSTRAINT `FK5cbqmw37fdmu9y8t96exf19es` FOREIGN KEY (`author_id`) REFERENCES `user_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog`
--

LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
INSERT INTO `blog` VALUES ('@ì˘öA∑∏ˇ{πkﬁ','Lifestyle','<p>Many people treat fitness as a short-term goal, such as losing weight for an event or gaining muscle quickly. However, true fitness is a lifelong journey that requires consistency and dedication.</p>\n\n                                                                                                                <p>When fitness becomes a lifestyle, it becomes a natural part of your daily routine. You no longer see exercise as a burden but as an essential activity for your well-being.</p>\n\n                                                                                                                <p>A fitness lifestyle includes regular exercise, healthy eating, proper sleep, and stress management. These habits work together to improve overall health and quality of life.</p>\n\n                                                                                                                <p>One of the biggest advantages of adopting a fitness lifestyle is long-term health benefits. It reduces the risk of chronic diseases such as diabetes, heart disease, and obesity.</p>\n\n                                                                                                                <p><em>It also improves mental strength and discipline. People who follow a fitness lifestyle tend to be more focused, confident, and productive.</em></p>\n\n                                                                                                                <p>In conclusion, fitness should not be a temporary goal but a permanent lifestyle choice. <strong>Start small, stay consistent, and make</strong> it a part of your everyday life.</p>','627001aa-1180-4027-a462-d42e03a68573_istockphoto-1342504639-612x612.jpg','2026-04-04 00:25:41.718437','','Why Fitness is a Lifestyle, Not a Temporary Goal ¬≠∆í√Æ‚îê',NULL,' ˝ÔFûå«◊ëŒcd“'),('#è‰køçF=Ç#L*øH¨ñ','Lifestyle','<p>Joining a gym is not just about working out alone√î√á√∂it is about becoming part of a community. A gym environment provides motivation, support, and a sense of belonging that can make your fitness journey more enjoyable.</p>\n\n                                                                                                                <p>One of the biggest benefits of a gym community is motivation. Seeing others work hard encourages you to push your limits. Group workouts and training sessions create a positive and energetic atmosphere.</p>\n\n                                                                                                                <p>Professional trainers in a gym also play a crucial role. They guide members, correct their form, and help them achieve their goals safely. With expert support, you can avoid injuries and get better results.</p>\n\n                                                                                                                <p><em>Another advantage is access to modern equipment. A well-equipped gym offers a variety of machines and tools that allow you to perform different types of exercises. This variety keeps workouts interesting and effective.</em></p>\n\n                                                                                                                <p><strong>Social interaction is another important aspect. Meeting people with similar goals creates friendships and makes workouts more enjoyable. It also helps in building consistency.</strong></p>\n\n                                                                                                                <p>In conclusion, a gym community provides much more than just a place to exercise. It offers support, motivation, and a positive environment that helps you stay committed to your fitness goals.</p>','1b7fd7f0-434e-4903-aa3f-42d718bd5d49_how-to-do-mountain-climbers.jpeg','2026-04-04 00:21:31.347369','','Benefits of Joining a Gym Community ¬≠∆í√¶√ë',NULL,' ˝ÔFûå«◊ëŒcd“'),(',U\"K>Üç*4~Ã','Gym Tips','<p>Many people join the gym with enthusiasm but make common mistakes that slow down their progress or even cause injuries. Understanding these mistakes can help you achieve better results.</p>\n\n                                                                                                                <p>One of the most common mistakes is using incorrect form. Performing exercises without proper technique can lead to injuries and reduce effectiveness. Always focus on correct posture and movement.</p>\n\n                                                                                                                <p>Another mistake is skipping warm-ups. Warming up prepares your body for exercise and reduces the risk of injury. Similarly, skipping cool-down sessions can lead to muscle stiffness.</p>\n\n                                                                                                                <p>Overtraining is another issue. Many beginners think more workouts mean faster results, but this is not true. Overtraining can lead to fatigue and muscle damage. Rest days are essential for recovery.</p>\n\n                                                                                                                <p><em>Ignoring nutrition is also a big mistake. Without proper diet, your workouts will not give the desired results. Balance your diet with the right nutrients.</em></p>\n\n                                                                                                                <p><strong>Lastly, lack of consistency is a major problem. Going to the gym irregularly will not bring results. Stay committed to your routine.</strong></p>\n\n                                                                                                                <p>In conclusion, avoiding these common mistakes can help you achieve your fitness goals faster and more safely.</p>','6c772b95-7293-4045-a916-89b09c1bd101_5-Master-the-Squat-in-5-Easy-Steps.jpg','2026-04-04 00:24:56.529247','','Common Gym Mistakes and How to Avoid Them √î√ò√Æ',NULL,' ˝ÔFûå«◊ëŒcd“'),('7o!Ä˛œCµë…m/#≥Å™','Health & Fitness','<p>In modern life, many people spend long hours sitting at desks, using mobile devices, or working in front of computers. This sedentary lifestyle can lead to various health issues such as obesity, back pain, and low energy levels. Regular exercise is one of the most effective ways to combat these problems and maintain a healthy lifestyle.</p>\n\n                                                                                                                <p>Exercise helps improve cardiovascular health by strengthening the heart and improving blood circulation. Activities like <strong>running, cycling, and treadmill workouts</strong> can significantly reduce the risk of heart disease. Additionally, strength training exercises help build muscle mass, improve bone density, and increase metabolism.</p>\n\n                                                                                                                <p>Another important benefit of regular exercise is its positive impact on mental health. Physical activity reduces stress hormones and increases the production of endorphins, which help improve mood and reduce anxiety. Many people find that going to the gym helps them clear their minds and feel more relaxed.</p>\n\n                                                                                                                <p><em>Consistency is the most important factor when it comes to fitness. It is not about working out intensely for a few days but maintaining a regular routine over time. Even 30√î√á√¥45 minutes of daily exercise can bring noticeable improvements in health and fitness.</em></p>\n\n                                                                                                                <p>In conclusion, exercise is not just an option√î√á√∂it is a necessity for a healthy and balanced life. Making it a part of your daily routine can transform both your body and mind.</p>','f054141f-c871-49ed-8eaa-002272f19421_cheerful-athletic-black-man-doing-forward-lunge-exercising-near-laptop-watching-online-workout-tutorial-home-guy-training-428627411.webp','2026-04-04 00:17:33.042978','\0','The Importance of Regular Exercise in Daily Life ¬≠∆í√Ü¬¨','2026-04-04 00:18:51.253991',' ˝ÔFûå«◊ëŒcd“'),('I°y@·àLÎÆesî[	ô','Fitness','<p>for testing&nbsp;</p>','9349bf9d-f6d1-4a8d-83a0-be10df9c6d30_ChatGPT Image Jul 20, 2026, 05_31_47 AM.png','2026-08-13 01:26:41.000000','','testing',NULL,' ˝ÔFûå«◊ëŒcd“'),('l\r.–*DRª¯‚ÔEo˘˜','Nutrition','<p>Fitness is not only about working out; nutrition plays an equally important role. Without proper nutrition, it is difficult to achieve fitness goals such as weight loss or muscle gain. A balanced diet provides the energy and nutrients needed for effective workouts and recovery.</p>\n\n                                                                                                                <p>Protein is one of the most important nutrients for muscle growth. It helps repair and build muscle tissues after intense workouts. Foods like eggs, chicken, fish, and legumes are excellent sources of protein.</p>\n\n                                                                                                                <p>Carbohydrates are the body&rsquo;s main source of energy. They fuel your workouts and help you perform better. Complex carbohydrates such as brown rice, oats, and whole grains provide sustained energy throughout the day.</p>\n\n                                                                                                                <p>Healthy fats are also essential for overall health. They support hormone production and provide long-lasting energy. Sources of healthy fats include nuts, seeds, and avocados.</p>\n\n                                                                                                                <p><em>Hydration is often overlooked but is extremely important. Drinking enough water helps maintain energy levels, improves performance, and aids in recovery.</em></p>\n\n                                                                                                                <p>In conclusion, a proper balance of exercise and nutrition is the key to achieving fitness success. Eating the right foods at the right time can significantly enhance your results.</p>','e80c205f-dff3-46f2-8cb4-db0a6faceb6b_young-man-workout-fitness-club-260nw-2471712867.webp','2026-04-04 00:20:43.419478','','The Role of Nutrition in Fitness and Muscle Growth ¬≠∆í√ë√π',NULL,' ˝ÔFûå«◊ëŒcd“'),('πªÈrMîQ(JËY£&','Fitness Tips','<p>A daily workout routine can bring numerous benefits to your life, both physically and mentally. Even a short session of exercise every day can make a significant difference.</p>\n\n                                                                                                                <p>First, it improves overall health by strengthening the heart and muscles. Second, it helps maintain a healthy weight by burning calories regularly. Third, it boosts energy levels and reduces fatigue.</p>\n\n                                                                                                                <p>Daily workouts also improve mental health by reducing stress and anxiety. They enhance mood and promote better sleep. People who exercise regularly often feel more confident and positive.</p>\n\n                                                                                                                <p>Another benefit is improved discipline. Following a daily routine builds consistency and self-control, which can be applied to other areas of life as well.</p>\n\n                                                                                                                <p><em>Exercise also improves flexibility and posture, reducing the risk of injuries. It keeps your body active and prevents stiffness caused by long hours of sitting.</em></p>\n\n                                                                                                                <p>In conclusion, a daily workout routine is one of the best habits you can develop. It leads to a healthier, happier, and more productive life.</p>','18476a4f-5e8c-4d3f-971d-c87321db365b_Fit-man-doing-high-knees-cardio-exercise-548x428.jpg','2026-04-04 00:24:07.313860','','Top 10 Benefits of Daily Workout Routine √î¬£√†',NULL,' ˝ÔFûå«◊ëŒcd“'),('áÕúˇ 0Lt≤Ä+¡È˝','Weight Loss','<p>Losing weight is one of the most common fitness goals, but many people struggle to achieve it due to lack of proper knowledge and consistency. Weight loss is not about starving yourself or following extreme diets√î√á√∂it is about maintaining a balanced lifestyle.</p>\n\n                                                                                                                <p>The first step towards weight loss is understanding calorie balance. To lose weight, you need to burn more calories than you consume. This can be achieved through a combination of exercise and healthy eating habits. Cardio exercises such as running, cycling, and skipping are highly effective in burning calories.</p>\n\n                                                                                                                <p>Strength training is equally important for weight loss. Many people think lifting weights is only for muscle building, but it also helps burn fat by increasing metabolism. The more muscle mass you have, the more calories your body burns even at rest.</p>\n\n                                                                                                                <p><em>Diet plays a crucial role in weight loss. Avoid processed foods, sugary drinks, and excessive fast food. Instead, focus on whole foods like vegetables, fruits, lean proteins, and whole grains. Eating smaller portions and maintaining a consistent eating schedule can also help.</em></p>\n\n                                                                                                                <p>Another key factor is patience. Weight loss is a gradual process, and expecting quick results can lead to disappointment. Staying consistent with your workouts and diet will eventually bring results.</p>\n\n                                                                                                                <p><strong>In conclusion, weight loss becomes simple when you follow the right approach. Stay consistent, eat healthy, and trust the process.</strong></p>','e3351ce3-5342-49ea-8dd0-d771cb70a8da_GzLeM2yKQGigqMF7Mtu8vh.jpg','2026-04-04 00:22:33.093660','','Weight Loss Made Simple: A Complete Guide ¬≠∆í√∂√ë',NULL,' ˝ÔFûå«◊ëŒcd“'),('°µ1Ä¡E ®‰°ÂÛ…&','frfrrf','<p>frrrrrrrrr</p>\n<p>fr</p>','bd3577d3-f438-47ca-9737-94526757eb23_Copilot_20260618_022820.png','2026-08-09 00:17:20.550170','','hi',NULL,' ˝ÔFûå«◊ëŒcd“'),('ØR•TdJ¸ÑòÜeZ∑\0©','Muscle Gain','<p>Building muscle is a goal for many gym-goers, especially beginners who want to improve their strength and physique. However, starting the journey without proper guidance can lead to confusion and slow progress.</p>\n\n                                                                                                                <p>The first step in muscle building is following a structured workout plan. Focus on compound exercises such as squats, deadlifts, bench press, and pull-ups. These exercises target multiple muscle groups and provide better results.</p>\n\n                                                                                                                <p><strong>Progressive overload is the key principle of muscle growth. This means gradually increasing the weight or intensity of your workouts over time. Without progression, your muscles will not grow effectively.</strong></p>\n\n                                                                                                                <p>Rest and recovery are just as important as workouts. Muscles grow when you rest, not when you train. Ensure you get enough sleep and allow your muscles time to recover between workouts.</p>\n\n                                                                                                                <p><em>Nutrition is another critical factor. Protein intake should be sufficient to support muscle repair and growth. Combine protein with carbohydrates and healthy fats for balanced nutrition.</em></p>\n\n                                                                                                                <p>Consistency is the most important factor. Muscle building takes time, and results will not appear overnight. Stay dedicated, and you will see progress over time.</p>','aa4a18bb-ffc4-4ab9-8c0e-779f3e65fe85_how-many-push-ups-should-you-do-a-day-to-see-results.jpeg','2026-04-04 00:23:26.541394','','Muscle Building Tips for Beginners ¬≠∆í√Ö√Ø¬¥¬©√Ö',NULL,' ˝ÔFûå«◊ëŒcd“'),('ÎÙÛ›Ââ@≠ü0±C€^','Motivation','<p>Starting a fitness journey is easy, but staying consistent is the real challenge. Many people begin with excitement but lose motivation after a few weeks. Understanding how to stay motivated is essential for achieving long-term fitness goals.</p>\n\n                                                                                                                <p>One effective way to stay motivated is by setting clear and realistic goals. Instead of aiming for drastic changes, focus on small, achievable targets such as losing a few kilograms or improving endurance. Achieving these small goals builds confidence and keeps you motivated.</p>\n\n                                                                                                                <p>Another important factor is creating a workout routine that you enjoy. If you do not enjoy your workouts, it becomes difficult to stay consistent. Try different types of exercises such as weight training, cardio, or group workouts to find what suits you best.</p>\n\n                                                                                                                <p>Having a workout partner or joining a fitness community can also boost motivation. When you train with others, you feel encouraged and accountable. A supportive environment plays a big role in maintaining consistency.</p>\n\n                                                                                                                <p><em>Tracking progress is another powerful motivator. Keeping a record of your workouts, weight, and measurements helps you see improvements over time. This progress inspires you to keep going.</em></p>\n\n                                                                                                                <p>In the end, motivation comes and goes, but discipline is what keeps you moving forward. Stay consistent, stay focused, and never give up on your fitness journey.</p>','af4ac5f5-e7a2-4731-b9be-84fa86d5440b_leg-press.jpg','2026-04-04 00:20:06.830776','','How to Stay Motivated in Your Fitness Journey ¬≠∆í√∂√ë',NULL,' ˝ÔFûå«◊ëŒcd“');
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_image`
--

DROP TABLE IF EXISTS `blog_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_image` (
  `id` binary(16) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `blog_id` binary(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKat9q4c791rtra7wfa5s11skkd` (`blog_id`),
  CONSTRAINT `FKat9q4c791rtra7wfa5s11skkd` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_image`
--

LOCK TABLES `blog_image` WRITE;
/*!40000 ALTER TABLE `blog_image` DISABLE KEYS */;
INSERT INTO `blog_image` VALUES ('ëÂçB√G–∏t◊¡A‚éK','863a989a-6fea-43da-94a7-e64b49c0e44d_Tricep-pushdown-movement_ddb8dbd8-566d-4f55-99e0-36c35790234a_1224x.webp','ÎÙÛ›Ââ@≠ü0±C€^'),('÷∂1¢GôöçÓebïÜÙ','35f8c41e-f89d-40ea-a792-2a1d834e6463_Lat-pulldown-on-Mirafit-Lat-Pulldown-Machine.webp','ÎÙÛ›Ââ@≠ü0±C€^'),('ù„SJ êÍäØé.Ë	','d92cfe49-5282-4e55-be33-865bd23d82bf_Fit-man-doing-high-knees-cardio-exercise-548x428.jpg','πªÈrMîQ(JËY£&'),('Dâì:0G¯π¢F˘\Z9Åh','d97373d1-9397-4ecb-acea-79826f9270fb_9BP4SsAx7aSmc6gE5FFiGC.jpg','l\r.–*DRª¯‚ÔEo˘˜'),('4¨8∆GŸ´Âr˝GÜ`Ã','66e8f3c9-3964-4c5b-907f-08b1bbf8b8d5_Ryan-Push-Up.png','l\r.–*DRª¯‚ÔEo˘˜'),('>ΩÃ‘ÜMæ§Õ∞∂,1æ','8d4e7292-f334-452d-87c5-361800b71704_Bicycle_Exercise.webp','áÕúˇ 0Lt≤Ä+¡È˝'),('>N∂0qæG€üæ˛\nîáÖÊ','72f02d73-9cd1-49c8-a663-d08814a957fc_ds1.webp','@ì˘öA∑∏ˇ{πkﬁ'),('DÿœI∂üyV\'ê¬0','d135184b-a24f-42fd-b4ae-0ecdd3df8dd9_cheerful-athletic-black-man-doing-forward-lunge-exercising-near-laptop-watching-online-workout-tutorial-home-guy-training-428627411.webp',',U\"K>Üç*4~Ã'),('MÜÇ-\"xO§§ﬂ=','712a9ff9-69f3-4a83-82c8-b7476baeb036_how-to-do-a-push-up-plank-build-core-chest-and-triceps.jpeg','ØR•TdJ¸ÑòÜeZ∑\0©'),('O)~nåtHÑñ(∞•ŒÛVZ','b5530a37-c88d-4150-a73a-3cdd1f9df783_Push-Up-Exercises-1.jpg','ØR•TdJ¸ÑòÜeZ∑\0©'),('Z7+©Ç@è∫øN8]µ9ò','39224c12-f020-48a7-aa0b-9670c94bd73c_b1.webp','I°y@·àLÎÆesî[	ô'),('hL>¸‡4Nîê‡πõÏ±“','f854a578-2489-4377-8ec7-82cbf8711927_how-to-get-better-at-push-ups_c96cd61d-63d8-4bd0-a93e-e3a8dee52408.webp','7o!Ä˛œCµë…m/#≥Å™'),('lN+!*ËL€û§?‰‡›v','1f67e485-d2b5-4bf3-9469-704375948d8d_19-bodyweight-squat.avif','7o!Ä˛œCµë…m/#≥Å™'),('nÍÌ/‰±@∞é©√∆¿˛ä','81880910-4d5d-4a58-8cd8-6bcd4e4a954f_19-bodyweight-squat.avif',',U\"K>Üç*4~Ã'),('rL¬ã·˜D™ìtJ¸´Âä','8ff60ecc-a3b5-4197-8a18-03e75dc1d000_mountain-climbers.png','#è‰køçF=Ç#L*øH¨ñ'),('ä˚~∆rïAïê–Ê.BE¶','147b5dde-dc04-4730-acb6-36b07f178b6e_u732pcXisraDgMESrUvnNk.jpg','áÕúˇ 0Lt≤Ä+¡È˝'),('¶ö&0xµL≥ã{LlÚ~','416743ef-7b8a-431c-b2cc-f6cd3a202a00_2-muscles-worked.webp','ÎÙÛ›Ââ@≠ü0±C€^'),('¥ ™UZ»A™™]79öhûü','742b69c3-3bdc-4061-aa6c-f27274405791_high-knees-exercise-1296x728-header.webp','πªÈrMîQ(JËY£&'),('µxÜÓ±gG-£˙XTF∫8','9e684784-2258-44fc-ac31-da4c60db28d9_ds1.webp','I°y@·àLÎÆesî[	ô'),('∂ ˜ÑO€åˇÀ]ï.','d5e95d09-6ee1-4289-9c33-3eaf89acdc1a_u732pcXisraDgMESrUvnNk.jpg','#è‰køçF=Ç#L*øH¨ñ'),('ª™—„jLÑ^éÒPΩZ','2ecdb950-6e9d-4291-ae04-0f428969e6b1_how-to-get-better-at-push-ups_c96cd61d-63d8-4bd0-a93e-e3a8dee52408.webp','l\r.–*DRª¯‚ÔEo˘˜'),('Ω@dõsF`ç|W±Z˙óX','e82b1ab4-14d3-4a2f-8f63-dafdaafd86ed_mountain-climbers.png','ØR•TdJ¸ÑòÜeZ∑\0©'),('¿¿»úöGùI˛‹æJr','0fafec9c-4b89-42db-b904-9433860b06ab_b1.webp','@ì˘öA∑∏ˇ{πkﬁ'),('¡ÿQuDû∂ƒÁÊ`û´','b778e27a-5cdb-4b41-a8f3-9ca00d506cbb_young-man-workout-fitness-club-260nw-2471712867.webp','7o!Ä˛œCµë…m/#≥Å™'),('ÕÆÎ≠˚\0ISÆS8ƒSÒb)','28f238d4-7b84-46fe-8ba4-7309f27bfff5_66e8991460790ade1fac6d2a_maxresdefault (1).jpg',',U\"K>Üç*4~Ã'),('œ£€o…G#øœåã∂f“’','2e657a62-0654-426d-b3cd-239a2864475b_Xw8VaDaXRAstbCW84vib6g.jpg','πªÈrMîQ(JËY£&'),('◊õN¢I≤™º†Ú ∞','2ebefd94-f2bb-4ef3-bd48-cec0631f070d_bicycle-crunch.jpg','áÕúˇ 0Lt≤Ä+¡È˝'),('ﬁvﬂá.hA5ê`Ä!ÑA∆ï','cf2fa814-d10d-493b-aa03-5ec5cd0796e9_GzLeM2yKQGigqMF7Mtu8vh.jpg','#è‰køçF=Ç#L*øH¨ñ'),('ÂO\\≤~Nç‹éG8ùØ@','77b29f40-b53b-476a-a232-c0f9e220d646_Matt-WP.jpg','°µ1Ä¡E ®‰°ÂÛ…&'),('ıÚ⁄—/D˚àp‰mb{¯','54abaad0-7fff-4733-81bd-37038c4f5ce2_hq720.jpg','@ì˘öA∑∏ˇ{πkﬁ');
/*!40000 ALTER TABLE `blog_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_image`
--

DROP TABLE IF EXISTS `class_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_image` (
  `id` binary(16) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `class_id` binary(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKsmp7ueuwfw90obkvwod64tlx6` (`class_id`),
  CONSTRAINT `FKsmp7ueuwfw90obkvwod64tlx6` FOREIGN KEY (`class_id`) REFERENCES `gym_class` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_image`
--

LOCK TABLES `class_image` WRITE;
/*!40000 ALTER TABLE `class_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `class_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_schedule`
--

DROP TABLE IF EXISTS `class_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_schedule` (
  `id` binary(16) NOT NULL,
  `day_of_week` enum('FRIDAY','MONDAY','SATURDAY','SUNDAY','THURSDAY','TUESDAY','WEDNESDAY') NOT NULL,
  `end_time` time DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `class_id` binary(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKjom3qim1gccn8k4nvi0amhklh` (`class_id`),
  CONSTRAINT `FKjom3qim1gccn8k4nvi0amhklh` FOREIGN KEY (`class_id`) REFERENCES `gym_class` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_schedule`
--

LOCK TABLES `class_schedule` WRITE;
/*!40000 ALTER TABLE `class_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `class_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_message`
--

DROP TABLE IF EXISTS `contact_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_message` (
  `id` binary(16) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `message` varchar(5000) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `replied` bit(1) NOT NULL,
  `status` enum('NEW','READ','REPLIED') DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_message`
--

LOCK TABLES `contact_message` WRITE;
/*!40000 ALTER TABLE `contact_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercise`
--

DROP TABLE IF EXISTS `exercise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exercise` (
  `exercise_id` binary(16) NOT NULL,
  `active` bit(1) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `difficulty` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `target_muscle` varchar(255) DEFAULT NULL,
  `warning` varchar(500) DEFAULT NULL,
  `created_by` binary(16) DEFAULT NULL,
  PRIMARY KEY (`exercise_id`),
  KEY `FKnqmgrsed7lpfw7aowmow0l4xm` (`created_by`),
  CONSTRAINT `FKnqmgrsed7lpfw7aowmow0l4xm` FOREIGN KEY (`created_by`) REFERENCES `user_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercise`
--

LOCK TABLES `exercise` WRITE;
/*!40000 ALTER TABLE `exercise` DISABLE KEYS */;
INSERT INTO `exercise` VALUES ('29kêiˆO.±[êä˝.º','','2026-08-09 00:10:01.987666','Stand at a cable machine holding the rope or bar attachment. Push the handle down by extending your arms.','BEGINNER','Cable Tricep Pushdown','Arms','Keep your elbows close...',NULL),('7ZÜ,ÌE√âwƒPJoü€','','2026-08-09 00:10:01.987666',NULL,'BEGINNER','Jumping Jacks','Full Body',NULL,NULL),('@UZ÷ÈãL©Û∞“HóÜy','','2026-08-09 00:10:01.987666','Lie on your back and alternate touching elbows to opposite knees in a cycling motion.','INTERMEDIATE','Bicycle Crunch','Core','Avoid if you have neck strain.',NULL),('C¢#ña•GRúk¬áa“É','','2026-08-09 00:10:01.987666','Sit at the lat pulldown machine and grip the bar wide. Pull the bar down toward your chest while squeezing your back muscles.','BEGINNER','Lat Pulldown','Back','Do not lean too far back...',NULL),('aÃR±ØM§è9ŸAö9Œ','','2026-08-09 00:10:01.987666','Lie flat and raise your legs straight up while keeping your core engaged.','BEGINNER','Leg Raises','Core','Avoid if you have lower back pain.',NULL),('p¡üﬂNÿìHyb@)%','','2026-08-09 00:10:01.987666','Start in a plank position with your hands slightly wider than shoulder width.\n\n     Lower your body until your chest nearly touches the floor.\n\n     Keep your body straight and core tight.\n\n     Push back up to the starting position.','BEGINNER','Push Up','Chest','Avoid if you have shoulder or wrist injuries.',NULL),('Ü?õ,Omáà æ9’vt','','2026-08-09 00:10:01.987666','Stand upright with feet together.\n\n     Step forward with one leg and lower your hips until both knees are bent at about 90 degrees.\n\n     Push back to the starting position and switch legs.','BEGINNER','Forward Lunges','Legs','Avoid if you have knee ligament injuries.',NULL),('ä\r3È˝WMæñ«™1∞‡\Zg','','2026-08-09 00:10:01.987666','Lie on your back with knees bent and lift your upper body toward your knees.','BEGINNER','Sit Ups','Core','Avoid if you have lower back issues.',NULL),('¶¬}™ΩúIUÖñé”LÜäì','','2026-08-09 00:10:01.987666','Sit on the leg press machine and place your feet shoulder-width apart on the platform. Push the platform away by extending your legs.','BEGINNER','Leg Press','Legs','Do not lock your knees...',NULL),('™ç@„‡@Àâı∞µ˜˝1v','','2026-08-09 00:10:01.987666','Start in a push-up position.\n\n     Bring one knee toward your chest, then quickly switch legs.\n\n     Continue alternating legs in a running motion.','INTERMEDIATE','Mountain Climbers','Full Body','Not recommended for people with wrist or shoulder pain.',NULL),('≤ñ)àPH í˜¬Ì]>l®','','2026-08-09 00:10:01.987666','Start standing, drop into a squat, kick feet back to a plank, perform a push-up, jump forward and jump up.','ADVANCED','Burpees','Full Body','Avoid if you have heart or joint problems.',NULL),('∂q≤êï≈LÏóÖL√¶\\k∆','','2026-08-09 00:10:01.987666','Sit at the cable row machine and pull the handle toward your waist while squeezing your shoulder blades.','BEGINNER','Seated Row','Back','Avoid rounding your back...',NULL),('»1°å/O§†’uÃ1˚r','','2026-08-09 00:10:01.987666','Start in a forearm plank position with elbows directly under shoulders.\n\n     Keep your body in a straight line from head to heels.\n\n     Engage your core and hold the position.','BEGINNER','Plank Hold','Core','Stop if you feel pain in your lower back.',NULL),('·£~yÛI°âŸ•L;’','','2026-08-09 00:10:01.987666','Stand with your feet shoulder-width apart.\n\n     Lower your body by bending your knees and pushing your hips back.\n\n     Keep your chest up and back straight.\n\n     Return to standing position.','BEGINNER','Bodyweight Squat','Legs','Do not perform if you have severe knee pain.',NULL),('Ë|gøˆFö|Åúí/Æ','','2026-08-09 00:10:01.987666','Start in a push-up position.\n\n     Bring one knee toward your chest, then quickly switch legs.\n\n     Continue alternating legs in a running motion.','INTERMEDIATE','Mountain Climbers','Full Body','Not recommended for people with wrist or shoulder pain.',NULL),('ÌµŒ·¯°JªÇ§//f`;Ø','','2026-08-09 00:10:01.987666','Lie flat on a bench and grip the barbell slightly wider than shoulder width. Lower the bar to your chest and press it back up until your arms are fully extended.','INTERMEDIATE','Bench Press','Chest','Avoid if you have shoulder or chest injuries.',NULL),('Ù∂≠ RN¡Ü+”ÃÊÒ|','','2026-08-09 00:10:01.987666','Stand upright with your feet together and arms at your sides.\n\n     Jump while spreading your legs and raising your arms overhead.\n\n     Return to the starting position.','BEGINNER','Jumping Jacks','Full Body','Avoid if you have ankle or knee injuries.',NULL);
/*!40000 ALTER TABLE `exercise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercise_image`
--

DROP TABLE IF EXISTS `exercise_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exercise_image` (
  `id` binary(16) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `exercise_id` binary(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKb0coppb3ht52jqljob0xmidiy` (`exercise_id`),
  CONSTRAINT `FKb0coppb3ht52jqljob0xmidiy` FOREIGN KEY (`exercise_id`) REFERENCES `exercise` (`exercise_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercise_image`
--

LOCK TABLES `exercise_image` WRITE;
/*!40000 ALTER TABLE `exercise_image` DISABLE KEYS */;
INSERT INTO `exercise_image` VALUES ('	’Iô⁄EÖ[ˆ¡±∫','7af8baa6-f40d-4f5a-ace5-96519c5c83ba_66e8991460790ade1fac6d2a_maxresdefault (1).jpg','·£~yÛI°âŸ•L;’'),('óÑa◊XHIåˆ\\ˇßN`@','b6a9c626-37a3-4b0e-98de-dcaa61463e5e_Push-Up-Exercises-1.jpg','p¡üﬂNÿìHyb@)%'),('É€‘G©Z®yŒ3Ω','02c40f4d-4c57-42cc-ae52-1c956a71b0d8_6786c870ee8717d31a82f0a4_677e6acd61197024154c1738_AF_Blog_HERO_HowToUseTheLatPulldownMachine.jpeg','C¢#ña•GRúk¬áa“É'),('º≤◊£5DßNÇ}ÉVVÆ','8f6bbed1-29f9-4725-ad3e-a5efdc12ceaa_how-many-push-ups-should-you-do-a-day-to-see-results.jpeg','»1°å/O§†’uÃ1˚r'),('$W±üivB~éî‡Ω=AŒ','2a84a1a2-b968-4983-a0fe-36a727978ba2_9BP4SsAx7aSmc6gE5FFiGC.jpg','p¡üﬂNÿìHyb@)%'),('1æµÏîHuØ⁄…±Rf~','80c7fa99-e45e-4b79-8c0e-7ff9585c475c_67f015f49341927eeca662f0_67e301fcab24c92d48cb372e_AF-HERO_BenchPress%20(1).jpeg','ÌµŒ·¯°JªÇ§//f`;Ø'),('>S8øïDï§ <0{sÿ}','97f1d7df-a930-435e-9ae3-08f427b853c4_lat-pulldown-maschine.webp','C¢#ña•GRúk¬áa“É'),('CœoJG¬å∂yç~Œƒ','9152225b-54bf-4fe3-a1dc-906f6260783b_GzLeM2yKQGigqMF7Mtu8vh.jpg','ä\r3È˝WMæñ«™1∞‡\Zg'),('H√f“_Ü@¸∑ÏF›å~´','b1ce7683-d421-46e8-a1bb-f47cae52ace3_A_diagram_of_a_woman_showing_the_change_in_position_to_perform_Burpees_52648db3-20b9-419c-8648-c58a9351ca34.webp','≤ñ)àPH í˜¬Ì]>l®'),('J¯óG-óF‚Ω	mµjC','de075147-3867-4100-aead-8b63b9e1b779_Lat-pulldown-on-Mirafit-Lat-Pulldown-Machine.webp','C¢#ña•GRúk¬áa“É'),('N;±›oC.µ 7•9rÓ','365852d8-d60f-4662-9e1d-d906e91c1682_19-bodyweight-squat.avif','·£~yÛI°âŸ•L;’'),('Q⁄–≈N˙ò5∫ÏI=Ê','417a3e9a-c596-412c-b037-505dee5610ff_Ryan-Push-Up.png','p¡üﬂNÿìHyb@)%'),('Yπ9qòoCiö9éyòßnã','f87f4151-470b-45e3-b732-80a5b591aaec_5-Master-the-Squat-in-5-Easy-Steps.jpg','·£~yÛI°âŸ•L;’'),('\\≠]œÈÅ@†•:˘¶9%é…','94ffd7ba-3468-4f94-956b-f8f5b2b481bf_Xw8VaDaXRAstbCW84vib6g.jpg','aÃR±ØM§è9ŸAö9Œ'),('{Éb~cìL9òµm°pZ≥','fe7d8bfe-8cd6-411b-ad37-97369aa2b1d3_u732pcXisraDgMESrUvnNk.jpg','ä\r3È˝WMæñ«™1∞‡\Zg'),('~ï7ËDˇîÂ`\0⁄¯\\¿','2b6c0fb0-b81f-4871-ad8d-7c451ac776c1_Bicycle_Exercise.webp','@UZ÷ÈãL©Û∞“HóÜy'),('ü„’	@/ÅÍÖ&ä”3’','d8f36290-09b5-4664-81a0-ba59c15d5a12_Pushup-Mistakes-Body360-Fit.png','p¡üﬂNÿìHyb@)%'),('ïO€ºtÁE=ø:jØ+ì“','80674007-070d-4c6c-955d-f789a94ccede_black-guy-doing-forward-lunge-exercise-laptop-home-sporty-black-guy-doing-forward-lunge-exercise-training-front-laptop-219000134.webp','Ü?õ,Omáà æ9’vt'),('£ûG˜Ÿ∑Hä≥óÕwö\ZÂ','ae789204-121c-48ce-b649-045fe42f4876_cheerful-athletic-black-man-doing-forward-lunge-exercising-near-laptop-watching-online-workout-tutorial-home-guy-training-428627411.webp','Ü?õ,Omáà æ9’vt'),('ß<‚t	ÃNüΩúHT ⁄—÷','4d9ec68f-e2a3-437e-b454-c04032580116_GRT-two-people-jumping-jacks-1296x728-header.avif','Ù∂≠ RN¡Ü+”ÃÊÒ|'),('™“\n√ˇ@†B¥D ıæ◊','801a13ee-3a77-4787-aa49-ea5721e46d59_depositphotos_475663642-stock-illustration-guy-doing-jumping-jacks-home.jpg','Ù∂≠ RN¡Ü+”ÃÊÒ|'),('≥[	B$\nItΩÒå©B>∏','20830875-2244-4a07-b50f-954e44b9acd4_mountain-climbers.png','Ë|gøˆFö|Åúí/Æ'),('¬≥2\n√áDWñdß√9`L3','fc6f1bc8-7638-4003-9fa1-7f545f00ff9f_woman-doing-straight-leg-raise-on-yoga-mat.png','aÃR±ØM§è9ŸAö9Œ'),('«\Z9¬ÑL<ûxz‡√ﬁÔ•','2f27f27f-587c-4b03-95d7-a13674f2da36_how-to-do-a-push-up-plank-build-core-chest-and-triceps.jpeg','»1°å/O§†’uÃ1˚r'),('“!Ó	/EïùË*¢j∆','505f4193-ac06-4356-9949-686f3bdd84e7_Push-Up-Exercises-1.jpg','»1°å/O§†’uÃ1˚r'),('◊ô’RtEçä¡Sœ=ø}2','b4a3b259-1693-4615-a92c-55637ad54af1_bench-press-form.jpg','ÌµŒ·¯°JªÇ§//f`;Ø'),('€OMë—ÑEÜµ&µE>','727dd3c5-e800-4adc-b120-06dc61815e93_Push_Up.webp','p¡üﬂNÿìHyb@)%'),('ÊX´aÖBWå»–æ:†≈e','8571e914-0d27-4070-b0b5-75fdece1e561_bicycle-crunch.jpg','@UZ÷ÈãL©Û∞“HóÜy'),('¸»¢YªM$óuLõC','a7962b4d-7c08-4012-912c-97d22a397d33_how-to-do-mountain-climbers.jpeg','Ë|gøˆFö|Åúí/Æ'),('ˇa∫ÚTC!¨é¢r•Ic-','dacb6b12-f12d-4419-81c1-d79c2011ae68_burpee-1109.webp','≤ñ)àPH í˜¬Ì]>l®');
/*!40000 ALTER TABLE `exercise_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercise_video`
--

DROP TABLE IF EXISTS `exercise_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exercise_video` (
  `id` binary(16) NOT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `exercise_id` binary(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKkhoqda2y2698gglw6rls2d000` (`exercise_id`),
  CONSTRAINT `FKkhoqda2y2698gglw6rls2d000` FOREIGN KEY (`exercise_id`) REFERENCES `exercise` (`exercise_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercise_video`
--

LOCK TABLES `exercise_video` WRITE;
/*!40000 ALTER TABLE `exercise_video` DISABLE KEYS */;
INSERT INTO `exercise_video` VALUES ('å\"∑>˝BÖ≥É¸nÙ±/ø','https://youtu.be/8uoaYwS6iFM?si=Yu-1x2KxSNJR6Upj','·£~yÛI°âŸ•L;’'),('\nÌz°¿Ω@S¶@hçíj','https://youtu.be/n69-eVLtevc?si=2cmJUZbUoAl3f6-h','¶¬}™ΩúIUÖñé”LÜäì'),('s<6rAxùJˆº@ÃI','https://youtu.be/ruQ4ZwncXBg?si=El5hX03FQk69smrM','™ç@„‡@Àâı∞µ˜˝1v'),('c~\Zó@õ∏öPMˇ£a','https://youtu.be/y9RBpnR04B0?si=Q2Fnt4ylHB7XHUiC','≤ñ)àPH í˜¬Ì]>l®'),('+Ë®.	¸Lñå92=§ﬂ4','https://youtu.be/wnuLak2onoA?si=ZMuCVrY5KDhfL01h','@UZ÷ÈãL©Û∞“HóÜy'),('8íEnQE-∏FÌTè2¡','https://youtu.be/s3PPU_2z9qo?si=3QZZUrq6EVQHAxVw','ä\r3È˝WMæñ«™1∞‡\Zg'),('Fﬂ⁄±≤uG•ØG±∏Ÿ˛ZQ','https://youtu.be/A2b2EmIg0dA?si=OrnSMlN6lmmOoeDi','»1°å/O§†’uÃ1˚r'),('J(1ÚÁBÚú.Ñïö˜P','https://youtu.be/8EMbB0tCn7Q?si=vWtdePagJqefJm_X','¶¬}™ΩúIUÖñé”LÜäì'),('K6i)»(C»®YWïç≈à','https://youtu.be/CAwf7n6Luuc?si=Tn-wPMlZKr_z94Sz','C¢#ña•GRúk¬áa“É'),('MX>Iî¢Ì$W9ò”','https://youtu.be/5ER5Of4MOPI?si=Dwh6619gMFuZBCoW','ä\r3È˝WMæñ«™1∞‡\Zg'),('[8oO≈◊L°¢Í:ò/Ï','https://youtu.be/6LqqeBtFn9M?si=YTs99BeApsWDT9jW','»1°å/O§†’uÃ1˚r'),('\\Áêu#ÿB≤ah°oÜü&','https://youtu.be/zHsPDsYwEWs?si=LiYRXMKGCidT0vhe','aÃR±ØM§è9ŸAö9Œ'),('`√ ∞9eB.ª1ÚvHõÎ','https://youtu.be/qu1pqo-dbXM?si=L26RarOMPeK9w-A2','≤ñ)àPH í˜¬Ì]>l®'),('s◊çÌ»KÄ∫eOÌ˜á	','https://youtu.be/ZhiCSdOVJp0?si=zPlHV2nsd9eIYrPm','Ë|gøˆFö|Åúí/Æ'),('|‰<\0¸Lµ}t‹”Eﬁ','https://youtu.be/vwHG9Jfu4sw?si=kMGUwg1oyLmVbg7g','∂q≤êï≈LÏóÖL√¶\\k∆'),('ÜòWpÄ)I‘£qÃíÎ(œî','https://youtu.be/CsROhQ1onAg?si=noRZZnBtemy1S5Z7','∂q≤êï≈LÏóÖL√¶\\k∆'),('â»bÌTEqö_P$ ∂z‡','https://youtu.be/gRVjAtPip0Y?si=NYqnxlWmH2zk-RFg','ÌµŒ·¯°JªÇ§//f`;Ø'),('é »ÈuD2µb%Á‘ŸÅ','https://youtu.be/RuIdJSVTKO4?si=Hoe9fdEZxPvnjYA2','aÃR±ØM§è9ŸAö9Œ'),('ë1ª∑¢¢Gàéßì4™ÿ}','https://youtu.be/3TM-vVWuLYE?si=_mJI1lrYMTZnx1Ry','Ü?õ,Omáà æ9’vt'),('®Ä†‘‘KxºúåÓÎ≈','https://youtu.be/g8-Ge9S0aUw?si=JaYiZMBSYu5CzzuS','Ü?õ,Omáà æ9’vt'),('Æ»â/xG3õbo‚.N','https://youtu.be/CWpmIW6l-YA?si=bRY2-a6da9Hn_SVo','7ZÜ,ÌE√âwƒPJoü€'),('Æ.)€Hc°’∏ü‚3T','https://youtu.be/ZhiCSdOVJp0?si=zPlHV2nsd9eIYrPm','Ë|gøˆFö|Åúí/Æ'),('∂»≤$áñOÆí¢∞®≠4','https://youtu.be/-zLyUAo1gMw?si=aCeWI5uwg_us5yZY','29kêiˆO.±[êä˝.º'),('∫ì‹ÎAI™\"†XÌ8','https://youtu.be/CWpmIW6l-YA?si=bRY2-a6da9Hn_SVo','Ù∂≠ RN¡Ü+”ÃÊÒ|'),('¡£¸c{ÈOòöÿi¨∂∞ìz','https://youtu.be/vthMCtgVtFw?si=vtwK7n4hfg2FzHmR','ÌµŒ·¯°JªÇ§//f`;Ø'),('Õ∑„fH”Ω*g˜‚‚¸‘','https://youtu.be/kLh-uczlPLg?si=_VVK_bQguZvD4Osr','™ç@„‡@Àâı∞µ˜˝1v'),('Õ–¢o\0NªµÔ⁄Lq','https://youtu.be/ruQ4ZwncXBg?si=9SQXdLX0WCTSDtVY','Ë|gøˆFö|Åúí/Æ'),('‹ˇKÆ‡)OªΩ·V6Âiñç','https://youtu.be/SALxEARiMkw?si=GBvygJYQT0Kzy6jn','C¢#ña•GRúk¬áa“É'),('Ïs§kE}©>˝¯IY','https://youtu.be/eqg47ZuGZXQ?si=6XG0r8GqG3LroXMA','@UZ÷ÈãL©Û∞“HóÜy'),('q–?)AL[ä4àèºñÈ','https://www.youtube.com/watch?v=IODxDxX7oi4','p¡üﬂNÿìHyb@)%'),('ÛGÑÁ)≥E\rçÍb∆Â|§','https://youtu.be/CWpmIW6l-YA?si=bRY2-a6da9Hn_SVo','7ZÜ,ÌE√âwƒPJoü€'),('˜d◊∞NM¬ç”©ì≈ j','https://youtu.be/CWpmIW6l-YA?si=bRY2-a6da9Hn_SVo','Ù∂≠ RN¡Ü+”ÃÊÒ|'),('˘eˆGeÅGU«≠¬)','https://youtu.be/30PqX2zvK88?si=Mo0xrDthGBHVXVfM','·£~yÛI°âŸ•L;’'),('˝6OqéNKπçJâ»x','https://youtu.be/ZhiCSdOVJp0?si=dvm6LH41tIlM5_5y','™ç@„‡@Àâı∞µ˜˝1v'),('˛ûg≈¢@Ï†‹ôLñ>…j','https://youtu.be/_w-HpW70nSQ?si=LGPheWQ3lu84J2Z9','29kêiˆO.±[êä˝.º');
/*!40000 ALTER TABLE `exercise_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_image`
--

DROP TABLE IF EXISTS `gallery_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gallery_image` (
  `id` binary(16) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_image`
--

LOCK TABLES `gallery_image` WRITE;
/*!40000 ALTER TABLE `gallery_image` DISABLE KEYS */;
INSERT INTO `gallery_image` VALUES ('„\"<õì@dî√â˛‘⁄1’','Fitness','2026-04-04 00:10:27.725654','Our members pushing limits with intense strength training workouts to build muscle and endurance.','57c279d8-e5c4-49fa-914a-7e5c8dbe8deb_A_man_doing_seated_cable_row.webp','Strength Training Session'),('˘≈Ph	O†£?:¨bÔÔ','Nutrition','2026-04-04 00:11:14.654095','High-energy cardio sessions designed to improve stamina, burn calories, and boost heart health.','bef3fc3e-2e36-4c9c-a8ab-30a8f555ab98_cheerful-athletic-black-man-doing-forward-lunge-exercising-near-laptop-watching-online-workout-tutorial-home-guy-training-428627411.webp','Cardio Blast ¬≠∆í√∂√ë'),('X2≤?≤Hm∫õﬁYπr','Nutrition','2026-04-04 00:11:14.692106','High-energy cardio sessions designed to improve stamina, burn calories, and boost heart health.','f636c810-8a7a-4510-86b6-82ee62b56bb5_how-to-get-better-at-push-ups_c96cd61d-63d8-4bd0-a93e-e3a8dee52408.webp','Cardio Blast ¬≠∆í√∂√ë'),('$‚Y·Ã#OwΩlüjRa!9','Fitness','2026-04-04 00:10:27.530656','Our members pushing limits with intense strength training workouts to build muscle and endurance.','beca9894-35ea-483f-a15c-34e8b47284b7_ds2.webp','Strength Training Session'),('$Ù=ØZÃD$∞Èj*Ø¢k','Fitness','2026-04-04 00:10:27.713625','Our members pushing limits with intense strength training workouts to build muscle and endurance.','bcbc9639-0b93-4cad-b2c7-ce607c29a5a2_b1.webp','Strength Training Session'),('C©ôÄBp∂ÓM“ø∏\'','Fitness','2026-04-04 00:10:27.720629','Our members pushing limits with intense strength training workouts to build muscle and endurance.','31649a43-b68b-4346-a32b-e7a212f82272_hq720.jpg','Strength Training Session'),('h˚ó—¿K˘ÄŒ\"˚jVà','Fitness','2026-04-04 00:10:27.731632','Our members pushing limits with intense strength training workouts to build muscle and endurance.','65d2179b-479f-4267-8f88-b42690c5969e_istockphoto-1342504639-612x612.jpg','Strength Training Session'),('qw–Û…∂F¸äg≈%>Z[≥','Nutrition','2026-04-04 00:11:14.677083','High-energy cardio sessions designed to improve stamina, burn calories, and boost heart health.','da1bf3d3-3545-4e25-93b8-ff83d31c1d3a_19-bodyweight-squat.avif','Cardio Blast ¬≠∆í√∂√ë'),('ÖPß1”FŸ∏q∑ˆ\rPπ','Nutrition','2026-04-04 00:11:14.705148','High-energy cardio sessions designed to improve stamina, burn calories, and boost heart health.','191fc820-a85f-41c5-b488-ca919e272a6e_young-man-workout-fitness-club-260nw-2471712867.webp','Cardio Blast ¬≠∆í√∂√ë'),('†ÔÍ–#ÛNGèˇ––k`%3','Fitness','2026-04-04 00:10:27.707640','Our members pushing limits with intense strength training workouts to build muscle and endurance.','0e84abf1-6f56-46d3-8d5c-f0b542543da8_ds1.webp','Strength Training Session'),('´U≠UwıA3Ω{!-L√qD','Nutrition','2026-04-04 00:11:14.639635','High-energy cardio sessions designed to improve stamina, burn calories, and boost heart health.','980b22e7-3d6e-4f25-8e99-73579c786fd2_black-guy-doing-forward-lunge-exercise-laptop-home-sporty-black-guy-doing-forward-lunge-exercise-training-front-laptop-219000134.webp','Cardio Blast ¬≠∆í√∂√ë'),('∆ÌáÖÉ{FºÕ™õπ˙L™','Nutrition','2026-04-04 00:11:14.665623','High-energy cardio sessions designed to improve stamina, burn calories, and boost heart health.','7fd4c0f1-ea62-43d5-8c37-9079fa3ce24f_how-to-do-a-push-up-plank-build-core-chest-and-triceps.jpeg','Cardio Blast ¬≠∆í√∂√ë');
/*!40000 ALTER TABLE `gallery_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_video`
--

DROP TABLE IF EXISTS `gallery_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gallery_video` (
  `id` binary(16) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_video`
--

LOCK TABLES `gallery_video` WRITE;
/*!40000 ALTER TABLE `gallery_video` DISABLE KEYS */;
INSERT INTO `gallery_video` VALUES ('\n≈}õa)Jπ®Öûô≥:\n','Fitness','2026-04-04 00:12:13.494898','Our members pushing limits with intense strength training workouts to build muscle and endurance.','Strength Training Session','https://youtu.be/Epit6DSq_ww?si=xpNvDQU9pXfD-aaT'),('/ÂÂJ¶§HèLãQÄù’','Nutrition','2026-04-04 00:13:17.978901','Motivating group workouts where members train together and achieve fitness goals as a team.','Group Training Session ¬≠∆í√¶√ë','https://youtu.be/mtX-B5gbgmM?si=IINkIFHq9O7HlQsp'),('uôÉ∫≠7A1∫th∑¢î&N','Fitness','2026-04-04 00:13:43.656980','Expert trainers helping members maintain proper form and maximize results.','Trainer Guidance ¬≠∆í√Ñ¬ª','https://youtu.be/5ourM6YUQPU?si=PAXRTWq87AjftAIn'),('ªìã–H\"NR∏Xé«0\ra','Nutrition','2026-04-04 00:14:20.186851','Live action clips of workouts, exercises, and fitness routines inside our gym.','Workout in Action ¬≠∆í√Ñ√ë','https://youtu.be/JyV7mUFSpXs?si=P2O_6jEdA2RkWGNO'),('–6´ëmªMè¢ÀÉèÉüªø','Fitness','2026-04-04 00:12:49.490571','Capturing powerful workout moments from our daily gym activities and member routines.','Gym Workout Moments','https://youtu.be/f9TERHtc1LA?si=aqxJYE-74YfwusbL');
/*!40000 ALTER TABLE `gallery_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gym_class`
--

DROP TABLE IF EXISTS `gym_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gym_class` (
  `id` binary(16) NOT NULL,
  `active` bit(1) NOT NULL,
  `capacity` int(11) NOT NULL,
  `cover_image` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `description` varchar(5000) DEFAULT NULL,
  `duration` int(11) NOT NULL,
  `level` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `short_description` varchar(2000) DEFAULT NULL,
  `trainer_id` binary(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKrmrwmcjtgbgumb7s5yxxhlf3u` (`trainer_id`),
  CONSTRAINT `FKrmrwmcjtgbgumb7s5yxxhlf3u` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`trainer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gym_class`
--

LOCK TABLES `gym_class` WRITE;
/*!40000 ALTER TABLE `gym_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `gym_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_routine`
--

DROP TABLE IF EXISTS `member_routine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_routine` (
  `id` binary(16) NOT NULL,
  `active` bit(1) NOT NULL,
  `start_date` date DEFAULT NULL,
  `member_member_id` binary(16) DEFAULT NULL,
  `template_id` binary(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKsbx3x03cgls76oidxxurg2d01` (`member_member_id`),
  KEY `FKa8l5148gorfmqtvplyqml8e9a` (`template_id`),
  CONSTRAINT `FKa8l5148gorfmqtvplyqml8e9a` FOREIGN KEY (`template_id`) REFERENCES `routine_template` (`id`),
  CONSTRAINT `FKsbx3x03cgls76oidxxurg2d01` FOREIGN KEY (`member_member_id`) REFERENCES `members` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_routine`
--

LOCK TABLES `member_routine` WRITE;
/*!40000 ALTER TABLE `member_routine` DISABLE KEYS */;
INSERT INTO `member_routine` VALUES ('uèG<≈Aíø9µàv∆','','2026-03-16','ª52zIÔA…ûu{\Z¡iÙù','˘fôf[€A˙ñÄÇ@ßÌ'),('ÉüsjôJt£ôGö— L°','','2026-03-16','ª52zIÔA…ûu{\Z¡iÙù','˝ŒÇ\rø◊FÌÑtC˜ó»Ê7'),('Ëº5~ë‡@ZÖC˚∞¢¥È','','2026-03-16','ª52zIÔA…ûu{\Z¡iÙù','ælÇB≤Nm≥XH}$p');
/*!40000 ALTER TABLE `member_routine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members` (
  `member_id` binary(16) NOT NULL,
  `active` bit(1) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `due_amount` double NOT NULL,
  `end_date` date DEFAULT NULL,
  `height` double NOT NULL,
  `initialweight` double DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `membership_id` binary(16) DEFAULT NULL,
  `routine_template_id` binary(16) DEFAULT NULL,
  `trainer_id` binary(16) DEFAULT NULL,
  `user_id` binary(16) NOT NULL,
  PRIMARY KEY (`member_id`),
  UNIQUE KEY `UKda61ga2jecphdliwvkqyt6sw2` (`user_id`),
  KEY `FKtk89iy1bxa8bug9eu8b3153lk` (`membership_id`),
  KEY `FK7ivg78w3luoktys99nj140v6b` (`routine_template_id`),
  KEY `FKpuumgrbmt270og5275pwltnq` (`trainer_id`),
  CONSTRAINT `FK7ivg78w3luoktys99nj140v6b` FOREIGN KEY (`routine_template_id`) REFERENCES `routine_template` (`id`),
  CONSTRAINT `FKahx8rg6vvqwi9xxb1tw16fgy6` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`id`),
  CONSTRAINT `FKpuumgrbmt270og5275pwltnq` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`trainer_id`),
  CONSTRAINT `FKtk89iy1bxa8bug9eu8b3153lk` FOREIGN KEY (`membership_id`) REFERENCES `memberships` (`membership_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES ('oÅBtaE\r´5úÍK@É','','2026-02-08 14:47:45.613253',0,'2026-06-08',6,56,'2026-02-08','Ü’÷.W≠FÉØ˚âu¡*∫–',NULL,'º4Ò=\nJâ)E{Ó	ƒ','ﬂ(gkAO‘Ü@ü£Gœv£'),('ª52zIÔA…ûu{\Z¡iÙù','','2026-02-08 23:11:22.108035',0,'2027-02-08',6,59,'2026-02-08','ïSÑ6A¢è0«cØM´’',NULL,'º4Ò=\nJâ)E{Ó	ƒ','~—+Á€·IΩÜkπvsﬂ‹');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members_progress`
--

DROP TABLE IF EXISTS `members_progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members_progress` (
  `id` binary(16) NOT NULL,
  `bmi` double NOT NULL,
  `body_fat` double NOT NULL,
  `notes` varchar(500) DEFAULT NULL,
  `record_date` date DEFAULT NULL,
  `weight` double NOT NULL,
  `member_member_id` binary(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4w29bl62o73pj00vpiv7i0o91` (`member_member_id`),
  CONSTRAINT `FK4w29bl62o73pj00vpiv7i0o91` FOREIGN KEY (`member_member_id`) REFERENCES `members` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members_progress`
--

LOCK TABLES `members_progress` WRITE;
/*!40000 ALTER TABLE `members_progress` DISABLE KEYS */;
/*!40000 ALTER TABLE `members_progress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membership_feature`
--

DROP TABLE IF EXISTS `membership_feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `membership_feature` (
  `id` int(11) NOT NULL,
  `feature_name` varchar(255) DEFAULT NULL,
  `membership_id` binary(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKgcb6d3sj6da8sg89dpj41xx12` (`membership_id`),
  CONSTRAINT `FKgcb6d3sj6da8sg89dpj41xx12` FOREIGN KEY (`membership_id`) REFERENCES `memberships` (`membership_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membership_feature`
--

LOCK TABLES `membership_feature` WRITE;
/*!40000 ALTER TABLE `membership_feature` DISABLE KEYS */;
INSERT INTO `membership_feature` VALUES (1,'Gym floor access (Cardio + Basic Equipment)','MÅ√e”MΩçù·ıÁLO'),(2,'Fixed time slot access (e.g., 6am√î√á√¥10am)','MÅ√e”MΩçù·ıÁLO'),(3,'Locker facility (basic)','MÅ√e”MΩçù·ıÁLO'),(4,'Monthly subscription','MÅ√e”MΩçù·ıÁLO'),(5,'Orientation session for beginners','MÅ√e”MΩçù·ıÁLO'),(6,'Fitness assessment at joining','MÅ√e”MΩçù·ıÁLO'),(7,'Access to gym rules & safety guidelines','MÅ√e”MΩçù·ıÁLO'),(8,'Basic towel service','MÅ√e”MΩçù·ıÁLO'),(9,'Full gym access (Cardio + Strength equipment + Functional training)','Ü’÷.W≠FÉØ˚âu¡*∫–'),(10,'Group classes: Yoga, Zumba, HIIT, Aerobics','Ü’÷.W≠FÉØ˚âu¡*∫–'),(11,'Trainer guidance: 1√î√á√¥2 sessions/month','Ü’÷.W≠FÉØ˚âu¡*∫–'),(12,'Locker + shower + towel service','Ü’÷.W≠FÉØ˚âu¡*∫–'),(13,'Health check-up / basic body composition analysis','Ü’÷.W≠FÉØ˚âu¡*∫–'),(14,'Progress tracking in mobile app','Ü’÷.W≠FÉØ˚âu¡*∫–'),(15,'Monthly fitness newsletter / tips','Ü’÷.W≠FÉØ˚âu¡*∫–'),(16,'Access to online workout videos library','Ü’÷.W≠FÉØ˚âu¡*∫–'),(17,'Unlimited gym access (all equipment + free weights + functional area)','ïSÑ6A¢è0«cØM´’'),(18,'Personal trainer (2√î√á√¥3 sessions/week)','ïSÑ6A¢è0«cØM´’'),(19,'Customized workout plan','ïSÑ6A¢è0«cØM´’'),(20,'Diet & nutrition guidance','ïSÑ6A¢è0«cØM´’'),(21,'Progress tracking system (weight, BMI, muscle mass, fat %)','ïSÑ6A¢è0«cØM´’'),(22,'Body composition analysis every month','ïSÑ6A¢è0«cØM´’'),(23,'Priority booking for classes','ïSÑ6A¢è0«cØM´’'),(24,'Access to premium group classes (Pilates, Crossfit)','ïSÑ6A¢è0«cØM´’');
/*!40000 ALTER TABLE `membership_feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membership_feature_seq`
--

DROP TABLE IF EXISTS `membership_feature_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `membership_feature_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membership_feature_seq`
--

LOCK TABLES `membership_feature_seq` WRITE;
/*!40000 ALTER TABLE `membership_feature_seq` DISABLE KEYS */;
INSERT INTO `membership_feature_seq` VALUES (1);
/*!40000 ALTER TABLE `membership_feature_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `memberships`
--

DROP TABLE IF EXISTS `memberships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `memberships` (
  `membership_id` binary(16) NOT NULL,
  `active` bit(1) NOT NULL,
  `duration_in_days` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`membership_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `memberships`
--

LOCK TABLES `memberships` WRITE;
/*!40000 ALTER TABLE `memberships` DISABLE KEYS */;
INSERT INTO `memberships` VALUES ('ïSÑ6A¢è0«cØM´’','',365,'Premium Package (Pro Fitness Plan)',3600),('MÅ√e”MΩçù·ıÁLO','',180,'Basic Package (Starter Plan)',2000),('Ü’÷.W≠FÉØ˚âu¡*∫–','',120,'Standard Package (Regular Plan)',1700);
/*!40000 ALTER TABLE `memberships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `payment_id` binary(16) NOT NULL,
  `amount` double NOT NULL,
  `for_membership` varchar(255) DEFAULT NULL,
  `gateway` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `success` bit(1) NOT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `member_member_id` binary(16) DEFAULT NULL,
  `membership_membership_id` binary(16) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `FKu2pgfhu78f1fo99t6hcr80sb` (`member_member_id`),
  KEY `FK111p3lcjoi60dhbd6dfdcy0pd` (`membership_membership_id`),
  CONSTRAINT `FK111p3lcjoi60dhbd6dfdcy0pd` FOREIGN KEY (`membership_membership_id`) REFERENCES `memberships` (`membership_id`),
  CONSTRAINT `FKu2pgfhu78f1fo99t6hcr80sb` FOREIGN KEY (`member_member_id`) REFERENCES `members` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES ('q¬KâùπN∂˝8¿°)ìƒ',6000,NULL,NULL,'Cash','2026-02-08','',NULL,'oÅBtaE\r´5úÍK@É',NULL),('∑=–Jñ1FΩ©Üè¿LŸ<',50000,NULL,NULL,'Nagad','2026-02-08','',NULL,'ª52zIÔA…ûu{\Z¡iÙù',NULL);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routine_template`
--

DROP TABLE IF EXISTS `routine_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `routine_template` (
  `id` binary(16) NOT NULL,
  `active` bit(1) NOT NULL,
  `level` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `trainer_trainer_id` binary(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKtij0xk52edts5m186muea3aq3` (`trainer_trainer_id`),
  CONSTRAINT `FKtij0xk52edts5m186muea3aq3` FOREIGN KEY (`trainer_trainer_id`) REFERENCES `trainers` (`trainer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routine_template`
--

LOCK TABLES `routine_template` WRITE;
/*!40000 ALTER TABLE `routine_template` DISABLE KEYS */;
INSERT INTO `routine_template` VALUES ('ælÇB≤Nm≥XH}$p','','Advanced','week-3','º4Ò=\nJâ)E{Ó	ƒ'),('˘fôf[€A˙ñÄÇ@ßÌ','','Intermediate','Week-2','º4Ò=\nJâ)E{Ó	ƒ'),('˝ŒÇ\rø◊FÌÑtC˜ó»Ê7','','Beginner','Week-1','º4Ò=\nJâ)E{Ó	ƒ');
/*!40000 ALTER TABLE `routine_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routine_template_day`
--

DROP TABLE IF EXISTS `routine_template_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `routine_template_day` (
  `id` binary(16) NOT NULL,
  `day_of_week` enum('FRIDAY','MONDAY','SATURDAY','SUNDAY','THURSDAY','TUESDAY','WEDNESDAY') NOT NULL,
  `template_id` binary(16) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdd6fkx3n3uqf096h068d8re53` (`template_id`),
  CONSTRAINT `FKdd6fkx3n3uqf096h068d8re53` FOREIGN KEY (`template_id`) REFERENCES `routine_template` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routine_template_day`
--

LOCK TABLES `routine_template_day` WRITE;
/*!40000 ALTER TABLE `routine_template_day` DISABLE KEYS */;
INSERT INTO `routine_template_day` VALUES ('u:˝¨G˝°™—«ÚèΩ®','MONDAY','˝ŒÇ\rø◊FÌÑtC˜ó»Ê7'),('∂ª˛Ω!D2ë—ÇâÙ≠m','TUESDAY','˘fôf[€A˙ñÄÇ@ßÌ'),('@&·% ßAÉÍëj˛f~i','SATURDAY','ælÇB≤Nm≥XH}$p'),('LÎõã√Gïø†3¨8„','TUESDAY','ælÇB≤Nm≥XH}$p'),('jÌR9‡3N°ôã£!©V','THURSDAY','˘fôf[€A˙ñÄÇ@ßÌ'),('à}NQ\"ùI0•Ù–0ˆ~˛À','SUNDAY','˝ŒÇ\rø◊FÌÑtC˜ó»Ê7'),('çÜÌE&N{∂àSÒ1)','WEDNESDAY','˝ŒÇ\rø◊FÌÑtC˜ó»Ê7'),('£wÍﬂ4⁄Lˇ®œ»º*Uu','FRIDAY','˝ŒÇ\rø◊FÌÑtC˜ó»Ê7'),('´iÛìÀFäØøû9Da°≈','SATURDAY','˝ŒÇ\rø◊FÌÑtC˜ó»Ê7'),('∑üJ¸d¯Fëë.ı?>≠','WEDNESDAY','ælÇB≤Nm≥XH}$p'),('¿|c≤{zLe∂»©«~•ô∫','FRIDAY','ælÇB≤Nm≥XH}$p'),('¡ôkS;\nBè¥Ïñó@_B','MONDAY','ælÇB≤Nm≥XH}$p'),('∆b—é„D*ãŒ™ì¯òj®','WEDNESDAY','˘fôf[€A˙ñÄÇ@ßÌ'),('—ã≈¿\'ÿC£°…B˙≈«˙','THURSDAY','˝ŒÇ\rø◊FÌÑtC˜ó»Ê7'),('ŸjªuN`ú˙rÂMD}Õ','SATURDAY','˘fôf[€A˙ñÄÇ@ßÌ'),('·YåMóÙOﬁ¨~¸Hˇsu}','THURSDAY','ælÇB≤Nm≥XH}$p'),('‰dU›ñAÜË≥\Z\\·5','SUNDAY','˘fôf[€A˙ñÄÇ@ßÌ'),('‰íønçîGRã–SPœ°','MONDAY','˘fôf[€A˙ñÄÇ@ßÌ'),('ÌV]2ÌΩLÄ¨ÄÄµ∏KE','SUNDAY','ælÇB≤Nm≥XH}$p'),('˚>¡¨˚åBµæü_Ä±–G','TUESDAY','˝ŒÇ\rø◊FÌÑtC˜ó»Ê7');
/*!40000 ALTER TABLE `routine_template_day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routine_template_exercise`
--

DROP TABLE IF EXISTS `routine_template_exercise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `routine_template_exercise` (
  `id` binary(16) NOT NULL,
  `duration` int(11) NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `reps` int(11) NOT NULL,
  `sets` int(11) NOT NULL,
  `exercise_exercise_id` binary(16) DEFAULT NULL,
  `template_day_id` binary(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKiw94d0a4uifos7lk7c7i12t9g` (`exercise_exercise_id`),
  KEY `FKn5su8e2pnflastkioe4wph2g2` (`template_day_id`),
  CONSTRAINT `FKiw94d0a4uifos7lk7c7i12t9g` FOREIGN KEY (`exercise_exercise_id`) REFERENCES `exercise` (`exercise_id`),
  CONSTRAINT `FKn5su8e2pnflastkioe4wph2g2` FOREIGN KEY (`template_day_id`) REFERENCES `routine_template_day` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routine_template_exercise`
--

LOCK TABLES `routine_template_exercise` WRITE;
/*!40000 ALTER TABLE `routine_template_exercise` DISABLE KEYS */;
INSERT INTO `routine_template_exercise` VALUES ('˝Ω pCß#\\	UA∫',45,'good',12,4,'@UZ÷ÈãL©Û∞“HóÜy','u:˝¨G˝°™—«ÚèΩ®'),('U„Q+C˜¶Î™T˝G	ã',60,'good',15,8,'¶¬}™ΩúIUÖñé”LÜäì','jÌR9‡3N°ôã£!©V'),('!6Pr˜K˛ñd˚AçyΩ',45,NULL,15,7,'29kêiˆO.±[êä˝.º','∆b—é„D*ãŒ™ì¯òj®'),('0Ã¶\nbB|§®}O¸8',30,'good',10,4,'Ü?õ,Omáà æ9’vt','à}NQ\"ùI0•Ù–0ˆ~˛À'),(';1¸.–“I∞áÕÂaJbÌÛ',70,'good',20,10,'ÌµŒ·¯°JªÇ§//f`;Ø','ŸjªuN`ú˙rÂMD}Õ'),(';óÆÙ“F=Ä%»–tb„Î',30,'good',15,5,'p¡üﬂNÿìHyb@)%','ÌV]2ÌΩLÄ¨ÄÄµ∏KE'),('@vÀ=5°J<∏Äx1ODµ',50,'good',10,5,'29kêiˆO.±[êä˝.º','£wÍﬂ4⁄Lˇ®œ»º*Uu'),('Gñ8ΩﬁÒH ê[¶	~T',35,'good',20,8,'ÌµŒ·¯°JªÇ§//f`;Ø','ŸjªuN`ú˙rÂMD}Õ'),('[|∞^(@MÄa§¬1Ì[ﬂ',30,'good',30,8,'»1°å/O§†’uÃ1˚r','@&·% ßAÉÍëj˛f~i'),('a∆≠∑âÆGf¶|^ò˚√W',30,'good',20,5,'·£~yÛI°âŸ•L;’','´iÛìÀFäØøû9Da°≈'),('euw•K´1ÆÑæƒ∫',20,'good',10,3,'p¡üﬂNÿìHyb@)%','´iÛìÀFäØøû9Da°≈'),('m3Z”≤Nº˘b\nµ!s',40,'good',20,10,'·£~yÛI°âŸ•L;’','ÌV]2ÌΩLÄ¨ÄÄµ∏KE'),('wpG‡GôÆZë&e<Àí',70,'good',25,10,'Ù∂≠ RN¡Ü+”ÃÊÒ|','ŸjªuN`ú˙rÂMD}Õ'),('ã0	¨>ÀLéú¶πJôÿå',50,'good',15,8,'aÃR±ØM§è9ŸAö9Œ','jÌR9‡3N°ôã£!©V'),('åKLåﬁïL>©†∏.+Rï´',45,'good',30,5,'ÌµŒ·¯°JªÇ§//f`;Ø','çÜÌE&N{∂àSÒ1)'),('ñÅ∞v@E5äπ◊Ö©[´',30,'good day',15,10,'ä\r3È˝WMæñ«™1∞‡\Zg','LÎõã√Gïø†3¨8„'),('öÙ∂‚_OL°bè	ºY',30,'good',20,5,'∂q≤êï≈LÏóÖL√¶\\k∆','£wÍﬂ4⁄Lˇ®œ»º*Uu'),('£ñÌühL)∂™ùv©\"ùÛ',40,'good',10,5,'ä\r3È˝WMæñ«™1∞‡\Zg','—ã≈¿\'ÿC£°…B˙≈«˙'),('Æ§ˇt£OµùïŸ∑&&',30,'good',20,7,'Ù∂≠ RN¡Ü+”ÃÊÒ|','£wÍﬂ4⁄Lˇ®œ»º*Uu'),('¥©xµ8NÏ∑g∞Â',60,'good',30,12,'≤ñ)àPH í˜¬Ì]>l®','‰dU›ñAÜË≥\Z\\·5'),('π≥ÿ@¥M¸Å—®5#îä∏',70,'good',30,12,'»1°å/O§†’uÃ1˚r','‰íønçîGRã–SPœ°'),('økÈé\"ˆEﬁæÜ#∂âÎ',25,'good',10,5,'@UZ÷ÈãL©Û∞“HóÜy','à}NQ\"ùI0•Ù–0ˆ~˛À'),(' S¯[≠IF¶˘ê‘gÙ›',50,'good',15,7,'∂q≤êï≈LÏóÖL√¶\\k∆','∆b—é„D*ãŒ™ì¯òj®'),('ÕS/1Ä…D áè1ÎÌL.Õ',35,'good',15,4,'≤ñ)àPH í˜¬Ì]>l®','˚>¡¨˚åBµæü_Ä±–G'),('‘«?Ú¬êAò¨Ëu@ÅÎ',30,'good',30,12,'Ü?õ,Omáà æ9’vt','∂ª˛Ω!D2ë—ÇâÙ≠m'),('’›1˘C\\§ÉÈ˘S∫µ—',20,'good',10,3,'»1°å/O§†’uÃ1˚r','u:˝¨G˝°™—«ÚèΩ®');
/*!40000 ALTER TABLE `routine_template_exercise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainer_achievement`
--

DROP TABLE IF EXISTS `trainer_achievement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trainer_achievement` (
  `id` binary(16) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `trainer_id` binary(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKot7nf9kbqjiowed2eekxvoe7f` (`trainer_id`),
  CONSTRAINT `FKot7nf9kbqjiowed2eekxvoe7f` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`trainer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainer_achievement`
--

LOCK TABLES `trainer_achievement` WRITE;
/*!40000 ALTER TABLE `trainer_achievement` DISABLE KEYS */;
INSERT INTO `trainer_achievement` VALUES ('˜WYíKŸØ(ˆ.\0VÜ','National Yoga Champion 2022','º4Ò=\nJâ)E{Ó	ƒ'),(' 7?{~oDkíXïX5îÔ¯','Best Bodybuilding Trainer - 2019','˛AÍ*ø™Cøû3†\"ı]ê3'),('!äK‘NI4±DŒ˛æ$Iü','Regional Yoga Competition Winner 2022','ôwÙZ˛rA7©≥˛‘E	û'),('0ÓÄåÛôCÍ•Àpóø','National Fitness Champion 2022','Æí£î6HXÜÁÏı…(¿'),('8 æó<J‚ãe—!T‹NE','Best National Trainer - 2019','˛AÍ*ø™Cøû3†\"ı]ê3'),('EOÎÎ…Eµºµ†êõ”µ','Two times National Champion of Bodybuilding - 2017 & 2018','˛AÍ*ø™Cøû3†\"ı]ê3'),('E3\0Ê≤lAå∑c–d∫∑','Best Gym Trainer Award 2023','Æí£î6HXÜÁÏı…(¿'),('GÄreLC˝≠°6E∫G*˝','Best National Trainer - 2019','º4Ò=\nJâ)E{Ó	ƒ'),('cö?…3BOQõ‹\'´íCn¸','Certified Yoga Alliance Instructor 2021','ôwÙZ˛rA7©≥˛‘E	û'),('pn•#E7C&¥Pê:l–0n','Two times National Champion of Bodybuilding - 2017 & 2018','˛AÍ*ø™Cøû3†\"ı]ê3'),('¶ﬁÈ7/ËBåN\"ıÊÂYK','Best National Trainer - 2019','˛AÍ*ø™Cøû3†\"ı]ê3'),('ø’∂∞¸OP•–¢—\'_Â£','Yoga Instructor of the Year 2023','ôwÙZ˛rA7©≥˛‘E	û'),('Ã]ãxoA±ú%T◊jÚJ','Best Bodybuilding Trainer - 2019','˛AÍ*ø™Cøû3†\"ı]ê3'),('–ˇÃﬂ¥∏O≥∑√4™‰≥ÇÅ','Two times National Champion of Bodybuilding - 2017 & 2018','º4Ò=\nJâ)E{Ó	ƒ'),('ÂlÂP⁄O¥ùíYKY‹˜','Certified Personal Trainer (CPT) 2021','Æí£î6HXÜÁÏı…(¿');
/*!40000 ALTER TABLE `trainer_achievement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainer_review`
--

DROP TABLE IF EXISTS `trainer_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trainer_review` (
  `id` binary(16) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `rating` int(11) NOT NULL,
  `member_member_id` binary(16) DEFAULT NULL,
  `trainer_trainer_id` binary(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2cm8m6np65k3bp67jhkgcepmq` (`member_member_id`),
  KEY `FK74fd8vqt6o64n8jfpc61sb26g` (`trainer_trainer_id`),
  CONSTRAINT `FK2cm8m6np65k3bp67jhkgcepmq` FOREIGN KEY (`member_member_id`) REFERENCES `members` (`member_id`),
  CONSTRAINT `FK74fd8vqt6o64n8jfpc61sb26g` FOREIGN KEY (`trainer_trainer_id`) REFERENCES `trainers` (`trainer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainer_review`
--

LOCK TABLES `trainer_review` WRITE;
/*!40000 ALTER TABLE `trainer_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `trainer_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainer_skill`
--

DROP TABLE IF EXISTS `trainer_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trainer_skill` (
  `id` binary(16) NOT NULL,
  `percentage` int(11) NOT NULL,
  `skill_name` varchar(255) DEFAULT NULL,
  `trainer_id` binary(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5yeol61n8sisinnx6k60d9o24` (`trainer_id`),
  CONSTRAINT `FK5yeol61n8sisinnx6k60d9o24` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`trainer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainer_skill`
--

LOCK TABLES `trainer_skill` WRITE;
/*!40000 ALTER TABLE `trainer_skill` DISABLE KEYS */;
INSERT INTO `trainer_skill` VALUES ('∞T&/dElô≤ø≠\ZΩmI',95,'Bodybuilding Training','˛AÍ*ø™Cøû3†\"ı]ê3'),('Ÿ\ZzÒ∞F|ëjŸ&Øå',68,'Hatha Yoga','ôwÙZ˛rA7©≥˛‘E	û'),(']=4ç^G\\´7L+¬[⁄',72,'Vinyasa Flow','ôwÙZ˛rA7©≥˛‘E	û'),('0{∏qqé@úóYu?‚º',65,'Aerobics Training','º4Ò=\nJâ)E{Ó	ƒ'),('3⁄\r˜8vH±ª<≤JâÄ',90,'Bodybuilding Training','º4Ò=\nJâ)E{Ó	ƒ'),('N∏ÕÿΩ5@\"Åç·YôPl',90,'Endurance Training','Æí£î6HXÜÁÏı…(¿'),('tU|i{\"D)∫∞Ì‚-%Û\0',87,'Weight Training','Æí£î6HXÜÁÏı…(¿'),('Éã]ßK‡CgçÉ>µ…πÿ#',80,'Cardio Training','˛AÍ*ø™Cøû3†\"ı]ê3'),('ä§«\0—AN®]ö“\Z}à6',90,'Fitness Training','˛AÍ*ø™Cøû3†\"ı]ê3'),('ê	œJÒ:GÍÉEêÖ$K¢',95,'Bodybuilding Training','˛AÍ*ø™Cøû3†\"ı]ê3'),('†∆v£‘MLß3ü¬w”â',65,'Aerobics Training','˛AÍ*ø™Cøû3†\"ı]ê3'),('®ç˘f˜îEQîèÛkz\\-',90,'Fitness Training','˛AÍ*ø™Cøû3†\"ı]ê3'),(' bµJñ%@wÉòÉ/]äq',80,'Cardio Training','˛AÍ*ø™Cøû3†\"ı]ê3'),('Õ‘33ICÃñ{d-$˜æ',85,'Strength Conditioning','Æí£î6HXÜÁÏı…(¿'),('”‘©$Ë„K€ÅV¬·˝˝≥',65,'Aerobics Training','˛AÍ*ø™Cøû3†\"ı]ê3'),('˜ˇD\nuPB<∫˘äkíaJ',92,'Meditation & Mindfulness','ôwÙZ˛rA7©≥˛‘E	û'),('¯Âè¢YKL°úﬁc¥Ì',90,'Fitness Training','º4Ò=\nJâ)E{Ó	ƒ'),('˚©–NR@ÀñÀ‰>R',80,'Cardio Training','º4Ò=\nJâ)E{Ó	ƒ');
/*!40000 ALTER TABLE `trainer_skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainers`
--

DROP TABLE IF EXISTS `trainers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trainers` (
  `trainer_id` binary(16) NOT NULL,
  `active` bit(1) NOT NULL,
  `bio` varchar(2000) DEFAULT NULL,
  `experience_years` int(11) NOT NULL,
  `join_date` datetime(6) DEFAULT NULL,
  `rating` double NOT NULL,
  `salary` int(11) NOT NULL,
  `specialization` varchar(255) DEFAULT NULL,
  `total_reviews` int(11) NOT NULL,
  `user_id` binary(16) NOT NULL,
  PRIMARY KEY (`trainer_id`),
  UNIQUE KEY `UKse8qmhomor3guutjui5wfmrk3` (`user_id`),
  CONSTRAINT `FK67k0bpqjr58pbl5mme5wy45af` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainers`
--

LOCK TABLES `trainers` WRITE;
/*!40000 ALTER TABLE `trainers` DISABLE KEYS */;
INSERT INTO `trainers` VALUES ('ôwÙZ˛rA7©≥˛‘E	û','','Experienced yoga instructor focused on holistic wellness, flexibility, and mental balance. Dedicated to helping students build inner strength.',3,'2026-04-04 00:56:32.090634',4.8,25000,'Yoga',16,')ˆ¸/˛íLΩëâ8|3S'),('Æí£î6HXÜÁÏı…(¿','','Certified fitness trainer specializing in strength and endurance training. Passionate about helping clients achieve sustainable results.',5,'2026-04-04 00:54:52.053084',4,30000,'Fitness',9,'„=SıÑúNO≥)p…¯]'),('º4Ò=\nJâ)E{Ó	ƒ','','Halbert Bourn is very professional and expert trainer. In his career, he done great job. He never compromise about his work to maintain our health luptas sit fugit, sed cuuntur magni dolores eos qui rat ione volupta pleasure rationally encounter onsequences that are extremely very professional',4,'2026-02-04 17:36:51.365497',4.2,25000,'Cardio, Weight Training',7,'*âà¿çJØV;†v*˚Q'),('˛AÍ*ø™Cøû3†\"ı]ê3','','Halbert Bourn is very professional and expert trainer. In his career, he done great job. He never compromise about his work to maintain our health luptas sit fugit, sed cuuntur magni dolores eos qui rat ione volupta pleasure rationally encounter onsequences that are extremely very professional',5,'2026-02-04 17:36:33.787937',4.5,120000,'Cardio, Weight Training',10,'SZ&6-`I‡≠†p[/Ïw');
/*!40000 ALTER TABLE `trainers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_table`
--

DROP TABLE IF EXISTS `user_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_table` (
  `id` binary(16) NOT NULL,
  `active` bit(1) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_table`
--

LOCK TABLES `user_table` WRITE;
/*!40000 ALTER TABLE `user_table` DISABLE KEYS */;
INSERT INTO `user_table` VALUES (' ˝ÔFûå«◊ëŒcd“','','Dhaka','2026-02-03 22:52:51.628886','faisal22205101279@diu.edu.bd','Mohammad','Male','Faisal','$2a$10$EZ8xFmOVa68UQU3Ee6UzmOmczdk2jDfrtsPXhsIMFZHS.cN58r7ke','01608949908',NULL,'ROLE_ADMIN'),(')ˆ¸/˛íLΩëâ8|3S','','Dhaka','2026-02-03 22:53:36.641610','user@gmail.com','Mohammad','Male','Faisal','$2a$10$c1vBVHysOuys1GYzVqrGzejL8awlOc4eLkLqWbwga0/Gyd4lH9GYu','01608949908','00fb0682-3a04-49b6-8adf-7166f13fa8ce_ds2.webp','ROLE_TRAINER'),('*âà¿çJØV;†v*˚Q','','Cox\'s Bazar','2026-02-04 17:33:19.110466','user12@gmail.com','Mohammad','Male','Faisal','$2a$10$Edv8RzWhWJAKuDJ1k9jhH.xoidI7ytLBbjNwNxB82LMizH5C6eRNK','01608949908','0c7953a6-fdf6-48dd-b423-192518bbee34_Matt-WP.jpg','ROLE_TRAINER'),('9í∆“sN≠+.ùÙó»','','Chittagong','2026-02-04 17:34:03.752396','user123@gmail.com','Mrs','Female','Fatima','$2a$10$yaBd8.aZaDVrVG2w/OAWBedQaYKjeiZdFMIsk8iABsTAUZvkWKR7C','01608949908',NULL,'ROLE_USER'),('SZ&6-`I‡≠†p[/Ïw','','Dhaka','2026-02-04 17:32:42.865116','user1@gmail.com','Mohammad','Male','Faisal','$2a$10$OWZKODaZKOuGz9Wk.q.tle7OK4Pjf2RK8o.tFkQ9nqaSnEo9jPGFy','01608949908','0d4bd154-cbec-4605-9f7c-40a1f6de679b_Personal+Trainer+Profile+(Full+Size).webp','ROLE_TRAINER'),('~—+Á€·IΩÜkπvsﬂ‹','','Chowfaldondi,Cox\'s bazar,Chittagong','2026-02-08 23:09:16.674239','arif@gmail.com','Md','Male','Arif','$2a$10$ZfjAQeltjjoWmp4xSO.PC.pN1qAPjdKrWeXX1perOoekPbB8MXqh6','01608949908','d5a6ac84-876c-4ca3-8931-acffdcf3adfa_WhatsApp Image 2025-09-11 at 17.06.28_f81c59c2.jpg','ROLE_MEMBER'),('ﬂ(gkAO‘Ü@ü£Gœv£','','Dhaka','2026-02-03 22:53:11.327467','faisal@gmail.com','Mohammad','Male','Faisal','$2a$10$NyCG6vAsCQ/f9YwdRts5yOs7RtvkvfuhGAEguN/HEBG69Pz8q/5RW','01608949908',NULL,'ROLE_MEMBER'),('„=SıÑúNO≥)p…¯]','','Mirpur-10,Dhaka,Bangladesh','2026-04-04 00:50:32.673678','faisal12@gmail.com','MR','Male','James','$2a$10$01IBHmUUpXSGlsRGkWsAUe7VZs4TSpAf9j.6ZYbQ3pt.JpGNxJHx2','01608949908','323e7b98-4365-45b0-a072-3a6dea266e6a_gun-j-profile-1.jpg','ROLE_TRAINER');
/*!40000 ALTER TABLE `user_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'gym_management_system'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-14 23:55:34
