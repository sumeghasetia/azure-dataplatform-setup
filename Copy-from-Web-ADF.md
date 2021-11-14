## Load data from Web end-point into the ADLS

Step 1: Create Source Linked Service and Dataset. LS and DS type is HTTP.

![image](/images/http-ls.png)
  
![image](/images/http-ds.png)
  
Step 2: Create Sink Linked Service and Dataset. It will be ADLS.
  
![image](/images/adls-LS.png)

![image](/images/ds-rest-sink.png)
  
Step 3: Create pipeline and add copy activity

![image](/images/http-copy.png)
  
Step 4: Now run the pipeline in debug mode and check the data in ADLS

![image](/images/http-output.png)

Step 5: Add trigger, set the timings and publish the changes.
  
![image](/images/http-trigger.png)
