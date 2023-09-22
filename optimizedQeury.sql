use mydb;

CREATE PROCEDURE GetMaxQuantity()
SELECT MAX(quantity) as "Max Quantity in Order" FROM orders;

CALL GetMaxQuantity();

PREPARE GetOrderDetail FROM 
'SELECT orderID as OrderID,quantity as Quantity,totalcost as Cost FROM orders WHERE orderID = ?';

SET @id = 1;
EXECUTE GetOrderDetail USING @id;

CREATE PROCEDURE CancelOrder(IN orderid INT)

SELECT CASE 
		when orderid = os.orderID THEN concat('Order ',orderid,' is cancelled')
		else concat('Order ',orderid,' doesnot exist')
        END as Confirmation
from orders as os;

CALL CancelOrder(2);