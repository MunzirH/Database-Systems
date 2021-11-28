CREATE TABLE vehicle( 
licensePlate VARCHAR(10), 
year INT, 
PRIMARY KEY(licensePlate) 
);

CREATE TABLE car (
licensePlate VARCHAR(10), 
make VARCHAR(20), 
PRIMARY KEY(licensePlate), 
FOREIGN KEY(licensePlate) REFERENCES vehicle(licensePlate) 
); 

CREATE TABLE truck( 
licensePlate VARCHAR(10), 
capacity INT, 
PRIMARY KEY(licensePlate), 
FOREIGN KEY(licensePlate) REFERENCES vehicle(licensePlate) 
); 

CREATE TABLE insuranceCo ( 
name VARCHAR(30), 
phone INT, 
PRIMARY KEY(name) 
); 

CREATE TABLE vehicle_insurance ( 
licensePlate VARCHAR(10), 
name VARCHAR(30), 
maxliability FLOAT, 
PRIMARY KEY(licensePlate, name), 
FOREIGN KEY(licensePlate) REFERENCES vehicle(licensePlate), 
FOREIGN KEY(name) REFERENCES insuranceCo(name) 
); 


CREATE TABLE person( 
ssn INT, 
name VARCHAR(20), 
PRIMARY KEY(ssn) 
); 


CREATE TABLE owns ( 
licensePlate VARCHAR(10), 
ssn INT, 
PRIMARY KEY(ssn, licensePlate), 
FOREIGN KEY(licensePlate) REFERENCES vehicle(licensePlate), 
FOREIGN KEY(ssn) REFERENCES person(ssn) 
);

CREATE TABLE driver ( 
driverID INT, 
ssn INT, 
PRIMARY KEY(ssn), 
FOREIGN KEY(ssn) REFERENCES person(ssn) 
); 

CREATE TABLE non_professional_driver ( 
ssn INT, 
licensePlate VARCHAR(10), 
PRIMARY KEY(ssn), 
FOREIGN KEY(ssn) REFERENCES person(ssn), 
FOREIGN KEY(licensePlate) REFERENCES vehicle(licensePlate) 
); 


CREATE TABLE professional_driver ( 
ssn INT, 
licensePlate VARCHAR(10), 
medicalhistory VARCHAR(150), 
PRIMARY KEY(ssn), 
FOREIGN KEY(ssn) REFERENCES person(ssn), 
FOREIGN KEY(licensePlate) REFERENCES vehicle(licensePlate) 
);

/* 
(b) The "insures" relationship is represented by the vehicle insurance table.
The vehicle insurance table connects the vehicle table's "licensePlate" and the InsuranceCo table's "name."
The vehicle insurance table can thus be used to find the "maxLiability." 

(c) "drives" is defined as "non professional driver," while "operates" is defined as "professional driver." "operates" was linked to "medicalhistory," which is only associated with "truck," and non-professional drivers are not permitted to drive truck.
And because "operates" is a many-to-one relationship, the truck can only be operated by its one and only driver. In other words; drives is a N to N relationship while Operates is a N to 1 relationship.*/
