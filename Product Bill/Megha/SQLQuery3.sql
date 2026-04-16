SELECT * FROM Bank_Loan_data
---KPIs 
---Total loan aplication 
Select COUNT(id) AS Total_Loan_Application  From Bank_Loan_data

---Month to day 
Select COUNT(id) AS MTD_Total_Loan_Application From Bank_Loan_data
Where MONTH(issue_date) = 12 AND YEAR (issue_date) = 2021 

--- Previous month to day 
Select COUNT(id) AS PMTD_Total_Loan_Application From Bank_Loan_data
where MONTH(issue_date) = 11 AND YEAR (issue_date) = 2021

--total funded amount 
Select SUM(loan_amount) AS MTD_Total_Funded_Amount From Bank_Loan_data
WHERE MONTH(issue_date) = 12 AND YEAR (issue_date) = 2021 

--total funded amount Previous month to date  
Select SUM(loan_amount) AS PMTD_Total_Funded_Amount From Bank_Loan_data
WHERE MONTH(issue_date) = 11 AND YEAR (issue_date) = 2021 

--total amount received/ installment received 
Select Sum(total_payment) AS Total_Amount_received From Bank_Loan_data
where MONTH (issue_date) = 12 AND YEAR (issue_date) = 2021 

--total amount received/ installment received of previous month 
Select Sum(total_payment) AS PMTD_Total_Amount_received From Bank_Loan_data
where MONTH (issue_date) = 11 AND YEAR (issue_date) = 2021 

--Average int rate 
Select ROUND(AVG(int_rate),4) * 100 AS MTD_Avg_interest_rate From Bank_Loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021
--Higher the interest rate or higher the avg it is very much beneficial for banks, make profits on int rate 

---previous average int rate 
Select ROUND(AVG(int_rate),4) * 100 AS PMTD_Avg_intereste_rate From Bank_Loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021 

--- Avg debt-to -income ratio(dti)
SELECT ROUND(AVG(dti),4) * 100 AS MTD_Avg_DTI From Bank_Loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021 

--- Avg debt-to -income ratio(dti) of previous month 
SELECT ROUND(AVG(dti),4) * 100 AS PMTD_Avg_DTI  from Bank_Loan_data 
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

--PROBLEM STATEMENTT
--Good loans & bad loans  ,good loans r fully paid,  currently loans rcustomers paying interest for taken loan,charged loans bad loans not repaying loans and interest   
--- Good loan & current loan %  
Select
     (COUNT(CASE WHEN loan_status = 'Fully paid' OR loan_status = 'Current' THEN id END)*100)
	  /
	  COUNT(id) AS Good_loan_percentage 
FROM Bank_Loan_data 

--good loan applications 
   Select COUNT(id) AS Good_Loan_Applications FROM Bank_Loan_data 
   where loan_status = 'Fully paid' OR loan_status = 'Current' 

---good loan funded amt 
Select SUM(loan_amount) AS Good_loan_Funded_Amt From Bank_Loan_data 
   where loan_status = 'Fully paid' OR loan_status = 'Current' 

 --Good loan toatl payment  
 Select SUM(total_payment) AS Good_loan_received_amt From Bank_Loan_data
   where loan_status = 'Fully paid' OR loan_status = 'Current' 

 --Bad loan 
 Select 
       (COUNT(CASE WHEN loan_status = 'Charged off' THEN id END)* 100.0)
	   /
	   COUNT (id) AS Bad_Loan_Percentage 
	   From Bank_Loan_data 

--total application for bad loan
Select COUNT(id) AS Bad_Loan_Applications From Bank_Loan_data 
where loan_status = 'Charged Off'

---bad loan amount received 
Select Sum(total_payment) AS Bad_Loan_Amount_Received From Bank_Loan_data
Where loan_status = 'Charged off'

---bad loan funded amount 
Select SUM(loan_amount) AS Bad_Loan_Funded_amount From Bank_Loan_data
Where loan_status = 'Charged off'

--loan status grid view 
Select 
     loan_status ,
	 count(id) As Total_Loan_Applications,
	 SUM(total_payment) As Total_Amt_Received,
	 SUM(loan_amount) As Total_Funded_Amt,
	 AVG(int_rate *100) As Interest_Rate,
	 AVG(dti *100) As DTI 
	 From 
	 Bank_Loan_data
	 Group by 
	 loan_status 

--current month to date 
select  loan_status,
SUM(total_payment) AS MTD_Total_Amount_Received,
SUM(loan_amount) AS MTD_Total_Funded_Amount
from Bank_Loan_data  
WHERE MONTH(issue_date) = 12
Group by loan_status 

---Pervious month to date 
select loan_status,
SUM(total_payment) AS MTD_Total_Amount_Received,
SUM(loan_amount) AS MTD_Total_Funded_Amount from Bank_Loan_data 
where month(issue_date) = 11
group by loan_status 


--Dashboard Problem statement 
 Select 
 MONTH(issue_date)AS Month_Number,
 DATENAME(MONTH,issue_date)AS Month_Name,
 COUNT(id) AS Total_Loan_Applications,
 SUM(loan_amount) AS Total_Funded_Amount,
 SUM(total_payment) AS Total_Funded_Received_Amount 
 From Bank_Loan_data 
 Group By MONTH(issue_date), DATENAME(MONTH,issue_date)
 Order by MONTH(issue_date) 

 --Regional analysis 
 Select 
 address_state,
 COUNT(id) AS Total_Loan_Applications,
 SUM(loan_amount) AS Total_Funded_Amount,
 SUM(total_payment) AS Total_Funded_Received_Amount 
 From Bank_Loan_data 
 Group by address_state
 Order by COUNT(id) Desc
--SUM(loan_amount) desc for hight city, to see total maximum loan application then use count  

---loan term analysis 
Select 
      term,
	  COUNT(id) AS Total_Loan_Applications,
 SUM(loan_amount) AS Total_Funded_Amount,
 SUM(total_payment) AS Total_Funded_Received_Amount 
 From Bank_Loan_data 
 Group by term
 Order by term
	  
--Employee Length analysis 
    select
	  emp_length,
      COUNT(id) AS Total_Loan_Applications,
      SUM(loan_amount) AS Total_Funded_Amount,
      SUM(total_payment) AS Total_Funded_Received_Amount 
      From Bank_Loan_data 
      Group by emp_length 
      Order by COUNT(id) Desc
	  
--- Loan Purpose breakdown 
     select
	  home_ownership,
      COUNT(id) AS Total_Loan_Applications,
      SUM(loan_amount) AS Total_Funded_Amount,
      SUM(total_payment) AS Total_Funded_Received_Amount 
      From Bank_Loan_data
	  Where grade = 'A'AND address_state = 'CA'
	  GROUP BY home_ownership
	  Order by COUNT(id) Desc
	  --AND address_state = 'CA' can add this to find with cities 