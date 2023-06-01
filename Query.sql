--Union : This query will retrieve all the columns from the Books table and add NULL values for the corresponding columns from the Rentals table.
SELECT book_id, title, author, publication_year, genre, availability_status
FROM Books
UNION
SELECT book_id, NULL AS title, NULL AS author, NULL AS publication_year, NULL AS genre, NULL AS availability_status
FROM Rentals;

--Intersect : This query will retrieve the rows from the Books table where the book_id is present in the Rentals table.
SELECT book_id, title, author, publication_year, genre, availability_status
FROM Books
WHERE book_id IN (
  SELECT book_id
  FROM Rentals
);

--Except : This query will retrieve the rows from the Books table that do not have a matching book_id in the Rentals table.
SELECT book_id, title, author, publication_year, genre, availability_status
FROM Books
EXCEPT
SELECT book_id, NULL AS title, NULL AS author, NULL AS publication_year, NULL AS genre, NULL AS availability_status
FROM Rentals;

--Aggregate functions

--Count the number of books in the Books table:
SELECT COUNT(*) AS book_count FROM Books;

--Calculate the average late fee in the Rentals table:
SELECT AVG(late_fee) AS average_late_fee FROM Rentals;

--Find the maximum publication year of books in the Books table:
SELECT MAX(publication_year) AS max_publication_year FROM Books;

--Get the minimum rental date in the Rentals table:
SELECT MIN(rental_date) AS min_rental_date FROM Rentals;

--GroupBy Having: Find the authors who have more than 2 books in the Books table:

SELECT author, COUNT(*) AS book_count
FROM Books
GROUP BY author
HAVING COUNT(*) > 1;

--Subquery : Find the books borrowed by users who have rented more than one book:

SELECT book_id, title, author
FROM Books
WHERE book_id IN (
  SELECT book_id
  FROM Rentals
  WHERE borrower_id IN (
    SELECT borrower_id
    FROM Rentals
    GROUP BY borrower_id
    HAVING COUNT(*) > 1
  )
);

 --Join Operation: Retrieve the details of books along with the corresponding user who has rented them:
 SELECT b.book_id, b.title, b.author, u.name AS user_name
FROM Books b
JOIN Rentals r ON b.book_id = r.book_id
JOIN Users u ON r.borrower_id = u.user_id;

--Using SOME : Find the books that have been rented by users who have rented more than one book:
SELECT book_id, title, author
FROM Books
WHERE book_id IN (
  SELECT book_id
  FROM Rentals
  WHERE borrower_id = SOME (
    SELECT borrower_id
    FROM Rentals
    GROUP BY borrower_id
    HAVING COUNT(*) > 1
  )
);


--Using UNIQUE : Find the authors whose books have all unique publication years:

SELECT author
FROM Books
GROUP BY author
HAVING COUNT(DISTINCT publication_year) = COUNT(*);


--Using EXISTS : Find the books that have been rented at least once:

SELECT book_id, title, author
FROM Books
WHERE EXISTS (
  SELECT *
  FROM Rentals
  WHERE Rentals.book_id = Books.book_id
);

--Using ALL : Find the books that have been rented by all users:

SELECT book_id, title, author
FROM Books
WHERE book_id = ALL (
  SELECT book_id
  FROM Rentals
  GROUP BY book_id
  HAVING COUNT(DISTINCT borrower_id) = (SELECT COUNT(*) FROM Users)
);


--view : to display the available books along with their details:

CREATE VIEW AvailableBooks AS
SELECT book_id, title, author
FROM Books
WHERE availability_status = 1;

--PL SQl

-- Cursor and Counting the number of row

set serveroutput on
DECLARE
  CURSOR c_books IS
    SELECT book_id, title, author
    FROM Books;
  v_book_id Books.book_id%TYPE;
  v_title Books.title%TYPE;
  v_author Books.author%TYPE;
  v_row_count NUMBER := 0;
BEGIN
  OPEN c_books;
  LOOP
    FETCH c_books INTO v_book_id, v_title, v_author;
    EXIT WHEN c_books%NOTFOUND;
    
    -- Process each row here (e.g., perform calculations, update data)
    
    v_row_count := v_row_count + 1;
  END LOOP;
  CLOSE c_books;
  
  -- Print the row count
  DBMS_OUTPUT.PUT_LINE('Total Rows Processed: ' || v_row_count);
END;
/


--Loop and Array with extend() function : 





--IF/ELSEIF/ElSE : check if a book is urrently available for rent

set serveroutput on
DECLARE
    v_book_title Books.title%TYPE := 'The Great Gatsby';
    v_book_availability Rentals.return_date%TYPE;
BEGIN
    -- Check if the book is available for rental
    SELECT return_date
    INTO v_book_availability
    FROM Rentals
    WHERE book_id = (
        SELECT book_id
        FROM Books
        WHERE title = v_book_title
    );

    IF v_book_availability IS NULL THEN
        DBMS_OUTPUT.PUT_LINE(v_book_title || ' is available for rental.');
    ELSE
        DBMS_OUTPUT.PUT_LINE(v_book_title || ' is currently rented and will be returned on ' || v_book_availability);
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Book not found in the database.');
END;
/


-- Procedure : Get details of Book when given Book_Id

set serveroutput on
CREATE OR REPLACE PROCEDURE GetBookDetails(
    p_book_id IN Books.book_id%TYPE
)
AS
    v_title Books.title%TYPE;
    v_author Books.author%TYPE;
    v_publication_year Books.publication_year%TYPE;
    v_genre Books.genre%TYPE;
    v_availability_status Books.availability_status%TYPE;
BEGIN
    SELECT title, author, publication_year, genre, availability_status
    INTO v_title, v_author, v_publication_year, v_genre, v_availability_status
    FROM Books
    WHERE book_id = p_book_id;
    
    -- Print the book details
    DBMS_OUTPUT.PUT_LINE('Title: ' || v_title);
    DBMS_OUTPUT.PUT_LINE('Author: ' || v_author);
    DBMS_OUTPUT.PUT_LINE('Publication Year: ' || v_publication_year);
    DBMS_OUTPUT.PUT_LINE('Genre: ' || v_genre);
    DBMS_OUTPUT.PUT_LINE('Availability Status: ' || v_availability_status);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No book found with ID: ' || p_book_id);
END;
/

--Calling Proedure
BEGIN
    GetBookDetails(p_book_id => 1);
END;
/



--Funtion : Calculates the total late fee for a given rental ID

set serveroutput on
CREATE OR REPLACE FUNCTION CalculateLateFee(p_rental_id IN Rentals.rental_id%TYPE)
    RETURN NUMBER
AS
    v_late_fee Rentals.late_fee%TYPE;
BEGIN
    SELECT late_fee
    INTO v_late_fee
    FROM Rentals
    WHERE rental_id = p_rental_id;
    
    RETURN v_late_fee;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;
END;
/

-- Calling Funtion : 
SELECT CalculateLateFee(4) AS late_fee FROM DUAL;











