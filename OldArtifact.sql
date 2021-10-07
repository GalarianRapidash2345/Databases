/* This is the old artifact */
/* Create adequate documentation starting here */



/* Make new database for Arkham Horror: The Board Game Third Edition, make timeouts */

USE messaging; 



INSERT INTO person(person_id,first_name,last_name) 
    VALUES (20, "Clara", "Kellermann-Bryant");
    
    
    
   /* Make new tables for the new database */
   
ALTER TABLE person ADD hair_color VARCHAR(25) NOT NULL;  /* Properly define variables to be clear*/




UPDATE person
  SET hair_color = 5
  WHERE person_id = 2
  LIMIT 5;
  
  
  
  

DELETE FROM person   /* Use prepared statements for preventing SQL injections */
    WHERE 
    first_name = "Diana"
    AND
    last_name = "Taurasi"
   
   
   
CREATE TABLE image (
    image_id INT(8) UNISIGNED NOT NULL auto_increment,  /* Eliminate redundant variables */
    image_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (image_id)
) AUTO_INCREMENT = 1;



CREATE TABLE message_image (     /* Create properly nested logic constructs */ 
    image_id INT(8) NOT NULL,
    message_id INT(8) NOT NULL,
    PRIMARY KEY (image_id, message_id)
) AUTO_INCREMENT = 1;



CREATE TABLE hello (
hello_id INT(8) NOT NULL auto_increment,
hello_name VARCHAR(62) NOT NULL,
PRIMARY KEY (hello_id)
) AUTO_INCREMENT = 1;



/*This is used as a demonstration of functionality */

CREATE TABLE horror (
horror_id INT(8) NOT NULL auto_increment,
horror_name VARCHAR(62) NOT NULL,
PRIMARY KEY (hello_id)
) AUTO_INCREMENT = 1;
