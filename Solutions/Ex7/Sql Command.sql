

select em.EmployeeID, em.FirstName + ' ' + em.LastName , COUNT (o.EmployeeID) as totalorders ,SUM (od.totalamunt) as totalRevenue
from Employees as em join Orders as o 
on (em.EmployeeID = o.EmployeeID) 			
join 
[Order Details] as od
on (o.orderid = od.orderid)
group by em.EmployeeID , em.FirstName,em.LastName




