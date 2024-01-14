############################################## SOLUTIONS ###############################################
CREATE DATABASE IF NOT EXISTS IMARTICUS;

# Once the database is create open table data wizard and add all the data file to same data base ALTER

# select default data base to solve the questions 
USE imartiucs;

# Q1. Print product, price, sum of quantity more than 5 sold during all three months.  
-------------------------------------------------
SELECT * FROM bank_inventory_pricing;
--------------------------------------------------
SELECT 
    `Product`, `Price`, SUM(`Quantity`) AS `total_quantity`
FROM
    `bank_inventory_pricing`
GROUP BY `Product`
HAVING `total_quantity` > 5;

#Q2.Print product, quantity , month and count of records for which estimated_sale_price is less than purchase_cost (in progess)
-------------------------------------------------
SELECT * FROM bank_inventory_pricing;
--------------------------------------------------
SELECT 
    `Product`, `Quantity`, `Month`, count(*) as `count`
FROM
    `bank_inventory_pricing`
where `Estimated_sale_price` < `purchase_cost`
group by `Product`;

#Q3. Extarct the 3rd highest value of column Estimated_sale_price from bank_inventory_pricing dataset
-------------------------------------------------
SELECT * FROM bank_inventory_pricing;
--------------------------------------------------

SELECT 
    `Estimated_sale_price`
FROM
    `bank_inventory_pricing`
ORDER BY `Estimated_sale_price` DESC
LIMIT 1 OFFSET 2;


#Q4. Count all duplicate values of column Product from table bank_inventory_pricing
-------------------------------------------------
SELECT * FROM bank_inventory_pricing;
--------------------------------------------------

SELECT 
    `Product`, COUNT(*) AS `Duplicate_count`
FROM
    `bank_inventory_pricing`
GROUP BY `Product`;

#Q 5. Create a view 'bank_details' for the product 'PayPoints' and Quantity is greater than 2 
-------------------------------------------------
SELECT * FROM bank_inventory_pricing;
--------------------------------------------------

# create view 
CREATE VIEW `bank_details` AS
    SELECT 
        `Product`, `Quantity`, `Price`
    FROM
        `bank_inventory_pricing`
    WHERE
        `Product` = 'PayPoints'
            AND `Quantity` > 2;
            

# call the view 
Select * from `bank_details`;


# Q6 Update view bank_details and add new record in bank_details.
-- --example(Producct=PayPoints, Quantity=3, Price=410.67)

insert into `bank_details`(`Product`, `Quantity`, `Price`)
values("PayPoints", 3, 410.67);
            
# call the view 
Select * from `bank_details`;

# Q7.Real Profit = revenue - cost  Find for which products, 
# branch level real profit is more than the estimated_profit in Bank_branch_PL.
-------------------------------------------------
SELECT * FROM imartiucs.bank_branch_pl;
--------------------------------------------------

SELECT 
    `Branch`,
    `Product`,
    `Estimated_profit`,
    (`revenue` - `cost`) AS `Real_Profit`
FROM
    `bank_branch_pl`
HAVING `Real_Profit` > `Estimated_profit`;

# Q8.Find the least calculated profit earned during all 3 periods
-------------------------------------------------
SELECT * FROM imartiucs.bank_branch_pl;
--------------------------------------------------

SELECT 
    `Branch`,
    `Product`,
    `Estimated_profit`,
    (`revenue` - `Estimated_profit`) AS `Real_Profit`,
    `month`
FROM
    `bank_branch_pl`
GROUP BY `month`
ORDER BY `Real_Profit`;

#Q9. In Bank_Inventory_pricing, 
-- a) convert Quantity data type from numeric to character 
-- b) Add then, add zeros before the Quantity field.  








