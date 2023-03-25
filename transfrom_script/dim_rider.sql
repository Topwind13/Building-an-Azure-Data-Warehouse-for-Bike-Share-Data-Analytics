CREATE TABLE Rider(
    RiderId INT,
	Firstname VARCHAR(50),
	Lastname VARCHAR(50),
	Address VARCHAR(50),
	Birthday DATE,
	AccountStartDate DATE,
	AccountEndDate DATE,
	IsMember BOOLEAN
)
GO

INTO TABLE Rider(RiderId, Firstname, Lastname, Address, Birthday, AccountStartDate, AccountEndDate, IsMember)
SELECT
    RiderId,
    Firstname,
    Lastname,
    Address,
    CAST(Birthday AS DATE),
    CAST(AccountStartDate AS DATE),
    CAST(AccountEndDate AS DATE),
    IsMember
FROM dbo.staging_rider
GO