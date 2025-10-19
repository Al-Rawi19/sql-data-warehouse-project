/*
===================================================================================
Create Database and Schemas
===================================================================================
Script Purpose:
    This script creates a new database named 'DataWarehouse' after checking if it already existis.
    First, it terminates active connections if the database is active, then it is dropped and recreated.
    Additionally, the script sets up three schemas within the database: 'bronze', 'silver', and 'gold'.

WARNING:
    Running This script will drop the entire 'DataWarehouse' database if exists
    All data in the database will be permanently deleted. proceed with caution
    and ensure you have proper backups before running this script.
*/

-- Terminate active connection to the 'DataWarehouse' database
-- Avoid terminating the current connection
SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname = 'datawarehouse' AND pid <> pg_backend_pid();

-- Drop the database if exists 
DROP database IF EXISTS datawarehouse;

-- Recreating the database
CREATE DATABASE datawarehouse;

-- Connected to the newly database
\c datawarehouse

-- Creating Schemas
CREATE SCHEMA bronze;
CREATE SCHEMA silver;
CREATE SCHEMA gold;
