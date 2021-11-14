## Here we will load the data present in cosmos DB to adls.


Step 1: Create resources in Azure portal
  1. Azure Cosmos DB (already created)
  2. ADLS Gen2 (already created)

Step 2: Create Linked services and datasets on both the sink and source. 

Source LS and DS:

![image](/images/ls-cosmosDB.png)

![image](/images/ds-cosmosDB.png)

Sink DS:

![image](/images/ds-rest-sink.png)

Step 3: Now create a new pipeline

![image](/images/cosmosdb-pipeline.png)

Now debug the pipeline and check teh data in ADLS

![image](/images/cosmosdb-output.png)

