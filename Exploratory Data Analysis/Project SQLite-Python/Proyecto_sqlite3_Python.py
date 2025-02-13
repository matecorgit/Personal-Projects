#Import library
import sqlite3
import pandas as pd
import matplotlib.pyplot as plt

#Set up conection
conn = sqlite3.connect('Northwind.db')

#Write consult of the 10 products that produced the most revenue
query = '''
    SELECT ProductName, sum(Price*Quantity) as Revenue
    FROM OrderDetails od
    JOIN Products p ON p.ProductID = od.ProductID
    GROUP BY od.ProductID
    ORDER BY Revenue DESC
    LIMIT 10
''' 

#Create conection and the consult
top_products = pd.read_sql_query(query,conn)

#Showing results
print(top_products)

#Plotting
top_products.plot(x='ProductName',y='Revenue',kind='bar',figsize=(10,5),legend=False)

plt.title('10 Productos más rentables')
plt.xlabel('Productos')
plt.ylabel('Revenue')
plt.xticks(rotation=90)
plt.show()

#Write consult of the 10 employees more effective
query2 = ('''
    SELECT FirstName || " " || LastName as Employee, Count(*) as Total
    FROM Orders o
    JOIN Employee e
    ON o.EmployeeID = e.EmployeeID
    GROUP BY o.EmployeeID
    ORDER BY Total DESC
    LIMIT 10
    ''')

#Create conection and the consult
top_employees = pd.read_sql_query(query2,conn)

#Showing results
print(top_employees)

#Plotting
top_employees.plot(x='Employee',y='Total',kind='bar',figsize=(10,5),legend=False)

plt.title('10 Empleados más efectivos')
plt.xlabel('Empleados')
plt.ylabel('Total Vendido')
plt.xticks(rotation=45)
plt.show()


#Write consult of the 10 employees that produced most revenue
query3 = ('''
    SELECT e.FirstName, e.LastName, SUM(p.Price * od.Quantity) AS TotalRevenue
    FROM Employees e
    JOIN Orders o ON e.EmployeeID = o.EmployeeID
    JOIN OrderDetails od ON o.OrderID = od.OrderID
    JOIN Products p ON p.ProductID = od.ProductID
    GROUP BY e.EmployeeID
    ORDER BY TotalRevenue DESC
    LIMIT 5
    ''')

#Create conection and the consult
top_employees_revenue = pd.read_sql_query(query3,conn)

#Showing results
print(top_employees_revenue)

#Plotting
top_employees_revenue.plot(x='Employee',y='Total_Revenue',kind='bar',figsize=(10,5),legend=False)

plt.title('10 Empleados que generaron más')
plt.xlabel('Empleados')
plt.ylabel('Total Recaudado')
plt.xticks(rotation=45)
plt.show()