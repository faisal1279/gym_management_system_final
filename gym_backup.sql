-- H2 2.4.240;
;             
CREATE USER IF NOT EXISTS "XYZ" SALT '0487cd6bae27be63' HASH '92c55c7163ee443d8ac8a06452ef3734c81aecf4ebc8b604ff0ffb3f447723db' ADMIN;        
CREATE SEQUENCE "PUBLIC"."MEMBERSHIP_FEATURE_SEQ" START WITH 1 INCREMENT BY 50;               
CREATE CACHED TABLE "PUBLIC"."ATTENDANCE"(
    "ATTENDANCE_ID" UUID NOT NULL,
    "DATE" DATE,
    "PRESENT" BOOLEAN NOT NULL,
    "MEMBER_ID" UUID
);   
ALTER TABLE "PUBLIC"."ATTENDANCE" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_8" PRIMARY KEY("ATTENDANCE_ID");        
-- 4 +/- SELECT COUNT(*) FROM PUBLIC.ATTENDANCE;              
INSERT INTO "PUBLIC"."ATTENDANCE" VALUES
(UUID '6bf2536a-7904-47f5-9fcd-4d60a3719f59', DATE '2026-02-08', TRUE, UUID 'bb35327a-49ef-41c9-9e75-7b1ac169f49d'),
(UUID 'd07ccade-c75b-45b9-bea7-007c47ec5a52', DATE '2026-02-08', TRUE, UUID '6f814274-610e-450d-ab35-9cea4bf04083'),
(UUID 'e92ade21-848c-403e-9304-42b3215d69ae', DATE '2026-02-06', TRUE, UUID 'bb35327a-49ef-41c9-9e75-7b1ac169f49d'),
(UUID 'd433af55-7948-4dd7-bec2-01669941aa63', DATE '2026-02-06', TRUE, UUID '6f814274-610e-450d-ab35-9cea4bf04083');              
CREATE CACHED TABLE "PUBLIC"."BLOG"(
    "ID" UUID NOT NULL,
    "CATEGORY" CHARACTER VARYING(255),
    "CONTENT" CHARACTER VARYING(5000),
    "COVER_IMAGE" CHARACTER VARYING(255),
    "CREATED_AT" TIMESTAMP(6),
    "PUBLISHED" BOOLEAN NOT NULL,
    "TITLE" CHARACTER VARYING(255),
    "UPDATED_AT" TIMESTAMP(6),
    "AUTHOR_ID" UUID
);    
ALTER TABLE "PUBLIC"."BLOG" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_1" PRIMARY KEY("ID");         
-- 10 +/- SELECT COUNT(*) FROM PUBLIC.BLOG;   
INSERT INTO "PUBLIC"."BLOG" VALUES
(UUID '376f2180-fecf-43b5-91c9-6d2f23b381aa', 'Health & Fitness', U&'<p>In modern life, many people spend long hours sitting at desks, using mobile devices, or working in front of computers. This sedentary lifestyle can lead to various health issues such as obesity, back pain, and low energy levels. Regular exercise is one of the most effective ways to combat these problems and maintain a healthy lifestyle.</p>\000a\000a                                                                                                                <p>Exercise helps improve cardiovascular health by strengthening the heart and improving blood circulation. Activities like <strong>running, cycling, and treadmill workouts</strong> can significantly reduce the risk of heart disease. Additionally, strength training exercises help build muscle mass, improve bone density, and increase metabolism.</p>\000a\000a                                                                                                                <p>Another important benefit of regular exercise is its positive impact on mental health. Physical activity reduces stress hormones and increases the production of endorphins, which help improve mood and reduce anxiety. Many people find that going to the gym helps them clear their minds and feel more relaxed.</p>\000a\000a                                                                                                                <p><em>Consistency is the most important factor when it comes to fitness. It is not about working out intensely for a few days but maintaining a regular routine over time. Even 30\201345 minutes of daily exercise can bring noticeable improvements in health and fitness.</em></p>\000a\000a                                                                                                                <p>In conclusion, exercise is not just an option\2014it is a necessity for a healthy and balanced life. Making it a part of your daily routine can transform both your body and mind.</p>', 'f054141f-c871-49ed-8eaa-002272f19421_cheerful-athletic-black-man-doing-forward-lunge-exercising-near-laptop-watching-online-workout-tutorial-home-guy-training-428627411.webp', TIMESTAMP '2026-04-04 00:17:33.042978', FALSE, U&'The Importance of Regular Exercise in Daily Life \+01f4aa', TIMESTAMP '2026-04-04 00:18:51.253991', UUID '07ca14fd-ef02-469e-8cc7-d791ce6364d2'),
(UUID 'ebf4f3dd-e589-40ad-9f30-b143db5e111d', 'Motivation', U&'<p>Starting a fitness journey is easy, but staying consistent is the real challenge. Many people begin with excitement but lose motivation after a few weeks. Understanding how to stay motivated is essential for achieving long-term fitness goals.</p>\000a\000a                                                                                                                <p>One effective way to stay motivated is by setting clear and realistic goals. Instead of aiming for drastic changes, focus on small, achievable targets such as losing a few kilograms or improving endurance. Achieving these small goals builds confidence and keeps you motivated.</p>\000a\000a                                                                                                                <p>Another important factor is creating a workout routine that you enjoy. If you do not enjoy your workouts, it becomes difficult to stay consistent. Try different types of exercises such as weight training, cardio, or group workouts to find what suits you best.</p>\000a\000a                                                                                                                <p>Having a workout partner or joining a fitness community can also boost motivation. When you train with others, you feel encouraged and accountable. A supportive environment plays a big role in maintaining consistency.</p>\000a\000a                                                                                                                <p><em>Tracking progress is another powerful motivator. Keeping a record of your workouts, weight, and measurements helps you see improvements over time. This progress inspires you to keep going.</em></p>\000a\000a                                                                                                                <p>In the end, motivation comes and goes, but discipline is what keeps you moving forward. Stay consistent, stay focused, and never give up on your fitness journey.</p>', 'af4ac5f5-e7a2-4731-b9be-84fa86d5440b_leg-press.jpg', TIMESTAMP '2026-04-04 00:20:06.830776', TRUE, U&'How to Stay Motivated in Your Fitness Journey \+01f525', NULL, UUID '07ca14fd-ef02-469e-8cc7-d791ce6364d2');           
INSERT INTO "PUBLIC"."BLOG" VALUES
(UUID '6c0d2e10-d02a-4452-bbf8-e2ef456ff9f7', 'Nutrition', U&'<p>Fitness is not only about working out; nutrition plays an equally important role. Without proper nutrition, it is difficult to achieve fitness goals such as weight loss or muscle gain. A balanced diet provides the energy and nutrients needed for effective workouts and recovery.</p>\000a\000a                                                                                                                <p>Protein is one of the most important nutrients for muscle growth. It helps repair and build muscle tissues after intense workouts. Foods like eggs, chicken, fish, and legumes are excellent sources of protein.</p>\000a\000a                                                                                                                <p>Carbohydrates are the body&rsquo;s main source of energy. They fuel your workouts and help you perform better. Complex carbohydrates such as brown rice, oats, and whole grains provide sustained energy throughout the day.</p>\000a\000a                                                                                                                <p>Healthy fats are also essential for overall health. They support hormone production and provide long-lasting energy. Sources of healthy fats include nuts, seeds, and avocados.</p>\000a\000a                                                                                                                <p><em>Hydration is often overlooked but is extremely important. Drinking enough water helps maintain energy levels, improves performance, and aids in recovery.</em></p>\000a\000a                                                                                                                <p>In conclusion, a proper balance of exercise and nutrition is the key to achieving fitness success. Eating the right foods at the right time can significantly enhance your results.</p>', 'e80c205f-dff3-46f2-8cb4-db0a6faceb6b_young-man-workout-fitness-club-260nw-2471712867.webp', TIMESTAMP '2026-04-04 00:20:43.419478', TRUE, U&'The Role of Nutrition in Fitness and Muscle Growth \+01f957', NULL, UUID '07ca14fd-ef02-469e-8cc7-d791ce6364d2'),
(UUID '238fe46b-bf8d-463d-8223-4c2abf48ac96', 'Lifestyle', U&'<p>Joining a gym is not just about working out alone\2014it is about becoming part of a community. A gym environment provides motivation, support, and a sense of belonging that can make your fitness journey more enjoyable.</p>\000a\000a                                                                                                                <p>One of the biggest benefits of a gym community is motivation. Seeing others work hard encourages you to push your limits. Group workouts and training sessions create a positive and energetic atmosphere.</p>\000a\000a                                                                                                                <p>Professional trainers in a gym also play a crucial role. They guide members, correct their form, and help them achieve their goals safely. With expert support, you can avoid injuries and get better results.</p>\000a\000a                                                                                                                <p><em>Another advantage is access to modern equipment. A well-equipped gym offers a variety of machines and tools that allow you to perform different types of exercises. This variety keeps workouts interesting and effective.</em></p>\000a\000a                                                                                                                <p><strong>Social interaction is another important aspect. Meeting people with similar goals creates friendships and makes workouts more enjoyable. It also helps in building consistency.</strong></p>\000a\000a                                                                                                                <p>In conclusion, a gym community provides much more than just a place to exercise. It offers support, motivation, and a positive environment that helps you stay committed to your fitness goals.</p>', '1b7fd7f0-434e-4903-aa3f-42d718bd5d49_how-to-do-mountain-climbers.jpeg', TIMESTAMP '2026-04-04 00:21:31.347369', TRUE, U&'Benefits of Joining a Gym Community \+01f465', NULL, UUID '07ca14fd-ef02-469e-8cc7-d791ce6364d2');        
INSERT INTO "PUBLIC"."BLOG" VALUES
(UUID '87cd9cff-ca30-4c74-b280-0f042bc1e9fd', 'Weight Loss', U&'<p>Losing weight is one of the most common fitness goals, but many people struggle to achieve it due to lack of proper knowledge and consistency. Weight loss is not about starving yourself or following extreme diets\2014it is about maintaining a balanced lifestyle.</p>\000a\000a                                                                                                                <p>The first step towards weight loss is understanding calorie balance. To lose weight, you need to burn more calories than you consume. This can be achieved through a combination of exercise and healthy eating habits. Cardio exercises such as running, cycling, and skipping are highly effective in burning calories.</p>\000a\000a                                                                                                                <p>Strength training is equally important for weight loss. Many people think lifting weights is only for muscle building, but it also helps burn fat by increasing metabolism. The more muscle mass you have, the more calories your body burns even at rest.</p>\000a\000a                                                                                                                <p><em>Diet plays a crucial role in weight loss. Avoid processed foods, sugary drinks, and excessive fast food. Instead, focus on whole foods like vegetables, fruits, lean proteins, and whole grains. Eating smaller portions and maintaining a consistent eating schedule can also help.</em></p>\000a\000a                                                                                                                <p>Another key factor is patience. Weight loss is a gradual process, and expecting quick results can lead to disappointment. Staying consistent with your workouts and diet will eventually bring results.</p>\000a\000a                                                                                                                <p><strong>In conclusion, weight loss becomes simple when you follow the right approach. Stay consistent, eat healthy, and trust the process.</strong></p>', 'e3351ce3-5342-49ea-8dd0-d771cb70a8da_GzLeM2yKQGigqMF7Mtu8vh.jpg', TIMESTAMP '2026-04-04 00:22:33.09366', TRUE, U&'Weight Loss Made Simple: A Complete Guide \+01f525', NULL, UUID '07ca14fd-ef02-469e-8cc7-d791ce6364d2'),
(UUID 'af52a554-0164-4afc-8498-86655ab700a9', 'Muscle Gain', U&'<p>Building muscle is a goal for many gym-goers, especially beginners who want to improve their strength and physique. However, starting the journey without proper guidance can lead to confusion and slow progress.</p>\000a\000a                                                                                                                <p>The first step in muscle building is following a structured workout plan. Focus on compound exercises such as squats, deadlifts, bench press, and pull-ups. These exercises target multiple muscle groups and provide better results.</p>\000a\000a                                                                                                                <p><strong>Progressive overload is the key principle of muscle growth. This means gradually increasing the weight or intensity of your workouts over time. Without progression, your muscles will not grow effectively.</strong></p>\000a\000a                                                                                                                <p>Rest and recovery are just as important as workouts. Muscles grow when you rest, not when you train. Ensure you get enough sleep and allow your muscles time to recover between workouts.</p>\000a\000a                                                                                                                <p><em>Nutrition is another critical factor. Protein intake should be sufficient to support muscle repair and growth. Combine protein with carbohydrates and healthy fats for balanced nutrition.</em></p>\000a\000a                                                                                                                <p>Consistency is the most important factor. Muscle building takes time, and results will not appear overnight. Stay dedicated, and you will see progress over time.</p>', 'aa4a18bb-ffc4-4ab9-8c0e-779f3e65fe85_how-many-push-ups-should-you-do-a-day-to-see-results.jpeg', TIMESTAMP '2026-04-04 00:23:26.541394', TRUE, U&'Muscle Building Tips for Beginners \+01f3cb\fe0f', NULL, UUID '07ca14fd-ef02-469e-8cc7-d791ce6364d2');     
INSERT INTO "PUBLIC"."BLOG" VALUES
(UUID '7fb9bbe9-0272-4d03-9451-284ae859a326', 'Fitness Tips', U&'<p>A daily workout routine can bring numerous benefits to your life, both physically and mentally. Even a short session of exercise every day can make a significant difference.</p>\000a\000a                                                                                                                <p>First, it improves overall health by strengthening the heart and muscles. Second, it helps maintain a healthy weight by burning calories regularly. Third, it boosts energy levels and reduces fatigue.</p>\000a\000a                                                                                                                <p>Daily workouts also improve mental health by reducing stress and anxiety. They enhance mood and promote better sleep. People who exercise regularly often feel more confident and positive.</p>\000a\000a                                                                                                                <p>Another benefit is improved discipline. Following a daily routine builds consistency and self-control, which can be applied to other areas of life as well.</p>\000a\000a                                                                                                                <p><em>Exercise also improves flexibility and posture, reducing the risk of injuries. It keeps your body active and prevents stiffness caused by long hours of sitting.</em></p>\000a\000a                                                                                                                <p>In conclusion, a daily workout routine is one of the best habits you can develop. It leads to a healthier, happier, and more productive life.</p>', '18476a4f-5e8c-4d3f-971d-c87321db365b_Fit-man-doing-high-knees-cardio-exercise-548x428.jpg', TIMESTAMP '2026-04-04 00:24:07.31386', TRUE, U&'Top 10 Benefits of Daily Workout Routine \2705', NULL, UUID '07ca14fd-ef02-469e-8cc7-d791ce6364d2'),
(UUID '2c552201-1510-4b3e-868d-152a341b7ecc', 'Gym Tips', U&'<p>Many people join the gym with enthusiasm but make common mistakes that slow down their progress or even cause injuries. Understanding these mistakes can help you achieve better results.</p>\000a\000a                                                                                                                <p>One of the most common mistakes is using incorrect form. Performing exercises without proper technique can lead to injuries and reduce effectiveness. Always focus on correct posture and movement.</p>\000a\000a                                                                                                                <p>Another mistake is skipping warm-ups. Warming up prepares your body for exercise and reduces the risk of injury. Similarly, skipping cool-down sessions can lead to muscle stiffness.</p>\000a\000a                                                                                                                <p>Overtraining is another issue. Many beginners think more workouts mean faster results, but this is not true. Overtraining can lead to fatigue and muscle damage. Rest days are essential for recovery.</p>\000a\000a                                                                                                                <p><em>Ignoring nutrition is also a big mistake. Without proper diet, your workouts will not give the desired results. Balance your diet with the right nutrients.</em></p>\000a\000a                                                                                                                <p><strong>Lastly, lack of consistency is a major problem. Going to the gym irregularly will not bring results. Stay committed to your routine.</strong></p>\000a\000a                                                                                                                <p>In conclusion, avoiding these common mistakes can help you achieve your fitness goals faster and more safely.</p>', '6c772b95-7293-4045-a916-89b09c1bd101_5-Master-the-Squat-in-5-Easy-Steps.jpg', TIMESTAMP '2026-04-04 00:24:56.529247', TRUE, U&'Common Gym Mistakes and How to Avoid Them \274c', NULL, UUID '07ca14fd-ef02-469e-8cc7-d791ce6364d2');        
INSERT INTO "PUBLIC"."BLOG" VALUES
(UUID '0640931f-f99a-4108-b7b8-02ff7bb96bde', 'Lifestyle', U&'<p>Many people treat fitness as a short-term goal, such as losing weight for an event or gaining muscle quickly. However, true fitness is a lifelong journey that requires consistency and dedication.</p>\000a\000a                                                                                                                <p>When fitness becomes a lifestyle, it becomes a natural part of your daily routine. You no longer see exercise as a burden but as an essential activity for your well-being.</p>\000a\000a                                                                                                                <p>A fitness lifestyle includes regular exercise, healthy eating, proper sleep, and stress management. These habits work together to improve overall health and quality of life.</p>\000a\000a                                                                                                                <p>One of the biggest advantages of adopting a fitness lifestyle is long-term health benefits. It reduces the risk of chronic diseases such as diabetes, heart disease, and obesity.</p>\000a\000a                                                                                                                <p><em>It also improves mental strength and discipline. People who follow a fitness lifestyle tend to be more focused, confident, and productive.</em></p>\000a\000a                                                                                                                <p>In conclusion, fitness should not be a temporary goal but a permanent lifestyle choice. <strong>Start small, stay consistent, and make</strong> it a part of your everyday life.</p>', '627001aa-1180-4027-a462-d42e03a68573_istockphoto-1342504639-612x612.jpg', TIMESTAMP '2026-04-04 00:25:41.718437', TRUE, U&'Why Fitness is a Lifestyle, Not a Temporary Goal \+01f33f', NULL, UUID '07ca14fd-ef02-469e-8cc7-d791ce6364d2'),
(UUID 'a1b53180-c11c-4520-a8e4-a1e5f3c90526', 'frfrrf', U&'<p>frrrrrrrrr</p>\000d\000a<p>fr</p>', 'bd3577d3-f438-47ca-9737-94526757eb23_Copilot_20260618_022820.png', TIMESTAMP '2026-08-09 00:17:20.55017', TRUE, 'hi', NULL, UUID '07ca14fd-ef02-469e-8cc7-d791ce6364d2');     
CREATE CACHED TABLE "PUBLIC"."BLOG_IMAGE"(
    "ID" UUID NOT NULL,
    "IMAGE_URL" CHARACTER VARYING(255),
    "BLOG_ID" UUID
);          
ALTER TABLE "PUBLIC"."BLOG_IMAGE" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_5" PRIMARY KEY("ID");   
-- 28 +/- SELECT COUNT(*) FROM PUBLIC.BLOG_IMAGE;             
INSERT INTO "PUBLIC"."BLOG_IMAGE" VALUES
(UUID '6c4e2b21-2ae8-4cdb-9ea4-3fe411e0dd76', '1f67e485-d2b5-4bf3-9469-704375948d8d_19-bodyweight-squat.avif', UUID '376f2180-fecf-43b5-91c9-6d2f23b381aa'),
(UUID '684c3efc-e034-4e12-9490-e0b99becb1d2', 'f854a578-2489-4377-8ec7-82cbf8711927_how-to-get-better-at-push-ups_c96cd61d-63d8-4bd0-a93e-e3a8dee52408.webp', UUID '376f2180-fecf-43b5-91c9-6d2f23b381aa'),
(UUID 'c1d85107-7511-449e-b60e-c4e7e6609eab', 'b778e27a-5cdb-4b41-a8f3-9ca00d506cbb_young-man-workout-fitness-club-260nw-2471712867.webp', UUID '376f2180-fecf-43b5-91c9-6d2f23b381aa'),
(UUID '0f91e58d-42c3-47d0-b874-d7c141e28e4b', '863a989a-6fea-43da-94a7-e64b49c0e44d_Tricep-pushdown-movement_ddb8dbd8-566d-4f55-99e0-36c35790234a_1224x.webp', UUID 'ebf4f3dd-e589-40ad-9f30-b143db5e111d'),
(UUID 'a69a2630-78b5-4cb3-8b0c-7b4c6c0ef27e', '416743ef-7b8a-431c-b2cc-f6cd3a202a00_2-muscles-worked.webp', UUID 'ebf4f3dd-e589-40ad-9f30-b143db5e111d'),
(UUID '100fd6b6-31a2-4799-9a8d-ee65629586f4', '35f8c41e-f89d-40ea-a792-2a1d834e6463_Lat-pulldown-on-Mirafit-Lat-Pulldown-Machine.webp', UUID 'ebf4f3dd-e589-40ad-9f30-b143db5e111d'),
(UUID '18448993-3a30-47f8-b9a2-46f91a398168', 'd97373d1-9397-4ecb-acea-79826f9270fb_9BP4SsAx7aSmc6gE5FFiGC.jpg', UUID '6c0d2e10-d02a-4452-bbf8-e2ef456ff9f7'),
(UUID '1c34ac38-12c6-47d9-abe5-72fd478660cc', '66e8f3c9-3964-4c5b-907f-08b1bbf8b8d5_Ryan-Push-Up.png', UUID '6c0d2e10-d02a-4452-bbf8-e2ef456ff9f7'),
(UUID 'bbaad1e3-6a04-4c18-845e-8ef15006bd5a', '2ecdb950-6e9d-4291-ae04-0f428969e6b1_how-to-get-better-at-push-ups_c96cd61d-63d8-4bd0-a93e-e3a8dee52408.webp', UUID '6c0d2e10-d02a-4452-bbf8-e2ef456ff9f7'),
(UUID 'de76df87-2e68-4135-9060-80218441c695', 'cf2fa814-d10d-493b-aa03-5ec5cd0796e9_GzLeM2yKQGigqMF7Mtu8vh.jpg', UUID '238fe46b-bf8d-463d-8223-4c2abf48ac96'),
(UUID 'b6ca1ef7-0584-4fdb-8c1f-ffcb1f5d952e', 'd5e95d09-6ee1-4289-9c33-3eaf89acdc1a_u732pcXisraDgMESrUvnNk.jpg', UUID '238fe46b-bf8d-463d-8223-4c2abf48ac96'),
(UUID '724cc28b-e1f7-44aa-9307-744afcabe58a', '8ff60ecc-a3b5-4197-8a18-03e75dc1d000_mountain-climbers.png', UUID '238fe46b-bf8d-463d-8223-4c2abf48ac96'),
(UUID 'd79b0c4e-14a2-49b2-aabc-12a0f2ca07b0', '2ebefd94-f2bb-4ef3-bd48-cec0631f070d_bicycle-crunch.jpg', UUID '87cd9cff-ca30-4c74-b280-0f042bc1e9fd'),
(UUID '3e06bdcc-d486-4dbe-a40c-cdb0b62c31be', '8d4e7292-f334-452d-87c5-361800b71704_Bicycle_Exercise.webp', UUID '87cd9cff-ca30-4c74-b280-0f042bc1e9fd'),
(UUID '8afb7ec6-7295-4195-90d0-e62e421545a6', '147b5dde-dc04-4730-acb6-36b07f178b6e_u732pcXisraDgMESrUvnNk.jpg', UUID '87cd9cff-ca30-4c74-b280-0f042bc1e9fd'),
(UUID 'bd400764-9b73-4660-8d7c-57b15afa9758', 'e82b1ab4-14d3-4a2f-8f63-dafdaafd86ed_mountain-climbers.png', UUID 'af52a554-0164-4afc-8498-86655ab700a9'),
(UUID '4f297e6e-8c74-4884-9628-b0a5cef3565a', 'b5530a37-c88d-4150-a73a-3cdd1f9df783_Push-Up-Exercises-1.jpg', UUID 'af52a554-0164-4afc-8498-86655ab700a9'),
(UUID '4d86822d-2278-4f03-a4a4-140bdf1e023d', '712a9ff9-69f3-4a83-82c8-b7476baeb036_how-to-do-a-push-up-plank-build-core-chest-and-triceps.jpeg', UUID 'af52a554-0164-4afc-8498-86655ab700a9'),
(UUID '18139d1c-e353-4aca-90ea-8aaf8e2ee809', 'd92cfe49-5282-4e55-be33-865bd23d82bf_Fit-man-doing-high-knees-cardio-exercise-548x428.jpg', UUID '7fb9bbe9-0272-4d03-9451-284ae859a326'),
(UUID 'b420aa55-5ac8-41aa-aa5d-37399a689e9f', '742b69c3-3bdc-4061-aa6c-f27274405791_high-knees-exercise-1296x728-header.webp', UUID '7fb9bbe9-0272-4d03-9451-284ae859a326'),
(UUID 'cfa3db1c-6fc9-4723-bfcf-8c8bb666d2d5', '2e657a62-0654-426d-b3cd-239a2864475b_Xw8VaDaXRAstbCW84vib6g.jpg', UUID '7fb9bbe9-0272-4d03-9451-284ae859a326'),
(UUID '44d81917-06cf-49b6-9f7f-79562790c230', 'd135184b-a24f-42fd-b4ae-0ecdd3df8dd9_cheerful-athletic-black-man-doing-forward-lunge-exercising-near-laptop-watching-online-workout-tutorial-home-guy-training-428627411.webp', UUID '2c552201-1510-4b3e-868d-152a341b7ecc'),
(UUID 'cdaeebad-fb00-4953-ae53-38c453f16229', '28f238d4-7b84-46fe-8ba4-7309f27bfff5_66e8991460790ade1fac6d2a_maxresdefault (1).jpg', UUID '2c552201-1510-4b3e-868d-152a341b7ecc'),
(UUID '6eeaed2f-e4b1-400e-b08e-a9c3c6c0fe8a', '81880910-4d5d-4a58-8cd8-6bcd4e4a954f_19-bodyweight-squat.avif', UUID '2c552201-1510-4b3e-868d-152a341b7ecc');               
INSERT INTO "PUBLIC"."BLOG_IMAGE" VALUES
(UUID '3e4eb630-71be-47db-9fbe-fe0a948785e6', '72f02d73-9cd1-49c8-a663-d08814a957fc_ds1.webp', UUID '0640931f-f99a-4108-b7b8-02ff7bb96bde'),
(UUID 'c0c0c89c-109a-471c-9d49-fedc7fbe4a72', '0fafec9c-4b89-42db-b904-9433860b06ab_b1.webp', UUID '0640931f-f99a-4108-b7b8-02ff7bb96bde'),
(UUID 'f5f2dad1-0e2f-44fb-8870-e46d12627bf8', '54abaad0-7fff-4733-81bd-37038c4f5ce2_hq720.jpg', UUID '0640931f-f99a-4108-b7b8-02ff7bb96bde'),
(UUID 'e54f5cb2-7e02-4e17-8ddc-8e47389daf40', '77b29f40-b53b-476a-a232-c0f9e220d646_Matt-WP.jpg', UUID 'a1b53180-c11c-4520-a8e4-a1e5f3c90526');           
CREATE CACHED TABLE "PUBLIC"."CLASS_IMAGE"(
    "ID" UUID NOT NULL,
    "IMAGE_URL" CHARACTER VARYING(255),
    "CLASS_ID" UUID
);        
ALTER TABLE "PUBLIC"."CLASS_IMAGE" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_9" PRIMARY KEY("ID");  
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.CLASS_IMAGE;             
CREATE CACHED TABLE "PUBLIC"."CLASS_SCHEDULE"(
    "ID" UUID NOT NULL,
    "DAY_OF_WEEK" ENUM('FRIDAY', 'MONDAY', 'SATURDAY', 'SUNDAY', 'THURSDAY', 'TUESDAY', 'WEDNESDAY') NOT NULL,
    "END_TIME" TIME(0),
    "START_TIME" TIME(0),
    "CLASS_ID" UUID
);          
ALTER TABLE "PUBLIC"."CLASS_SCHEDULE" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_6" PRIMARY KEY("ID");               
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.CLASS_SCHEDULE;          
CREATE CACHED TABLE "PUBLIC"."CONTACT_MESSAGE"(
    "ID" UUID NOT NULL,
    "CREATED_AT" TIMESTAMP(6),
    "EMAIL" CHARACTER VARYING(255),
    "MESSAGE" CHARACTER VARYING(5000),
    "NAME" CHARACTER VARYING(255),
    "REPLIED" BOOLEAN NOT NULL,
    "STATUS" ENUM('NEW', 'READ', 'REPLIED'),
    "SUBJECT" CHARACTER VARYING(255)
);            
ALTER TABLE "PUBLIC"."CONTACT_MESSAGE" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_BE" PRIMARY KEY("ID");             
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.CONTACT_MESSAGE;         
CREATE CACHED TABLE "PUBLIC"."EXERCISE"(
    "EXERCISE_ID" UUID NOT NULL,
    "ACTIVE" BOOLEAN NOT NULL,
    "CREATED_AT" TIMESTAMP(6),
    "DESCRIPTION" CHARACTER VARYING(2000),
    "DIFFICULTY" CHARACTER VARYING(255),
    "NAME" CHARACTER VARYING(255),
    "TARGET_MUSCLE" CHARACTER VARYING(255),
    "WARNING" CHARACTER VARYING(500),
    "CREATED_BY" UUID
);           
ALTER TABLE "PUBLIC"."EXERCISE" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_A" PRIMARY KEY("EXERCISE_ID");            
-- 17 +/- SELECT COUNT(*) FROM PUBLIC.EXERCISE;               
INSERT INTO "PUBLIC"."EXERCISE" VALUES
(UUID '70c10804-9fdf-4ed8-9348-790362402925', TRUE, TIMESTAMP '2026-08-09 00:10:01.987666', U&'Start in a plank position with your hands slightly wider than shoulder width.\000a\000a     Lower your body until your chest nearly touches the floor.\000a\000a     Keep your body straight and core tight.\000a\000a     Push back up to the starting position.', 'BEGINNER', 'Push Up', 'Chest', 'Avoid if you have shoulder or wrist injuries.', NULL),
(UUID 'e1a3167e-79f3-49a1-8906-d9a54c3b18d5', TRUE, TIMESTAMP '2026-08-09 00:10:01.987666', U&'Stand with your feet shoulder-width apart.\000a\000a     Lower your body by bending your knees and pushing your hips back.\000a\000a     Keep your chest up and back straight.\000a\000a     Return to standing position.', 'BEGINNER', 'Bodyweight Squat', 'Legs', 'Do not perform if you have severe knee pain.', NULL),
(UUID 'c83118a1-8c2f-4fa4-a0d5-0575cc31fb72', TRUE, TIMESTAMP '2026-08-09 00:10:01.987666', U&'Start in a forearm plank position with elbows directly under shoulders.\000a\000a     Keep your body in a straight line from head to heels.\000a\000a     Engage your core and hold the position.', 'BEGINNER', 'Plank Hold', 'Core', 'Stop if you feel pain in your lower back.', NULL),
(UUID '863f9b01-182c-4f6d-8788-20be39d57674', TRUE, TIMESTAMP '2026-08-09 00:10:01.987666', U&'Stand upright with feet together.\000a\000a     Step forward with one leg and lower your hips until both knees are bent at about 90 degrees.\000a\000a     Push back to the starting position and switch legs.', 'BEGINNER', 'Forward Lunges', 'Legs', 'Avoid if you have knee ligament injuries.', NULL),
(UUID 'aa8d4010-e3e0-40cb-89f5-b0b5f7fd3176', TRUE, TIMESTAMP '2026-08-09 00:10:01.987666', U&'Start in a push-up position.\000a\000a     Bring one knee toward your chest, then quickly switch legs.\000a\000a     Continue alternating legs in a running motion.', 'INTERMEDIATE', 'Mountain Climbers', 'Full Body', 'Not recommended for people with wrist or shoulder pain.', NULL),
(UUID 'e8127c67-bff6-4612-9a7c-819c921c2fae', TRUE, TIMESTAMP '2026-08-09 00:10:01.987666', U&'Start in a push-up position.\000a\000a     Bring one knee toward your chest, then quickly switch legs.\000a\000a     Continue alternating legs in a running motion.', 'INTERMEDIATE', 'Mountain Climbers', 'Full Body', 'Not recommended for people with wrist or shoulder pain.', NULL),
(UUID '375a860f-2ced-45c3-8977-c4504a6f9fdb', TRUE, TIMESTAMP '2026-08-09 00:10:01.987666', NULL, 'BEGINNER', 'Jumping Jacks', 'Full Body', NULL, NULL),
(UUID 'f4b6adca-5204-4ec1-862b-d3cce611f17c', TRUE, TIMESTAMP '2026-08-09 00:10:01.987666', U&'Stand upright with your feet together and arms at your sides.\000a\000a     Jump while spreading your legs and raising your arms overhead.\000a\000a     Return to the starting position.', 'BEGINNER', 'Jumping Jacks', 'Full Body', 'Avoid if you have ankle or knee injuries.', NULL),
(UUID 'b2962988-5004-4820-92f7-c2ed5d3e6ca8', TRUE, TIMESTAMP '2026-08-09 00:10:01.987666', 'Start standing, drop into a squat, kick feet back to a plank, perform a push-up, jump forward and jump up.', 'ADVANCED', 'Burpees', 'Full Body', 'Avoid if you have heart or joint problems.', NULL),
(UUID '8a0d33e9-fd57-4dbe-96c7-aa31b0e01a67', TRUE, TIMESTAMP '2026-08-09 00:10:01.987666', 'Lie on your back with knees bent and lift your upper body toward your knees.', 'BEGINNER', 'Sit Ups', 'Core', 'Avoid if you have lower back issues.', NULL),
(UUID '40555ad6-e98b-4c0f-a9f3-b0d248978679', TRUE, TIMESTAMP '2026-08-09 00:10:01.987666', 'Lie on your back and alternate touching elbows to opposite knees in a cycling motion.', 'INTERMEDIATE', 'Bicycle Crunch', 'Core', 'Avoid if you have neck strain.', NULL),
(UUID '61cc52b1-0eaf-4da4-8f39-d903419a39ce', TRUE, TIMESTAMP '2026-08-09 00:10:01.987666', 'Lie flat and raise your legs straight up while keeping your core engaged.', 'BEGINNER', 'Leg Raises', 'Core', 'Avoid if you have lower back pain.', NULL),
(UUID 'edb5cee1-f8a1-4abb-82a4-2f2f66603baf', TRUE, TIMESTAMP '2026-08-09 00:10:01.987666', 'Lie flat on a bench and grip the barbell slightly wider than shoulder width. Lower the bar to your chest and press it back up until your arms are fully extended.', 'INTERMEDIATE', 'Bench Press', 'Chest', 'Avoid if you have shoulder or chest injuries.', NULL); 
INSERT INTO "PUBLIC"."EXERCISE" VALUES
(UUID '43a22396-61a5-4752-9c6b-c28761d20b83', TRUE, TIMESTAMP '2026-08-09 00:10:01.987666', 'Sit at the lat pulldown machine and grip the bar wide. Pull the bar down toward your chest while squeezing your back muscles.', 'BEGINNER', 'Lat Pulldown', 'Back', 'Do not lean too far back...', NULL),
(UUID 'a6c27daa-bd9c-4955-8596-8ed34c868a93', TRUE, TIMESTAMP '2026-08-09 00:10:01.987666', 'Sit on the leg press machine and place your feet shoulder-width apart on the platform. Push the platform away by extending your legs.', 'BEGINNER', 'Leg Press', 'Legs', 'Do not lock your knees...', NULL),
(UUID '32396b90-69f6-4f2e-b104-5b908afd2ebc', TRUE, TIMESTAMP '2026-08-09 00:10:01.987666', 'Stand at a cable machine holding the rope or bar attachment. Push the handle down by extending your arms.', 'BEGINNER', 'Cable Tricep Pushdown', 'Arms', 'Keep your elbows close...', NULL),
(UUID 'b671b290-95c5-4cec-9785-4cc3a65c6bc6', TRUE, TIMESTAMP '2026-08-09 00:10:01.987666', 'Sit at the cable row machine and pull the handle toward your waist while squeezing your shoulder blades.', 'BEGINNER', 'Seated Row', 'Back', 'Avoid rounding your back...', NULL);         
CREATE CACHED TABLE "PUBLIC"."EXERCISE_IMAGE"(
    "ID" UUID NOT NULL,
    "IMAGE_URL" CHARACTER VARYING(255),
    "EXERCISE_ID" UUID
);  
ALTER TABLE "PUBLIC"."EXERCISE_IMAGE" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_6F" PRIMARY KEY("ID");              
-- 30 +/- SELECT COUNT(*) FROM PUBLIC.EXERCISE_IMAGE;         
INSERT INTO "PUBLIC"."EXERCISE_IMAGE" VALUES
(UUID '10978461-d758-4849-8cf6-5cffa74e6040', 'b6a9c626-37a3-4b0e-98de-dcaa61463e5e_Push-Up-Exercises-1.jpg', UUID '70c10804-9fdf-4ed8-9348-790362402925'),
(UUID 'db4f4d91-d184-45f0-86b5-260bb57f453e', '727dd3c5-e800-4adc-b120-06dc61815e93_Push_Up.webp', UUID '70c10804-9fdf-4ed8-9348-790362402925'),
(UUID '2457b19f-6976-427e-8e94-e0bd133d41ce', '2a84a1a2-b968-4983-a0fe-36a727978ba2_9BP4SsAx7aSmc6gE5FFiGC.jpg', UUID '70c10804-9fdf-4ed8-9348-790362402925'),
(UUID '51da131e-d0c5-4efa-9835-baec0b493de6', '417a3e9a-c596-412c-b037-505dee5610ff_Ryan-Push-Up.png', UUID '70c10804-9fdf-4ed8-9348-790362402925'),
(UUID '7f1c9fe3-d509-402f-81ea-85268ad333d5', 'd8f36290-09b5-4664-81a0-ba59c15d5a12_Pushup-Mistakes-Body360-Fit.png', UUID '70c10804-9fdf-4ed8-9348-790362402925'),
(UUID '09d50c49-99da-4511-855b-0f06f6c1b1ba', '7af8baa6-f40d-4f5a-ace5-96519c5c83ba_66e8991460790ade1fac6d2a_maxresdefault (1).jpg', UUID 'e1a3167e-79f3-49a1-8906-d9a54c3b18d5'),
(UUID '59b93971-986f-4369-9a39-8e7998a76e8b', 'f87f4151-470b-45e3-b732-80a5b591aaec_5-Master-the-Squat-in-5-Easy-Steps.jpg', UUID 'e1a3167e-79f3-49a1-8906-d9a54c3b18d5'),
(UUID '4e3bb11c-dd6f-432e-b51d-2037a53972ee', '365852d8-d60f-4662-9e1d-d906e91c1682_19-bodyweight-squat.avif', UUID 'e1a3167e-79f3-49a1-8906-d9a54c3b18d5'),
(UUID '19bcb2d7-a335-4403-a74e-827d835656ae', '8f6bbed1-29f9-4725-ad3e-a5efdc12ceaa_how-many-push-ups-should-you-do-a-day-to-see-results.jpeg', UUID 'c83118a1-8c2f-4fa4-a0d5-0575cc31fb72'),
(UUID 'd221ee09-102f-4595-9de8-2a1e0ea26ac6', '505f4193-ac06-4356-9949-686f3bdd84e7_Push-Up-Exercises-1.jpg', UUID 'c83118a1-8c2f-4fa4-a0d5-0575cc31fb72'),
(UUID 'c71a1539-c284-4c3c-9e78-7ae0c3deefa5', '2f27f27f-587c-4b03-95d7-a13674f2da36_how-to-do-a-push-up-plank-build-core-chest-and-triceps.jpeg', UUID 'c83118a1-8c2f-4fa4-a0d5-0575cc31fb72'),
(UUID '954fdbbc-74e7-453d-bf3a-6a0baf2b93d2', '80674007-070d-4c6c-955d-f789a94ccede_black-guy-doing-forward-lunge-exercise-laptop-home-sporty-black-guy-doing-forward-lunge-exercise-training-front-laptop-219000134.webp', UUID '863f9b01-182c-4f6d-8788-20be39d57674'),
(UUID 'a39e47f7-d9b7-488a-b31e-97cd779a1ae5', 'ae789204-121c-48ce-b649-045fe42f4876_cheerful-athletic-black-man-doing-forward-lunge-exercising-near-laptop-watching-online-workout-tutorial-home-guy-training-428627411.webp', UUID '863f9b01-182c-4f6d-8788-20be39d57674'),
(UUID 'b35b0942-240a-4974-bdf1-8c10a9423eb8', '20830875-2244-4a07-b50f-954e44b9acd4_mountain-climbers.png', UUID 'e8127c67-bff6-4612-9a7c-819c921c2fae'),
(UUID 'fcc8a214-59bb-4d24-9775-0ef0134c9b43', 'a7962b4d-7c08-4012-912c-97d22a397d33_how-to-do-mountain-climbers.jpeg', UUID 'e8127c67-bff6-4612-9a7c-819c921c2fae'),
(UUID 'a73ce274-09cc-4e9f-bd9c-485420dad1d6', '4d9ec68f-e2a3-437e-b454-c04032580116_GRT-two-people-jumping-jacks-1296x728-header.avif', UUID 'f4b6adca-5204-4ec1-862b-d3cce611f17c'),
(UUID 'aad20ac3-12ff-400f-a042-b44420f5bed7', '801a13ee-3a77-4787-aa49-ea5721e46d59_depositphotos_475663642-stock-illustration-guy-doing-jumping-jacks-home.jpg', UUID 'f4b6adca-5204-4ec1-862b-d3cce611f17c'),
(UUID '48c366d2-5f86-40fc-b7ec-46dd8c017eab', 'b1ce7683-d421-46e8-a1bb-f47cae52ace3_A_diagram_of_a_woman_showing_the_change_in_position_to_perform_Burpees_52648db3-20b9-419c-8648-c58a9351ca34.webp', UUID 'b2962988-5004-4820-92f7-c2ed5d3e6ca8'),
(UUID 'ff0361ba-f254-4321-ac8e-a272a549632d', 'dacb6b12-f12d-4419-81c1-d79c2011ae68_burpee-1109.webp', UUID 'b2962988-5004-4820-92f7-c2ed5d3e6ca8'),
(UUID '43cf6f01-4a03-47c2-8cb6-79178d7ecec4', '9152225b-54bf-4fe3-a1dc-906f6260783b_GzLeM2yKQGigqMF7Mtu8vh.jpg', UUID '8a0d33e9-fd57-4dbe-96c7-aa31b0e01a67'),
(UUID '7b83627e-6393-4c39-98b5-6da106705ab3', 'fe7d8bfe-8cd6-411b-ad37-97369aa2b1d3_u732pcXisraDgMESrUvnNk.jpg', UUID '8a0d33e9-fd57-4dbe-96c7-aa31b0e01a67'),
(UUID 'e65805ab-6185-4257-8cc8-d0be3aa0c565', '8571e914-0d27-4070-b0b5-75fdece1e561_bicycle-crunch.jpg', UUID '40555ad6-e98b-4c0f-a9f3-b0d248978679'),
(UUID '7e9537e8-011c-44ff-94e5-6000daf85cc0', '2b6c0fb0-b81f-4871-ad8d-7c451ac776c1_Bicycle_Exercise.webp', UUID '40555ad6-e98b-4c0f-a9f3-b0d248978679');            
INSERT INTO "PUBLIC"."EXERCISE_IMAGE" VALUES
(UUID '5cad5dcf-e981-40a0-a53a-f9a639258ec9', '94ffd7ba-3468-4f94-956b-f8f5b2b481bf_Xw8VaDaXRAstbCW84vib6g.jpg', UUID '61cc52b1-0eaf-4da4-8f39-d903419a39ce'),
(UUID 'c2b3320a-c387-4457-9664-a7c339604c33', 'fc6f1bc8-7638-4003-9fa1-7f545f00ff9f_woman-doing-straight-leg-raise-on-yoga-mat.png', UUID '61cc52b1-0eaf-4da4-8f39-d903419a39ce'),
(UUID 'd71299d5-5274-458d-8ac1-53cf3dbf7d32', 'b4a3b259-1693-4615-a92c-55637ad54af1_bench-press-form.jpg', UUID 'edb5cee1-f8a1-4abb-82a4-2f2f66603baf'),
(UUID '31beb5ec-9419-4875-afda-c901b152667e', '80c7fa99-e45e-4b79-8c0e-7ff9585c475c_67f015f49341927eeca662f0_67e301fcab24c92d48cb372e_AF-HERO_BenchPress%20(1).jpeg', UUID 'edb5cee1-f8a1-4abb-82a4-2f2f66603baf'),
(UUID '4af89747-2d97-46e2-bd09-6db56a431116', 'de075147-3867-4100-aead-8b63b9e1b779_Lat-pulldown-on-Mirafit-Lat-Pulldown-Machine.webp', UUID '43a22396-61a5-4752-9c6b-c28761d20b83'),
(UUID '3e5338bf-1295-4495-a4ca-3c307b73d87d', '97f1d7df-a930-435e-9ae3-08f427b853c4_lat-pulldown-maschine.webp', UUID '43a22396-61a5-4752-9c6b-c28761d20b83'),
(UUID '181783db-01d4-471c-a95a-a879ce0b33bd', '02c40f4d-4c57-42cc-ae52-1c956a71b0d8_6786c870ee8717d31a82f0a4_677e6acd61197024154c1738_AF_Blog_HERO_HowToUseTheLatPulldownMachine.jpeg', UUID '43a22396-61a5-4752-9c6b-c28761d20b83'); 
CREATE CACHED TABLE "PUBLIC"."EXERCISE_VIDEO"(
    "ID" UUID NOT NULL,
    "VIDEO_URL" CHARACTER VARYING(255),
    "EXERCISE_ID" UUID
);  
ALTER TABLE "PUBLIC"."EXERCISE_VIDEO" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_6FB" PRIMARY KEY("ID");             
-- 35 +/- SELECT COUNT(*) FROM PUBLIC.EXERCISE_VIDEO;         
INSERT INTO "PUBLIC"."EXERCISE_VIDEO" VALUES
(UUID 'f071d03f-2941-4c5b-8a34-888fbc1296e9', 'https://www.youtube.com/watch?v=IODxDxX7oi4', UUID '70c10804-9fdf-4ed8-9348-790362402925'),
(UUID '088c22b7-3efd-4285-b383-fc6ef4b12fbf', 'https://youtu.be/8uoaYwS6iFM?si=Yu-1x2KxSNJR6Upj', UUID 'e1a3167e-79f3-49a1-8906-d9a54c3b18d5'),
(UUID 'f9f00e10-65f6-4765-8147-55c7adc2290f', 'https://youtu.be/30PqX2zvK88?si=Mo0xrDthGBHVXVfM', UUID 'e1a3167e-79f3-49a1-8906-d9a54c3b18d5'),
(UUID '5b386f4f-c5d7-4ca1-a207-ea3a98042fec', 'https://youtu.be/6LqqeBtFn9M?si=YTs99BeApsWDT9jW', UUID 'c83118a1-8c2f-4fa4-a0d5-0575cc31fb72'),
(UUID '46dfdab1-b275-47a5-af47-b1b8d9fe5a51', 'https://youtu.be/A2b2EmIg0dA?si=OrnSMlN6lmmOoeDi', UUID 'c83118a1-8c2f-4fa4-a0d5-0575cc31fb72'),
(UUID 'a81580a0-d4d4-4b78-bc9c-8c0617eeebc5', 'https://youtu.be/g8-Ge9S0aUw?si=JaYiZMBSYu5CzzuS', UUID '863f9b01-182c-4f6d-8788-20be39d57674'),
(UUID '9131bbb7-a2a2-4701-888e-a79334aad87d', 'https://youtu.be/3TM-vVWuLYE?si=_mJI1lrYMTZnx1Ry', UUID '863f9b01-182c-4f6d-8788-20be39d57674'),
(UUID '1c733c36-721c-4178-9d4a-f6bc4013cc49', 'https://youtu.be/ruQ4ZwncXBg?si=El5hX03FQk69smrM', UUID 'aa8d4010-e3e0-40cb-89f5-b0b5f7fd3176'),
(UUID 'fd364f71-0e8e-4e4b-b98d-034a1789c878', 'https://youtu.be/ZhiCSdOVJp0?si=dvm6LH41tIlM5_5y', UUID 'aa8d4010-e3e0-40cb-89f5-b0b5f7fd3176'),
(UUID 'cdb701e3-0666-48d3-bd2a-67f7e2e2fcd4', 'https://youtu.be/kLh-uczlPLg?si=_VVK_bQguZvD4Osr', UUID 'aa8d4010-e3e0-40cb-89f5-b0b5f7fd3176'),
(UUID 'cdd0a202-6f00-4ebb-b5ef-0fda4c0f1071', 'https://youtu.be/ruQ4ZwncXBg?si=9SQXdLX0WCTSDtVY', UUID 'e8127c67-bff6-4612-9a7c-819c921c2fae'),
(UUID '73d78ded-c80b-4b80-ba65-4fedf7870f09', 'https://youtu.be/ZhiCSdOVJp0?si=zPlHV2nsd9eIYrPm', UUID 'e8127c67-bff6-4612-9a7c-819c921c2fae'),
(UUID 'aef02e29-db0f-4863-a11b-d5b89fe23354', 'https://youtu.be/ZhiCSdOVJp0?si=zPlHV2nsd9eIYrPm', UUID 'e8127c67-bff6-4612-9a7c-819c921c2fae'),
(UUID 'aec8891f-2f78-4733-9b10-0e626fe22e4e', 'https://youtu.be/CWpmIW6l-YA?si=bRY2-a6da9Hn_SVo', UUID '375a860f-2ced-45c3-8977-c4504a6f9fdb'),
(UUID 'f34784e7-29b3-450d-8dea-6205c6e57ca4', 'https://youtu.be/CWpmIW6l-YA?si=bRY2-a6da9Hn_SVo', UUID '375a860f-2ced-45c3-8977-c4504a6f9fdb'),
(UUID 'f71b64d7-b04e-4dc2-8dd3-a993c5206a1b', 'https://youtu.be/CWpmIW6l-YA?si=bRY2-a6da9Hn_SVo', UUID 'f4b6adca-5204-4ec1-862b-d3cce611f17c'),
(UUID 'ba129311-dceb-4149-aa13-2218a058ed38', 'https://youtu.be/CWpmIW6l-YA?si=bRY2-a6da9Hn_SVo', UUID 'f4b6adca-5204-4ec1-862b-d3cce611f17c'),
(UUID '1e18637e-1a97-409b-b89a-504d15ffa361', 'https://youtu.be/y9RBpnR04B0?si=Q2Fnt4ylHB7XHUiC', UUID 'b2962988-5004-4820-92f7-c2ed5d3e6ca8'),
(UUID '60c320b0-3965-422e-bb19-31f276489beb', 'https://youtu.be/qu1pqo-dbXM?si=L26RarOMPeK9w-A2', UUID 'b2962988-5004-4820-92f7-c2ed5d3e6ca8'),
(UUID '3892450f-6e51-452d-b846-ed540e8f32c1', 'https://youtu.be/s3PPU_2z9qo?si=3QZZUrq6EVQHAxVw', UUID '8a0d33e9-fd57-4dbe-96c7-aa31b0e01a67'),
(UUID '4d58113e-0c19-4917-94a2-ed24573998d3', 'https://youtu.be/5ER5Of4MOPI?si=Dwh6619gMFuZBCoW', UUID '8a0d33e9-fd57-4dbe-96c7-aa31b0e01a67'),
(UUID 'ec73a46b-1614-457d-a93e-fdf849597f07', 'https://youtu.be/eqg47ZuGZXQ?si=6XG0r8GqG3LroXMA', UUID '40555ad6-e98b-4c0f-a9f3-b0d248978679'),
(UUID '2be8a82e-09fc-4c96-8c39-08323da4df34', 'https://youtu.be/wnuLak2onoA?si=ZMuCVrY5KDhfL01h', UUID '40555ad6-e98b-4c0f-a9f3-b0d248978679'),
(UUID '5ce79075-23d8-421e-b261-68a16f869f26', 'https://youtu.be/zHsPDsYwEWs?si=LiYRXMKGCidT0vhe', UUID '61cc52b1-0eaf-4da4-8f39-d903419a39ce'),
(UUID '8e06cac8-e975-4432-b562-0825e7d4d981', 'https://youtu.be/RuIdJSVTKO4?si=Hoe9fdEZxPvnjYA2', UUID '61cc52b1-0eaf-4da4-8f39-d903419a39ce'),
(UUID '89c80e62-ed54-4571-9a5f-5024cab67ae0', 'https://youtu.be/gRVjAtPip0Y?si=NYqnxlWmH2zk-RFg', UUID 'edb5cee1-f8a1-4abb-82a4-2f2f66603baf'),
(UUID 'c1a3fc63-7be9-4f98-9ad8-69acb6b0937a', 'https://youtu.be/vthMCtgVtFw?si=vtwK7n4hfg2FzHmR', UUID 'edb5cee1-f8a1-4abb-82a4-2f2f66603baf'),
(UUID 'dcff4bae-e029-4fbb-bde1-5636e569968d', 'https://youtu.be/SALxEARiMkw?si=GBvygJYQT0Kzy6jn', UUID '43a22396-61a5-4752-9c6b-c28761d20b83'),
(UUID '4b366929-c828-43c8-a859-571b958dc588', 'https://youtu.be/CAwf7n6Luuc?si=Tn-wPMlZKr_z94Sz', UUID '43a22396-61a5-4752-9c6b-c28761d20b83');          
INSERT INTO "PUBLIC"."EXERCISE_VIDEO" VALUES
(UUID '0aed7aa1-c0bd-4053-a640-0b688d921f6a', 'https://youtu.be/n69-eVLtevc?si=2cmJUZbUoAl3f6-h', UUID 'a6c27daa-bd9c-4955-8596-8ed34c868a93'),
(UUID '4a042831-f2e7-42f2-9c2e-8495079af750', 'https://youtu.be/8EMbB0tCn7Q?si=vWtdePagJqefJm_X', UUID 'a6c27daa-bd9c-4955-8596-8ed34c868a93'),
(UUID 'b6c8b224-8796-4f1f-ae92-05a2b0a8ad34', 'https://youtu.be/-zLyUAo1gMw?si=aCeWI5uwg_us5yZY', UUID '32396b90-69f6-4f2e-b104-5b908afd2ebc'),
(UUID 'fe159e67-c5a2-40ec-a0dc-994c963ec96a', 'https://youtu.be/_w-HpW70nSQ?si=LGPheWQ3lu84J2Z9', UUID '32396b90-69f6-4f2e-b104-5b908afd2ebc'),
(UUID '7ce43c16-00fc-4c03-b57d-74dcd31045de', 'https://youtu.be/vwHG9Jfu4sw?si=kMGUwg1oyLmVbg7g', UUID 'b671b290-95c5-4cec-9785-4cc3a65c6bc6'),
(UUID '86985770-8029-49d4-a371-cc92eb28cf94', 'https://youtu.be/CsROhQ1onAg?si=noRZZnBtemy1S5Z7', UUID 'b671b290-95c5-4cec-9785-4cc3a65c6bc6');            
CREATE CACHED TABLE "PUBLIC"."GALLERY_IMAGE"(
    "ID" UUID NOT NULL,
    "CATEGORY" CHARACTER VARYING(255),
    "CREATED_AT" TIMESTAMP(6),
    "DESCRIPTION" CHARACTER VARYING(255),
    "IMAGE_URL" CHARACTER VARYING(255),
    "TITLE" CHARACTER VARYING(255)
);    
ALTER TABLE "PUBLIC"."GALLERY_IMAGE" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_1B" PRIMARY KEY("ID");               
-- 12 +/- SELECT COUNT(*) FROM PUBLIC.GALLERY_IMAGE;          
INSERT INTO "PUBLIC"."GALLERY_IMAGE" VALUES
(UUID '24e259e1-cc23-4f77-bd6c-9f6a52612139', 'Fitness', TIMESTAMP '2026-04-04 00:10:27.530656', 'Our members pushing limits with intense strength training workouts to build muscle and endurance.', 'beca9894-35ea-483f-a15c-34e8b47284b7_ds2.webp', 'Strength Training Session'),
(UUID 'a0efead0-23f3-4e47-8fff-d0d06b602533', 'Fitness', TIMESTAMP '2026-04-04 00:10:27.70764', 'Our members pushing limits with intense strength training workouts to build muscle and endurance.', '0e84abf1-6f56-46d3-8d5c-f0b542543da8_ds1.webp', 'Strength Training Session'),
(UUID '24f43daf-5acc-4424-b0e9-116a2aafa26b', 'Fitness', TIMESTAMP '2026-04-04 00:10:27.713625', 'Our members pushing limits with intense strength training workouts to build muscle and endurance.', 'bcbc9639-0b93-4cad-b2c7-ce607c29a5a2_b1.webp', 'Strength Training Session'),
(UUID '431ea999-8006-4270-b6ee-4dd2bfb81527', 'Fitness', TIMESTAMP '2026-04-04 00:10:27.720629', 'Our members pushing limits with intense strength training workouts to build muscle and endurance.', '31649a43-b68b-4346-a32b-e7a212f82272_hq720.jpg', 'Strength Training Session'),
(UUID '1ce3223c-9b93-4064-94c3-89fed4da31d5', 'Fitness', TIMESTAMP '2026-04-04 00:10:27.725654', 'Our members pushing limits with intense strength training workouts to build muscle and endurance.', '57c279d8-e5c4-49fa-914a-7e5c8dbe8deb_A_man_doing_seated_cable_row.webp', 'Strength Training Session'),
(UUID '6806fb97-d1c0-4bf9-80ce-0222fb6a5688', 'Fitness', TIMESTAMP '2026-04-04 00:10:27.731632', 'Our members pushing limits with intense strength training workouts to build muscle and endurance.', '65d2179b-479f-4267-8f88-b42690c5969e_istockphoto-1342504639-612x612.jpg', 'Strength Training Session'),
(UUID 'ab55ad55-77f5-4133-bd7b-212d4cc37144', 'Nutrition', TIMESTAMP '2026-04-04 00:11:14.639635', 'High-energy cardio sessions designed to improve stamina, burn calories, and boost heart health.', '980b22e7-3d6e-4f25-8e99-73579c786fd2_black-guy-doing-forward-lunge-exercise-laptop-home-sporty-black-guy-doing-forward-lunge-exercise-training-front-laptop-219000134.webp', U&'Cardio Blast \+01f525'),
(UUID '1df9c550-6809-4fa0-a33f-3a1cac62efef', 'Nutrition', TIMESTAMP '2026-04-04 00:11:14.654095', 'High-energy cardio sessions designed to improve stamina, burn calories, and boost heart health.', 'bef3fc3e-2e36-4c9c-a8ab-30a8f555ab98_cheerful-athletic-black-man-doing-forward-lunge-exercising-near-laptop-watching-online-workout-tutorial-home-guy-training-428627411.webp', U&'Cardio Blast \+01f525'),
(UUID 'c6ed8785-837b-4605-bccd-aa9bb9fa4caa', 'Nutrition', TIMESTAMP '2026-04-04 00:11:14.665623', 'High-energy cardio sessions designed to improve stamina, burn calories, and boost heart health.', '7fd4c0f1-ea62-43d5-8c37-9079fa3ce24f_how-to-do-a-push-up-plank-build-core-chest-and-triceps.jpeg', U&'Cardio Blast \+01f525'),
(UUID '7177d0f3-c9b6-46fc-8a67-c5253e5a5bb3', 'Nutrition', TIMESTAMP '2026-04-04 00:11:14.677083', 'High-energy cardio sessions designed to improve stamina, burn calories, and boost heart health.', 'da1bf3d3-3545-4e25-93b8-ff83d31c1d3a_19-bodyweight-squat.avif', U&'Cardio Blast \+01f525'),
(UUID '1e5832b2-3fb2-486d-ba04-9b13de59b972', 'Nutrition', TIMESTAMP '2026-04-04 00:11:14.692106', 'High-energy cardio sessions designed to improve stamina, burn calories, and boost heart health.', 'f636c810-8a7a-4510-86b6-82ee62b56bb5_how-to-get-better-at-push-ups_c96cd61d-63d8-4bd0-a93e-e3a8dee52408.webp', U&'Cardio Blast \+01f525'),
(UUID '8550a713-31d3-46d9-b871-b7f61e0d50b9', 'Nutrition', TIMESTAMP '2026-04-04 00:11:14.705148', 'High-energy cardio sessions designed to improve stamina, burn calories, and boost heart health.', '191fc820-a85f-41c5-b488-ca919e272a6e_young-man-workout-fitness-club-260nw-2471712867.webp', U&'Cardio Blast \+01f525');          
CREATE CACHED TABLE "PUBLIC"."GALLERY_VIDEO"(
    "ID" UUID NOT NULL,
    "CATEGORY" CHARACTER VARYING(255),
    "CREATED_AT" TIMESTAMP(6),
    "DESCRIPTION" CHARACTER VARYING(255),
    "TITLE" CHARACTER VARYING(255),
    "VIDEO_URL" CHARACTER VARYING(255)
);    
ALTER TABLE "PUBLIC"."GALLERY_VIDEO" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_1BB" PRIMARY KEY("ID");              
-- 5 +/- SELECT COUNT(*) FROM PUBLIC.GALLERY_VIDEO;           
INSERT INTO "PUBLIC"."GALLERY_VIDEO" VALUES
(UUID '0ac57d9b-6129-4ab9-a885-9e997fb33a0a', 'Fitness', TIMESTAMP '2026-04-04 00:12:13.494898', 'Our members pushing limits with intense strength training workouts to build muscle and endurance.', 'Strength Training Session', 'https://youtu.be/Epit6DSq_ww?si=xpNvDQU9pXfD-aaT'),
(UUID 'd036ab91-6dbb-4d8f-a2cb-838f839fbbbf', 'Fitness', TIMESTAMP '2026-04-04 00:12:49.490571', 'Capturing powerful workout moments from our daily gym activities and member routines.', 'Gym Workout Moments', 'https://youtu.be/f9TERHtc1LA?si=aqxJYE-74YfwusbL'),
(UUID '2fe5e54a-a6a4-4813-8f4c-7f8b51809dd5', 'Nutrition', TIMESTAMP '2026-04-04 00:13:17.978901', 'Motivating group workouts where members train together and achieve fitness goals as a team.', U&'Group Training Session \+01f465', 'https://youtu.be/mtX-B5gbgmM?si=IINkIFHq9O7HlQsp'),
(UUID '759983ba-ad37-4131-ba74-68b7a294264e', 'Fitness', TIMESTAMP '2026-04-04 00:13:43.65698', 'Expert trainers helping members maintain proper form and maximize results.', U&'Trainer Guidance \+01f3af', 'https://youtu.be/5ourM6YUQPU?si=PAXRTWq87AjftAIn'),
(UUID 'bb938bd0-4822-4e52-b858-8ec707300d61', 'Nutrition', TIMESTAMP '2026-04-04 00:14:20.186851', 'Live action clips of workouts, exercises, and fitness routines inside our gym.', U&'Workout in Action \+01f3a5', 'https://youtu.be/JyV7mUFSpXs?si=P2O_6jEdA2RkWGNO');        
CREATE CACHED TABLE "PUBLIC"."GYM_CLASS"(
    "ID" UUID NOT NULL,
    "ACTIVE" BOOLEAN NOT NULL,
    "CAPACITY" INTEGER NOT NULL,
    "COVER_IMAGE" CHARACTER VARYING(255),
    "CREATED_AT" TIMESTAMP(6),
    "DESCRIPTION" CHARACTER VARYING(5000),
    "DURATION" INTEGER NOT NULL,
    "LEVEL" CHARACTER VARYING(255),
    "NAME" CHARACTER VARYING(255),
    "SHORT_DESCRIPTION" CHARACTER VARYING(2000),
    "TRAINER_ID" UUID
);           
ALTER TABLE "PUBLIC"."GYM_CLASS" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_C" PRIMARY KEY("ID");    
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.GYM_CLASS;               
CREATE CACHED TABLE "PUBLIC"."MEMBER_ROUTINE"(
    "ID" UUID NOT NULL,
    "ACTIVE" BOOLEAN NOT NULL,
    "START_DATE" DATE,
    "MEMBER_MEMBER_ID" UUID,
    "TEMPLATE_ID" UUID
);     
ALTER TABLE "PUBLIC"."MEMBER_ROUTINE" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_4" PRIMARY KEY("ID");               
-- 3 +/- SELECT COUNT(*) FROM PUBLIC.MEMBER_ROUTINE;          
INSERT INTO "PUBLIC"."MEMBER_ROUTINE" VALUES
(UUID '839f736a-9911-4a74-a399-479ad1ca4ca1', TRUE, DATE '2026-03-16', UUID 'bb35327a-49ef-41c9-9e75-7b1ac169f49d', UUID 'fdce820d-bfd7-46ed-8474-43f797c8e637'),
(UUID '758f473c-10c5-4192-bf39-b5881c761bc6', TRUE, DATE '2026-03-16', UUID 'bb35327a-49ef-41c9-9e75-7b1ac169f49d', UUID 'f9669966-5bdb-41fa-961e-808240a7ed07'),
(UUID 'e8bc357e-91e0-405a-8515-43fbb0a2b4e9', TRUE, DATE '2026-03-16', UUID 'bb35327a-49ef-41c9-9e75-7b1ac169f49d', UUID 'be076c82-42b2-4e6d-b358-487d24700c08');         
CREATE CACHED TABLE "PUBLIC"."MEMBERS"(
    "MEMBER_ID" UUID NOT NULL,
    "ACTIVE" BOOLEAN NOT NULL,
    "CREATED_AT" TIMESTAMP(6),
    "DUE_AMOUNT" FLOAT(53) NOT NULL,
    "END_DATE" DATE,
    "HEIGHT" FLOAT(53) NOT NULL,
    "INITIALWEIGHT" FLOAT(53),
    "START_DATE" DATE,
    "MEMBERSHIP_ID" UUID,
    "ROUTINE_TEMPLATE_ID" UUID,
    "TRAINER_ID" UUID,
    "USER_ID" UUID NOT NULL
);            
ALTER TABLE "PUBLIC"."MEMBERS" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_63" PRIMARY KEY("MEMBER_ID");              
-- 2 +/- SELECT COUNT(*) FROM PUBLIC.MEMBERS; 
INSERT INTO "PUBLIC"."MEMBERS" VALUES
(UUID '6f814274-610e-450d-ab35-9cea4bf04083', TRUE, TIMESTAMP '2026-02-08 14:47:45.613253', 0.0, DATE '2026-06-08', 6.0, 56.0, DATE '2026-02-08', UUID '86d5d62e-57ad-4683-affb-8975c12abad0', NULL, UUID 'bc3415f1-3d0a-4a14-8929-457bee0908c4', UUID 'df28677f-6b41-4fd4-8640-9fa347cf76a3'),
(UUID 'bb35327a-49ef-41c9-9e75-7b1ac169f49d', TRUE, TIMESTAMP '2026-02-08 23:11:22.108035', 0.0, DATE '2027-02-08', 6.0, 59.0, DATE '2026-02-08', UUID '180b9553-8436-41a2-8f30-c763af4dabd5', NULL, UUID 'bc3415f1-3d0a-4a14-8929-457bee0908c4', UUID '7ed12be7-dbe1-49bd-8617-6bb97673dfdc');       
CREATE CACHED TABLE "PUBLIC"."MEMBERSHIP_FEATURE"(
    "ID" INTEGER NOT NULL,
    "FEATURE_NAME" CHARACTER VARYING(255),
    "MEMBERSHIP_ID" UUID
);      
ALTER TABLE "PUBLIC"."MEMBERSHIP_FEATURE" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_2" PRIMARY KEY("ID");           
-- 24 +/- SELECT COUNT(*) FROM PUBLIC.MEMBERSHIP_FEATURE;     
INSERT INTO "PUBLIC"."MEMBERSHIP_FEATURE" VALUES
(1, 'Gym floor access (Cardio + Basic Equipment)', UUID '4d81c365-18d3-4dbd-8d9d-e1f513e74c4f'),
(2, U&'Fixed time slot access (e.g., 6am\201310am)', UUID '4d81c365-18d3-4dbd-8d9d-e1f513e74c4f'),
(3, 'Locker facility (basic)', UUID '4d81c365-18d3-4dbd-8d9d-e1f513e74c4f'),
(4, 'Monthly subscription', UUID '4d81c365-18d3-4dbd-8d9d-e1f513e74c4f'),
(5, 'Orientation session for beginners', UUID '4d81c365-18d3-4dbd-8d9d-e1f513e74c4f'),
(6, 'Fitness assessment at joining', UUID '4d81c365-18d3-4dbd-8d9d-e1f513e74c4f'),
(7, 'Access to gym rules & safety guidelines', UUID '4d81c365-18d3-4dbd-8d9d-e1f513e74c4f'),
(8, 'Basic towel service', UUID '4d81c365-18d3-4dbd-8d9d-e1f513e74c4f'),
(9, 'Full gym access (Cardio + Strength equipment + Functional training)', UUID '86d5d62e-57ad-4683-affb-8975c12abad0'),
(10, 'Group classes: Yoga, Zumba, HIIT, Aerobics', UUID '86d5d62e-57ad-4683-affb-8975c12abad0'),
(11, U&'Trainer guidance: 1\20132 sessions/month', UUID '86d5d62e-57ad-4683-affb-8975c12abad0'),
(12, 'Locker + shower + towel service', UUID '86d5d62e-57ad-4683-affb-8975c12abad0'),
(13, 'Health check-up / basic body composition analysis', UUID '86d5d62e-57ad-4683-affb-8975c12abad0'),
(14, 'Progress tracking in mobile app', UUID '86d5d62e-57ad-4683-affb-8975c12abad0'),
(15, 'Monthly fitness newsletter / tips', UUID '86d5d62e-57ad-4683-affb-8975c12abad0'),
(16, 'Access to online workout videos library', UUID '86d5d62e-57ad-4683-affb-8975c12abad0'),
(17, 'Unlimited gym access (all equipment + free weights + functional area)', UUID '180b9553-8436-41a2-8f30-c763af4dabd5'),
(18, U&'Personal trainer (2\20133 sessions/week)', UUID '180b9553-8436-41a2-8f30-c763af4dabd5'),
(19, 'Customized workout plan', UUID '180b9553-8436-41a2-8f30-c763af4dabd5'),
(20, 'Diet & nutrition guidance', UUID '180b9553-8436-41a2-8f30-c763af4dabd5'),
(21, 'Progress tracking system (weight, BMI, muscle mass, fat %)', UUID '180b9553-8436-41a2-8f30-c763af4dabd5'),
(22, 'Body composition analysis every month', UUID '180b9553-8436-41a2-8f30-c763af4dabd5'),
(23, 'Priority booking for classes', UUID '180b9553-8436-41a2-8f30-c763af4dabd5'),
(24, 'Access to premium group classes (Pilates, Crossfit)', UUID '180b9553-8436-41a2-8f30-c763af4dabd5'); 
CREATE CACHED TABLE "PUBLIC"."MEMBERSHIPS"(
    "MEMBERSHIP_ID" UUID NOT NULL,
    "ACTIVE" BOOLEAN NOT NULL,
    "DURATION_IN_DAYS" INTEGER NOT NULL,
    "NAME" CHARACTER VARYING(255),
    "PRICE" FLOAT(53) NOT NULL
);             
ALTER TABLE "PUBLIC"."MEMBERSHIPS" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_D" PRIMARY KEY("MEMBERSHIP_ID");       
-- 3 +/- SELECT COUNT(*) FROM PUBLIC.MEMBERSHIPS;             
INSERT INTO "PUBLIC"."MEMBERSHIPS" VALUES
(UUID '4d81c365-18d3-4dbd-8d9d-e1f513e74c4f', TRUE, 180, 'Basic Package (Starter Plan)', 2000.0),
(UUID '86d5d62e-57ad-4683-affb-8975c12abad0', TRUE, 120, 'Standard Package (Regular Plan)', 1700.0),
(UUID '180b9553-8436-41a2-8f30-c763af4dabd5', TRUE, 365, 'Premium Package (Pro Fitness Plan)', 3600.0);   
CREATE CACHED TABLE "PUBLIC"."MEMBERS_PROGRESS"(
    "ID" UUID NOT NULL,
    "BMI" FLOAT(53) NOT NULL,
    "BODY_FAT" FLOAT(53) NOT NULL,
    "NOTES" CHARACTER VARYING(500),
    "RECORD_DATE" DATE,
    "WEIGHT" FLOAT(53) NOT NULL,
    "MEMBER_MEMBER_ID" UUID
); 
ALTER TABLE "PUBLIC"."MEMBERS_PROGRESS" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_6E" PRIMARY KEY("ID");            
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.MEMBERS_PROGRESS;        
CREATE CACHED TABLE "PUBLIC"."PAYMENTS"(
    "PAYMENT_ID" UUID NOT NULL,
    "AMOUNT" FLOAT(53) NOT NULL,
    "FOR_MEMBERSHIP" CHARACTER VARYING(255),
    "GATEWAY" CHARACTER VARYING(255),
    "METHOD" CHARACTER VARYING(255),
    "PAYMENT_DATE" DATE,
    "SUCCESS" BOOLEAN NOT NULL,
    "TRANSACTION_ID" CHARACTER VARYING(255),
    "MEMBER_MEMBER_ID" UUID,
    "MEMBERSHIP_MEMBERSHIP_ID" UUID
);        
ALTER TABLE "PUBLIC"."PAYMENTS" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_81" PRIMARY KEY("PAYMENT_ID");            
-- 2 +/- SELECT COUNT(*) FROM PUBLIC.PAYMENTS;
INSERT INTO "PUBLIC"."PAYMENTS" VALUES
(UUID '71c24b89-9db9-4e08-b6fd-38c0a12993c4', 6000.0, NULL, NULL, 'Cash', DATE '2026-02-08', TRUE, NULL, UUID '6f814274-610e-450d-ab35-9cea4bf04083', NULL),
(UUID 'b73dd04a-9631-46bd-a986-8f18c04cd93c', 50000.0, NULL, NULL, 'Nagad', DATE '2026-02-08', TRUE, NULL, UUID 'bb35327a-49ef-41c9-9e75-7b1ac169f49d', NULL);          
CREATE CACHED TABLE "PUBLIC"."ROUTINE_TEMPLATE_DAY"(
    "ID" UUID NOT NULL,
    "DAY_OF_WEEK" ENUM('FRIDAY', 'MONDAY', 'SATURDAY', 'SUNDAY', 'THURSDAY', 'TUESDAY', 'WEDNESDAY') NOT NULL,
    "TEMPLATE_ID" UUID NOT NULL
);            
ALTER TABLE "PUBLIC"."ROUTINE_TEMPLATE_DAY" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_CC" PRIMARY KEY("ID");        
-- 20 +/- SELECT COUNT(*) FROM PUBLIC.ROUTINE_TEMPLATE_DAY;   
INSERT INTO "PUBLIC"."ROUTINE_TEMPLATE_DAY" VALUES
(UUID 'ab1869f3-93cb-468a-afbf-9e394461a1c5', 'SATURDAY', UUID 'fdce820d-bfd7-46ed-8474-43f797c8e637'),
(UUID '887d4e51-229d-4930-a5f4-d030f67efecb', 'SUNDAY', UUID 'fdce820d-bfd7-46ed-8474-43f797c8e637'),
(UUID '04753afd-ac08-47fd-a1aa-d1c7f28fbda8', 'MONDAY', UUID 'fdce820d-bfd7-46ed-8474-43f797c8e637'),
(UUID 'fb3ec1ac-fb8c-421b-b5be-9f5f80b1d047', 'TUESDAY', UUID 'fdce820d-bfd7-46ed-8474-43f797c8e637'),
(UUID '8d1386ed-4526-4e7b-b688-530ef1312907', 'WEDNESDAY', UUID 'fdce820d-bfd7-46ed-8474-43f797c8e637'),
(UUID 'd18bc5c0-27d8-43a3-a102-c942fac5c7fa', 'THURSDAY', UUID 'fdce820d-bfd7-46ed-8474-43f797c8e637'),
(UUID 'a377eadf-34da-4cff-a810-cfc8bc2a5575', 'FRIDAY', UUID 'fdce820d-bfd7-46ed-8474-43f797c8e637'),
(UUID 'e492bf6e-8d94-4752-8b10-1cd05350cfa1', 'MONDAY', UUID 'f9669966-5bdb-41fa-961e-808240a7ed07'),
(UUID 'e4086455-dd96-4112-86e8-b31a5ce13513', 'SUNDAY', UUID 'f9669966-5bdb-41fa-961e-808240a7ed07'),
(UUID 'd96abb75-0f02-4e60-9cfa-72e54d447dcd', 'SATURDAY', UUID 'f9669966-5bdb-41fa-961e-808240a7ed07'),
(UUID '6aed5239-e033-4ea1-998b-a321a91c0f56', 'THURSDAY', UUID 'f9669966-5bdb-41fa-961e-808240a7ed07'),
(UUID 'c662d10f-8ee3-442a-8bce-aa93f8986aa8', 'WEDNESDAY', UUID 'f9669966-5bdb-41fa-961e-808240a7ed07'),
(UUID '0cb6bbfe-bd21-4432-91d1-821289f4ad6d', 'TUESDAY', UUID 'f9669966-5bdb-41fa-961e-808240a7ed07'),
(UUID 'c1996b53-3b0a-428f-b4ec-969707405f42', 'MONDAY', UUID 'be076c82-42b2-4e6d-b358-487d24700c08'),
(UUID '4c1deb9b-8bc3-4718-95bf-a033ac3806e3', 'TUESDAY', UUID 'be076c82-42b2-4e6d-b358-487d24700c08'),
(UUID 'b79f4afc-64f8-4691-912e-f505183f3ead', 'WEDNESDAY', UUID 'be076c82-42b2-4e6d-b358-487d24700c08'),
(UUID 'e1598c4d-97f4-4fde-ac7e-fc48ff73757d', 'THURSDAY', UUID 'be076c82-42b2-4e6d-b358-487d24700c08'),
(UUID 'c07c63b2-7b7a-4c65-b6c8-a9c77ea599ba', 'FRIDAY', UUID 'be076c82-42b2-4e6d-b358-487d24700c08'),
(UUID '4026e125-caa7-4105-83ea-916afe667e69', 'SATURDAY', UUID 'be076c82-42b2-4e6d-b358-487d24700c08'),
(UUID 'ed565d32-edbd-4c80-ac80-8013b5b84b45', 'SUNDAY', UUID 'be076c82-42b2-4e6d-b358-487d24700c08');        
CREATE CACHED TABLE "PUBLIC"."ROUTINE_TEMPLATE"(
    "ID" UUID NOT NULL,
    "ACTIVE" BOOLEAN NOT NULL,
    "LEVEL" CHARACTER VARYING(255),
    "NAME" CHARACTER VARYING(255),
    "TRAINER_TRAINER_ID" UUID
);         
ALTER TABLE "PUBLIC"."ROUTINE_TEMPLATE" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_89" PRIMARY KEY("ID");            
-- 3 +/- SELECT COUNT(*) FROM PUBLIC.ROUTINE_TEMPLATE;        
INSERT INTO "PUBLIC"."ROUTINE_TEMPLATE" VALUES
(UUID 'fdce820d-bfd7-46ed-8474-43f797c8e637', TRUE, 'Beginner', 'Week-1', UUID 'bc3415f1-3d0a-4a14-8929-457bee0908c4'),
(UUID 'f9669966-5bdb-41fa-961e-808240a7ed07', TRUE, 'Intermediate', 'Week-2', UUID 'bc3415f1-3d0a-4a14-8929-457bee0908c4'),
(UUID 'be076c82-42b2-4e6d-b358-487d24700c08', TRUE, 'Advanced', 'week-3', UUID 'bc3415f1-3d0a-4a14-8929-457bee0908c4'); 
CREATE CACHED TABLE "PUBLIC"."ROUTINE_TEMPLATE_EXERCISE"(
    "ID" UUID NOT NULL,
    "DURATION" INTEGER NOT NULL,
    "NOTES" CHARACTER VARYING(255),
    "REPS" INTEGER NOT NULL,
    "SETS" INTEGER NOT NULL,
    "EXERCISE_EXERCISE_ID" UUID,
    "TEMPLATE_DAY_ID" UUID
);       
ALTER TABLE "PUBLIC"."ROUTINE_TEMPLATE_EXERCISE" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_7" PRIMARY KEY("ID");    
-- 26 +/- SELECT COUNT(*) FROM PUBLIC.ROUTINE_TEMPLATE_EXERCISE;              
INSERT INTO "PUBLIC"."ROUTINE_TEMPLATE_EXERCISE" VALUES
(UUID '657577a5-f012-4b0b-ab31-17ae84bec4ba', 20, 'good', 10, 3, UUID '70c10804-9fdf-4ed8-9348-790362402925', UUID 'ab1869f3-93cb-468a-afbf-9e394461a1c5'),
(UUID '61c6adb7-89ae-4766-a67c-035e98fbc357', 30, 'good', 20, 5, UUID 'e1a3167e-79f3-49a1-8906-d9a54c3b18d5', UUID 'ab1869f3-93cb-468a-afbf-9e394461a1c5'),
(UUID '9af4b6e2-1e5f-4f4c-a162-f08f09bc590e', 30, 'good', 20, 5, UUID 'b671b290-95c5-4cec-9785-4cc3a65c6bc6', UUID 'a377eadf-34da-4cff-a810-cfc8bc2a5575'),
(UUID 'aea4ff0e-74a3-4fb5-9d95-d911b7261026', 30, 'good', 20, 7, UUID 'f4b6adca-5204-4ec1-862b-d3cce611f17c', UUID 'a377eadf-34da-4cff-a810-cfc8bc2a5575'),
(UUID '4076cb3d-35a1-4a3c-b880-78310e4f44b5', 50, 'good', 10, 5, UUID '32396b90-69f6-4f2e-b104-5b908afd2ebc', UUID 'a377eadf-34da-4cff-a810-cfc8bc2a5575'),
(UUID 'a39615ed-9f68-4c29-b6aa-9d76a9229df3', 40, 'good', 10, 5, UUID '8a0d33e9-fd57-4dbe-96c7-aa31b0e01a67', UUID 'd18bc5c0-27d8-43a3-a102-c942fac5c7fa'),
(UUID '8c4b4c8c-de95-4c3e-a9a0-b82e2b5295ab', 45, 'good', 30, 5, UUID 'edb5cee1-f8a1-4abb-82a4-2f2f66603baf', UUID '8d1386ed-4526-4e7b-b688-530ef1312907'),
(UUID '30cca60a-1662-427c-a4a8-7d4f7f01fc38', 30, 'good', 10, 4, UUID '863f9b01-182c-4f6d-8788-20be39d57674', UUID '887d4e51-229d-4930-a5f4-d030f67efecb'),
(UUID 'bf6be98e-22f6-45de-be86-23b61e89eb10', 25, 'good', 10, 5, UUID '40555ad6-e98b-4c0f-a9f3-b0d248978679', UUID '887d4e51-229d-4930-a5f4-d030f67efecb'),
(UUID 'd5dd3101-10f9-435c-a483-e9f953bab5d1', 20, 'good', 10, 3, UUID 'c83118a1-8c2f-4fa4-a0d5-0575cc31fb72', UUID '04753afd-ac08-47fd-a1aa-d1c7f28fbda8'),
(UUID '10fd19bd-ca70-431b-a723-5c0955410cba', 45, 'good', 12, 4, UUID '40555ad6-e98b-4c0f-a9f3-b0d248978679', UUID '04753afd-ac08-47fd-a1aa-d1c7f28fbda8'),
(UUID 'cd532f31-80c9-44ca-878f-31ebed4c2ecd', 35, 'good', 15, 4, UUID 'b2962988-5004-4820-92f7-c2ed5d3e6ca8', UUID 'fb3ec1ac-fb8c-421b-b5be-9f5f80b1d047'),
(UUID 'ca53f85b-15ad-4946-a6f9-90d4671ef4dd', 50, 'good', 15, 7, UUID 'b671b290-95c5-4cec-9785-4cc3a65c6bc6', UUID 'c662d10f-8ee3-442a-8bce-aa93f8986aa8'),
(UUID '2136500e-72f7-4bfe-9664-fb1e418d79bd', 45, NULL, 15, 7, UUID '32396b90-69f6-4f2e-b104-5b908afd2ebc', UUID 'c662d10f-8ee3-442a-8bce-aa93f8986aa8'),
(UUID '171455e3-512b-43f7-a6eb-aa54fd47098b', 60, 'good', 15, 8, UUID 'a6c27daa-bd9c-4955-8596-8ed34c868a93', UUID '6aed5239-e033-4ea1-998b-a321a91c0f56'),
(UUID '8b3009ac-3ecb-4c8e-9ca6-b94a9919d88c', 50, 'good', 15, 8, UUID '61cc52b1-0eaf-4da4-8f39-d903419a39ce', UUID '6aed5239-e033-4ea1-998b-a321a91c0f56'),
(UUID '3b31fc2e-d0d2-49b0-87cd-e5614a62edf3', 70, 'good', 20, 10, UUID 'edb5cee1-f8a1-4abb-82a4-2f2f66603baf', UUID 'd96abb75-0f02-4e60-9cfa-72e54d447dcd'),
(UUID '479638bd-def1-4820-905b-051ba6097e54', 35, 'good', 20, 8, UUID 'edb5cee1-f8a1-4abb-82a4-2f2f66603baf', UUID 'd96abb75-0f02-4e60-9cfa-72e54d447dcd'),
(UUID '770f7047-1ce0-4799-ae5a-9126653ccb92', 70, 'good', 25, 10, UUID 'f4b6adca-5204-4ec1-862b-d3cce611f17c', UUID 'd96abb75-0f02-4e60-9cfa-72e54d447dcd'),
(UUID 'b419a978-b538-4eec-b767-0510b00e0ce5', 60, 'good', 30, 12, UUID 'b2962988-5004-4820-92f7-c2ed5d3e6ca8', UUID 'e4086455-dd96-4112-86e8-b31a5ce13513'),
(UUID 'b9b319d8-40b4-4dfc-81d1-a83523948ab8', 70, 'good', 30, 12, UUID 'c83118a1-8c2f-4fa4-a0d5-0575cc31fb72', UUID 'e492bf6e-8d94-4752-8b10-1cd05350cfa1'),
(UUID 'd4c73ff2-c290-4119-98ac-e8757f4081eb', 30, 'good', 30, 12, UUID '863f9b01-182c-4f6d-8788-20be39d57674', UUID '0cb6bbfe-bd21-4432-91d1-821289f4ad6d'),
(UUID '3b97ae18-f4d2-463d-8025-c8d07462e3eb', 30, 'good', 15, 5, UUID '70c10804-9fdf-4ed8-9348-790362402925', UUID 'ed565d32-edbd-4c80-ac80-8013b5b84b45'),
(UUID '6d335a0f-d3b2-4e1d-bc11-f9620ab52173', 40, 'good', 20, 10, UUID 'e1a3167e-79f3-49a1-8906-d9a54c3b18d5', UUID 'ed565d32-edbd-4c80-ac80-8013b5b84b45'),
(UUID '5b7cb05e-2840-4d01-8061-a4c231ed5bdf', 30, 'good', 30, 8, UUID 'c83118a1-8c2f-4fa4-a0d5-0575cc31fb72', UUID '4026e125-caa7-4105-83ea-916afe667e69'),
(UUID '961d81b0-7640-4535-8ab9-d70885a95bab', 30, 'good day', 15, 10, UUID '8a0d33e9-fd57-4dbe-96c7-aa31b0e01a67', UUID '4c1deb9b-8bc3-4718-95bf-a033ac3806e3');            
CREATE CACHED TABLE "PUBLIC"."TRAINER_ACHIEVEMENT"(
    "ID" UUID NOT NULL,
    "TITLE" CHARACTER VARYING(255),
    "TRAINER_ID" UUID
);  
ALTER TABLE "PUBLIC"."TRAINER_ACHIEVEMENT" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_AB" PRIMARY KEY("ID");         
-- 15 +/- SELECT COUNT(*) FROM PUBLIC.TRAINER_ACHIEVEMENT;    
INSERT INTO "PUBLIC"."TRAINER_ACHIEVEMENT" VALUES
(UUID '45134feb-ebc9-45b5-bcb5-a0909bd30fb5', 'Two times National Champion of Bodybuilding - 2017 & 2018', UUID 'fe41ea2a-bfaa-43bf-9e33-a022f55d9033'),
(UUID 'cc015d8b-786f-41b1-9c25-54d71e6af24a', 'Best Bodybuilding Trainer - 2019', UUID 'fe41ea2a-bfaa-43bf-9e33-a022f55d9033'),
(UUID 'a6dee937-2fe8-4215-8c4e-22f5e6e5594b', 'Best National Trainer - 2019', UUID 'fe41ea2a-bfaa-43bf-9e33-a022f55d9033'),
(UUID '706ea523-4537-4326-b450-903a6cd0306e', 'Two times National Champion of Bodybuilding - 2017 & 2018', UUID 'fe41ea2a-bfaa-43bf-9e33-a022f55d9033'),
(UUID '20373f7b-7e6f-446b-9258-95583594eff8', 'Best Bodybuilding Trainer - 2019', UUID 'fe41ea2a-bfaa-43bf-9e33-a022f55d9033'),
(UUID '381ccabe-973c-4ae2-8b65-d12154dc4e45', 'Best National Trainer - 2019', UUID 'fe41ea2a-bfaa-43bf-9e33-a022f55d9033'),
(UUID '14f71057-5992-4bd9-af06-28f62e005686', 'National Yoga Champion 2022', UUID 'bc3415f1-3d0a-4a14-8929-457bee0908c4'),
(UUID 'd0ffccdf-b4b8-4fb3-b7c3-34aae4b38281', 'Two times National Champion of Bodybuilding - 2017 & 2018', UUID 'bc3415f1-3d0a-4a14-8929-457bee0908c4'),
(UUID '47801372-654c-43fd-ada1-3645ba472afd', 'Best National Trainer - 2019', UUID 'bc3415f1-3d0a-4a14-8929-457bee0908c4'),
(UUID '30ee808c-f399-43ea-a516-cb70011597bf', 'National Fitness Champion 2022', UUID 'ae921fa3-9436-4858-86e7-ecf5c91328c0'),
(UUID 'e56ce550-13da-4fb4-9d14-92594b59dcf7', 'Certified Personal Trainer (CPT) 2021', UUID 'ae921fa3-9436-4858-86e7-ecf5c91328c0'),
(UUID '453300e6-b26c-410f-8cb7-63d064bab714', 'Best Gym Trainer Award 2023', UUID 'ae921fa3-9436-4858-86e7-ecf5c91328c0'),
(UUID 'bfd5b61f-b0fc-4f50-a5d0-a2d1275fe5a3', 'Yoga Instructor of the Year 2023', UUID '9977f45a-fe72-4137-a9b3-fed44514099e'),
(UUID '639a3fc9-3342-4f51-9bdc-27ab92436efc', 'Certified Yoga Alliance Instructor 2021', UUID '9977f45a-fe72-4137-a9b3-fed44514099e'),
(UUID '218a0f4b-d44e-4934-b144-cefebe24499f', 'Regional Yoga Competition Winner 2022', UUID '9977f45a-fe72-4137-a9b3-fed44514099e');          
CREATE CACHED TABLE "PUBLIC"."TRAINER_REVIEW"(
    "ID" UUID NOT NULL,
    "COMMENT" CHARACTER VARYING(255),
    "RATING" INTEGER NOT NULL,
    "MEMBER_MEMBER_ID" UUID,
    "TRAINER_TRAINER_ID" UUID
);               
ALTER TABLE "PUBLIC"."TRAINER_REVIEW" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_C8" PRIMARY KEY("ID");              
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.TRAINER_REVIEW;          
CREATE CACHED TABLE "PUBLIC"."TRAINERS"(
    "TRAINER_ID" UUID NOT NULL,
    "ACTIVE" BOOLEAN NOT NULL,
    "BIO" CHARACTER VARYING(2000),
    "EXPERIENCE_YEARS" INTEGER NOT NULL,
    "JOIN_DATE" TIMESTAMP(6),
    "RATING" FLOAT(53) NOT NULL,
    "SALARY" INTEGER NOT NULL,
    "SPECIALIZATION" CHARACTER VARYING(255),
    "TOTAL_REVIEWS" INTEGER NOT NULL,
    "USER_ID" UUID NOT NULL
);
ALTER TABLE "PUBLIC"."TRAINERS" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_7A" PRIMARY KEY("TRAINER_ID");            
-- 4 +/- SELECT COUNT(*) FROM PUBLIC.TRAINERS;
INSERT INTO "PUBLIC"."TRAINERS" VALUES
(UUID 'fe41ea2a-bfaa-43bf-9e33-a022f55d9033', TRUE, 'Halbert Bourn is very professional and expert trainer. In his career, he done great job. He never compromise about his work to maintain our health luptas sit fugit, sed cuuntur magni dolores eos qui rat ione volupta pleasure rationally encounter onsequences that are extremely very professional', 5, TIMESTAMP '2026-02-04 17:36:33.787937', 4.5, 120000, 'Cardio, Weight Training', 10, UUID '535a2636-2d60-49e0-ada0-08705b2fec77'),
(UUID 'bc3415f1-3d0a-4a14-8929-457bee0908c4', TRUE, 'Halbert Bourn is very professional and expert trainer. In his career, he done great job. He never compromise about his work to maintain our health luptas sit fugit, sed cuuntur magni dolores eos qui rat ione volupta pleasure rationally encounter onsequences that are extremely very professional', 4, TIMESTAMP '2026-02-04 17:36:51.365497', 4.2, 25000, 'Cardio, Weight Training', 7, UUID '2a8988c0-8d0f-4a18-af56-3ba0762afb51'),
(UUID 'ae921fa3-9436-4858-86e7-ecf5c91328c0', TRUE, 'Certified fitness trainer specializing in strength and endurance training. Passionate about helping clients achieve sustainable results.', 5, TIMESTAMP '2026-04-04 00:54:52.053084', 4.0, 30000, 'Fitness', 9, UUID 'e33d53f5-849c-4e4f-b329-7f70c91ff85d'),
(UUID '9977f45a-fe72-4137-a9b3-fed44514099e', TRUE, 'Experienced yoga instructor focused on holistic wellness, flexibility, and mental balance. Dedicated to helping students build inner strength.', 3, TIMESTAMP '2026-04-04 00:56:32.090634', 4.8, 25000, 'Yoga', 16, UUID '29f6fc2f-fe92-4cbd-911e-0289387c3353');      
CREATE CACHED TABLE "PUBLIC"."TRAINER_SKILL"(
    "ID" UUID NOT NULL,
    "PERCENTAGE" INTEGER NOT NULL,
    "SKILL_NAME" CHARACTER VARYING(255),
    "TRAINER_ID" UUID
);               
ALTER TABLE "PUBLIC"."TRAINER_SKILL" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_F" PRIMARY KEY("ID");
-- 18 +/- SELECT COUNT(*) FROM PUBLIC.TRAINER_SKILL;          
INSERT INTO "PUBLIC"."TRAINER_SKILL" VALUES
(UUID '06b05426-2f64-456c-99b2-bfad1abd6d49', 95, 'Bodybuilding Training', UUID 'fe41ea2a-bfaa-43bf-9e33-a022f55d9033'),
(UUID 'ca62b54a-9625-4077-831e-98832f5d8a71', 80, 'Cardio Training', UUID 'fe41ea2a-bfaa-43bf-9e33-a022f55d9033'),
(UUID 'a88df966-f794-4551-9413-8ff36b7a5c2d', 90, 'Fitness Training', UUID 'fe41ea2a-bfaa-43bf-9e33-a022f55d9033'),
(UUID 'd3d4a924-e8e3-4bdb-8156-c2e1fd19fdb3', 65, 'Aerobics Training', UUID 'fe41ea2a-bfaa-43bf-9e33-a022f55d9033'),
(UUID '9009cf4a-f13a-47ea-8345-079085244ba2', 95, 'Bodybuilding Training', UUID 'fe41ea2a-bfaa-43bf-9e33-a022f55d9033'),
(UUID '838b5da7-4be0-4367-8d83-3eb5c9b9d823', 80, 'Cardio Training', UUID 'fe41ea2a-bfaa-43bf-9e33-a022f55d9033'),
(UUID '8aa4c700-10d1-414e-a85d-9ad21a7d8836', 90, 'Fitness Training', UUID 'fe41ea2a-bfaa-43bf-9e33-a022f55d9033'),
(UUID 'a0c676a3-16d4-4d4c-a733-9fc277d3897f', 65, 'Aerobics Training', UUID 'fe41ea2a-bfaa-43bf-9e33-a022f55d9033'),
(UUID '33da0df7-3876-48b1-bb13-3cb2064a8980', 90, 'Bodybuilding Training', UUID 'bc3415f1-3d0a-4a14-8929-457bee0908c4'),
(UUID 'fba9d01e-4e52-40cb-96cb-03e41b063e52', 80, 'Cardio Training', UUID 'bc3415f1-3d0a-4a14-8929-457bee0908c4'),
(UUID 'f8e58f16-a259-4b4c-a19c-de63b410ed10', 90, 'Fitness Training', UUID 'bc3415f1-3d0a-4a14-8929-457bee0908c4'),
(UUID '307bb871-718e-409c-9759-753f04e2bc04', 65, 'Aerobics Training', UUID 'bc3415f1-3d0a-4a14-8929-457bee0908c4'),
(UUID '74557c69-7b22-4429-bab0-ede22d25f300', 87, 'Weight Training', UUID 'ae921fa3-9436-4858-86e7-ecf5c91328c0'),
(UUID 'cd02d433-3349-43cc-967b-642d2410f7be', 85, 'Strength Conditioning', UUID 'ae921fa3-9436-4858-86e7-ecf5c91328c0'),
(UUID '4eb8cdd8-bd35-4022-818d-e1599905506c', 90, 'Endurance Training', UUID 'ae921fa3-9436-4858-86e7-ecf5c91328c0'),
(UUID '16d91a7a-f1b0-467c-9110-6ad9261faf8c', 68, 'Hatha Yoga', UUID '9977f45a-fe72-4137-a9b3-fed44514099e'),
(UUID '1c5d3d34-8d5e-475c-ab37-4c0e2bc25bda', 72, 'Vinyasa Flow', UUID '9977f45a-fe72-4137-a9b3-fed44514099e'),
(UUID 'f7ff440a-7550-423c-baf0-f98a6b92614a', 92, 'Meditation & Mindfulness', UUID '9977f45a-fe72-4137-a9b3-fed44514099e');      
CREATE CACHED TABLE "PUBLIC"."USER_TABLE"(
    "ID" UUID NOT NULL,
    "ACTIVE" BOOLEAN NOT NULL,
    "ADDRESS" CHARACTER VARYING(255),
    "CREATED_AT" TIMESTAMP(6),
    "EMAIL" CHARACTER VARYING(255),
    "FIRST_NAME" CHARACTER VARYING(255),
    "GENDER" CHARACTER VARYING(255),
    "LAST_NAME" CHARACTER VARYING(255),
    "PASSWORD" CHARACTER VARYING(255),
    "PHONE" CHARACTER VARYING(255),
    "PROFILE_IMAGE" CHARACTER VARYING(255),
    "ROLE" CHARACTER VARYING(255)
);     
ALTER TABLE "PUBLIC"."USER_TABLE" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_C6" PRIMARY KEY("ID");  
-- 8 +/- SELECT COUNT(*) FROM PUBLIC.USER_TABLE;              
INSERT INTO "PUBLIC"."USER_TABLE" VALUES
(UUID '07ca14fd-ef02-469e-8cc7-d791ce6364d2', TRUE, 'Dhaka', TIMESTAMP '2026-02-03 22:52:51.628886', 'faisal22205101279@diu.edu.bd', 'Mohammad', 'Male', 'Faisal', '$2a$10$EZ8xFmOVa68UQU3Ee6UzmOmczdk2jDfrtsPXhsIMFZHS.cN58r7ke', '01608949908', NULL, 'ROLE_ADMIN'),
(UUID 'df28677f-6b41-4fd4-8640-9fa347cf76a3', TRUE, 'Dhaka', TIMESTAMP '2026-02-03 22:53:11.327467', 'faisal@gmail.com', 'Mohammad', 'Male', 'Faisal', '$2a$10$NyCG6vAsCQ/f9YwdRts5yOs7RtvkvfuhGAEguN/HEBG69Pz8q/5RW', '01608949908', NULL, 'ROLE_MEMBER'),
(UUID '29f6fc2f-fe92-4cbd-911e-0289387c3353', TRUE, 'Dhaka', TIMESTAMP '2026-02-03 22:53:36.64161', 'user@gmail.com', 'Mohammad', 'Male', 'Faisal', '$2a$10$c1vBVHysOuys1GYzVqrGzejL8awlOc4eLkLqWbwga0/Gyd4lH9GYu', '01608949908', '00fb0682-3a04-49b6-8adf-7166f13fa8ce_ds2.webp', 'ROLE_TRAINER'),
(UUID '535a2636-2d60-49e0-ada0-08705b2fec77', TRUE, 'Dhaka', TIMESTAMP '2026-02-04 17:32:42.865116', 'user1@gmail.com', 'Mohammad', 'Male', 'Faisal', '$2a$10$OWZKODaZKOuGz9Wk.q.tle7OK4Pjf2RK8o.tFkQ9nqaSnEo9jPGFy', '01608949908', '0d4bd154-cbec-4605-9f7c-40a1f6de679b_Personal+Trainer+Profile+(Full+Size).webp', 'ROLE_TRAINER'),
(UUID '2a8988c0-8d0f-4a18-af56-3ba0762afb51', TRUE, 'Cox''s Bazar', TIMESTAMP '2026-02-04 17:33:19.110466', 'user12@gmail.com', 'Mohammad', 'Male', 'Faisal', '$2a$10$Edv8RzWhWJAKuDJ1k9jhH.xoidI7ytLBbjNwNxB82LMizH5C6eRNK', '01608949908', '0c7953a6-fdf6-48dd-b423-192518bbee34_Matt-WP.jpg', 'ROLE_TRAINER'),
(UUID '3992c6d2-0773-4ef0-ad2b-2e7f9df497c8', TRUE, 'Chittagong', TIMESTAMP '2026-02-04 17:34:03.752396', 'user123@gmail.com', 'Mrs', 'Female', 'Fatima', '$2a$10$yaBd8.aZaDVrVG2w/OAWBedQaYKjeiZdFMIsk8iABsTAUZvkWKR7C', '01608949908', NULL, 'ROLE_USER'),
(UUID '7ed12be7-dbe1-49bd-8617-6bb97673dfdc', TRUE, 'Chowfaldondi,Cox''s bazar,Chittagong', TIMESTAMP '2026-02-08 23:09:16.674239', 'arif@gmail.com', 'Md', 'Male', 'Arif', '$2a$10$ZfjAQeltjjoWmp4xSO.PC.pN1qAPjdKrWeXX1perOoekPbB8MXqh6', '01608949908', 'd5a6ac84-876c-4ca3-8931-acffdcf3adfa_WhatsApp Image 2025-09-11 at 17.06.28_f81c59c2.jpg', 'ROLE_MEMBER'),
(UUID 'e33d53f5-849c-4e4f-b329-7f70c91ff85d', TRUE, 'Mirpur-10,Dhaka,Bangladesh', TIMESTAMP '2026-04-04 00:50:32.673678', 'faisal12@gmail.com', 'MR', 'Male', 'James', '$2a$10$01IBHmUUpXSGlsRGkWsAUe7VZs4TSpAf9j.6ZYbQ3pt.JpGNxJHx2', '01608949908', '323e7b98-4365-45b0-a072-3a6dea266e6a_gun-j-profile-1.jpg', 'ROLE_TRAINER');      
ALTER TABLE "PUBLIC"."ATTENDANCE" ADD CONSTRAINT "PUBLIC"."UKGQS5MHD9QAA7U6S59E47TGQJR" UNIQUE NULLS DISTINCT ("MEMBER_ID", "DATE");          
ALTER TABLE "PUBLIC"."TRAINERS" ADD CONSTRAINT "PUBLIC"."UKSE8QMHOMOR3GUUTJUI5WFMRK3" UNIQUE NULLS DISTINCT ("USER_ID");      
ALTER TABLE "PUBLIC"."MEMBERS" ADD CONSTRAINT "PUBLIC"."UKDA61GA2JECPHDLIWVKQYT6SW2" UNIQUE NULLS DISTINCT ("USER_ID");       
ALTER TABLE "PUBLIC"."MEMBER_ROUTINE" ADD CONSTRAINT "PUBLIC"."FKA8L5148GORFMQTVPLYQML8E9A" FOREIGN KEY("TEMPLATE_ID") REFERENCES "PUBLIC"."ROUTINE_TEMPLATE"("ID") NOCHECK;  
ALTER TABLE "PUBLIC"."PAYMENTS" ADD CONSTRAINT "PUBLIC"."FKU2PGFHU78F1FO99T6HCR80SB" FOREIGN KEY("MEMBER_MEMBER_ID") REFERENCES "PUBLIC"."MEMBERS"("MEMBER_ID") NOCHECK;      
ALTER TABLE "PUBLIC"."MEMBERS" ADD CONSTRAINT "PUBLIC"."FKAHX8RG6VVQWI9XXB1TW16FGY6" FOREIGN KEY("USER_ID") REFERENCES "PUBLIC"."USER_TABLE"("ID") NOCHECK;   
ALTER TABLE "PUBLIC"."TRAINER_ACHIEVEMENT" ADD CONSTRAINT "PUBLIC"."FKOT7NF9KBQJIOWED2EEKXVOE7F" FOREIGN KEY("TRAINER_ID") REFERENCES "PUBLIC"."TRAINERS"("TRAINER_ID") NOCHECK;              
ALTER TABLE "PUBLIC"."MEMBERS_PROGRESS" ADD CONSTRAINT "PUBLIC"."FK4W29BL62O73PJ00VPIV7I0O91" FOREIGN KEY("MEMBER_MEMBER_ID") REFERENCES "PUBLIC"."MEMBERS"("MEMBER_ID") NOCHECK;             
ALTER TABLE "PUBLIC"."PAYMENTS" ADD CONSTRAINT "PUBLIC"."FK111P3LCJOI60DHBD6DFDCY0PD" FOREIGN KEY("MEMBERSHIP_MEMBERSHIP_ID") REFERENCES "PUBLIC"."MEMBERSHIPS"("MEMBERSHIP_ID") NOCHECK;     
ALTER TABLE "PUBLIC"."TRAINER_REVIEW" ADD CONSTRAINT "PUBLIC"."FK2CM8M6NP65K3BP67JHKGCEPMQ" FOREIGN KEY("MEMBER_MEMBER_ID") REFERENCES "PUBLIC"."MEMBERS"("MEMBER_ID") NOCHECK;               
ALTER TABLE "PUBLIC"."MEMBERS" ADD CONSTRAINT "PUBLIC"."FKPUUMGRBMT270OG5275PWLTNQ" FOREIGN KEY("TRAINER_ID") REFERENCES "PUBLIC"."TRAINERS"("TRAINER_ID") NOCHECK;           
ALTER TABLE "PUBLIC"."ROUTINE_TEMPLATE_DAY" ADD CONSTRAINT "PUBLIC"."FKDD6FKX3N3UQF096H068D8RE53" FOREIGN KEY("TEMPLATE_ID") REFERENCES "PUBLIC"."ROUTINE_TEMPLATE"("ID") NOCHECK;            
ALTER TABLE "PUBLIC"."EXERCISE" ADD CONSTRAINT "PUBLIC"."FKNQMGRSED7LPFW7AOWMOW0L4XM" FOREIGN KEY("CREATED_BY") REFERENCES "PUBLIC"."USER_TABLE"("ID") NOCHECK;               
ALTER TABLE "PUBLIC"."ATTENDANCE" ADD CONSTRAINT "PUBLIC"."FK7RJ8Q8PE272IB4MRPIUDOFHGY" FOREIGN KEY("MEMBER_ID") REFERENCES "PUBLIC"."MEMBERS"("MEMBER_ID") NOCHECK;          
ALTER TABLE "PUBLIC"."ROUTINE_TEMPLATE_EXERCISE" ADD CONSTRAINT "PUBLIC"."FKIW94D0A4UIFOS7LK7C7I12T9G" FOREIGN KEY("EXERCISE_EXERCISE_ID") REFERENCES "PUBLIC"."EXERCISE"("EXERCISE_ID") NOCHECK;             
ALTER TABLE "PUBLIC"."TRAINER_REVIEW" ADD CONSTRAINT "PUBLIC"."FK74FD8VQT6O64N8JFPC61SB26G" FOREIGN KEY("TRAINER_TRAINER_ID") REFERENCES "PUBLIC"."TRAINERS"("TRAINER_ID") NOCHECK;           
ALTER TABLE "PUBLIC"."TRAINERS" ADD CONSTRAINT "PUBLIC"."FK67K0BPQJR58PBL5MME5WY45AF" FOREIGN KEY("USER_ID") REFERENCES "PUBLIC"."USER_TABLE"("ID") NOCHECK;  
ALTER TABLE "PUBLIC"."ROUTINE_TEMPLATE_EXERCISE" ADD CONSTRAINT "PUBLIC"."FKN5SU8E2PNFLASTKIOE4WPH2G2" FOREIGN KEY("TEMPLATE_DAY_ID") REFERENCES "PUBLIC"."ROUTINE_TEMPLATE_DAY"("ID") NOCHECK;               
ALTER TABLE "PUBLIC"."CLASS_IMAGE" ADD CONSTRAINT "PUBLIC"."FKSMP7UEUWFW90OBKVWOD64TLX6" FOREIGN KEY("CLASS_ID") REFERENCES "PUBLIC"."GYM_CLASS"("ID") NOCHECK;               
ALTER TABLE "PUBLIC"."TRAINER_SKILL" ADD CONSTRAINT "PUBLIC"."FK5YEOL61N8SISINNX6K60D9O24" FOREIGN KEY("TRAINER_ID") REFERENCES "PUBLIC"."TRAINERS"("TRAINER_ID") NOCHECK;    
ALTER TABLE "PUBLIC"."EXERCISE_VIDEO" ADD CONSTRAINT "PUBLIC"."FKKHOQDA2Y2698GGLW6RLS2D000" FOREIGN KEY("EXERCISE_ID") REFERENCES "PUBLIC"."EXERCISE"("EXERCISE_ID") NOCHECK; 
ALTER TABLE "PUBLIC"."MEMBERS" ADD CONSTRAINT "PUBLIC"."FK7IVG78W3LUOKTYS99NJ140V6B" FOREIGN KEY("ROUTINE_TEMPLATE_ID") REFERENCES "PUBLIC"."ROUTINE_TEMPLATE"("ID") NOCHECK; 
ALTER TABLE "PUBLIC"."BLOG" ADD CONSTRAINT "PUBLIC"."FK5CBQMW37FDMU9Y8T96EXF19ES" FOREIGN KEY("AUTHOR_ID") REFERENCES "PUBLIC"."USER_TABLE"("ID") NOCHECK;    
ALTER TABLE "PUBLIC"."EXERCISE_IMAGE" ADD CONSTRAINT "PUBLIC"."FKB0COPPB3HT52JQLJOB0XMIDIY" FOREIGN KEY("EXERCISE_ID") REFERENCES "PUBLIC"."EXERCISE"("EXERCISE_ID") NOCHECK; 
ALTER TABLE "PUBLIC"."MEMBER_ROUTINE" ADD CONSTRAINT "PUBLIC"."FKSBX3X03CGLS76OIDXXURG2D01" FOREIGN KEY("MEMBER_MEMBER_ID") REFERENCES "PUBLIC"."MEMBERS"("MEMBER_ID") NOCHECK;               
ALTER TABLE "PUBLIC"."CLASS_SCHEDULE" ADD CONSTRAINT "PUBLIC"."FKJOM3QIM1GCCN8K4NVI0AMHKLH" FOREIGN KEY("CLASS_ID") REFERENCES "PUBLIC"."GYM_CLASS"("ID") NOCHECK;            
ALTER TABLE "PUBLIC"."MEMBERSHIP_FEATURE" ADD CONSTRAINT "PUBLIC"."FKGCB6D3SJ6DA8SG89DPJ41XX12" FOREIGN KEY("MEMBERSHIP_ID") REFERENCES "PUBLIC"."MEMBERSHIPS"("MEMBERSHIP_ID") NOCHECK;      
ALTER TABLE "PUBLIC"."GYM_CLASS" ADD CONSTRAINT "PUBLIC"."FKRMRWMCJTGBGUMB7S5YXXHLF3U" FOREIGN KEY("TRAINER_ID") REFERENCES "PUBLIC"."TRAINERS"("TRAINER_ID") NOCHECK;        
ALTER TABLE "PUBLIC"."BLOG_IMAGE" ADD CONSTRAINT "PUBLIC"."FKAT9Q4C791RTRA7WFA5S11SKKD" FOREIGN KEY("BLOG_ID") REFERENCES "PUBLIC"."BLOG"("ID") NOCHECK;      
ALTER TABLE "PUBLIC"."MEMBERS" ADD CONSTRAINT "PUBLIC"."FKTK89IY1BXA8BUG9EU8B3153LK" FOREIGN KEY("MEMBERSHIP_ID") REFERENCES "PUBLIC"."MEMBERSHIPS"("MEMBERSHIP_ID") NOCHECK; 
ALTER TABLE "PUBLIC"."ROUTINE_TEMPLATE" ADD CONSTRAINT "PUBLIC"."FKTIJ0XK52EDTS5M186MUEA3AQ3" FOREIGN KEY("TRAINER_TRAINER_ID") REFERENCES "PUBLIC"."TRAINERS"("TRAINER_ID") NOCHECK;         
