/*
part 1, return 54
*/
select count(*)
from Orders inner join Shippers on Orders.ShipperID=Shippers.ShipperID
where ShipperName='Speedy Express'

/*
part 2, return Peacock
*/
select LastName
from Employees
where EmployeeID = (select top 1 Orders.EmployeeID
from Orders
group by EmployeeID
order by count(OrderID) desc)

/*
part 3, return Boston Crab Meat 
*/
select Products.ProductName, sum(OrderDetails.Quantity) as totalQuantity
from (((Orders 
	inner join OrderDetails on Orders.OrderID=OrderDetails.OrderID)
    inner join Customers on Orders.CustomerID=Customers.CustomerID)
    inner join Products on OrderDetails.ProductID=Products.ProductID)
where Customers.Country='Germany'
group by Products.ProductName
order by sum(OrderDetails.Quantity) desc