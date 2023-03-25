IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'SynapseDelimitedTextFormat') 
	CREATE EXTERNAL FILE FORMAT [SynapseDelimitedTextFormat] 
	WITH ( FORMAT_TYPE = DELIMITEDTEXT ,
	       FORMAT_OPTIONS (
			 FIELD_TERMINATOR = ',',
			 USE_TYPE_DEFAULT = FALSE
			))
GO

IF NOT EXISTS (SELECT * FROM sys.external_data_sources WHERE name = 'udacitydelake_udacitydelake_dfs_core_windows_net') 
	CREATE EXTERNAL DATA SOURCE [udacitydelake_udacitydelake_dfs_core_windows_net] 
	WITH (
		LOCATION = 'abfss://udacitydelake@udacitydelake.dfs.core.windows.net' 
	)
GO

CREATE EXTERNAL TABLE dbo.staging_rider (
	[RiderId] bigint,
	[Firstname] nvarchar(4000),
	[Lastname] nvarchar(4000),
	[Address] nvarchar(4000),
	[Birthday] datetime2(0),
	[AccountStartDate] datetime2(0),
	[AccountEndDate] datetime2(0),
	[IsMember] bit
	)
	WITH (
	LOCATION = 'publicriderimport.csv',
	DATA_SOURCE = [udacitydelake_udacitydelake_dfs_core_windows_net],
	FILE_FORMAT = [SynapseDelimitedTextFormat]
	)
GO


SELECT TOP 100 * FROM dbo.staging_rider
GO