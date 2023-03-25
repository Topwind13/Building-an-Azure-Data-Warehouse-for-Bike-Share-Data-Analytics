CREATE TABLE Payment(
    PaymentId INT,
	DateId DATE,
    RiderId INT,
	Amount FLOAT
)
GO


INSERT INTO Payment(PaymentId, DateId, RiderId, Amount)
SELECT
    PaymentId,
    CAST(PaymentDate AS DATE) AS 'DateId',
    RiderId,
    Amount
FROM dbo.staging_payment
GO