INSERT INTO `afs`.`roles` (`role_id`, `role_name`)
VALUES
    (1, 'Admin'),
    (2, 'Artist'),
    (3, 'Customer'),
    (4, 'NGO');

-- Insert data into afs.questions table
INSERT INTO `afs`.`questions` (`que_id`, `que_text`)
VALUES
    (11, 'What is your favorite color?'),
    (12, 'What is your pet\'s name?'),
    (13, 'What is your mother\'s maiden name?');

-- Insert data into afs.users table
INSERT INTO afs.users (user_id, user_name, password, email, role_id, que_id, answer, approve)
VALUES
    (1001, 'admin', 'admin123', 'admin@example.com', 1, 11, 'Blue', 1),
    (1002, 'artist1', 'artist123', 'artist1@example.com', 2, 12, 'Fluffy', 1),
    (1003, 'customer1', 'customer123', 'customer1@example.com', 3, 13, 'Smith', 1),
    (1004, 'ngo1', 'ngo123', 'ngo1@example.com', 4, 11, 'Blue', 1),
    (1005, 'artist2', 'artist456', 'artist2@example.com', 2, 12, 'Buddy', 1),
    (1006, 'ngo2', 'ngo789', 'ngo2@example.com', 4, 11, 'Green', 1),
    (1007, 'customer2', 'customer456', 'customer2@example.com', 3, 13, 'Johnson', 1),
    (1008, 'admin2', 'admin456', 'admin2@example.com', 1, 11, 'Red', 1),
    (1009, 'Alice', 'customer123', 'alice@example.com', 3, 13, 'Brown', 1),
    (1010, 'Bob', 'customer456', 'bob@example.com', 3, 11, 'Yellow', 1),
    (1011, 'Eva', 'customer456', 'eva@example.com', 3, 12, 'Whiskers', 1),
    (1012, 'JohnDoe', 'admin123', 'john.doe@example.com', 1, 13, 'Garcia', 1),
    (1013, 'EmilyJ', 'admin456', 'emily.johnson@example.com', 1, 11, 'Purple', 1),
    (1014, 'JaneSmith', 'artist123', 'jane.smith@example.com', 2, 12, 'Milo', 1),
    (1015, 'WilliamB', 'artist456', 'william.brown@example.com', 2, 13, 'Davis', 1),
    (1016, 'MichaelJ', 'artist456', 'michael.johnson@example.com', 2, 11, 'Orange', 1);

-- Insert data into afs.admin table
INSERT INTO afs.admins (admin_id, user_id, fname, lname)
VALUES
    (901, 1001, 'John', 'Doe'),
    (902, 1008, 'Emily', 'Johnson'),
    (903, 1012, 'John', 'Doe'), 
    (904, 1013, 'Emily', 'Johnson');

-- Insert data into afs.state table
INSERT INTO afs.states (state_id, state_name)
VALUES
    (41, 'Delhi'),
    (42, 'Maharashtra'),
    (43, 'Karnataka'),
    (44, 'Tamil Nadu'),
    (45, 'Uttar Pradesh');

-- Insert data into afs.city table
INSERT INTO afs.cities (city_id, city_name, state_id)
VALUES
    (101, 'New Delhi', 41),
    (102, 'Mumbai', 42),
    (103, 'Bangalore', 43),
    (104, 'Chennai', 44),
    (105, 'Lucknow', 45);

-- Insert data into afs.area table
INSERT INTO afs.areas (area_id, area_name, city_id)
VALUES
    (141, 'Connaught Place', 101),
    (142, 'Dadar', 102),
    (143, 'Koramangala', 103),
    (144, 'T. Nagar', 104),
    (145, 'Hazratganj', 105);

-- Insert data into afs.artists table
INSERT INTO afs.artists (artist_id, user_id, fname, lname, area_id, contact)
VALUES
    (2001, 1002, 'Jane', 'Smith', 141, '555-1234'),
    (2002, 1005, 'Artist', 'Two', 142, '555-5555'), 
    (2003, 1014, 'Jane', 'Smith', 141, '555-1235'), 
    (2004, 1015, 'William', 'Brown', 142, '555-5678'),
    (2005, 1016, 'Michael', 'Johnson', 141, '555-7890');

-- Insert data into afs.customers table
INSERT INTO afs.customers (cust_id, user_id, fname, lname, area_id, contact)
VALUES
    (3001, 1003, 'Customer', 'One', 142, '555-4444'), 
    (3002, 1007, 'Customer', 'Two', 141, '555-5555'), 
    (3003, 1009, 'Alice', 'Johnson', 141, '555-1111'),
    (3004, 1010, 'Bob', 'Williams', 142, '555-2222'),
    (3005, 1011, 'Eva', 'Martinez', 141, '555-3333');

-- Insert data into afs.ngo table
INSERT INTO afs.ngo (ngo_id, user_id, fname, lname, area_id, address, contact)
VALUES
    (5001, 1004, 'NGO One', 'Organization', 141, '212 gokhlenagar' , '555-9876'),
    (5002, 1006, 'NGO Two', 'Foundation', 142, '280 jagatpura' , '555-5432');

-- Insert data into afs.category table
INSERT INTO `afs`.`categories` (`cat_id`, `cat_name`)
VALUES
    (201, 'Painting'),
    (202, 'Sculpture'),
    (203, 'Photography'),
    (204, 'Drawing'),
    (205, 'Digital Art'),
    (206, 'Mixed Media'),
    (207, 'Printmaking'),
    (208, 'Ceramics'),
    (209, 'Textile Art'),
    (210, 'Illustration');

-- Insert data into afs.art table
INSERT INTO `afs`.`arts` (`art_id`, `artist_id`, `cat_id`, `price`, `ngo_id`, `description`, `art_name`, `image`)
VALUES
    (8001, 2001, 201, 100.00, 5001, 'Beautiful painting of a landscape', 'Landscape Painting', 'landscape.jpg'),
    (8002, 2002, 202, 250.00, 5002, 'Elegant sculpture depicting a figure', 'Elegant Sculpture', 'sculpture.jpg'),
    (8003, 2003, 203, 50.00, 5001, 'Vibrant photograph capturing a moment', 'Vibrant Photography', 'photo.jpg'),
    (8004, 2001, 201, 75.00, 5002, 'Abstract artwork with bold colors', 'Abstract Art', 'abstract.jpg'),
    (8005, 2004, 204, 180.00, 5001, 'Detailed pencil drawing of a portrait', 'Portrait Drawing', 'drawing.jpg'),
    (8006, 2002, 205, 120.00, 5002, 'Digital art with a futuristic theme', 'Futuristic Digital Art', 'digital_art.jpg'),
    (8007, 2003, 206, 300.00, 5001, 'Mixed media piece with various materials', 'Mixed Media Artwork', 'mixed_media.jpg'),
    (8008, 2005, 207, 40.00, 5002, 'Print of a nature scene', 'Nature Print', 'nature_print.jpg'),
    (8009, 2004, 208, 220.00, 5001, 'Ceramic vase with intricate design', 'Intricate Ceramic Vase', 'ceramic_vase.jpg'),
    (8010, 2001, 209, 90.00, 5002, 'Textile art with vibrant patterns', 'Vibrant Textile Art', 'textile_art.jpg'),
    (8011, 2003, 210, 160.00, 5001, 'Illustration of a whimsical fantasy world', 'Fantasy Illustration', 'fantasy_illustration.jpg'),
    (8012, 2004, 201, 200.00, 5002, 'Realistic oil painting of a still life', 'Still Life Painting', 'still_life.jpg'),
    (8013, 2002, 202, 130.00, 5001, 'Bronze sculpture of an animal', 'Animal Sculpture', 'animal_sculpture.jpg'),
    (8014, 2005, 203, 70.00, 5002, 'Black and white photography', 'Black and White Photo', 'bw_photo.jpg'),
    (8015, 2002, 204, 85.00, 5001, 'Charcoal drawing of a cityscape', 'Cityscape Drawing', 'cityscape_drawing.jpg'),
    (8016, 2001, 205, 180.00, 5002, 'Digital artwork with vibrant colors', 'Vibrant Digital Art', 'vibrant_digital.jpg'),
    (8017, 2003, 206, 270.00, 5001, 'Mixed media collage with abstract elements', 'Abstract Mixed Media', 'abstract_collage.jpg'),
    (8018, 2004, 207, 30.00, 5002, 'Print of a seascape', 'Seascape Print', 'seascape_print.jpg'),
    (8019, 2005, 208, 240.00, 5001, 'Handcrafted ceramic bowl', 'Handcrafted Ceramic Bowl', 'ceramic_bowl.jpg'),
    (8020, 2003, 209, 110.00, 5002, 'Textile artwork inspired by nature', 'Nature-Inspired Textile Art', 'nature_textile.jpg');
