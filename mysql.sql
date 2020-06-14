create schema java;             
use java;

CREATE  TABLE AUTHORITIES(
    AUTHORITIESID INTEGER, 
    AUTHORITY VARCHAR(255),
    USERNAME VARCHAR(255)
);            
ALTER TABLE AUTHORITIES ADD CONSTRAINT CONSTRAINT_A PRIMARY KEY(AUTHORITIESID); 
-- 2 +/- SELECT COUNT(*) FROM AUTHORITIES;             
INSERT INTO AUTHORITIES(AUTHORITIESID, AUTHORITY, USERNAME) VALUES
(1, 'ROLE_USER', 'cristy'),
(2, 'ROLE_USER', 'dany');   
          
CREATE TABLE CART(
    CARTID INTEGER,
    GRANDTOTAL DOUBLE NOT NULL,
    CUSTOMERID INTEGER
);         
ALTER TABLE CART ADD CONSTRAINT CONSTRAINT_1 PRIMARY KEY(CARTID);               
-- 2 +/- SELECT COUNT(*) FROM CART;    
INSERT INTO CART(CARTID, GRANDTOTAL, CUSTOMERID) VALUES
(1, 75.0, 1),
(2, 0.0, 2);   
CREATE  TABLE CARTITEM(
    CARTITEMID INTEGER,
    QUANTITY INTEGER NOT NULL,
    TOTALPRICE DOUBLE NOT NULL,
    CARTID INTEGER,
    PRODUCTID INTEGER
);             
ALTER TABLE CARTITEM ADD CONSTRAINT CONSTRAINT_2 PRIMARY KEY(CARTITEMID);       
-- 1 +/- SELECT COUNT(*) FROM CARTITEM;
INSERT INTO CARTITEM(CARTITEMID, QUANTITY, TOTALPRICE, CARTID, PRODUCTID) VALUES
(12, 1, 75.0, 1, 20);
CREATE  TABLE COMMENT(
    COMMENTID INTEGER,
    COMMENT VARCHAR(500) NOT NULL,
    COMMENTTITLE VARCHAR(20) NOT NULL,
    NICKNAME VARCHAR(255),
    RATING DOUBLE NOT NULL,
    TIME TIMESTAMP NOT NULL,
    PRODUCTID INTEGER
);  
ALTER TABLE COMMENT ADD CONSTRAINT CONSTRAINT_6 PRIMARY KEY(COMMENTID);         
-- 0 +/- SELECT COUNT(*) FROM COMMENT; 
CREATE TABLE CREDITCARD(
    CREDITCARDID INTEGER ,
    CARDVERIFICATIONVALUE VARCHAR(255) NOT NULL,
    CREDITCARDNAME VARCHAR(255) NOT NULL,
    CREDITCARDNUMBER VARCHAR(255) NOT NULL,
    EXPIRATIONMONTH VARCHAR(255) NOT NULL,
    EXPIRATIONYEAR VARCHAR(255) NOT NULL,
    CUSTOMERID INTEGER
);             
ALTER TABLE CREDITCARD ADD CONSTRAINT CONSTRAINT_F PRIMARY KEY(CREDITCARDID);   
-- 2 +/- SELECT COUNT(*) FROM CREDITCARD;              
INSERT INTO CREDITCARD(CREDITCARDID, CARDVERIFICATIONVALUE, CREDITCARDNAME, CREDITCARDNUMBER, EXPIRATIONMONTH, EXPIRATIONYEAR, CUSTOMERID) VALUES
(1, '123', 'Cristina', '8392789237498324', '09', '2020', 1),
(2, '123', 'Daniela', '2343242342343242', '09', '2020', 2);           
CREATE  TABLE CUSTOMER(
    CUSTOMERID INTEGER ,
    CUSTOMEREMAIL VARCHAR(255) NOT NULL,
    CUSTOMERNAME VARCHAR(255) NOT NULL,
    CUSTOMERPHONE VARCHAR(255),
    ENABLED BOOLEAN NOT NULL,
    NICKNAME VARCHAR(255),
    PASSWORD VARCHAR(255) NOT NULL,
    USERNAME VARCHAR(255) NOT NULL,
    CARTID INTEGER,
    CREDITCARDID INTEGER,
    SHIPPINGADDRESSID INTEGER
);  
ALTER TABLE CUSTOMER ADD CONSTRAINT CONSTRAINT_5 PRIMARY KEY(CUSTOMERID);       
-- 2 +/- SELECT COUNT(*) FROM CUSTOMER;
INSERT INTO CUSTOMER(CUSTOMERID, CUSTOMEREMAIL, CUSTOMERNAME, CUSTOMERPHONE, ENABLED, NICKNAME, PASSWORD, USERNAME, CARTID, CREDITCARDID, SHIPPINGADDRESSID) VALUES
(1, 'cristy@gmail.com', 'cristina', '304443453453454', TRUE, 'cristy', 'Abcde12345!', 'cristy', 1, 1, 1),
(2, 'dany@gmail.com', 'daniela', '324234324234233', TRUE, 'nanix', 'Abcde12345!', 'dany', 2, 2, 2);    
CREATE  TABLE CUSTOMERORDER(
    CUSTOMERORDERID INTEGER ,
    CARTID INTEGER,
    CREDITCARDID INTEGER,
    CUSTOMERID INTEGER,
    SHIPPINGADDRESSID INTEGER
);        
ALTER TABLE CUSTOMERORDER ADD CONSTRAINT CONSTRAINT_3 PRIMARY KEY(CUSTOMERORDERID);             
-- 4 +/- SELECT COUNT(*) FROM CUSTOMERORDER;           
INSERT INTO CUSTOMERORDER(CUSTOMERORDERID, CARTID, CREDITCARDID, CUSTOMERID, SHIPPINGADDRESSID) VALUES
(1, 1, 1, 1, 1),
(2, 2, 2, 2, 2),
(3, 1, 1, 1, 1),
(4, 1, 1, 1, 1);         
CREATE TABLE PRODUCT(
    PRODUCTID INTEGER ,
    PRODUCTAUTHOR VARCHAR(255),
    PRODUCTAUTHORBIO VARCHAR(255),
    PRODUCTCATEGORY VARCHAR(255),
    PRODUCTCONDITION VARCHAR(255),
    PRODUCTDESCRIPTION VARCHAR(255),
    PRODUCTNAME VARCHAR(255),
    PRODUCTPRICE DOUBLE NOT NULL,
    PRODUCTPUBLISHER VARCHAR(255),
    PRODUCTRELEASEDATE TIMESTAMP,
    PRODUCTSTATUS VARCHAR(255),
    TOPSELLERSTATUS VARCHAR(255),
    UNITINSTOCK INTEGER NOT NULL,
    NUMRATING DOUBLE,
    RATING DOUBLE,
    TOTAL_RATING DOUBLE
);      
ALTER TABLE PRODUCT ADD CONSTRAINT CONSTRAINT_18 PRIMARY KEY(PRODUCTID);        
-- 22 +/- SELECT COUNT(*) FROM PRODUCT;

-- sql_mode=NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION;
SET SESSION SQL_MODE=NO_ZERO_IN_DATE;

INSERT INTO PRODUCT(PRODUCTID, PRODUCTAUTHOR, PRODUCTAUTHORBIO, PRODUCTCATEGORY, PRODUCTCONDITION, PRODUCTDESCRIPTION, PRODUCTNAME, PRODUCTPRICE, PRODUCTPUBLISHER, PRODUCTRELEASEDATE, PRODUCTSTATUS, TOPSELLERSTATUS, UNITINSTOCK, NUMRATING, RATING, TOTAL_RATING) VALUES
(14, 'J. R. R. Tolkien', 'John Ronald Reuel Tolkien, CBE FRSL was an English writer, poet, philologist, and university professor who is best known as the author of the classic high fantasy works The Hobbit, The Lord of the Rings, and The Silmarillion.', 'Fantasy, Adventure', 'new', 'This is a fantasy book', 'The Lord of the Rings', 22.2, 'Allen & Unwin',  '1954-07-29 00:00:00+0000', 'active', 'active', 6, 0.0, 0.0, 0.0);
INSERT INTO PRODUCT(PRODUCTID, PRODUCTAUTHOR, PRODUCTAUTHORBIO, PRODUCTCATEGORY, PRODUCTCONDITION, PRODUCTDESCRIPTION, PRODUCTNAME, PRODUCTPRICE, PRODUCTPUBLISHER, PRODUCTRELEASEDATE, PRODUCTSTATUS, TOPSELLERSTATUS, UNITINSTOCK, NUMRATING, RATING, TOTAL_RATING) VALUES

(15, 'Isaac Asimov', 'Isaac Asimov was an American writer and professor of biochemistry at Boston University. He was known for his works of science fiction and popular science.', 'Science fiction', 'new', 'This is a science fiction', 'I, Robot', 50.0, 'Gnome Press', TIMESTAMP '1950-12-02 00:00:00', 'active', 'inactive', 5, 0.0, 0.0, 0.0),
(17, 'Douglas Adams', 'Douglas Noel Adams was an English author, scriptwriter, essayist, humorist, satirist and dramatist. Adams was author of The Hitchhiker''s Guide to the Galaxy, which originated in 1978 as a BBC radio', 'Comic science fiction', 'new', 'This is a comedy science fiction', 'The Ultimate Hitchhiker''s Guide to the Galaxy', 14.0, 'Pan Books', TIMESTAMP '1979-10-12 00:00:00', 'active', 'inactive', 6, 0.0, 0.0, 0.0),
(18, 'William Gibson', 'William Ford Gibson is an American-Canadian speculative fiction writer and essayist widely credited with pioneering the science fiction subgenre known as cyberpunk.', 'Science fiction, cyberpunk', 'new', 'this is a science fiction', 'Neuromancer', 18.2, 'Ace', TIMESTAMP '1984-07-01 00:00:00', 'active', 'inactive', 15, 0.0, 0.0, 0.0),
(19, 'Scarlett Thomas', 'Scarlett Thomas is an English author and creative writing teacher. She has written nine novels, including The End of Mr. Y and PopCo, and the Worldquake series of children''s books.', 'Novel', 'new', 'This a curse book', 'The End of Mr. Y', 16.0, 'Harcourt Books', TIMESTAMP '2006-04-05 00:00:00', 'active', 'inactive', 14, 0.0, 0.0, 0.0),
(21, 'Holly Smale', 'Holly Smale is a British writer. Her first published book, Geek Girl, won the 2014 Waterstones Children''s Book Prize and was shortlisted for the Roald Dahl Funny Prize 2013. Smale is writing a 6-book teen fiction series, also called Geek Girl.', 'Young adult fiction, Fiction', 'new', 'This is a debut novel', 'Geek Girl', 50.0, 'HarperCollins', TIMESTAMP '2013-02-28 00:00:00', 'active', 'active', 40, 0.0, 0.0, 0.0),
(22, 'Stephenie Meyer', 'Stephenie Meyer is an American novelist and film producer, best known for her vampire romance series Twilight. The Twilight novels have gained worldwide recognition and sold over 100 million copies, with translations into 37 different languages', 'Young adult, Fantasy, Romance', 'new', 'this is a romance book', 'Eclipse', 15.0, 'Little, Brown', TIMESTAMP '2007-08-07 00:00:00', 'active', 'inactive', 4, 0.0, 0.0, 0.0),
(1, 'J.K Rowling', 'Joanne Rowling, CH, OBE, FRSL, FRCPE, writing under the pen names J. K. Rowling and Robert Galbraith, is a British novelist, philanthropist, film and television producer and screenwriter best known for writing the Harry Potter fantasy series.', 'Fantasy, Drama, Young Adult fiction, mystery, Thriller', 'new', 'Thi is a magical book', 'Harry Potter and The Sorcerer''s Stone', 50.0, 'Bloomsbury Publishing (UK), Scholastic (US)', TIMESTAMP '1997-06-26 00:00:00', 'active', 'active', 15, 0.0, 0.0, 0.0),
(2, 'Stephenie Meyer', 'Stephenie Meyer is an American novelist and film producer, best known for her vampire romance series Twilight. The Twilight novels have gained worldwide recognition and sold over 100 million copies, with translations into 37 different languages.', 'Young adult, fanatasy, romance, vampire', 'new', 'This is a romance book', 'Twilight', 25.5, 'Little, Brown, and Company', TIMESTAMP '2005-10-05 00:00:00', 'active', 'active', 60, 0.0, 0.0, 0.0),
(3, 'C.S. Lewis', 'Clive Staples Lewis was a British novelist, poet, academic, medievalist, literary critic, essayist, lay theologian, broadcaster, lecturer, and Christian apologist. He held academic positions at both Oxford University and Cambridge University.', 'Fantasy Children''s literature', 'new', 'This is a fantasy book', 'Narnia', 15.4, 'HaperCollins', TIMESTAMP '1950-10-16 00:00:00', 'active', 'inactive', 50, 0.0, 0.0, 0.0);          
INSERT INTO PRODUCT(PRODUCTID, PRODUCTAUTHOR, PRODUCTAUTHORBIO, PRODUCTCATEGORY, PRODUCTCONDITION, PRODUCTDESCRIPTION, PRODUCTNAME, PRODUCTPRICE, PRODUCTPUBLISHER, PRODUCTRELEASEDATE, PRODUCTSTATUS, TOPSELLERSTATUS, UNITINSTOCK, NUMRATING, RATING, TOTAL_RATING) VALUES
(4, 'Stephen King', 'Stephen Edwin King is an American author of horror, supernatural fiction, suspense, science fiction and fantasy', 'Horror, Thriller', 'new', 'This is a scary book', 'IT', 20.0, 'Viking', TIMESTAMP '1986-09-15 00:00:00', 'active', 'inactive', 18, 0.0, 0.0, 0.0),
(5, 'Suzanne Collins', 'Suzanne Collins is an American television writer and author, best known as the author of The New York Times best selling series The Underland Chronicles and The Hunger Games trilogy.', 'Dystopian, adventure, science fiction, drama, action', 'new', 'This is a fictional book', 'The Hunger Games', 23.0, 'Scholastic', TIMESTAMP '2008-09-14 00:00:00', 'active', 'active', 40, 0.0, 0.0, 0.0),
(6, 'John Green', 'John Michael Green is an American author, vlogger, writer, producer, actor, editor, and educator. He won the 2006 Printz Award for his debut novel, Looking for Alaska, and his sixth novel, The Fault in ...', 'Young adult novel Realistic Fiction, Drama, romance', 'new', 'This is a Romance book', 'The Fault in Our Stars', 20.0, 'Dutton Books', TIMESTAMP '2012-01-10 00:00:00', 'active', 'inactive', 65, 0.0, 0.0, 0.0),
(8, 'Veronica Roth', 'Veronica Anne Roth is an American novelist and short story writer, known for her debut New York Times bestselling Divergent trilogy, consisting of Divergent, Insurgent, and Allegiant; and Four: A Divergent Collection.', 'Science fiction, dystopia, young adult fiction', 'new', 'This is an adult fiction', 'Divergent', 25.0, 'Katherine Tegen Books', TIMESTAMP '2011-04-26 00:00:00', 'active', 'active', 45, 0.0, 0.0, 0.0),
(10, 'Mary Shelley', 'Mary Wollstonecraft Shelley was an English novelist, short story writer, dramatist, essayist, biographer, and travel writer, best known for her Gothic novel Frankenstein: or, The Modern Prometheus', 'Gothic novel, horror fiction, soft science fiction', 'new', 'this is a horror story', 'Frankenstein', 24.0, 'Lackington, hughes, Harding, Mavor & Jones', TIMESTAMP '1818-01-01 00:00:00', 'active', 'inactive', 50, 0.0, 0.0, 0.0),
(20, 'Stephen Hawking', 'Stephen William Hawking CH CBE FRS FRSA was an English theoretical physicist, cosmologist, and author, who was director of research at the Centre for Theoretical Cosmology at the University of Cambridge at the time of his death.', 'Cosmology', 'new', 'This is a study of the universe', 'A Brief History of Time', 75.0, 'Bantam Dell Publishing Group', TIMESTAMP '1988-06-18 00:00:00', 'active', 'inactive', 80, 0.0, 0.0, 0.0),
(16, 'Neal Stephenson', 'Neal Town Stephenson is an American writer and game designer known for his works of speculative fiction. His novels have been categorized as science fiction, historical fiction, cyberpunk, postcyberpunk, and baroque.', 'Science fiction, Cyberpunk, Postcyberpunk', 'new', 'This is a science fiction novel', 'Snow Crash', 11.2, 'Bantam Books (USA)', TIMESTAMP '1992-06-24 00:00:00', 'active', 'inactive', 60, 0.0, 0.0, 0.0),
(11, 'Ernest Cline', 'Ernest Christy Cline is an American novelist, slam poet, and screenwriter. He is known for his novels Ready Player One and Armada; he also co-wrote the screenplay for the film adaptation of Ready Player One, directed by Steven Spielberg.', 'LitRPG, Science Fiction, Dystopian', 'new', 'This is a futuristic book', 'Ready Player One', 25.0, 'Random House', TIMESTAMP '2011-08-16 00:00:00', 'active', 'active', 40, 0.0, 0.0, 0.0),
(7, 'Arthur Golden', 'Arthur Sulzberger Golden is an American writer. He is the author of the bestselling novel Memoirs of a Geisha.', 'Historical novel', 'new', 'This is a life story', 'Memoirs of a Geisha', 22.0, 'Alfred A. Knopf', TIMESTAMP '1997-09-27 00:00:00', 'active', 'inactive', 5, 0.0, 0.0, 0.0);
INSERT INTO PRODUCT(PRODUCTID, PRODUCTAUTHOR, PRODUCTAUTHORBIO, PRODUCTCATEGORY, PRODUCTCONDITION, PRODUCTDESCRIPTION, PRODUCTNAME, PRODUCTPRICE, PRODUCTPUBLISHER, PRODUCTRELEASEDATE, PRODUCTSTATUS, TOPSELLERSTATUS, UNITINSTOCK, NUMRATING, RATING, TOTAL_RATING) VALUES
(9, 'Antoine de Saint-Exupery', 'Antoine Marie Jean-Baptiste Roger, comte de Saint-Exup\u00e9ry was a French writer, poet, aristocrat, journalist, and pioneering aviator. He became a laureate of several of France''s highest literary awards and also won the U.S. National Book Award.', 'Kid''s literature', 'new', 'This is a kid''s book', 'The Little Prince', 15.0, 'Reynal & Hitchcock', TIMESTAMP '1943-04-20 00:00:00', 'active', 'inactive', 40, 0.0, 0.0, 0.0);              
INSERT INTO PRODUCT(PRODUCTID, PRODUCTAUTHOR, PRODUCTAUTHORBIO, PRODUCTCATEGORY, PRODUCTCONDITION, PRODUCTDESCRIPTION, PRODUCTNAME, PRODUCTPRICE, PRODUCTPUBLISHER, PRODUCTRELEASEDATE, PRODUCTSTATUS, TOPSELLERSTATUS, UNITINSTOCK, NUMRATING, RATING, TOTAL_RATING) VALUES
(12, 'Steve McConnell', 'Steven C. McConnell is an author of software engineering textbooks such as Code Complete, Rapid Development, and Software Estimation. He is cited as an expert in software engineering and project management.', 'Computer programming', 'new', 'This is A Practical Handbook of Software Construction', 'Code Complete', 100.0, '', TIMESTAMP '1993-08-12 00:00:00', 'active', 'inactive', 70, 0.0, 0.0, 0.0),
(13, 'Alan Moore', 'Alan Moore is an English writer known primarily for his work in comic books including Watchmen, V for Vendetta, The Ballad of Halo Jones and From Hell.', 'Comic, Superheroes, Futuristic', 'new', 'This is a comic', 'Watchmen', 15.2, 'DC Comics', TIMESTAMP '1986-09-15 00:00:00', 'active', 'inactive', 8, 1.0, 2.0, 2.0);             
CREATE  TABLE RATING(
    RATINGID INTEGER,
    RATING INTEGER NOT NULL,
    TIME TIMESTAMP,
    CUSTOMERID INTEGER,
    PRODUCTID INTEGER
);           
ALTER TABLE RATING ADD CONSTRAINT CONSTRAINT_8 PRIMARY KEY(RATINGID);           
-- 0 +/- SELECT COUNT(*) FROM RATING;  
CREATE  TABLE SHIPPINGADDRESS(
    SHIPPINGADDRESSID INTEGER ,
    APARTMENTNUMBER VARCHAR(255),
    CITY VARCHAR(255),
    COUNTRY VARCHAR(255),
    STATE VARCHAR(255),
    STREETNAME VARCHAR(255),
    ZIPCODE VARCHAR(255),
    CUSTOMERID INTEGER
);            
ALTER TABLE SHIPPINGADDRESS ADD CONSTRAINT CONSTRAINT_26 PRIMARY KEY(SHIPPINGADDRESSID);        
-- 2 +/- SELECT COUNT(*) FROM SHIPPINGADDRESS;         
INSERT INTO SHIPPINGADDRESS(SHIPPINGADDRESSID, APARTMENTNUMBER, CITY, COUNTRY, STATE, STREETNAME, ZIPCODE, CUSTOMERID) VALUES
(1, '', 'Miami', 'USA', 'Florida', '667 nw 48 st', '33178', 1),
(2, '233', 'Miami', 'USA', 'Florida', '23 nw 89 st', '32323', 2);      
CREATE  TABLE USERS(
    USERID INTEGER ,
    CUSTOMERID INTEGER NOT NULL,
    ENABLED BOOLEAN NOT NULL,
    PASSWORD VARCHAR(255),
    USERNAME VARCHAR(255)
);         
ALTER TABLE USERS ADD CONSTRAINT CONSTRAINT_4 PRIMARY KEY(USERID);              
-- 2 +/- SELECT COUNT(*) FROM USERS;   
INSERT INTO USERS(USERID, CUSTOMERID, ENABLED, PASSWORD, USERNAME) VALUES
(1, 1, TRUE, 'Abcde12345!', 'cristy'),
(2, 2, TRUE, 'Abcde12345!', 'dany');
CREATE  TABLE SAVEDITEMS(
    SAVEDITEMSID INTEGER,
    CARTID INTEGER,
    PRODUCTID INTEGER
);          
ALTER TABLE SAVEDITEMS ADD CONSTRAINT CONSTRAINT_7 PRIMARY KEY(SAVEDITEMSID);   
-- 1 +/- SELECT COUNT(*) FROM SAVEDITEMS;              
INSERT INTO SAVEDITEMS(SAVEDITEMSID, CARTID, PRODUCTID) VALUES
(5, 1, 9);             
ALTER TABLE CARTITEM ADD CONSTRAINT FK4393E73EBF266E FOREIGN KEY(CARTID) REFERENCES CART(CARTID) ;
ALTER TABLE CARTITEM ADD CONSTRAINT FK4393E7396F47F46 FOREIGN KEY(PRODUCTID) REFERENCES PRODUCT(PRODUCTID)  ;      
ALTER TABLE CART ADD CONSTRAINT FK1FEF40E0D536EA FOREIGN KEY(CUSTOMERID) REFERENCES CUSTOMER(CUSTOMERID)  ;        
ALTER TABLE CUSTOMERORDER ADD CONSTRAINT FKAEF781F0DCADD6E0 FOREIGN KEY(CREDITCARDID) REFERENCES CREDITCARD(CREDITCARDID)  ;       
ALTER TABLE CUSTOMERORDER ADD CONSTRAINT FKAEF781F029925394 FOREIGN KEY(SHIPPINGADDRESSID) REFERENCES SHIPPINGADDRESS(SHIPPINGADDRESSID)  ;        
ALTER TABLE SAVEDITEMS ADD CONSTRAINT FKD13D6199EBF266E FOREIGN KEY(CARTID) REFERENCES CART(CARTID)  ;             
ALTER TABLE COMMENT ADD CONSTRAINT FK9BDE863F96F47F46 FOREIGN KEY(PRODUCTID) REFERENCES PRODUCT(PRODUCTID)  ;      
ALTER TABLE SHIPPINGADDRESS ADD CONSTRAINT FKBB1EE46E0D536EA FOREIGN KEY(CUSTOMERID) REFERENCES CUSTOMER(CUSTOMERID)  ;            
ALTER TABLE RATING ADD CONSTRAINT FK917A9DBD96F47F46 FOREIGN KEY(PRODUCTID) REFERENCES PRODUCT(PRODUCTID)  ;       
ALTER TABLE CUSTOMER ADD CONSTRAINT FK27FBE3FE29925394 FOREIGN KEY(SHIPPINGADDRESSID) REFERENCES SHIPPINGADDRESS(SHIPPINGADDRESSID)  ;             
ALTER TABLE SAVEDITEMS ADD CONSTRAINT FKD13D619996F47F46 FOREIGN KEY(PRODUCTID) REFERENCES PRODUCT(PRODUCTID)  ;   
ALTER TABLE CUSTOMERORDER ADD CONSTRAINT FKAEF781F0E0D536EA FOREIGN KEY(CUSTOMERID) REFERENCES CUSTOMER(CUSTOMERID)  ;             
ALTER TABLE RATING ADD CONSTRAINT FK917A9DBDE0D536EA FOREIGN KEY(CUSTOMERID) REFERENCES CUSTOMER(CUSTOMERID)  ;    
ALTER TABLE CUSTOMERORDER ADD CONSTRAINT FKAEF781F0EBF266E FOREIGN KEY(CARTID) REFERENCES CART(CARTID)  ;          
ALTER TABLE CUSTOMER ADD CONSTRAINT FK27FBE3FEEBF266E FOREIGN KEY(CARTID) REFERENCES CART(CARTID)  ;               
ALTER TABLE CUSTOMER ADD CONSTRAINT FK27FBE3FEDCADD6E0 FOREIGN KEY(CREDITCARDID) REFERENCES CREDITCARD(CREDITCARDID)  ;            
ALTER TABLE CREDITCARD ADD CONSTRAINT FK552751C9E0D536EA FOREIGN KEY(CUSTOMERID) REFERENCES CUSTOMER(CUSTOMERID)  ;
