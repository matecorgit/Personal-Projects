SELECT
    
-- Desembolso total del préstamo
    SUM(LoanOriginalAmount) AS TotalLoanAmount,

    -- APR y tasa promedio del prestatario
    AVG(BorrowerAPR) AS AvgBorrowerAPR,
    AVG(BorrowerRate) AS AvgBorrowerRate,

    -- Principal neto y métricas de recuperación de pérdidas
    SUM(LP_NetPrincipalLoss) AS NetPrincipalLoss,
    SUM(LP_NonPrincipalRecoveryPayments) AS NonPrincipalRecovery,
    (SUM(LP_NetPrincipalLoss) / SUM(LoanOriginalAmount)) * 100 AS PercentageNetPrincipalLoss,

	-- Pago promedio mensual del préstamo
    AVG(MonthlyLoanPayment) AS AvgMonthlyPayment,

	-- Métricas de rentabilidad bruta
    SUM(LP_InterestandFees) AS TotalInterestFees,
    SUM(LP_ServiceFees + LP_CollectionFees) AS TotalServiceCollectionFees
FROM `testing_db`.`prosperloandata_temp`
WHERE LoanOriginationDate > '2009-12-31';