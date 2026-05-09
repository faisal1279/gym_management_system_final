
INSERT INTO USER_TABLE (ACTIVE, CREATED_AT, ID, ADDRESS, EMAIL, FIRST_NAME, GENDER, LAST_NAME, PASSWORD, PHONE, PROFILE_IMAGE, ROLE) VALUES
                                                                                                                                         (TRUE, '2026-02-03 22:52:51.628886', '07ca14fd-ef02-469e-8cc7-d791ce6364d2', 'Dhaka', 'faisal22205101279@diu.edu.bd', 'Mohammad', 'Male', 'Faisal', '$2a$10$EZ8xFmOVa68UQU3Ee6UzmOmczdk2jDfrtsPXhsIMFZHS.cN58r7ke', '01608949908', NULL, 'ROLE_ADMIN'),
                                                                                                                                         (TRUE, '2026-02-03 22:53:11.327467', 'df28677f-6b41-4fd4-8640-9fa347cf76a3', 'Dhaka', 'faisal@gmail.com', 'Mohammad', 'Male', 'Faisal', '$2a$10$NyCG6vAsCQ/f9YwdRts5yOs7RtvkvfuhGAEguN/HEBG69Pz8q/5RW', '01608949908', NULL, 'ROLE_MEMBER'),
                                                                                                                                         (TRUE, '2026-02-03 22:53:36.64161', '29f6fc2f-fe92-4cbd-911e-0289387c3353', 'Dhaka', 'user@gmail.com', 'Mohammad', 'Male', 'Faisal', '$2a$10$c1vBVHysOuys1GYzVqrGzejL8awlOc4eLkLqWbwga0/Gyd4lH9GYu', '01608949908', '00fb0682-3a04-49b6-8adf-7166f13fa8ce_ds2.webp', 'ROLE_TRAINER'),
                                                                                                                                         (TRUE, '2026-02-04 17:32:42.865116', '535a2636-2d60-49e0-ada0-08705b2fec77', 'Dhaka', 'user1@gmail.com', 'Mohammad', 'Male', 'Faisal', '$2a$10$OWZKODaZKOuGz9Wk.q.tle7OK4Pjf2RK8o.tFkQ9nqaSnEo9jPGFy', '01608949908', '0d4bd154-cbec-4605-9f7c-40a1f6de679b_Personal+Trainer+Profile+(Full+Size).webp', 'ROLE_TRAINER'),
                                                                                                                                         (TRUE, '2026-02-04 17:33:19.110466', '2a8988c0-8d0f-4a18-af56-3ba0762afb51', 'Cox''s Bazar', 'user12@gmail.com', 'Mohammad', 'Male', 'Faisal', '$2a$10$Edv8RzWhWJAKuDJ1k9jhH.xoidI7ytLBbjNwNxB82LMizH5C6eRNK', '01608949908', '0c7953a6-fdf6-48dd-b423-192518bbee34_Matt-WP.jpg', 'ROLE_TRAINER'),
                                                                                                                                         (TRUE, '2026-02-04 17:34:03.752396', '3992c6d2-0773-4ef0-ad2b-2e7f9df497c8', 'Chittagong', 'user123@gmail.com', 'Mrs', 'Female', 'Fatima', '$2a$10$yaBd8.aZaDVrVG2w/OAWBedQaYKjeiZdFMIsk8iABsTAUZvkWKR7C', '01608949908', NULL, 'ROLE_USER'),
                                                                                                                                         (TRUE, '2026-02-08 23:09:16.674239', '7ed12be7-dbe1-49bd-8617-6bb97673dfdc', 'Chowfaldondi,Cox''s bazar,Chittagong', 'arif@gmail.com', 'Md', 'Male', 'Arif', '$2a$10$ZfjAQeltjjoWmp4xSO.PC.pN1qAPjdKrWeXX1perOoekPbB8MXqh6', '01608949908', 'd5a6ac84-876c-4ca3-8931-acffdcf3adfa_WhatsApp Image 2025-09-11 at 17.06.28_f81c59c2.jpg', 'ROLE_MEMBER'),
                                                                                                                                         (TRUE, '2026-04-04 00:50:32.673678', 'e33d53f5-849c-4e4f-b329-7f70c91ff85d', 'Mirpur-10,Dhaka,Bangladesh', 'faisal12@gmail.com', 'MR', 'Male', 'James', '$2a$10$01IBHmUUpXSGlsRGkWsAUe7VZs4TSpAf9j.6ZYbQ3pt.JpGNxJHx2', '01608949908', '323e7b98-4365-45b0-a072-3a6dea266e6a_gun-j-profile-1.jpg', 'ROLE_TRAINER');



-- Insert the two rows

INSERT INTO TRAINERS (ACTIVE, EXPERIENCE_YEARS, RATING, SALARY, TOTAL_REVIEWS, JOIN_DATE, TRAINER_ID, USER_ID, BIO, SPECIALIZATION) VALUES
                                                                                                                                        (TRUE, 5, 4.5, 120000, 10, '2026-02-04 17:36:33.787937', 'fe41ea2a-bfaa-43bf-9e33-a022f55d9033', '535a2636-2d60-49e0-ada0-08705b2fec77', 'Halbert Bourn is very professional and expert trainer. In his career, he done great job. He never compromise about his work to maintain our health luptas sit fugit, sed cuuntur magni dolores eos qui rat ione volupta pleasure rationally encounter onsequences that are extremely very professional', 'Cardio, Weight Training'),

                                                                                                                                        (TRUE, 4, 4.2, 25000, 7, '2026-02-04 17:36:51.365497', 'bc3415f1-3d0a-4a14-8929-457bee0908c4', '2a8988c0-8d0f-4a18-af56-3ba0762afb51', 'Halbert Bourn is very professional and expert trainer. In his career, he done great job. He never compromise about his work to maintain our health luptas sit fugit, sed cuuntur magni dolores eos qui rat ione volupta pleasure rationally encounter onsequences that are extremely very professional', 'Cardio, Weight Training'),

                                                                                                                                        (TRUE, 5, 4.0, 30000, 9, '2026-04-04 00:54:52.053084', 'ae921fa3-9436-4858-86e7-ecf5c91328c0', 'e33d53f5-849c-4e4f-b329-7f70c91ff85d', 'Certified fitness trainer specializing in strength and endurance training. Passionate about helping clients achieve sustainable results.', 'Fitness'),

                                                                                                                                        (TRUE, 3, 4.8, 25000, 16, '2026-04-04 00:56:32.090634', '9977f45a-fe72-4137-a9b3-fed44514099e', '29f6fc2f-fe92-4cbd-911e-0289387c3353', 'Experienced yoga instructor focused on holistic wellness, flexibility, and mental balance. Dedicated to helping students build inner strength.', 'Yoga');



INSERT INTO TRAINER_SKILL (PERCENTAGE, ID, TRAINER_ID, SKILL_NAME) VALUES
                                                                       (95, '06b05426-2f64-456c-99b2-bfad1abd6d49', 'fe41ea2a-bfaa-43bf-9e33-a022f55d9033', 'Bodybuilding Training'),
                                                                       (80, 'ca62b54a-9625-4077-831e-98832f5d8a71', 'fe41ea2a-bfaa-43bf-9e33-a022f55d9033', 'Cardio Training'),
                                                                       (90, 'a88df966-f794-4551-9413-8ff36b7a5c2d', 'fe41ea2a-bfaa-43bf-9e33-a022f55d9033', 'Fitness Training'),
                                                                       (65, 'd3d4a924-e8e3-4bdb-8156-c2e1fd19fdb3', 'fe41ea2a-bfaa-43bf-9e33-a022f55d9033', 'Aerobics Training'),
                                                                       (95, '9009cf4a-f13a-47ea-8345-079085244ba2', 'fe41ea2a-bfaa-43bf-9e33-a022f55d9033', 'Bodybuilding Training'),
                                                                       (80, '838b5da7-4be0-4367-8d83-3eb5c9b9d823', 'fe41ea2a-bfaa-43bf-9e33-a022f55d9033', 'Cardio Training'),
                                                                       (90, '8aa4c700-10d1-414e-a85d-9ad21a7d8836', 'fe41ea2a-bfaa-43bf-9e33-a022f55d9033', 'Fitness Training'),
                                                                       (65, 'a0c676a3-16d4-4d4c-a733-9fc277d3897f', 'fe41ea2a-bfaa-43bf-9e33-a022f55d9033', 'Aerobics Training'),
                                                                       (90, '33da0df7-3876-48b1-bb13-3cb2064a8980', 'bc3415f1-3d0a-4a14-8929-457bee0908c4', 'Bodybuilding Training'),
                                                                       (80, 'fba9d01e-4e52-40cb-96cb-03e41b063e52', 'bc3415f1-3d0a-4a14-8929-457bee0908c4', 'Cardio Training'),
                                                                       (90, 'f8e58f16-a259-4b4c-a19c-de63b410ed10', 'bc3415f1-3d0a-4a14-8929-457bee0908c4', 'Fitness Training'),
                                                                       (65, '307bb871-718e-409c-9759-753f04e2bc04', 'bc3415f1-3d0a-4a14-8929-457bee0908c4', 'Aerobics Training'),
                                                                       (87, '74557c69-7b22-4429-bab0-ede22d25f300', 'ae921fa3-9436-4858-86e7-ecf5c91328c0', 'Weight Training'),
                                                                       (85, 'cd02d433-3349-43cc-967b-642d2410f7be', 'ae921fa3-9436-4858-86e7-ecf5c91328c0', 'Strength Conditioning'),
                                                                       (90, '4eb8cdd8-bd35-4022-818d-e1599905506c', 'ae921fa3-9436-4858-86e7-ecf5c91328c0', 'Endurance Training'),
                                                                       (68, '16d91a7a-f1b0-467c-9110-6ad9261faf8c', '9977f45a-fe72-4137-a9b3-fed44514099e', 'Hatha Yoga'),
                                                                       (72, '1c5d3d34-8d5e-475c-ab37-4c0e2bc25bda', '9977f45a-fe72-4137-a9b3-fed44514099e', 'Vinyasa Flow'),
                                                                       (92, 'f7ff440a-7550-423c-baf0-f98a6b92614a', '9977f45a-fe72-4137-a9b3-fed44514099e', 'Meditation & Mindfulness');

INSERT INTO TRAINER_ACHIEVEMENT (ID, TRAINER_ID, TITLE) VALUES
                                                            ('45134feb-ebc9-45b5-bcb5-a0909bd30fb5', 'fe41ea2a-bfaa-43bf-9e33-a022f55d9033', 'Two times National Champion of Bodybuilding - 2017 & 2018'),
                                                            ('cc015d8b-786f-41b1-9c25-54d71e6af24a', 'fe41ea2a-bfaa-43bf-9e33-a022f55d9033', 'Best Bodybuilding Trainer - 2019'),
                                                            ('a6dee937-2fe8-4215-8c4e-22f5e6e5594b', 'fe41ea2a-bfaa-43bf-9e33-a022f55d9033', 'Best National Trainer - 2019'),
                                                            ('706ea523-4537-4326-b450-903a6cd0306e', 'fe41ea2a-bfaa-43bf-9e33-a022f55d9033', 'Two times National Champion of Bodybuilding - 2017 & 2018'),
                                                            ('20373f7b-7e6f-446b-9258-95583594eff8', 'fe41ea2a-bfaa-43bf-9e33-a022f55d9033', 'Best Bodybuilding Trainer - 2019'),
                                                            ('381ccabe-973c-4ae2-8b65-d12154dc4e45', 'fe41ea2a-bfaa-43bf-9e33-a022f55d9033', 'Best National Trainer - 2019'),
                                                            ('14f71057-5992-4bd9-af06-28f62e005686', 'bc3415f1-3d0a-4a14-8929-457bee0908c4', 'National Yoga Champion 2022'),
                                                            ('d0ffccdf-b4b8-4fb3-b7c3-34aae4b38281', 'bc3415f1-3d0a-4a14-8929-457bee0908c4', 'Two times National Champion of Bodybuilding - 2017 & 2018'),
                                                            ('47801372-654c-43fd-ada1-3645ba472afd', 'bc3415f1-3d0a-4a14-8929-457bee0908c4', 'Best National Trainer - 2019'),
                                                            ('30ee808c-f399-43ea-a516-cb70011597bf', 'ae921fa3-9436-4858-86e7-ecf5c91328c0', 'National Fitness Champion 2022'),
                                                            ('e56ce550-13da-4fb4-9d14-92594b59dcf7', 'ae921fa3-9436-4858-86e7-ecf5c91328c0', 'Certified Personal Trainer (CPT) 2021'),
                                                            ('453300e6-b26c-410f-8cb7-63d064bab714', 'ae921fa3-9436-4858-86e7-ecf5c91328c0', 'Best Gym Trainer Award 2023'),
                                                            ('bfd5b61f-b0fc-4f50-a5d0-a2d1275fe5a3', '9977f45a-fe72-4137-a9b3-fed44514099e', 'Yoga Instructor of the Year 2023'),
                                                            ('639a3fc9-3342-4f51-9bdc-27ab92436efc', '9977f45a-fe72-4137-a9b3-fed44514099e', 'Certified Yoga Alliance Instructor 2021'),
                                                            ('218a0f4b-d44e-4934-b144-cefebe24499f', '9977f45a-fe72-4137-a9b3-fed44514099e', 'Regional Yoga Competition Winner 2022');
-- INSERT INTO memberships (
--     membership_id,
--     name,
--     duration_in_days,
--     price,
--     active
-- ) VALUES
--       (
--           '4d81c365-18d3-4dbd-8d9d-e1f513e74c4f',
--           'Golden',
--           180,
--           2000.0,
--           TRUE
--       ),
--       (
--           '86d5d62e-57ad-4683-affb-8975c12abad0',
--           'Bronze',
--           120,
--           1700.0,
--           TRUE
--       ),
--       (
--           '180b9553-8436-41a2-8f30-c763af4dabd5',
--           'Premium',
--           365,
--           3600.0,
--           TRUE
--       );

INSERT INTO MEMBERSHIPS (ACTIVE, DURATION_IN_DAYS, PRICE, MEMBERSHIP_ID, NAME) VALUES
                                                                                   (TRUE, 180, 2000.0, '4d81c365-18d3-4dbd-8d9d-e1f513e74c4f', 'Basic Package (Starter Plan)'),
                                                                                   (TRUE, 120, 1700.0, '86d5d62e-57ad-4683-affb-8975c12abad0', 'Standard Package (Regular Plan)'),
                                                                                   (TRUE, 365, 3600.0, '180b9553-8436-41a2-8f30-c763af4dabd5', 'Premium Package (Pro Fitness Plan)');
INSERT INTO MEMBERS (
    ACTIVE,
    END_DATE,
    HEIGHT,
    START_DATE,
    INITIALWEIGHT,
    CREATED_AT,
    MEMBER_ID,
    MEMBERSHIP_ID,
    TRAINER_ID,
    USER_ID,
    DUE_AMOUNT
)
VALUES (
           TRUE,
           '2026-06-08',
           6.0,
           '2026-02-08',
           56.0,
           '2026-02-08 14:47:45.613253',
           '6f814274-610e-450d-ab35-9cea4bf04083',
           '86d5d62e-57ad-4683-affb-8975c12abad0',
           'bc3415f1-3d0a-4a14-8929-457bee0908c4',
           'df28677f-6b41-4fd4-8640-9fa347cf76a3',
           0.0
       );

INSERT INTO MEMBERS (
    ACTIVE,
    END_DATE,
    HEIGHT,
    START_DATE,
    INITIALWEIGHT,
    CREATED_AT,
    MEMBER_ID,
    MEMBERSHIP_ID,
    TRAINER_ID,
    USER_ID,
    DUE_AMOUNT
)
VALUES (
           TRUE,
           '2027-02-08',
           6.0,
           '2026-02-08',
           59.0,
           '2026-02-08 23:11:22.108035',
           'bb35327a-49ef-41c9-9e75-7b1ac169f49d',
           '180b9553-8436-41a2-8f30-c763af4dabd5',
           'bc3415f1-3d0a-4a14-8929-457bee0908c4',
           '7ed12be7-dbe1-49bd-8617-6bb97673dfdc',
           0.0
       );

INSERT INTO PAYMENTS (
    AMOUNT,
    PAYMENT_DATE,
    SUCCESS,
    MEMBER_MEMBER_ID,
    PAYMENT_ID,
    FOR_MEMBERSHIP,
    METHOD
)
VALUES (
           6000.0,
           '2026-02-08',
           TRUE,
           '6f814274-610e-450d-ab35-9cea4bf04083',
           '71c24b89-9db9-4e08-b6fd-38c0a12993c4',
           NULL,
           'Cash'
       );
INSERT INTO PAYMENTS (
    AMOUNT,
    PAYMENT_DATE,
    SUCCESS,
    MEMBER_MEMBER_ID,
    PAYMENT_ID,
    FOR_MEMBERSHIP,
    METHOD
)
VALUES (
           50000.0,
           '2026-02-08',
           TRUE,
           'bb35327a-49ef-41c9-9e75-7b1ac169f49d',
           'b73dd04a-9631-46bd-a986-8f18c04cd93c',
           NULL,
           'Nagad'
       );

INSERT INTO ATTENDANCE (
    DATE,
    PRESENT,
    ATTENDANCE_ID,
    MEMBER_ID
)
VALUES
    (
        '2026-02-08',
        TRUE,
        '6bf2536a-7904-47f5-9fcd-4d60a3719f59',
        'bb35327a-49ef-41c9-9e75-7b1ac169f49d'
    ),
    (
        '2026-02-08',
        TRUE,
        'd07ccade-c75b-45b9-bea7-007c47ec5a52',
        '6f814274-610e-450d-ab35-9cea4bf04083'
    ),
    (
        '2026-02-06',
        TRUE,
        'e92ade21-848c-403e-9304-42b3215d69ae',
        'bb35327a-49ef-41c9-9e75-7b1ac169f49d'
    ),
    (
        '2026-02-06',
        TRUE,
        'd433af55-7948-4dd7-bec2-01669941aa63',
        '6f814274-610e-450d-ab35-9cea4bf04083'
    );




-- exercise
-- INSERT INTO EXERCISE
-- (ACTIVE, EXERCISE_ID, WARNING, DESCRIPTION, DIFFICULTY, NAME, TARGET_MUSCLE)
-- VALUES
--     (TRUE,'70c10804-9fdf-4ed8-9348-790362402925',
--      'Avoid if you have shoulder or wrist injuries.',
--      'Start in a plank position with your hands slightly wider than shoulder width.
--
--      Lower your body until your chest nearly touches the floor.
--
--      Keep your body straight and core tight.
--
--      Push back up to the starting position.',
--      NULL,'Push Up',NULL),
--
--     (TRUE,'e1a3167e-79f3-49a1-8906-d9a54c3b18d5',
--      'Do not perform if you have severe knee pain.',
--      'Stand with your feet shoulder-width apart.
--
--      Lower your body by bending your knees and pushing your hips back.
--
--      Keep your chest up and back straight.
--
--      Return to standing position.',
--      NULL,'Bodyweight Squat',NULL),
--
--     (TRUE,'c83118a1-8c2f-4fa4-a0d5-0575cc31fb72',
--      'Stop if you feel pain in your lower back.',
--      'Start in a forearm plank position with elbows directly under shoulders.
--
--      Keep your body in a straight line from head to heels.
--
--      Engage your core and hold the position.',
--      NULL,'Plank Hold',NULL),
--
--     (TRUE,'863f9b01-182c-4f6d-8788-20be39d57674',
--      'Avoid if you have knee ligament injuries.',
--      'Stand upright with feet together.
--
--      Step forward with one leg and lower your hips until both knees are bent at about 90 degrees.
--
--      Push back to the starting position and switch legs.',
--      NULL,'Forward Lunges',NULL),
--
--     (TRUE,'aa8d4010-e3e0-40cb-89f5-b0b5f7fd3176',
--      NULL,
--      NULL,
--      NULL,'Mountain Climbers',NULL),
--
--     (TRUE,'e8127c67-bff6-4612-9a7c-819c921c2fae',
--      'Not recommended for people with wrist or shoulder pain.',
--      'Start in a push-up position.
--
--      Bring one knee toward your chest, then quickly switch legs.
--
--      Continue alternating legs in a running motion.',
--      NULL,'Mountain Climbers',NULL),
--
--     (TRUE,'375a860f-2ced-45c3-8977-c4504a6f9fdb',
--      NULL,
--      NULL,
--      NULL,'Jumping Jacks',NULL),
--
--     (TRUE,'f4b6adca-5204-4ec1-862b-d3cce611f17c',
--      'Avoid if you have ankle or knee injuries.',
--      'Stand upright with your feet together and arms at your sides.
--
--      Jump while spreading your legs and raising your arms overhead.
--
--      Return to the starting position.',
--      NULL,'Jumping Jacks',NULL),
--
--     (TRUE,'b2962988-5004-4820-92f7-c2ed5d3e6ca8',
--      'Avoid if you have heart or joint problems.',
--      'Start standing, drop into a squat, kick feet back to a plank, perform a push-up, jump forward and jump up.',
--      NULL,'Burpees',NULL),
--
--     (TRUE,'8a0d33e9-fd57-4dbe-96c7-aa31b0e01a67',
--      'Avoid if you have lower back issues.',
--      'Lie on your back with knees bent and lift your upper body toward your knees.',
--      NULL,'Sit Ups',NULL),
--
--     (TRUE,'40555ad6-e98b-4c0f-a9f3-b0d248978679',
--      'Avoid if you have neck strain.',
--      'Lie on your back and alternate touching elbows to opposite knees in a cycling motion.',
--      NULL,'Bicycle Crunch',NULL),
--
--     (TRUE,'61cc52b1-0eaf-4da4-8f39-d903419a39ce',
--      'Avoid if you have lower back pain.',
--      'Lie flat and raise your legs straight up while keeping your core engaged.',
--      NULL,'Leg Raises',NULL),
--
--     (TRUE,'edb5cee1-f8a1-4abb-82a4-2f2f66603baf',
--      'Avoid if you have shoulder or chest injuries. Always use a spotter for heavy weights.',
--      'Lie flat on a bench and grip the barbell slightly wider than shoulder width. Lower the bar to your chest and press it back up until your arms are fully extended.',
--      NULL,'Bench Press',NULL),
--
--     (TRUE,'43a22396-61a5-4752-9c6b-c28761d20b83',
--      'Do not lean too far back and avoid jerking the weight.',
--      'Sit at the lat pulldown machine and grip the bar wide. Pull the bar down toward your chest while squeezing your back muscles.',
--      NULL,'Lat Pulldown',NULL),
--
--     (TRUE,'a6c27daa-bd9c-4955-8596-8ed34c868a93',
--      'Do not lock your knees at the top.',
--      'Sit on the leg press machine and place your feet shoulder-width apart on the platform. Push the platform away by extending your legs.',
--      NULL,'Leg Press',NULL),
--
--     (TRUE,'32396b90-69f6-4f2e-b104-5b908afd2ebc',
--      'Keep your elbows close to your body to avoid injury.',
--      'Stand at a cable machine holding the rope or bar attachment. Push the handle down by extending your arms.',
--      NULL,'Cable Tricep Pushdown',NULL),
--
--     (TRUE,'b671b290-95c5-4cec-9785-4cc3a65c6bc6',
--      'Avoid rounding your back while pulling.',
--      'Sit at the cable row machine and pull the handle toward your waist while squeezing your shoulder blades.',
--      NULL,'Seated Row',NULL);
--
--

INSERT INTO EXERCISE
(ACTIVE, EXERCISE_ID, WARNING, DESCRIPTION, DIFFICULTY, NAME, TARGET_MUSCLE, CREATED_AT)
VALUES

    (TRUE,'70c10804-9fdf-4ed8-9348-790362402925',
     'Avoid if you have shoulder or wrist injuries.',
     'Start in a plank position with your hands slightly wider than shoulder width.

     Lower your body until your chest nearly touches the floor.

     Keep your body straight and core tight.

     Push back up to the starting position.',
     'BEGINNER','Push Up','Chest',CURRENT_TIMESTAMP),

    (TRUE,'e1a3167e-79f3-49a1-8906-d9a54c3b18d5',
     'Do not perform if you have severe knee pain.',
     'Stand with your feet shoulder-width apart.

     Lower your body by bending your knees and pushing your hips back.

     Keep your chest up and back straight.

     Return to standing position.',
     'BEGINNER','Bodyweight Squat','Legs',CURRENT_TIMESTAMP),

    (TRUE,'c83118a1-8c2f-4fa4-a0d5-0575cc31fb72',
     'Stop if you feel pain in your lower back.',
     'Start in a forearm plank position with elbows directly under shoulders.

     Keep your body in a straight line from head to heels.

     Engage your core and hold the position.',
     'BEGINNER','Plank Hold','Core',CURRENT_TIMESTAMP),

    (TRUE,'863f9b01-182c-4f6d-8788-20be39d57674',
     'Avoid if you have knee ligament injuries.',
     'Stand upright with feet together.

     Step forward with one leg and lower your hips until both knees are bent at about 90 degrees.

     Push back to the starting position and switch legs.',
     'BEGINNER','Forward Lunges','Legs',CURRENT_TIMESTAMP),

    (TRUE,'aa8d4010-e3e0-40cb-89f5-b0b5f7fd3176',
     'Not recommended for people with wrist or shoulder pain.',
     'Start in a push-up position.

     Bring one knee toward your chest, then quickly switch legs.

     Continue alternating legs in a running motion.',
     'INTERMEDIATE','Mountain Climbers','Full Body',CURRENT_TIMESTAMP),

    (TRUE,'e8127c67-bff6-4612-9a7c-819c921c2fae',
     'Not recommended for people with wrist or shoulder pain.',
     'Start in a push-up position.

     Bring one knee toward your chest, then quickly switch legs.

     Continue alternating legs in a running motion.',
     'INTERMEDIATE','Mountain Climbers','Full Body',CURRENT_TIMESTAMP),

    (TRUE,'375a860f-2ced-45c3-8977-c4504a6f9fdb',
     NULL,
     NULL,
     'BEGINNER','Jumping Jacks','Full Body',CURRENT_TIMESTAMP),

    (TRUE,'f4b6adca-5204-4ec1-862b-d3cce611f17c',
     'Avoid if you have ankle or knee injuries.',
     'Stand upright with your feet together and arms at your sides.

     Jump while spreading your legs and raising your arms overhead.

     Return to the starting position.',
     'BEGINNER','Jumping Jacks','Full Body',CURRENT_TIMESTAMP),

    (TRUE,'b2962988-5004-4820-92f7-c2ed5d3e6ca8',
     'Avoid if you have heart or joint problems.',
     'Start standing, drop into a squat, kick feet back to a plank, perform a push-up, jump forward and jump up.',
     'ADVANCED','Burpees','Full Body',CURRENT_TIMESTAMP),

    (TRUE,'8a0d33e9-fd57-4dbe-96c7-aa31b0e01a67',
     'Avoid if you have lower back issues.',
     'Lie on your back with knees bent and lift your upper body toward your knees.',
     'BEGINNER','Sit Ups','Core',CURRENT_TIMESTAMP),

    (TRUE,'40555ad6-e98b-4c0f-a9f3-b0d248978679',
     'Avoid if you have neck strain.',
     'Lie on your back and alternate touching elbows to opposite knees in a cycling motion.',
     'INTERMEDIATE','Bicycle Crunch','Core',CURRENT_TIMESTAMP),

    (TRUE,'61cc52b1-0eaf-4da4-8f39-d903419a39ce',
     'Avoid if you have lower back pain.',
     'Lie flat and raise your legs straight up while keeping your core engaged.',
     'BEGINNER','Leg Raises','Core',CURRENT_TIMESTAMP),

    (TRUE,'edb5cee1-f8a1-4abb-82a4-2f2f66603baf',
     'Avoid if you have shoulder or chest injuries.',
     'Lie flat on a bench and grip the barbell slightly wider than shoulder width. Lower the bar to your chest and press it back up until your arms are fully extended.',
     'INTERMEDIATE','Bench Press','Chest',CURRENT_TIMESTAMP),

    (TRUE,'43a22396-61a5-4752-9c6b-c28761d20b83',
     'Do not lean too far back...',
     'Sit at the lat pulldown machine and grip the bar wide. Pull the bar down toward your chest while squeezing your back muscles.',
     'BEGINNER','Lat Pulldown','Back',CURRENT_TIMESTAMP),

    (TRUE,'a6c27daa-bd9c-4955-8596-8ed34c868a93',
     'Do not lock your knees...',
     'Sit on the leg press machine and place your feet shoulder-width apart on the platform. Push the platform away by extending your legs.',
     'BEGINNER','Leg Press','Legs',CURRENT_TIMESTAMP),

    (TRUE,'32396b90-69f6-4f2e-b104-5b908afd2ebc',
     'Keep your elbows close...',
     'Stand at a cable machine holding the rope or bar attachment. Push the handle down by extending your arms.',
     'BEGINNER','Cable Tricep Pushdown','Arms',CURRENT_TIMESTAMP),

    (TRUE,'b671b290-95c5-4cec-9785-4cc3a65c6bc6',
     'Avoid rounding your back...',
     'Sit at the cable row machine and pull the handle toward your waist while squeezing your shoulder blades.',
     'BEGINNER','Seated Row','Back',CURRENT_TIMESTAMP);
INSERT INTO MEMBERSHIP_FEATURE (ID, MEMBERSHIP_ID, FEATURE_NAME) VALUES
                                                                     (1, '4d81c365-18d3-4dbd-8d9d-e1f513e74c4f', 'Gym floor access (Cardio + Basic Equipment)'),
                                                                     (2, '4d81c365-18d3-4dbd-8d9d-e1f513e74c4f', 'Fixed time slot access (e.g., 6am–10am)'),
                                                                     (3, '4d81c365-18d3-4dbd-8d9d-e1f513e74c4f', 'Locker facility (basic)'),
                                                                     (4, '4d81c365-18d3-4dbd-8d9d-e1f513e74c4f', 'Monthly subscription'),
                                                                     (5, '4d81c365-18d3-4dbd-8d9d-e1f513e74c4f', 'Orientation session for beginners'),
                                                                     (6, '4d81c365-18d3-4dbd-8d9d-e1f513e74c4f', 'Fitness assessment at joining'),
                                                                     (7, '4d81c365-18d3-4dbd-8d9d-e1f513e74c4f', 'Access to gym rules & safety guidelines'),
                                                                     (8, '4d81c365-18d3-4dbd-8d9d-e1f513e74c4f', 'Basic towel service'),
                                                                     (9, '86d5d62e-57ad-4683-affb-8975c12abad0', 'Full gym access (Cardio + Strength equipment + Functional training)'),
                                                                     (10, '86d5d62e-57ad-4683-affb-8975c12abad0', 'Group classes: Yoga, Zumba, HIIT, Aerobics'),
                                                                     (11, '86d5d62e-57ad-4683-affb-8975c12abad0', 'Trainer guidance: 1–2 sessions/month'),
                                                                     (12, '86d5d62e-57ad-4683-affb-8975c12abad0', 'Locker + shower + towel service'),
                                                                     (13, '86d5d62e-57ad-4683-affb-8975c12abad0', 'Health check-up / basic body composition analysis'),
                                                                     (14, '86d5d62e-57ad-4683-affb-8975c12abad0', 'Progress tracking in mobile app'),
                                                                     (15, '86d5d62e-57ad-4683-affb-8975c12abad0', 'Monthly fitness newsletter / tips'),
                                                                     (16, '86d5d62e-57ad-4683-affb-8975c12abad0', 'Access to online workout videos library'),
                                                                     (17, '180b9553-8436-41a2-8f30-c763af4dabd5', 'Unlimited gym access (all equipment + free weights + functional area)'),
                                                                     (18, '180b9553-8436-41a2-8f30-c763af4dabd5', 'Personal trainer (2–3 sessions/week)'),
                                                                     (19, '180b9553-8436-41a2-8f30-c763af4dabd5', 'Customized workout plan'),
                                                                     (20, '180b9553-8436-41a2-8f30-c763af4dabd5', 'Diet & nutrition guidance'),
                                                                     (21, '180b9553-8436-41a2-8f30-c763af4dabd5', 'Progress tracking system (weight, BMI, muscle mass, fat %)'),
                                                                     (22, '180b9553-8436-41a2-8f30-c763af4dabd5', 'Body composition analysis every month'),
                                                                     (23, '180b9553-8436-41a2-8f30-c763af4dabd5', 'Priority booking for classes'),
                                                                     (24, '180b9553-8436-41a2-8f30-c763af4dabd5', 'Access to premium group classes (Pilates, Crossfit)');

-- exercise image
INSERT INTO EXERCISE_IMAGE (EXERCISE_ID, ID, IMAGE_URL) VALUES
                                                            ('70c10804-9fdf-4ed8-9348-790362402925','10978461-d758-4849-8cf6-5cffa74e6040','b6a9c626-37a3-4b0e-98de-dcaa61463e5e_Push-Up-Exercises-1.jpg'),
                                                            ('70c10804-9fdf-4ed8-9348-790362402925','db4f4d91-d184-45f0-86b5-260bb57f453e','727dd3c5-e800-4adc-b120-06dc61815e93_Push_Up.webp'),
                                                            ('70c10804-9fdf-4ed8-9348-790362402925','2457b19f-6976-427e-8e94-e0bd133d41ce','2a84a1a2-b968-4983-a0fe-36a727978ba2_9BP4SsAx7aSmc6gE5FFiGC.jpg'),
                                                            ('70c10804-9fdf-4ed8-9348-790362402925','51da131e-d0c5-4efa-9835-baec0b493de6','417a3e9a-c596-412c-b037-505dee5610ff_Ryan-Push-Up.png'),
                                                            ('70c10804-9fdf-4ed8-9348-790362402925','7f1c9fe3-d509-402f-81ea-85268ad333d5','d8f36290-09b5-4664-81a0-ba59c15d5a12_Pushup-Mistakes-Body360-Fit.png'),

                                                            ('e1a3167e-79f3-49a1-8906-d9a54c3b18d5','09d50c49-99da-4511-855b-0f06f6c1b1ba','7af8baa6-f40d-4f5a-ace5-96519c5c83ba_66e8991460790ade1fac6d2a_maxresdefault (1).jpg'),
                                                            ('e1a3167e-79f3-49a1-8906-d9a54c3b18d5','59b93971-986f-4369-9a39-8e7998a76e8b','f87f4151-470b-45e3-b732-80a5b591aaec_5-Master-the-Squat-in-5-Easy-Steps.jpg'),
                                                            ('e1a3167e-79f3-49a1-8906-d9a54c3b18d5','4e3bb11c-dd6f-432e-b51d-2037a53972ee','365852d8-d60f-4662-9e1d-d906e91c1682_19-bodyweight-squat.avif'),

                                                            ('c83118a1-8c2f-4fa4-a0d5-0575cc31fb72','19bcb2d7-a335-4403-a74e-827d835656ae','8f6bbed1-29f9-4725-ad3e-a5efdc12ceaa_how-many-push-ups-should-you-do-a-day-to-see-results.jpeg'),
                                                            ('c83118a1-8c2f-4fa4-a0d5-0575cc31fb72','d221ee09-102f-4595-9de8-2a1e0ea26ac6','505f4193-ac06-4356-9949-686f3bdd84e7_Push-Up-Exercises-1.jpg'),
                                                            ('c83118a1-8c2f-4fa4-a0d5-0575cc31fb72','c71a1539-c284-4c3c-9e78-7ae0c3deefa5','2f27f27f-587c-4b03-95d7-a13674f2da36_how-to-do-a-push-up-plank-build-core-chest-and-triceps.jpeg'),

                                                            ('863f9b01-182c-4f6d-8788-20be39d57674','954fdbbc-74e7-453d-bf3a-6a0baf2b93d2','80674007-070d-4c6c-955d-f789a94ccede_black-guy-doing-forward-lunge-exercise-laptop-home-sporty-black-guy-doing-forward-lunge-exercise-training-front-laptop-219000134.webp'),
                                                            ('863f9b01-182c-4f6d-8788-20be39d57674','a39e47f7-d9b7-488a-b31e-97cd779a1ae5','ae789204-121c-48ce-b649-045fe42f4876_cheerful-athletic-black-man-doing-forward-lunge-exercising-near-laptop-watching-online-workout-tutorial-home-guy-training-428627411.webp'),

                                                            ('e8127c67-bff6-4612-9a7c-819c921c2fae','b35b0942-240a-4974-bdf1-8c10a9423eb8','20830875-2244-4a07-b50f-954e44b9acd4_mountain-climbers.png'),
                                                            ('e8127c67-bff6-4612-9a7c-819c921c2fae','fcc8a214-59bb-4d24-9775-0ef0134c9b43','a7962b4d-7c08-4012-912c-97d22a397d33_how-to-do-mountain-climbers.jpeg'),

                                                            ('f4b6adca-5204-4ec1-862b-d3cce611f17c','a73ce274-09cc-4e9f-bd9c-485420dad1d6','4d9ec68f-e2a3-437e-b454-c04032580116_GRT-two-people-jumping-jacks-1296x728-header.avif'),
                                                            ('f4b6adca-5204-4ec1-862b-d3cce611f17c','aad20ac3-12ff-400f-a042-b44420f5bed7','801a13ee-3a77-4787-aa49-ea5721e46d59_depositphotos_475663642-stock-illustration-guy-doing-jumping-jacks-home.jpg'),

                                                            ('b2962988-5004-4820-92f7-c2ed5d3e6ca8','48c366d2-5f86-40fc-b7ec-46dd8c017eab','b1ce7683-d421-46e8-a1bb-f47cae52ace3_A_diagram_of_a_woman_showing_the_change_in_position_to_perform_Burpees_52648db3-20b9-419c-8648-c58a9351ca34.webp'),
                                                            ('b2962988-5004-4820-92f7-c2ed5d3e6ca8','ff0361ba-f254-4321-ac8e-a272a549632d','dacb6b12-f12d-4419-81c1-d79c2011ae68_burpee-1109.webp'),

                                                            ('8a0d33e9-fd57-4dbe-96c7-aa31b0e01a67','43cf6f01-4a03-47c2-8cb6-79178d7ecec4','9152225b-54bf-4fe3-a1dc-906f6260783b_GzLeM2yKQGigqMF7Mtu8vh.jpg'),
                                                            ('8a0d33e9-fd57-4dbe-96c7-aa31b0e01a67','7b83627e-6393-4c39-98b5-6da106705ab3','fe7d8bfe-8cd6-411b-ad37-97369aa2b1d3_u732pcXisraDgMESrUvnNk.jpg'),

                                                            ('40555ad6-e98b-4c0f-a9f3-b0d248978679','e65805ab-6185-4257-8cc8-d0be3aa0c565','8571e914-0d27-4070-b0b5-75fdece1e561_bicycle-crunch.jpg'),
                                                            ('40555ad6-e98b-4c0f-a9f3-b0d248978679','7e9537e8-011c-44ff-94e5-6000daf85cc0','2b6c0fb0-b81f-4871-ad8d-7c451ac776c1_Bicycle_Exercise.webp'),

                                                            ('61cc52b1-0eaf-4da4-8f39-d903419a39ce','5cad5dcf-e981-40a0-a53a-f9a639258ec9','94ffd7ba-3468-4f94-956b-f8f5b2b481bf_Xw8VaDaXRAstbCW84vib6g.jpg'),
                                                            ('61cc52b1-0eaf-4da4-8f39-d903419a39ce','c2b3320a-c387-4457-9664-a7c339604c33','fc6f1bc8-7638-4003-9fa1-7f545f00ff9f_woman-doing-straight-leg-raise-on-yoga-mat.png'),

                                                            ('edb5cee1-f8a1-4abb-82a4-2f2f66603baf','d71299d5-5274-458d-8ac1-53cf3dbf7d32','b4a3b259-1693-4615-a92c-55637ad54af1_bench-press-form.jpg'),
                                                            ('edb5cee1-f8a1-4abb-82a4-2f2f66603baf','31beb5ec-9419-4875-afda-c901b152667e','80c7fa99-e45e-4b79-8c0e-7ff9585c475c_67f015f49341927eeca662f0_67e301fcab24c92d48cb372e_AF-HERO_BenchPress%20(1).jpeg'),

                                                            ('43a22396-61a5-4752-9c6b-c28761d20b83','4af89747-2d97-46e2-bd09-6db56a431116','de075147-3867-4100-aead-8b63b9e1b779_Lat-pulldown-on-Mirafit-Lat-Pulldown-Machine.webp'),
                                                            ('43a22396-61a5-4752-9c6b-c28761d20b83','3e5338bf-1295-4495-a4ca-3c307b73d87d','97f1d7df-a930-435e-9ae3-08f427b853c4_lat-pulldown-maschine.webp'),
                                                            ('43a22396-61a5-4752-9c6b-c28761d20b83','181783db-01d4-471c-a95a-a879ce0b33bd','02c40f4d-4c57-42cc-ae52-1c956a71b0d8_6786c870ee8717d31a82f0a4_677e6acd61197024154c1738_AF_Blog_HERO_HowToUseTheLatPulldownMachine.jpeg');

-- exercise video
INSERT INTO EXERCISE_VIDEO (EXERCISE_ID, ID, VIDEO_URL) VALUES
                                                            ('70c10804-9fdf-4ed8-9348-790362402925','f071d03f-2941-4c5b-8a34-888fbc1296e9','https://www.youtube.com/watch?v=IODxDxX7oi4'),

                                                            ('e1a3167e-79f3-49a1-8906-d9a54c3b18d5','088c22b7-3efd-4285-b383-fc6ef4b12fbf','https://youtu.be/8uoaYwS6iFM?si=Yu-1x2KxSNJR6Upj'),
                                                            ('e1a3167e-79f3-49a1-8906-d9a54c3b18d5','f9f00e10-65f6-4765-8147-55c7adc2290f','https://youtu.be/30PqX2zvK88?si=Mo0xrDthGBHVXVfM'),

                                                            ('c83118a1-8c2f-4fa4-a0d5-0575cc31fb72','5b386f4f-c5d7-4ca1-a207-ea3a98042fec','https://youtu.be/6LqqeBtFn9M?si=YTs99BeApsWDT9jW'),
                                                            ('c83118a1-8c2f-4fa4-a0d5-0575cc31fb72','46dfdab1-b275-47a5-af47-b1b8d9fe5a51','https://youtu.be/A2b2EmIg0dA?si=OrnSMlN6lmmOoeDi'),

                                                            ('863f9b01-182c-4f6d-8788-20be39d57674','a81580a0-d4d4-4b78-bc9c-8c0617eeebc5','https://youtu.be/g8-Ge9S0aUw?si=JaYiZMBSYu5CzzuS'),
                                                            ('863f9b01-182c-4f6d-8788-20be39d57674','9131bbb7-a2a2-4701-888e-a79334aad87d','https://youtu.be/3TM-vVWuLYE?si=_mJI1lrYMTZnx1Ry'),

                                                            ('aa8d4010-e3e0-40cb-89f5-b0b5f7fd3176','1c733c36-721c-4178-9d4a-f6bc4013cc49','https://youtu.be/ruQ4ZwncXBg?si=El5hX03FQk69smrM'),
                                                            ('aa8d4010-e3e0-40cb-89f5-b0b5f7fd3176','fd364f71-0e8e-4e4b-b98d-034a1789c878','https://youtu.be/ZhiCSdOVJp0?si=dvm6LH41tIlM5_5y'),
                                                            ('aa8d4010-e3e0-40cb-89f5-b0b5f7fd3176','cdb701e3-0666-48d3-bd2a-67f7e2e2fcd4','https://youtu.be/kLh-uczlPLg?si=_VVK_bQguZvD4Osr'),

                                                            ('e8127c67-bff6-4612-9a7c-819c921c2fae','cdd0a202-6f00-4ebb-b5ef-0fda4c0f1071','https://youtu.be/ruQ4ZwncXBg?si=9SQXdLX0WCTSDtVY'),
                                                            ('e8127c67-bff6-4612-9a7c-819c921c2fae','73d78ded-c80b-4b80-ba65-4fedf7870f09','https://youtu.be/ZhiCSdOVJp0?si=zPlHV2nsd9eIYrPm'),
                                                            ('e8127c67-bff6-4612-9a7c-819c921c2fae','aef02e29-db0f-4863-a11b-d5b89fe23354','https://youtu.be/ZhiCSdOVJp0?si=zPlHV2nsd9eIYrPm'),

                                                            ('375a860f-2ced-45c3-8977-c4504a6f9fdb','aec8891f-2f78-4733-9b10-0e626fe22e4e','https://youtu.be/CWpmIW6l-YA?si=bRY2-a6da9Hn_SVo'),
                                                            ('375a860f-2ced-45c3-8977-c4504a6f9fdb','f34784e7-29b3-450d-8dea-6205c6e57ca4','https://youtu.be/CWpmIW6l-YA?si=bRY2-a6da9Hn_SVo'),

                                                            ('f4b6adca-5204-4ec1-862b-d3cce611f17c','f71b64d7-b04e-4dc2-8dd3-a993c5206a1b','https://youtu.be/CWpmIW6l-YA?si=bRY2-a6da9Hn_SVo'),
                                                            ('f4b6adca-5204-4ec1-862b-d3cce611f17c','ba129311-dceb-4149-aa13-2218a058ed38','https://youtu.be/CWpmIW6l-YA?si=bRY2-a6da9Hn_SVo'),

                                                            ('b2962988-5004-4820-92f7-c2ed5d3e6ca8','1e18637e-1a97-409b-b89a-504d15ffa361','https://youtu.be/y9RBpnR04B0?si=Q2Fnt4ylHB7XHUiC'),
                                                            ('b2962988-5004-4820-92f7-c2ed5d3e6ca8','60c320b0-3965-422e-bb19-31f276489beb','https://youtu.be/qu1pqo-dbXM?si=L26RarOMPeK9w-A2'),

                                                            ('8a0d33e9-fd57-4dbe-96c7-aa31b0e01a67','3892450f-6e51-452d-b846-ed540e8f32c1','https://youtu.be/s3PPU_2z9qo?si=3QZZUrq6EVQHAxVw'),
                                                            ('8a0d33e9-fd57-4dbe-96c7-aa31b0e01a67','4d58113e-0c19-4917-94a2-ed24573998d3','https://youtu.be/5ER5Of4MOPI?si=Dwh6619gMFuZBCoW'),

                                                            ('40555ad6-e98b-4c0f-a9f3-b0d248978679','ec73a46b-1614-457d-a93e-fdf849597f07','https://youtu.be/eqg47ZuGZXQ?si=6XG0r8GqG3LroXMA'),
                                                            ('40555ad6-e98b-4c0f-a9f3-b0d248978679','2be8a82e-09fc-4c96-8c39-08323da4df34','https://youtu.be/wnuLak2onoA?si=ZMuCVrY5KDhfL01h'),

                                                            ('61cc52b1-0eaf-4da4-8f39-d903419a39ce','5ce79075-23d8-421e-b261-68a16f869f26','https://youtu.be/zHsPDsYwEWs?si=LiYRXMKGCidT0vhe'),
                                                            ('61cc52b1-0eaf-4da4-8f39-d903419a39ce','8e06cac8-e975-4432-b562-0825e7d4d981','https://youtu.be/RuIdJSVTKO4?si=Hoe9fdEZxPvnjYA2'),

                                                            ('edb5cee1-f8a1-4abb-82a4-2f2f66603baf','89c80e62-ed54-4571-9a5f-5024cab67ae0','https://youtu.be/gRVjAtPip0Y?si=NYqnxlWmH2zk-RFg'),
                                                            ('edb5cee1-f8a1-4abb-82a4-2f2f66603baf','c1a3fc63-7be9-4f98-9ad8-69acb6b0937a','https://youtu.be/vthMCtgVtFw?si=vtwK7n4hfg2FzHmR'),

                                                            ('43a22396-61a5-4752-9c6b-c28761d20b83','dcff4bae-e029-4fbb-bde1-5636e569968d','https://youtu.be/SALxEARiMkw?si=GBvygJYQT0Kzy6jn'),
                                                            ('43a22396-61a5-4752-9c6b-c28761d20b83','4b366929-c828-43c8-a859-571b958dc588','https://youtu.be/CAwf7n6Luuc?si=Tn-wPMlZKr_z94Sz'),

                                                            ('a6c27daa-bd9c-4955-8596-8ed34c868a93','0aed7aa1-c0bd-4053-a640-0b688d921f6a','https://youtu.be/n69-eVLtevc?si=2cmJUZbUoAl3f6-h'),
                                                            ('a6c27daa-bd9c-4955-8596-8ed34c868a93','4a042831-f2e7-42f2-9c2e-8495079af750','https://youtu.be/8EMbB0tCn7Q?si=vWtdePagJqefJm_X'),

                                                            ('32396b90-69f6-4f2e-b104-5b908afd2ebc','b6c8b224-8796-4f1f-ae92-05a2b0a8ad34','https://youtu.be/-zLyUAo1gMw?si=aCeWI5uwg_us5yZY'),
                                                            ('32396b90-69f6-4f2e-b104-5b908afd2ebc','fe159e67-c5a2-40ec-a0dc-994c963ec96a','https://youtu.be/_w-HpW70nSQ?si=LGPheWQ3lu84J2Z9'),

                                                            ('b671b290-95c5-4cec-9785-4cc3a65c6bc6','7ce43c16-00fc-4c03-b57d-74dcd31045de','https://youtu.be/vwHG9Jfu4sw?si=kMGUwg1oyLmVbg7g'),
                                                            ('b671b290-95c5-4cec-9785-4cc3a65c6bc6','86985770-8029-49d4-a371-cc92eb28cf94','https://youtu.be/CsROhQ1onAg?si=noRZZnBtemy1S5Z7');

-- routine template
INSERT INTO ROUTINE_TEMPLATE
(ACTIVE, ID, TRAINER_TRAINER_ID, LEVEL, NAME)
VALUES
    (TRUE,'fdce820d-bfd7-46ed-8474-43f797c8e637','bc3415f1-3d0a-4a14-8929-457bee0908c4','Beginner','Week-1'),

    (TRUE,'f9669966-5bdb-41fa-961e-808240a7ed07','bc3415f1-3d0a-4a14-8929-457bee0908c4','Intermediate','Week-2'),

    (TRUE,'be076c82-42b2-4e6d-b358-487d24700c08','bc3415f1-3d0a-4a14-8929-457bee0908c4','Advanced','week-3');

-- routine template day
INSERT INTO ROUTINE_TEMPLATE_DAY (ID, TEMPLATE_ID, DAY_OF_WEEK) VALUES
                                                                    ('ab1869f3-93cb-468a-afbf-9e394461a1c5','fdce820d-bfd7-46ed-8474-43f797c8e637','SATURDAY'),
                                                                    ('887d4e51-229d-4930-a5f4-d030f67efecb','fdce820d-bfd7-46ed-8474-43f797c8e637','SUNDAY'),
                                                                    ('04753afd-ac08-47fd-a1aa-d1c7f28fbda8','fdce820d-bfd7-46ed-8474-43f797c8e637','MONDAY'),
                                                                    ('fb3ec1ac-fb8c-421b-b5be-9f5f80b1d047','fdce820d-bfd7-46ed-8474-43f797c8e637','TUESDAY'),
                                                                    ('8d1386ed-4526-4e7b-b688-530ef1312907','fdce820d-bfd7-46ed-8474-43f797c8e637','WEDNESDAY'),
                                                                    ('d18bc5c0-27d8-43a3-a102-c942fac5c7fa','fdce820d-bfd7-46ed-8474-43f797c8e637','THURSDAY'),
                                                                    ('a377eadf-34da-4cff-a810-cfc8bc2a5575','fdce820d-bfd7-46ed-8474-43f797c8e637','FRIDAY'),

                                                                    ('e492bf6e-8d94-4752-8b10-1cd05350cfa1','f9669966-5bdb-41fa-961e-808240a7ed07','MONDAY'),
                                                                    ('e4086455-dd96-4112-86e8-b31a5ce13513','f9669966-5bdb-41fa-961e-808240a7ed07','SUNDAY'),
                                                                    ('d96abb75-0f02-4e60-9cfa-72e54d447dcd','f9669966-5bdb-41fa-961e-808240a7ed07','SATURDAY'),
                                                                    ('6aed5239-e033-4ea1-998b-a321a91c0f56','f9669966-5bdb-41fa-961e-808240a7ed07','THURSDAY'),
                                                                    ('c662d10f-8ee3-442a-8bce-aa93f8986aa8','f9669966-5bdb-41fa-961e-808240a7ed07','WEDNESDAY'),
                                                                    ('0cb6bbfe-bd21-4432-91d1-821289f4ad6d','f9669966-5bdb-41fa-961e-808240a7ed07','TUESDAY'),

                                                                    ('c1996b53-3b0a-428f-b4ec-969707405f42','be076c82-42b2-4e6d-b358-487d24700c08','MONDAY'),
                                                                    ('4c1deb9b-8bc3-4718-95bf-a033ac3806e3','be076c82-42b2-4e6d-b358-487d24700c08','TUESDAY'),
                                                                    ('b79f4afc-64f8-4691-912e-f505183f3ead','be076c82-42b2-4e6d-b358-487d24700c08','WEDNESDAY'),
                                                                    ('e1598c4d-97f4-4fde-ac7e-fc48ff73757d','be076c82-42b2-4e6d-b358-487d24700c08','THURSDAY'),
                                                                    ('c07c63b2-7b7a-4c65-b6c8-a9c77ea599ba','be076c82-42b2-4e6d-b358-487d24700c08','FRIDAY'),
                                                                    ('4026e125-caa7-4105-83ea-916afe667e69','be076c82-42b2-4e6d-b358-487d24700c08','SATURDAY'),
                                                                    ('ed565d32-edbd-4c80-ac80-8013b5b84b45','be076c82-42b2-4e6d-b358-487d24700c08','SUNDAY');

-- routine template exercise
INSERT INTO ROUTINE_TEMPLATE_EXERCISE
(DURATION, REPS, SETS, EXERCISE_EXERCISE_ID, ID, TEMPLATE_DAY_ID, NOTES)
VALUES
    (20,10,3,'70c10804-9fdf-4ed8-9348-790362402925','657577a5-f012-4b0b-ab31-17ae84bec4ba','ab1869f3-93cb-468a-afbf-9e394461a1c5','good'),
    (30,20,5,'e1a3167e-79f3-49a1-8906-d9a54c3b18d5','61c6adb7-89ae-4766-a67c-035e98fbc357','ab1869f3-93cb-468a-afbf-9e394461a1c5','good'),

    (30,20,5,'b671b290-95c5-4cec-9785-4cc3a65c6bc6','9af4b6e2-1e5f-4f4c-a162-f08f09bc590e','a377eadf-34da-4cff-a810-cfc8bc2a5575','good'),
    (30,20,7,'f4b6adca-5204-4ec1-862b-d3cce611f17c','aea4ff0e-74a3-4fb5-9d95-d911b7261026','a377eadf-34da-4cff-a810-cfc8bc2a5575','good'),
    (50,10,5,'32396b90-69f6-4f2e-b104-5b908afd2ebc','4076cb3d-35a1-4a3c-b880-78310e4f44b5','a377eadf-34da-4cff-a810-cfc8bc2a5575','good'),

    (40,10,5,'8a0d33e9-fd57-4dbe-96c7-aa31b0e01a67','a39615ed-9f68-4c29-b6aa-9d76a9229df3','d18bc5c0-27d8-43a3-a102-c942fac5c7fa','good'),

    (45,30,5,'edb5cee1-f8a1-4abb-82a4-2f2f66603baf','8c4b4c8c-de95-4c3e-a9a0-b82e2b5295ab','8d1386ed-4526-4e7b-b688-530ef1312907','good'),

    (30,10,4,'863f9b01-182c-4f6d-8788-20be39d57674','30cca60a-1662-427c-a4a8-7d4f7f01fc38','887d4e51-229d-4930-a5f4-d030f67efecb','good'),
    (25,10,5,'40555ad6-e98b-4c0f-a9f3-b0d248978679','bf6be98e-22f6-45de-be86-23b61e89eb10','887d4e51-229d-4930-a5f4-d030f67efecb','good'),

    (20,10,3,'c83118a1-8c2f-4fa4-a0d5-0575cc31fb72','d5dd3101-10f9-435c-a483-e9f953bab5d1','04753afd-ac08-47fd-a1aa-d1c7f28fbda8','good'),
    (45,12,4,'40555ad6-e98b-4c0f-a9f3-b0d248978679','10fd19bd-ca70-431b-a723-5c0955410cba','04753afd-ac08-47fd-a1aa-d1c7f28fbda8','good'),

    (35,15,4,'b2962988-5004-4820-92f7-c2ed5d3e6ca8','cd532f31-80c9-44ca-878f-31ebed4c2ecd','fb3ec1ac-fb8c-421b-b5be-9f5f80b1d047','good'),

    (50,15,7,'b671b290-95c5-4cec-9785-4cc3a65c6bc6','ca53f85b-15ad-4946-a6f9-90d4671ef4dd','c662d10f-8ee3-442a-8bce-aa93f8986aa8','good'),
    (45,15,7,'32396b90-69f6-4f2e-b104-5b908afd2ebc','2136500e-72f7-4bfe-9664-fb1e418d79bd','c662d10f-8ee3-442a-8bce-aa93f8986aa8',NULL),

    (60,15,8,'a6c27daa-bd9c-4955-8596-8ed34c868a93','171455e3-512b-43f7-a6eb-aa54fd47098b','6aed5239-e033-4ea1-998b-a321a91c0f56','good'),
    (50,15,8,'61cc52b1-0eaf-4da4-8f39-d903419a39ce','8b3009ac-3ecb-4c8e-9ca6-b94a9919d88c','6aed5239-e033-4ea1-998b-a321a91c0f56','good'),

    (70,20,10,'edb5cee1-f8a1-4abb-82a4-2f2f66603baf','3b31fc2e-d0d2-49b0-87cd-e5614a62edf3','d96abb75-0f02-4e60-9cfa-72e54d447dcd','good'),
    (35,20,8,'edb5cee1-f8a1-4abb-82a4-2f2f66603baf','479638bd-def1-4820-905b-051ba6097e54','d96abb75-0f02-4e60-9cfa-72e54d447dcd','good'),
    (70,25,10,'f4b6adca-5204-4ec1-862b-d3cce611f17c','770f7047-1ce0-4799-ae5a-9126653ccb92','d96abb75-0f02-4e60-9cfa-72e54d447dcd','good'),

    (60,30,12,'b2962988-5004-4820-92f7-c2ed5d3e6ca8','b419a978-b538-4eec-b767-0510b00e0ce5','e4086455-dd96-4112-86e8-b31a5ce13513','good'),

    (70,30,12,'c83118a1-8c2f-4fa4-a0d5-0575cc31fb72','b9b319d8-40b4-4dfc-81d1-a83523948ab8','e492bf6e-8d94-4752-8b10-1cd05350cfa1','good'),

    (30,30,12,'863f9b01-182c-4f6d-8788-20be39d57674','d4c73ff2-c290-4119-98ac-e8757f4081eb','0cb6bbfe-bd21-4432-91d1-821289f4ad6d','good'),

    (30,15,5,'70c10804-9fdf-4ed8-9348-790362402925','3b97ae18-f4d2-463d-8025-c8d07462e3eb','ed565d32-edbd-4c80-ac80-8013b5b84b45','good'),
    (40,20,10,'e1a3167e-79f3-49a1-8906-d9a54c3b18d5','6d335a0f-d3b2-4e1d-bc11-f9620ab52173','ed565d32-edbd-4c80-ac80-8013b5b84b45','good'),

    (30,30,8,'c83118a1-8c2f-4fa4-a0d5-0575cc31fb72','5b7cb05e-2840-4d01-8061-a4c231ed5bdf','4026e125-caa7-4105-83ea-916afe667e69','good'),

    (30,15,10,'8a0d33e9-fd57-4dbe-96c7-aa31b0e01a67','961d81b0-7640-4535-8ab9-d70885a95bab','4c1deb9b-8bc3-4718-95bf-a033ac3806e3','good day');

-- member routine
INSERT INTO MEMBER_ROUTINE
(ACTIVE, START_DATE, ID, MEMBER_MEMBER_ID, TEMPLATE_ID)
VALUES
    (TRUE,'2026-03-16','839f736a-9911-4a74-a399-479ad1ca4ca1','bb35327a-49ef-41c9-9e75-7b1ac169f49d','fdce820d-bfd7-46ed-8474-43f797c8e637'),

    (TRUE,'2026-03-16','758f473c-10c5-4192-bf39-b5881c761bc6','bb35327a-49ef-41c9-9e75-7b1ac169f49d','f9669966-5bdb-41fa-961e-808240a7ed07'),

    (TRUE,'2026-03-16','e8bc357e-91e0-405a-8515-43fbb0a2b4e9','bb35327a-49ef-41c9-9e75-7b1ac169f49d','be076c82-42b2-4e6d-b358-487d24700c08');


INSERT INTO BLOG (PUBLISHED, CREATED_AT, UPDATED_AT, AUTHOR_ID, ID, CONTENT, CATEGORY, COVER_IMAGE, TITLE) VALUES

                                                                                                               (FALSE,'2026-04-04 00:17:33.042978','2026-04-04 00:18:51.253991','07ca14fd-ef02-469e-8cc7-d791ce6364d2','376f2180-fecf-43b5-91c9-6d2f23b381aa',
                                                                                                                '<p>In modern life, many people spend long hours sitting at desks, using mobile devices, or working in front of computers. This sedentary lifestyle can lead to various health issues such as obesity, back pain, and low energy levels. Regular exercise is one of the most effective ways to combat these problems and maintain a healthy lifestyle.</p>

                                                                                                                <p>Exercise helps improve cardiovascular health by strengthening the heart and improving blood circulation. Activities like <strong>running, cycling, and treadmill workouts</strong> can significantly reduce the risk of heart disease. Additionally, strength training exercises help build muscle mass, improve bone density, and increase metabolism.</p>

                                                                                                                <p>Another important benefit of regular exercise is its positive impact on mental health. Physical activity reduces stress hormones and increases the production of endorphins, which help improve mood and reduce anxiety. Many people find that going to the gym helps them clear their minds and feel more relaxed.</p>

                                                                                                                <p><em>Consistency is the most important factor when it comes to fitness. It is not about working out intensely for a few days but maintaining a regular routine over time. Even 30–45 minutes of daily exercise can bring noticeable improvements in health and fitness.</em></p>

                                                                                                                <p>In conclusion, exercise is not just an option—it is a necessity for a healthy and balanced life. Making it a part of your daily routine can transform both your body and mind.</p>',
                                                                                                                'Health & Fitness','f054141f-c871-49ed-8eaa-002272f19421_cheerful-athletic-black-man-doing-forward-lunge-exercising-near-laptop-watching-online-workout-tutorial-home-guy-training-428627411.webp','The Importance of Regular Exercise in Daily Life 💪'),

                                                                                                               (TRUE,'2026-04-04 00:20:06.830776',NULL,'07ca14fd-ef02-469e-8cc7-d791ce6364d2','ebf4f3dd-e589-40ad-9f30-b143db5e111d',
                                                                                                                '<p>Starting a fitness journey is easy, but staying consistent is the real challenge. Many people begin with excitement but lose motivation after a few weeks. Understanding how to stay motivated is essential for achieving long-term fitness goals.</p>

                                                                                                                <p>One effective way to stay motivated is by setting clear and realistic goals. Instead of aiming for drastic changes, focus on small, achievable targets such as losing a few kilograms or improving endurance. Achieving these small goals builds confidence and keeps you motivated.</p>

                                                                                                                <p>Another important factor is creating a workout routine that you enjoy. If you do not enjoy your workouts, it becomes difficult to stay consistent. Try different types of exercises such as weight training, cardio, or group workouts to find what suits you best.</p>

                                                                                                                <p>Having a workout partner or joining a fitness community can also boost motivation. When you train with others, you feel encouraged and accountable. A supportive environment plays a big role in maintaining consistency.</p>

                                                                                                                <p><em>Tracking progress is another powerful motivator. Keeping a record of your workouts, weight, and measurements helps you see improvements over time. This progress inspires you to keep going.</em></p>

                                                                                                                <p>In the end, motivation comes and goes, but discipline is what keeps you moving forward. Stay consistent, stay focused, and never give up on your fitness journey.</p>',
                                                                                                                'Motivation','af4ac5f5-e7a2-4731-b9be-84fa86d5440b_leg-press.jpg','How to Stay Motivated in Your Fitness Journey 🔥'),

                                                                                                               (TRUE,'2026-04-04 00:20:43.419478',NULL,'07ca14fd-ef02-469e-8cc7-d791ce6364d2','6c0d2e10-d02a-4452-bbf8-e2ef456ff9f7',
                                                                                                                '<p>Fitness is not only about working out; nutrition plays an equally important role. Without proper nutrition, it is difficult to achieve fitness goals such as weight loss or muscle gain. A balanced diet provides the energy and nutrients needed for effective workouts and recovery.</p>

                                                                                                                <p>Protein is one of the most important nutrients for muscle growth. It helps repair and build muscle tissues after intense workouts. Foods like eggs, chicken, fish, and legumes are excellent sources of protein.</p>

                                                                                                                <p>Carbohydrates are the body&rsquo;s main source of energy. They fuel your workouts and help you perform better. Complex carbohydrates such as brown rice, oats, and whole grains provide sustained energy throughout the day.</p>

                                                                                                                <p>Healthy fats are also essential for overall health. They support hormone production and provide long-lasting energy. Sources of healthy fats include nuts, seeds, and avocados.</p>

                                                                                                                <p><em>Hydration is often overlooked but is extremely important. Drinking enough water helps maintain energy levels, improves performance, and aids in recovery.</em></p>

                                                                                                                <p>In conclusion, a proper balance of exercise and nutrition is the key to achieving fitness success. Eating the right foods at the right time can significantly enhance your results.</p>',
                                                                                                                'Nutrition','e80c205f-dff3-46f2-8cb4-db0a6faceb6b_young-man-workout-fitness-club-260nw-2471712867.webp','The Role of Nutrition in Fitness and Muscle Growth 🥗'),

                                                                                                               (TRUE,'2026-04-04 00:21:31.347369',NULL,'07ca14fd-ef02-469e-8cc7-d791ce6364d2','238fe46b-bf8d-463d-8223-4c2abf48ac96',
                                                                                                                '<p>Joining a gym is not just about working out alone—it is about becoming part of a community. A gym environment provides motivation, support, and a sense of belonging that can make your fitness journey more enjoyable.</p>

                                                                                                                <p>One of the biggest benefits of a gym community is motivation. Seeing others work hard encourages you to push your limits. Group workouts and training sessions create a positive and energetic atmosphere.</p>

                                                                                                                <p>Professional trainers in a gym also play a crucial role. They guide members, correct their form, and help them achieve their goals safely. With expert support, you can avoid injuries and get better results.</p>

                                                                                                                <p><em>Another advantage is access to modern equipment. A well-equipped gym offers a variety of machines and tools that allow you to perform different types of exercises. This variety keeps workouts interesting and effective.</em></p>

                                                                                                                <p><strong>Social interaction is another important aspect. Meeting people with similar goals creates friendships and makes workouts more enjoyable. It also helps in building consistency.</strong></p>

                                                                                                                <p>In conclusion, a gym community provides much more than just a place to exercise. It offers support, motivation, and a positive environment that helps you stay committed to your fitness goals.</p>',
                                                                                                                'Lifestyle','1b7fd7f0-434e-4903-aa3f-42d718bd5d49_how-to-do-mountain-climbers.jpeg','Benefits of Joining a Gym Community 👥'),

                                                                                                               (TRUE,'2026-04-04 00:22:33.09366',NULL,'07ca14fd-ef02-469e-8cc7-d791ce6364d2','87cd9cff-ca30-4c74-b280-0f042bc1e9fd',
                                                                                                                '<p>Losing weight is one of the most common fitness goals, but many people struggle to achieve it due to lack of proper knowledge and consistency. Weight loss is not about starving yourself or following extreme diets—it is about maintaining a balanced lifestyle.</p>

                                                                                                                <p>The first step towards weight loss is understanding calorie balance. To lose weight, you need to burn more calories than you consume. This can be achieved through a combination of exercise and healthy eating habits. Cardio exercises such as running, cycling, and skipping are highly effective in burning calories.</p>

                                                                                                                <p>Strength training is equally important for weight loss. Many people think lifting weights is only for muscle building, but it also helps burn fat by increasing metabolism. The more muscle mass you have, the more calories your body burns even at rest.</p>

                                                                                                                <p><em>Diet plays a crucial role in weight loss. Avoid processed foods, sugary drinks, and excessive fast food. Instead, focus on whole foods like vegetables, fruits, lean proteins, and whole grains. Eating smaller portions and maintaining a consistent eating schedule can also help.</em></p>

                                                                                                                <p>Another key factor is patience. Weight loss is a gradual process, and expecting quick results can lead to disappointment. Staying consistent with your workouts and diet will eventually bring results.</p>

                                                                                                                <p><strong>In conclusion, weight loss becomes simple when you follow the right approach. Stay consistent, eat healthy, and trust the process.</strong></p>',
                                                                                                                'Weight Loss','e3351ce3-5342-49ea-8dd0-d771cb70a8da_GzLeM2yKQGigqMF7Mtu8vh.jpg','Weight Loss Made Simple: A Complete Guide 🔥'),

                                                                                                               (TRUE,'2026-04-04 00:23:26.541394',NULL,'07ca14fd-ef02-469e-8cc7-d791ce6364d2','af52a554-0164-4afc-8498-86655ab700a9',
                                                                                                                '<p>Building muscle is a goal for many gym-goers, especially beginners who want to improve their strength and physique. However, starting the journey without proper guidance can lead to confusion and slow progress.</p>

                                                                                                                <p>The first step in muscle building is following a structured workout plan. Focus on compound exercises such as squats, deadlifts, bench press, and pull-ups. These exercises target multiple muscle groups and provide better results.</p>

                                                                                                                <p><strong>Progressive overload is the key principle of muscle growth. This means gradually increasing the weight or intensity of your workouts over time. Without progression, your muscles will not grow effectively.</strong></p>

                                                                                                                <p>Rest and recovery are just as important as workouts. Muscles grow when you rest, not when you train. Ensure you get enough sleep and allow your muscles time to recover between workouts.</p>

                                                                                                                <p><em>Nutrition is another critical factor. Protein intake should be sufficient to support muscle repair and growth. Combine protein with carbohydrates and healthy fats for balanced nutrition.</em></p>

                                                                                                                <p>Consistency is the most important factor. Muscle building takes time, and results will not appear overnight. Stay dedicated, and you will see progress over time.</p>',
                                                                                                                'Muscle Gain','aa4a18bb-ffc4-4ab9-8c0e-779f3e65fe85_how-many-push-ups-should-you-do-a-day-to-see-results.jpeg','Muscle Building Tips for Beginners 🏋️'),

                                                                                                               (TRUE,'2026-04-04 00:24:07.31386',NULL,'07ca14fd-ef02-469e-8cc7-d791ce6364d2','7fb9bbe9-0272-4d03-9451-284ae859a326',
                                                                                                                '<p>A daily workout routine can bring numerous benefits to your life, both physically and mentally. Even a short session of exercise every day can make a significant difference.</p>

                                                                                                                <p>First, it improves overall health by strengthening the heart and muscles. Second, it helps maintain a healthy weight by burning calories regularly. Third, it boosts energy levels and reduces fatigue.</p>

                                                                                                                <p>Daily workouts also improve mental health by reducing stress and anxiety. They enhance mood and promote better sleep. People who exercise regularly often feel more confident and positive.</p>

                                                                                                                <p>Another benefit is improved discipline. Following a daily routine builds consistency and self-control, which can be applied to other areas of life as well.</p>

                                                                                                                <p><em>Exercise also improves flexibility and posture, reducing the risk of injuries. It keeps your body active and prevents stiffness caused by long hours of sitting.</em></p>

                                                                                                                <p>In conclusion, a daily workout routine is one of the best habits you can develop. It leads to a healthier, happier, and more productive life.</p>',
                                                                                                                'Fitness Tips','18476a4f-5e8c-4d3f-971d-c87321db365b_Fit-man-doing-high-knees-cardio-exercise-548x428.jpg','Top 10 Benefits of Daily Workout Routine ✅'),

                                                                                                               (TRUE,'2026-04-04 00:24:56.529247',NULL,'07ca14fd-ef02-469e-8cc7-d791ce6364d2','2c552201-1510-4b3e-868d-152a341b7ecc',
                                                                                                                '<p>Many people join the gym with enthusiasm but make common mistakes that slow down their progress or even cause injuries. Understanding these mistakes can help you achieve better results.</p>

                                                                                                                <p>One of the most common mistakes is using incorrect form. Performing exercises without proper technique can lead to injuries and reduce effectiveness. Always focus on correct posture and movement.</p>

                                                                                                                <p>Another mistake is skipping warm-ups. Warming up prepares your body for exercise and reduces the risk of injury. Similarly, skipping cool-down sessions can lead to muscle stiffness.</p>

                                                                                                                <p>Overtraining is another issue. Many beginners think more workouts mean faster results, but this is not true. Overtraining can lead to fatigue and muscle damage. Rest days are essential for recovery.</p>

                                                                                                                <p><em>Ignoring nutrition is also a big mistake. Without proper diet, your workouts will not give the desired results. Balance your diet with the right nutrients.</em></p>

                                                                                                                <p><strong>Lastly, lack of consistency is a major problem. Going to the gym irregularly will not bring results. Stay committed to your routine.</strong></p>

                                                                                                                <p>In conclusion, avoiding these common mistakes can help you achieve your fitness goals faster and more safely.</p>',
                                                                                                                'Gym Tips','6c772b95-7293-4045-a916-89b09c1bd101_5-Master-the-Squat-in-5-Easy-Steps.jpg','Common Gym Mistakes and How to Avoid Them ❌'),

                                                                                                               (TRUE,'2026-04-04 00:25:41.718437',NULL,'07ca14fd-ef02-469e-8cc7-d791ce6364d2','0640931f-f99a-4108-b7b8-02ff7bb96bde',
                                                                                                                '<p>Many people treat fitness as a short-term goal, such as losing weight for an event or gaining muscle quickly. However, true fitness is a lifelong journey that requires consistency and dedication.</p>

                                                                                                                <p>When fitness becomes a lifestyle, it becomes a natural part of your daily routine. You no longer see exercise as a burden but as an essential activity for your well-being.</p>

                                                                                                                <p>A fitness lifestyle includes regular exercise, healthy eating, proper sleep, and stress management. These habits work together to improve overall health and quality of life.</p>

                                                                                                                <p>One of the biggest advantages of adopting a fitness lifestyle is long-term health benefits. It reduces the risk of chronic diseases such as diabetes, heart disease, and obesity.</p>

                                                                                                                <p><em>It also improves mental strength and discipline. People who follow a fitness lifestyle tend to be more focused, confident, and productive.</em></p>

                                                                                                                <p>In conclusion, fitness should not be a temporary goal but a permanent lifestyle choice. <strong>Start small, stay consistent, and make</strong> it a part of your everyday life.</p>',
                                                                                                                'Lifestyle','627001aa-1180-4027-a462-d42e03a68573_istockphoto-1342504639-612x612.jpg','Why Fitness is a Lifestyle, Not a Temporary Goal 🌿');




INSERT INTO BLOG_IMAGE (BLOG_ID, ID, IMAGE_URL) VALUES
                                                    ('376f2180-fecf-43b5-91c9-6d2f23b381aa','6c4e2b21-2ae8-4cdb-9ea4-3fe411e0dd76','1f67e485-d2b5-4bf3-9469-704375948d8d_19-bodyweight-squat.avif'),
                                                    ('376f2180-fecf-43b5-91c9-6d2f23b381aa','684c3efc-e034-4e12-9490-e0b99becb1d2','f854a578-2489-4377-8ec7-82cbf8711927_how-to-get-better-at-push-ups_c96cd61d-63d8-4bd0-a93e-e3a8dee52408.webp'),
                                                    ('376f2180-fecf-43b5-91c9-6d2f23b381aa','c1d85107-7511-449e-b60e-c4e7e6609eab','b778e27a-5cdb-4b41-a8f3-9ca00d506cbb_young-man-workout-fitness-club-260nw-2471712867.webp'),

                                                    ('ebf4f3dd-e589-40ad-9f30-b143db5e111d','0f91e58d-42c3-47d0-b874-d7c141e28e4b','863a989a-6fea-43da-94a7-e64b49c0e44d_Tricep-pushdown-movement_ddb8dbd8-566d-4f55-99e0-36c35790234a_1224x.webp'),
                                                    ('ebf4f3dd-e589-40ad-9f30-b143db5e111d','a69a2630-78b5-4cb3-8b0c-7b4c6c0ef27e','416743ef-7b8a-431c-b2cc-f6cd3a202a00_2-muscles-worked.webp'),
                                                    ('ebf4f3dd-e589-40ad-9f30-b143db5e111d','100fd6b6-31a2-4799-9a8d-ee65629586f4','35f8c41e-f89d-40ea-a792-2a1d834e6463_Lat-pulldown-on-Mirafit-Lat-Pulldown-Machine.webp'),

                                                    ('6c0d2e10-d02a-4452-bbf8-e2ef456ff9f7','18448993-3a30-47f8-b9a2-46f91a398168','d97373d1-9397-4ecb-acea-79826f9270fb_9BP4SsAx7aSmc6gE5FFiGC.jpg'),
                                                    ('6c0d2e10-d02a-4452-bbf8-e2ef456ff9f7','1c34ac38-12c6-47d9-abe5-72fd478660cc','66e8f3c9-3964-4c5b-907f-08b1bbf8b8d5_Ryan-Push-Up.png'),
                                                    ('6c0d2e10-d02a-4452-bbf8-e2ef456ff9f7','bbaad1e3-6a04-4c18-845e-8ef15006bd5a','2ecdb950-6e9d-4291-ae04-0f428969e6b1_how-to-get-better-at-push-ups_c96cd61d-63d8-4bd0-a93e-e3a8dee52408.webp'),

                                                    ('238fe46b-bf8d-463d-8223-4c2abf48ac96','de76df87-2e68-4135-9060-80218441c695','cf2fa814-d10d-493b-aa03-5ec5cd0796e9_GzLeM2yKQGigqMF7Mtu8vh.jpg'),
                                                    ('238fe46b-bf8d-463d-8223-4c2abf48ac96','b6ca1ef7-0584-4fdb-8c1f-ffcb1f5d952e','d5e95d09-6ee1-4289-9c33-3eaf89acdc1a_u732pcXisraDgMESrUvnNk.jpg'),
                                                    ('238fe46b-bf8d-463d-8223-4c2abf48ac96','724cc28b-e1f7-44aa-9307-744afcabe58a','8ff60ecc-a3b5-4197-8a18-03e75dc1d000_mountain-climbers.png'),

                                                    ('87cd9cff-ca30-4c74-b280-0f042bc1e9fd','d79b0c4e-14a2-49b2-aabc-12a0f2ca07b0','2ebefd94-f2bb-4ef3-bd48-cec0631f070d_bicycle-crunch.jpg'),
                                                    ('87cd9cff-ca30-4c74-b280-0f042bc1e9fd','3e06bdcc-d486-4dbe-a40c-cdb0b62c31be','8d4e7292-f334-452d-87c5-361800b71704_Bicycle_Exercise.webp'),
                                                    ('87cd9cff-ca30-4c74-b280-0f042bc1e9fd','8afb7ec6-7295-4195-90d0-e62e421545a6','147b5dde-dc04-4730-acb6-36b07f178b6e_u732pcXisraDgMESrUvnNk.jpg'),

                                                    ('af52a554-0164-4afc-8498-86655ab700a9','bd400764-9b73-4660-8d7c-57b15afa9758','e82b1ab4-14d3-4a2f-8f63-dafdaafd86ed_mountain-climbers.png'),
                                                    ('af52a554-0164-4afc-8498-86655ab700a9','4f297e6e-8c74-4884-9628-b0a5cef3565a','b5530a37-c88d-4150-a73a-3cdd1f9df783_Push-Up-Exercises-1.jpg'),
                                                    ('af52a554-0164-4afc-8498-86655ab700a9','4d86822d-2278-4f03-a4a4-140bdf1e023d','712a9ff9-69f3-4a83-82c8-b7476baeb036_how-to-do-a-push-up-plank-build-core-chest-and-triceps.jpeg'),

                                                    ('7fb9bbe9-0272-4d03-9451-284ae859a326','18139d1c-e353-4aca-90ea-8aaf8e2ee809','d92cfe49-5282-4e55-be33-865bd23d82bf_Fit-man-doing-high-knees-cardio-exercise-548x428.jpg'),
                                                    ('7fb9bbe9-0272-4d03-9451-284ae859a326','b420aa55-5ac8-41aa-aa5d-37399a689e9f','742b69c3-3bdc-4061-aa6c-f27274405791_high-knees-exercise-1296x728-header.webp'),
                                                    ('7fb9bbe9-0272-4d03-9451-284ae859a326','cfa3db1c-6fc9-4723-bfcf-8c8bb666d2d5','2e657a62-0654-426d-b3cd-239a2864475b_Xw8VaDaXRAstbCW84vib6g.jpg'),

                                                    ('2c552201-1510-4b3e-868d-152a341b7ecc','44d81917-06cf-49b6-9f7f-79562790c230','d135184b-a24f-42fd-b4ae-0ecdd3df8dd9_cheerful-athletic-black-man-doing-forward-lunge-exercising-near-laptop-watching-online-workout-tutorial-home-guy-training-428627411.webp'),
                                                    ('2c552201-1510-4b3e-868d-152a341b7ecc','cdaeebad-fb00-4953-ae53-38c453f16229','28f238d4-7b84-46fe-8ba4-7309f27bfff5_66e8991460790ade1fac6d2a_maxresdefault (1).jpg'),
                                                    ('2c552201-1510-4b3e-868d-152a341b7ecc','6eeaed2f-e4b1-400e-b08e-a9c3c6c0fe8a','81880910-4d5d-4a58-8cd8-6bcd4e4a954f_19-bodyweight-squat.avif'),

                                                    ('0640931f-f99a-4108-b7b8-02ff7bb96bde','3e4eb630-71be-47db-9fbe-fe0a948785e6','72f02d73-9cd1-49c8-a663-d08814a957fc_ds1.webp'),
                                                    ('0640931f-f99a-4108-b7b8-02ff7bb96bde','c0c0c89c-109a-471c-9d49-fedc7fbe4a72','0fafec9c-4b89-42db-b904-9433860b06ab_b1.webp'),
                                                    ('0640931f-f99a-4108-b7b8-02ff7bb96bde','f5f2dad1-0e2f-44fb-8870-e46d12627bf8','54abaad0-7fff-4733-81bd-37038c4f5ce2_hq720.jpg');


-- gallery
INSERT INTO GALLERY_IMAGE (CREATED_AT, ID, CATEGORY, DESCRIPTION, IMAGE_URL, TITLE) VALUES
                                                                                        ('2026-04-04 00:10:27.530656', '24e259e1-cc23-4f77-bd6c-9f6a52612139', 'Fitness', 'Our members pushing limits with intense strength training workouts to build muscle and endurance.', 'beca9894-35ea-483f-a15c-34e8b47284b7_ds2.webp', 'Strength Training Session'),

                                                                                        ('2026-04-04 00:10:27.70764', 'a0efead0-23f3-4e47-8fff-d0d06b602533', 'Fitness', 'Our members pushing limits with intense strength training workouts to build muscle and endurance.', '0e84abf1-6f56-46d3-8d5c-f0b542543da8_ds1.webp', 'Strength Training Session'),

                                                                                        ('2026-04-04 00:10:27.713625', '24f43daf-5acc-4424-b0e9-116a2aafa26b', 'Fitness', 'Our members pushing limits with intense strength training workouts to build muscle and endurance.', 'bcbc9639-0b93-4cad-b2c7-ce607c29a5a2_b1.webp', 'Strength Training Session'),

                                                                                        ('2026-04-04 00:10:27.720629', '431ea999-8006-4270-b6ee-4dd2bfb81527', 'Fitness', 'Our members pushing limits with intense strength training workouts to build muscle and endurance.', '31649a43-b68b-4346-a32b-e7a212f82272_hq720.jpg', 'Strength Training Session'),

                                                                                        ('2026-04-04 00:10:27.725654', '1ce3223c-9b93-4064-94c3-89fed4da31d5', 'Fitness', 'Our members pushing limits with intense strength training workouts to build muscle and endurance.', '57c279d8-e5c4-49fa-914a-7e5c8dbe8deb_A_man_doing_seated_cable_row.webp', 'Strength Training Session'),

                                                                                        ('2026-04-04 00:10:27.731632', '6806fb97-d1c0-4bf9-80ce-0222fb6a5688', 'Fitness', 'Our members pushing limits with intense strength training workouts to build muscle and endurance.', '65d2179b-479f-4267-8f88-b42690c5969e_istockphoto-1342504639-612x612.jpg', 'Strength Training Session'),

                                                                                        ('2026-04-04 00:11:14.639635', 'ab55ad55-77f5-4133-bd7b-212d4cc37144', 'Nutrition', 'High-energy cardio sessions designed to improve stamina, burn calories, and boost heart health.', '980b22e7-3d6e-4f25-8e99-73579c786fd2_black-guy-doing-forward-lunge-exercise-laptop-home-sporty-black-guy-doing-forward-lunge-exercise-training-front-laptop-219000134.webp', 'Cardio Blast 🔥'),

                                                                                        ('2026-04-04 00:11:14.654095', '1df9c550-6809-4fa0-a33f-3a1cac62efef', 'Nutrition', 'High-energy cardio sessions designed to improve stamina, burn calories, and boost heart health.', 'bef3fc3e-2e36-4c9c-a8ab-30a8f555ab98_cheerful-athletic-black-man-doing-forward-lunge-exercising-near-laptop-watching-online-workout-tutorial-home-guy-training-428627411.webp', 'Cardio Blast 🔥'),

                                                                                        ('2026-04-04 00:11:14.665623', 'c6ed8785-837b-4605-bccd-aa9bb9fa4caa', 'Nutrition', 'High-energy cardio sessions designed to improve stamina, burn calories, and boost heart health.', '7fd4c0f1-ea62-43d5-8c37-9079fa3ce24f_how-to-do-a-push-up-plank-build-core-chest-and-triceps.jpeg', 'Cardio Blast 🔥'),

                                                                                        ('2026-04-04 00:11:14.677083', '7177d0f3-c9b6-46fc-8a67-c5253e5a5bb3', 'Nutrition', 'High-energy cardio sessions designed to improve stamina, burn calories, and boost heart health.', 'da1bf3d3-3545-4e25-93b8-ff83d31c1d3a_19-bodyweight-squat.avif', 'Cardio Blast 🔥'),

                                                                                        ('2026-04-04 00:11:14.692106', '1e5832b2-3fb2-486d-ba04-9b13de59b972', 'Nutrition', 'High-energy cardio sessions designed to improve stamina, burn calories, and boost heart health.', 'f636c810-8a7a-4510-86b6-82ee62b56bb5_how-to-get-better-at-push-ups_c96cd61d-63d8-4bd0-a93e-e3a8dee52408.webp', 'Cardio Blast 🔥'),

                                                                                        ('2026-04-04 00:11:14.705148', '8550a713-31d3-46d9-b871-b7f61e0d50b9', 'Nutrition', 'High-energy cardio sessions designed to improve stamina, burn calories, and boost heart health.', '191fc820-a85f-41c5-b488-ca919e272a6e_young-man-workout-fitness-club-260nw-2471712867.webp', 'Cardio Blast 🔥');



INSERT INTO GALLERY_VIDEO (CREATED_AT, ID, CATEGORY, DESCRIPTION, TITLE, VIDEO_URL) VALUES
                                                                                        ('2026-04-04 00:12:13.494898', '0ac57d9b-6129-4ab9-a885-9e997fb33a0a', 'Fitness', 'Our members pushing limits with intense strength training workouts to build muscle and endurance.', 'Strength Training Session', 'https://youtu.be/Epit6DSq_ww?si=xpNvDQU9pXfD-aaT'),

                                                                                        ('2026-04-04 00:12:49.490571', 'd036ab91-6dbb-4d8f-a2cb-838f839fbbbf', 'Fitness', 'Capturing powerful workout moments from our daily gym activities and member routines.', 'Gym Workout Moments', 'https://youtu.be/f9TERHtc1LA?si=aqxJYE-74YfwusbL'),

                                                                                        ('2026-04-04 00:13:17.978901', '2fe5e54a-a6a4-4813-8f4c-7f8b51809dd5', 'Nutrition', 'Motivating group workouts where members train together and achieve fitness goals as a team.', 'Group Training Session 👥', 'https://youtu.be/mtX-B5gbgmM?si=IINkIFHq9O7HlQsp'),

                                                                                        ('2026-04-04 00:13:43.65698', '759983ba-ad37-4131-ba74-68b7a294264e', 'Fitness', 'Expert trainers helping members maintain proper form and maximize results.', 'Trainer Guidance 🎯', 'https://youtu.be/5ourM6YUQPU?si=PAXRTWq87AjftAIn'),

                                                                                        ('2026-04-04 00:14:20.186851', 'bb938bd0-4822-4e52-b858-8ec707300d61', 'Nutrition', 'Live action clips of workouts, exercises, and fitness routines inside our gym.', 'Workout in Action 🎥', 'https://youtu.be/JyV7mUFSpXs?si=P2O_6jEdA2RkWGNO');