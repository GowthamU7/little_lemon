CREATE VIEW OrdersView AS SELECT orderID as OrderID,quantity as Quantity,totalcost as Cost FROM orders;

SELECT * FROM OrdersView;