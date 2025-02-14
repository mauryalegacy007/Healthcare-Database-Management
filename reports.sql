SELECT  
    DATE(Appointment_Date) AS Day,  
    COUNT(*) AS Total_Appointments  
FROM Appointments  
GROUP BY Day  
ORDER BY Day;

SELECT  
    YEAR(Appointment_Date) AS Year,  
    MONTH(Appointment_Date) AS Month,  
    COUNT(*) AS Total_Appointments  
FROM Appointments  
GROUP BY Year, Month  
ORDER BY Year DESC, Month DESC;
 
SELECT  
    DATE(B.Bill_Date) AS Bill_Date,  
    SUM(B.Amount) AS Total_Revenue,  
    SUM(CASE WHEN B.Payment_Status = 'Paid' THEN B.Amount ELSE 0 END) AS Paid_Amount,  
    SUM(CASE WHEN B.Payment_Status = 'Unpaid' THEN B.Amount ELSE 0 END) AS Unpaid_Amount  
FROM Billing B  
GROUP BY Bill_Date  
ORDER BY Bill_Date DESC;

SELECT  
    Diagnosis,  
    COUNT(*) AS Diagnosis_Count  
FROM Prescriptions  
GROUP BY Diagnosis  
ORDER BY Diagnosis_Count DESC  
LIMIT 10;
