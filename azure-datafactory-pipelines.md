## Load multiple tables through single pipeline

Here in this example we have source system as a Azure Sql DWH and sink as the Azure data lake Gen2. So,we need below resources already created in azure portal.

  1. Azure Sql Datawarehouse
  2. Azure data lake Gen2 
  3. Azure data factory V2

Step 1: Create lookup table which will have all the deatils regarding tables, columns that needs to be synced, status etc. These tables will be accoridng to the syncing logics of tables like truncate load, incremental insert load, incremental insert update load etc. Incase of incremental loads this lookup table will have max_date for each table which hel us in avoiding the duplicates. In this particular example we are doing truncate load.

lookup table script:
```
create table lookup_table_Truncate_load(
	Source_schema varchar(50) NULL, 
	Sink_schema varchar(50) NULL, 
	table_name varchar(50) NULL, 
	column_names varchar(1000) NULL,
	success_flag bit NULL
)
```

Insert some table values which needs to be synced:
```
insert into lookup_table_Truncate_load
values
('dbo', 'adls_gen2', 'DimCurrency', 'CurrencyKey, CurrencyAlternateKey, CurrencyName', 0),
('dbo', 'adls_gen2', 'DimScenario', 'ScenarioKey, ScenarioName', 0),
('dbo', 'adls_gen2', 'DimGeography', 'GeographyKey, City, StateProvinceCode, StateProvinceName, CountryRegionCode, EnglishCountryRegionName, SpanishCountryRegionName, FrenchCountryRegionName, PostalCode, SalesTerritoryKey', 0)
```

Step 2: Create Linked services and Datasets of both source and destination.

![image](/images/ADF_LS_DS.png)

Step 3: Create pipeline by clicking on create new pipeline. Activities used will be lookup (to get details of tables to be synced), foearch (for iterating on output of lookup activity) and foeach will have copy activity (actual copy of data, this is parameterized).

![image](/images/adls-pipeline.png)

Parameters in Copy activity

![image](/images/adls-pipeline-1.png)

![image](/images/adls-pipeline-2.png)


