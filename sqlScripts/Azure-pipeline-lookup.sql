create table lookup_table_Truncate_load(
	Source_schema varchar(50) NULL, 
	Sink_schema varchar(50) NULL, 
	table_name varchar(50) NULL, 
	column_names varchar(1000) NULL,
	success_flag bit NULL
);

insert into lookup_table_Truncate_load
values
('dbo', 'adls_gen2', 'DimCurrency', 'CurrencyKey, CurrencyAlternateKey, CurrencyName', 0),
('dbo', 'adls_gen2', 'DimScenario', 'ScenarioKey, ScenarioName', 0),
('dbo', 'adls_gen2', 'DimGeography', 'GeographyKey, City, StateProvinceCode, StateProvinceName, CountryRegionCode, EnglishCountryRegionName, SpanishCountryRegionName, FrenchCountryRegionName, PostalCode, SalesTerritoryKey', 0)

select * from lookup_table_Truncate_load;