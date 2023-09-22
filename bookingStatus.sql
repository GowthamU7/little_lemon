use mydb;

INSERT INTO bookings(BookingID,date,tableNo,GuestFirstName,GuestLastName)value
(1,"2022-10-10",5,"A","B"),
(2,"2022-10-11",3,"C","D"),
(3,"2022-10-12",2,"E","F"),
(4,"2022-10-13",2,"G","H");

select * from bookings;

CREATE PROCEDURE IF NOT EXISTS CheckBooking(IN vdate date, IN tableNo INT)
SELECT CASE 
       WHEN count(bs.tableNo) = 0 THEN concat("Table ",tableNo," is available")
       ELSE concat("Table ",tableNo," is already booked") END as "Booking status" 
FROM bookings as bs where bs.date = vdate AND bs.tableNo = tableNo;
       
CALL CheckBooking("2022-10-12",2)

