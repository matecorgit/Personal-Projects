-- Loan Portfolio Metrics


/* Desembolso total de préstamos: esta métrica proporciona información sobre el monto total de préstamos representados en la tabla.*/
SELECT SUM(LoanOriginalAmount) AS TotalLoanAmount
FROM prosperLoanData_temp;

/* Monto promedio de préstamo por calificación de Prosper: este tipo de consulta es útil para analizar los montos promedio de préstamo asociados con diferentes calificaciones de Prosper. */
SELECT ProsperRatingAlpha, AVG(LoanOriginalAmount) AS AvgLoanAmount
FROM prosperLoanData_temp
GROUP BY ProsperRatingAlpha;