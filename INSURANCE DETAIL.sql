SELECT * FROM healthcaredb.insurance;

SELECT P.*, I.Coverage_Amount
FROM Patients P
JOIN Insurance I ON P.Patient_ID = I.Patient_ID
WHERE I.Coverage_Amount > 300000
ORDER BY I.Coverage_Amount DESC;
SELECT 
    CASE 
        WHEN Age BETWEEN 0 AND 18 THEN '0-18 Years'
        WHEN Age BETWEEN 19 AND 35 THEN '19-35 Years'
        WHEN Age BETWEEN 36 AND 50 THEN '36-50 Years'
        WHEN Age BETWEEN 51 AND 65 THEN '51-65 Years'
        ELSE '65+ Years'
    END AS Age_Group,
    COUNT(*) AS Total_Patients
FROM Patients
GROUP BY Age_Group
ORDER BY Total_Patients DESC;


SELECT 
    P.Gender,
    COUNT(DISTINCT P.Patient_ID) AS Total_Patients,
    COUNT(I.Patient_ID) AS Insured_Patients,
    (COUNT(I.Patient_ID) / COUNT(DISTINCT P.Patient_ID) * 100) AS Insurance_Coverage_Percentage,
    AVG(I.Coverage_Amount) AS Avg_Coverage_Amount
FROM Patients P
LEFT JOIN Insurance I ON P.Patient_ID = I.Patient_ID
GROUP BY P.Gender;

SELECT COUNT(*) AS Insured_Patients FROM Insurance;

SELECT *
FROM Insurance
WHERE Expiry_Date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 13 MONTH);
