Use myntra_data_analysis;

/* Total Sales */

select round(sum(`Total Sales`),0) as Total_Sales
from `orders`;

/* Average Discount */

select round((avg(`Discount`)/10),2) as Avg_Discount
from `orders`;

/* Count of Product */

select count(distinct `Product Name`) as Products
from `products`;

/* Total Orders */

select count(`﻿Order ID`) as Total_Order 
from `orders`;

/* Average Ratings */

select round(avg(`Ratings`),2) as Avg_Rating
from `products`;

/* Product Distribution */

select `Product Name`, count(`Product Name`) as Count
from `products`
group by `Product Name`;

/* Brands Distribution */ 

select `Brand Name`, count(`Brand Name`) as Count
from `products`
group by `Brand Name`;

/* Size Distribution */

select `Size`, count(`Size`) as Count
from `products`
group by `Size`;

/* Color Distribution */ 

select `Color`, count(`Color`) as Count
from `products`
group by `Color`;

/* Brands Wise Order, Average sales and Average discounts Top 10 */

select `Brand Name`, count(`﻿Order ID`) as Orders, round(avg(`Total Sales`),2) as Avg_Sales,
round(avg(`Discount`)/10,2) as Avg_discount from `products` join `orders`
on `products`.`﻿Product ID` = `orders`.`Product ID`
group by `Brand Name`
order by Orders desc
limit 10;

/* Order Distribution */

select `Category`, count(`﻿Order ID`) as Orders 
from `products` join `orders`
on `products`.`﻿Product ID` = `orders`.`Product ID`
group by `Category`
order by Orders desc;

/* Order Distribution by Region Top 100 */

select `State`, `City`, `Total Sales`
from `customers` join `orders`
on `customers`.`﻿Customer ID` = `orders`.`Customer ID`
order by `Total Sales` desc
limit 100;

/* State wise Distribution of orders */

select `State`, `Category`, count(`﻿Order ID`) as Count
from `customers` join `orders`
on `customers`.`﻿Customer ID` = `orders`.`Customer ID`
join `products`
on `orders`.`Product ID` = `products`.`﻿Product ID`
group by `State`, `Category`
order by Count desc;





