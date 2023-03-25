CREATE TABLE Station(
    StationId VARCHAR(50), 
    StationName VARCHAR(50), 
    Latitude FLOAT, 
    Longtitude FLOAT
)
Go

INSERT INTO Station(StationId, StationName, Latitude, Longtitude)
SELECT
    StationId, 
    StationName, 
    Latitude, 
    Longtitude
FROM dbo.staging_station
GO