## Load JSON data through REST API to ADLS

Step 1: First create linked service and dataset for COVID REST API

![image](/images/covid-LS.png)

![image](/images/azure-pipeline-covid-ds.png)

Step 2: Create linked service and dataset for sink i.e. adls gen2 (dataset will be of type json). In my case ADLS gen2 linked service is already created, so I have created JSON dataset on top of that

![image](/images/ds-rest-sink.png)

Step 3: Create pipeline with simple copy activity:

![image](/images/rest-covid-pipeline.png)

Step 4: Debug the pipeline and check the data in ADLS

![image](/images/covid-api-json-output.png)
