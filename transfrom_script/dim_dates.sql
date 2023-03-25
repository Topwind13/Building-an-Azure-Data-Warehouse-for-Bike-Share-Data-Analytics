CREATE TABLE DATES (
    DateId
)
GO

INSERT INTO DATES(DateId)
SELECT CAST(PaymentDate AS DATE) AS 'DateId'
FROM dbo.staging_payment 
UNION
SELECT Cast(StartAT AS DATE) AS 'DateId'
FROM dbo.staging_trip
GO