DROP TABLE BookUserRelation;
DROP TABLE Rentals;
DROP TABLE Locations;
DROP TABLE Users;
DROP TABLE Books;


-- Create the Books table
CREATE TABLE Books (
  book_id INT PRIMARY KEY,
  title VARCHAR(255),
  author VARCHAR(255),
  publication_year INT,
  genre VARCHAR(255),
  availability_status int
);

-- Create the Users table
CREATE TABLE Users (
  user_id INT PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255),
  phone VARCHAR(20),
  address VARCHAR(255)
);

-- Create the Rentals table
CREATE TABLE Rentals (
  rental_id INT PRIMARY KEY,
  borrower_id INT,
  lender_id INT,
  book_id INT,
  rental_date DATE,
  return_date DATE,
  late_fee DECIMAL(10, 2),
  FOREIGN KEY (borrower_id) REFERENCES Users(user_id),
  FOREIGN KEY (lender_id) REFERENCES Users(user_id),
  FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE
);

-- Create the BookUserRelation table
CREATE TABLE BookUserRelation (
  relation_id INT PRIMARY KEY,
  book_id INT,
  user_id INT,
  FOREIGN KEY (book_id) REFERENCES Books(book_id),
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Create the Locations table
CREATE TABLE Locations (
  location_id INT PRIMARY KEY,
  book_id INT,
  current_location VARCHAR(255),
  FOREIGN KEY (book_id) REFERENCES Books(book_id)
);
