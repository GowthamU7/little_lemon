use mydb;

CREATE VIEW OrdersView AS SELECT orderID as OrderID,quantity as Quantity,totalcost as Cost FROM orders;

SELECT * FROM OrdersView;

select 
bs.BookingID as CustomerID,
concat(bs.GuestFirstName," ",bs.GuestLastName) as FullName,
os.orderID as OrderID,
os.totalcost as Cost,
(select mn.Cuisine from menus as mn where mn.MenuID = os.MenuID) as MenuName,
(select Name from menuitems as ms where ms.ItemID = (select mn.ItemID from menus as mn where mn.MenuID = os.MenuID)) as CourseName
from bookings as bs
INNER JOIN orders as os ON os.BookingID = bs.BookingId AND os.totalcost > 150;

select mts.Name from menuitems as mts where mts.ItemID = ANY (select ms.ItemID from menus as ms
where ms.MenuID = (select os.MenuID from orders as os where os.quantity > 2));