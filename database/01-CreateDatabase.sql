/*
 * Payroll ETL Processing
 * Project #70 - Complete Database Implementation
 * SQL Server 2008/2012
 * Technology: SSIS
 * Created: 2013
 */

USE master;
GO

IF EXISTS (SELECT name FROM sys.databases WHERE name = 'PayrollETL')
BEGIN
    ALTER DATABASE PayrollETL SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE PayrollETL;
END
GO

CREATE DATABASE PayrollETL
ON PRIMARY
(
    NAME = 'PayrollETL_Data',
    FILENAME = 'C:\SQLData\PayrollETL_Data.mdf',
    SIZE = 100MB,
    MAXSIZE = 5GB,
    FILEGROWTH = 10MB
)
LOG ON
(
    NAME = 'PayrollETL_Log',
    FILENAME = 'C:\SQLData\PayrollETL_Log.ldf',
    SIZE = 50MB,
    MAXSIZE = 1GB,
    FILEGROWTH = 5MB
);
GO

ALTER DATABASE PayrollETL SET RECOVERY SIMPLE;
ALTER DATABASE PayrollETL SET AUTO_UPDATE_STATISTICS ON;
GO

USE PayrollETL;
GO

PRINT 'Database PayrollETL created successfully';
PRINT 'Project: Payroll ETL Processing';
PRINT 'Description: Monthly payroll data preparation';
GO
