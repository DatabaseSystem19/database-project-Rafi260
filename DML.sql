INSERT INTO Books VALUES(1, 'To Kill a Mockingbird', 'Harper Lee', 1960, 'Fiction', 1);
INSERT INTO Books VALUES (2, 'The Great Gatsby', 'F. Scott Fitzgerald', 1925, 'Fiction', 1);
INSERT INTO Books VALUES (3, '1984', 'George Orwell', 1949, 'Science Fiction', 1);
INSERT INTO Books VALUES (4, 'Pride and Prejudice', 'Jane Austen', 1813, 'Romance', 1);
INSERT INTO Books VALUES (5, 'The Hobbit', 'J.R.R. Tolkien', 1937, 'Fantasy', 1);
INSERT INTO Books VALUES (6, 'The Catcher in the Rye', 'J.D. Salinger', 1951, 'Fiction', 1);
INSERT INTO Books VALUES (7, 'To the Lighthouse', 'Virginia Woolf', 1927, 'Fiction', 1);
INSERT INTO Books VALUES (8, 'The Lord of the Rings', 'J.R.R. Tolkien', 1954, 'Fantasy', 1);
INSERT INTO Books VALUES (9, 'The Da Vinci Code', 'Dan Brown', 2003, 'Mystery', 1);
INSERT INTO Books VALUES (10, 'The Alchemist', 'Paulo Coelho', 1988, 'Fiction', 1);


 

INSERT INTO Users VALUES (1, 'John Doe', 'johndoe@example.com', '123-456-7890', '123 Main St, City');
INSERT INTO Users VALUES (2, 'Jane Smith', 'janesmith@example.com', '987-654-3210', '456 Elm St, Town');
INSERT INTO Users VALUES (3, 'Michael Johnson', 'michaeljohnson@example.com', '555-555-5555', '789 Oak Ave, Village');
INSERT INTO Users VALUES (4, 'Emily Davis', 'emilydavis@example.com', '111-222-3333', '321 Pine St, City');
INSERT INTO Users VALUES (5, 'David Wilson', 'davidwilson@example.com', '444-333-2222', '654 Maple Dr, Town');
INSERT INTO Users VALUES (6, 'Sarah Johnson', 'sarahjohnson@example.com', '555-123-4567', '789 Elm St, Town');
INSERT INTO Users VALUES (7, 'Robert Smith', 'robertsmith@example.com', '999-888-7777', '456 Oak Ave, Village');
INSERT INTO Users VALUES (8, 'Jennifer Davis', 'jenniferdavis@example.com', '111-999-3333', '123 Pine St, City');
INSERT INTO Users VALUES (9, 'Michael Brown', 'michaelbrown@example.com', '777-222-1111', '321 Maple Dr, Town');
INSERT INTO Users VALUES (10, 'Jessica Wilson', 'jessicawilson@example.com', '444-777-2222', '654 Oak Ave, Village');

  




INSERT INTO Rentals VALUES (1, 1, 3, 2, TO_DATE('2023-05-16', 'YYYY-MM-DD'), TO_DATE('2023-05-23', 'YYYY-MM-DD'), 0.00);
INSERT INTO Rentals VALUES (2, 2, 4, 1, TO_DATE('2023-05-17', 'YYYY-MM-DD'), TO_DATE('NULL, NULL', 'YYYY-MM-DD'), 0.00);
INSERT INTO Rentals VALUES (3, 3, 1, 3, TO_DATE('2023-05-17', 'YYYY-MM-DD'), NULL, NULL);
INSERT INTO Rentals VALUES (4, 4, 2, 4, TO_DATE('2023-05-18', 'YYYY-MM-DD'), TO_DATE('2023-05-25', 'YYYY-MM-DD'),1.50);
INSERT INTO Rentals VALUES (5, 5, 3, 5, TO_DATE('2023-05-19', 'YYYY-MM-DD'), NULL, NULL);
INSERT INTO Rentals VALUES (6, 1, 4, 6, TO_DATE('2023-05-20', 'YYYY-MM-DD'), TO_DATE('2023-05-27', 'YYYY-MM-DD'), 0.00);
INSERT INTO Rentals VALUES (7, 2, 5, 7, TO_DATE('2023-05-21', 'YYYY-MM-DD'), TO_DATE('2023-05-28', 'YYYY-MM-DD'), 0.00);
INSERT INTO Rentals VALUES (8, 3, 2, 8, TO_DATE('2023-05-22', 'YYYY-MM-DD'), NULL, NULL);
INSERT INTO Rentals VALUES (9, 4, 3, 9, TO_DATE('2023-05-23', 'YYYY-MM-DD'), TO_DATE('2023-05-30', 'YYYY-MM-DD'), 2.00);
INSERT INTO Rentals VALUES (10, 5, 1, 10, TO_DATE('2023-05-24', 'YYYY-MM-DD'),  NULL, NULL);




INSERT INTO BookUserRelation VALUES(1, 1, 1);
INSERT INTO BookUserRelation VALUES(2, 1, 2);
INSERT INTO BookUserRelation VALUES(3, 2, 1);
INSERT INTO BookUserRelation VALUES(4, 2, 3);
INSERT INTO BookUserRelation VALUES(5, 3, 2);
INSERT INTO BookUserRelation VALUES(6, 4, 3);
INSERT INTO BookUserRelation VALUES(7, 5, 1);
INSERT INTO BookUserRelation VALUES(8, 5, 2);
INSERT INTO BookUserRelation VALUES(9, 5, 3);
INSERT INTO BookUserRelation VALUES(10, 6, 1);
 

INSERT INTO Locations VALUES (1, 1, 'A-1');
INSERT INTO Locations VALUES (2, 2, 'b-3');
INSERT INTO Locations VALUES (3, 3, 'C-2');
INSERT INTO Locations VALUES (4, 4, 'D-4');
INSERT INTO Locations VALUES (5, 5, 'A-3');
INSERT INTO Locations VALUES (6, 6, 'B-2');
INSERT INTO Locations VALUES (7, 7, 'C-1');
INSERT INTO Locations VALUES (8, 8, 'D-3');
INSERT INTO Locations VALUES (9, 9, 'A-2');
INSERT INTO Locations VALUES (10, 10, 'B-1');



