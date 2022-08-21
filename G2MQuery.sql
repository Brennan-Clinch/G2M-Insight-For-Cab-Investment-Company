--Merge all tables together
select Customer_ID.Customer_ID, Transaction_ID.Transaction_ID, Customer_ID.Gender,
       Customer_ID.Age, Customer_ID.Income_USD_Month, Transaction_ID.Payment_Mode,
	   Cab_Data.Company, Cab_Data.City, Cab_Data.KM_Travelled, Cab_Data.Price_Charged,
	   Cab_Data.Cost_of_Trip, Cab_Data.Date_of_Travel,
	   City.Population, City.Users
from Customer_ID, Transaction_ID, Cab_Data, City
where Customer_ID.Customer_ID = Transaction_ID.Transaction_ID


select  Transaction_ID.Transaction_ID, Transaction_ID.Payment_Mode, Transaction_ID.Payment_Mode, Transaction_ID.Customer_ID,
        CabData.Company, CabData.City, CabData.KM_Travelled, CabData.Price_Charged,
		CabData.Cost_of_Trip, CabData.Date_of_Travel
from Transaction_ID, CabData
where Transaction_ID.Transaction_ID = CabData.Transaction_ID
order by Transaction_ID

--Merge Transactionmerge with Customer_ID
select Transaction_merge.Transaction_ID, Transaction_merge.Payment_Mode, Transaction_merge.Company, Transaction_merge.City,
       Transaction_merge.KM_Travelled, Transaction_merge.Price_Charged, Transaction_merge.Cost_of_Trip, Transaction_merge.Date_of_Travel,
	   Transaction_merge.Customer_ID, Customer_ID.Age, Customer_ID.Gender, Customer_ID.Income_USD_Month
from Transaction_merge, Customer_ID
where Transaction_merge.Customer_ID = Customer_ID.Customer_ID

--Merge Customermerge with City for final dataset
select Customer_merge.Transaction_ID, Customer_merge.Payment_Mode, Customer_merge.Company, Customer_merge.City, Customer_merge.KM_Travelled,
       Customer_merge.Price_Charged, Customer_merge.Cost_of_Trip, Customer_merge.Date_of_Travel, Customer_merge.Customer_ID, Customer_merge.Age,
	   Customer_merge.Gender, Customer_merge.Income_USD_Month, City.Population, City.Users, 
	   (Customer_merge.Price_Charged-Customer_merge.Cost_of_Trip) as Profit, 
	   ((Customer_merge.Price_Charged-Customer_merge.Cost_of_Trip)/Customer_merge.KM_Travelled) as Profit_per_KM
from Customer_merge, City
where Customer_merge.City = City.City