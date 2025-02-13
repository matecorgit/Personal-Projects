-- Financial Performance and Borrower Metrics

/* Average Borrower APR y tasa promedio del prestatario: el costo promedio de endeudamiento para los préstamos representados en la tabla.*/
SELECT AVG(BorrowerAPR) AS AvgBorrowerAPR, AVG(BorrowerRate) AS AvgBorrowerRate
FROM prosperLoanData_temp;

/* Resumen mensual del rendimiento del préstamo*/
SELECT 
    DATE_FORMAT(LoanOriginationDate, '%Y-%m-01') AS Month,
    DATE_FORMAT(LoanOriginationDate, '%Y') AS Year,
    SUM(LoanOriginalAmount) AS TotalDisbursement,
    ROUND(SUM(LP_CustomerPayments), 0) AS TotalPaid,
    ROUND(AVG(EstimatedReturn), 2) AS AverageProfit,
    ROUND(AVG(EstimatedLoss), 2) AS AverageLossRate,
    ROUND(AVG(DebtToIncomeRatio),2) as debtincome
FROM prosperloandata_temp
WHERE LoanOriginationDate > '2009-12-31'
GROUP BY 1, 2
ORDER BY 1;
