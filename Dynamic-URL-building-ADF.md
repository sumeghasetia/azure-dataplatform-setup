## Create dynamic URL for HTTP request through pipeline, dataset parameters and variables then copy data to ADLS.

Step 1: Create Linked service for HTTP request

![image](/images/http-ls.png)

Then create parameterised data set on top of this LS.
  
![image](/images/redit-http.gif)
  
Step 2: Create LS and DS for ADLS as sink

![image](/images/adls-LS.png)
  
![image](/images/ds-rest-sink.png)
  
Step 3: Create a new pipeline and copy activity, add the parameters that needs to be used to create dynamic URL

![image](/images/redit-pipeline.gif)
  
Step 4: Add the Trigger and publish the changes then run the pipeline.

![image](/images/redit-trigger.gif)
