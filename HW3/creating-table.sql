CREATE TABLE Books( 
               isbn INT PRIMARY KEY, 
               title VARCHAR(1000), 
               author  VARCHAR(1000), 
               genre VARCHAR(1000), 
               publisher VARCHAR(1000) 
); 
CREATE TABLE Members( 
                id INT PRIMARY KEY, 
                name VARCHAR(1000) 
);
CREATE TABLE Lending( 
                isbn,id,checkout INT PRIMARY KEY, 
                isbn INT REFERENCES Books(isbn), 
                id INT REFERENCES Members(id) 
);