## Import data from Hadoop environment into external table

First create Azure SQL DWH in the azure portal.

![image](/images/sql-dwh.png)

Then create a storage account with ADLS gen2 enabled and upload a sample file 

![image](/images/adls-gen2.png)

Data present in ADLS

![image](/images/adls-data2.png)

Below are the sql scripts that need to be perfomed on SSMS (Link to complete SqlScript - [Link to file](https://github.com/sumeghasetia/azure-dataplatform-setup/blob/428379a9f2448d6ae1580aa079935a4d8ad5b75b/sqlScripts/polybase-read.sql) ):

-- Execute all statements on data warehouse create on Azure through SSMS interface 
-- Execute Step-1 and Step-2, if your default user don't have access and master key is missing

--  Step 1
   -- GRANT CONTROL ON DATABASE::DWH_NAME TO dbo;   (first gave the permissions)

-- Step 2
   -- CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'give**new**password'  (then created master key) 

```
-- Step 3
CREATE DATABASE SCOPED CREDENTIAL credential_name 
WITH IDENTITY = 'your-adls-container-name'
   , SECRET = 'adls-access-key'  -- storage account access key 
```

```
-- Step 4
   CREATE EXTERNAL DATA SOURCE createNewDataSource  --create new datasource
WITH
  ( 
  	TYPE = HADOOP,
	LOCATION = 'Your ADLS URL',  --abfss://<container>@<storage_account>.dfs.core.windows.net/	
    CREDENTIAL =  credential_name    -- credential_name created in Step-3 above
)
```

```
-- Step 5, Create an external file format for DELIMITED (CSV/TSV) files.  
CREATE EXTERNAL FILE FORMAT csvfileformatcreated
WITH (  
       FORMAT_TYPE = DELIMITEDTEXT,  
    	FORMAT_OPTIONS (FIELD_TERMINATOR = ',')  
    );  
 	 
-- Step 6, Create a new external table
CREATE EXTERNAL TABLE customers_data
    ( customerId int NULL,
		firstName varchar(100) NULL,
		lastName varchar(100) NULL,
		street_address varchar(100) NULL,
		city varchar(100) NULL,
		stateName varchar(100) NULL)
    WITH (
        LOCATION = 'customers_data/customers.csv',   -- relative location of file present in ADLS
        DATA_SOURCE = createNewDataSource,   -- created in step 4
        FILE_FORMAT = csvfileformatcreated,  --created in step 5
        REJECT_TYPE = value,
		REJECT_VALUE = 0
    )
```

```
-- new table will be created in DWH, you can query
select * from [dbo].[customers_data]
```

Data present on DWH

![image](/images/sql-dqh-data.png)
