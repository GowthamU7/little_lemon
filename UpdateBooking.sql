use mydb;

CREATE PROCEDURE AddBooking(IN bookingID INT,IN GuestFirstName varchar(200),IN GuestLastName varchar(200),IN tableNo INT,IN bookingDate DATE)
INSERT INTO bookings(BookingID,date,tableNo,GuestFirstName,GuestLastName)VALUES(bookingID,bookingDate,tableNo,GuestFirstName,GuestLastName);
SELECT "New booking added";


select * from bookings;

DELIMITER //
CREATE PROCEDURE UpdateBooking(IN bookingID INT,IN bookingDate date)
BEGIN
	declare d_dec INT;
    SELECT count(*) INTO d_dec from bookings as bs where bs.BookingID=bookingID AND bs.date = bookingDate;
    IF d_dec = 0 THEN
		BEGIN
			Update bookings set bookings.date = bookingDate WHERE bookings.BookingID = bookingID;
			SELECT concat("Booking ",bookingID," updated") as "Confirmation";
        END;
	else
		SELECT "Booking already exists";
    END IF;
END//
DELIMITER ;
	
CALL UpdateBooking(2,"2022-11-20")


DELIMITER //
CREATE PROCEDURE CancelBooking(IN bookingID INT)
BEGIN
	DECLARE d_dec INT;
    SELECT COUNT(*) INTO d_dec FROM bookings WHERE bookings.BookingID = bookingID;
	IF d_dec <> 0 THEN
		BEGIN
			DELETE FROM bookings WHERE bookings.BookingID = bookingID;
			SELECT concat("Booking ",bookingID," cancelled") as "Confirmation";
		END;
    END IF;
END//
DELIMITER ;

CALL CancelBooking(4);
