CREATE TABLE Trip(
    TripId INT,
    DateId DATE, 
    StartStationId VARCHAR(50),
    EndStationId VARCHAR(50),
    RiderId INT,
    Duration INT, 
    RiderAgesAtTrip INT
)
Go

INSERT INTO Trip(TripId, DateId, StartStationId, EndStationId, RiderId, Duration, RiderAgesAtTrip)
SELECT TOP 10
    t.TripId,
    Cast(t.StartAT AS DATE) AS DateId,
    t.StartStationId,
    t.EndStationId,
    t.RiderId,
    DATEDIFF(minute, Cast(t.StartAT AS DATETIME2), Cast(t.EndedAt AS DATETIME2)) AS 'Duration(mins)',
    DATEDIFF(MONTH,Cast(r.Birthday AS DATETIME2), Cast(t.StartAT AS DATETIME2))/12 AS 'RiderAgesAtTrip'
FROM dbo.staging_trip t
JOIN dbo.staging_rider r ON t.RiderId = r.RiderId
GO