## Creation of ComosDB and uploading items:

**Step 1:** Go to portal.azure.com, click on create new resource and search Azure Cosmos DB. From there click on create and select “Core (SQL) - Recommended”
After completion of the above process, we can perform the following tasks.

**Step 2:** We can start uploading the JSON data through the upload item option.

![image](/images/step-2.png)

**Step 3:** Also, created the Stored Procedure named “insertingData” in JavaScript to upload items through it.

**Stored Procedure script:**

```
 function createDocument(doc) {
     var context = getContext();
     var collection = context.getCollection();
     var accepted = collection.createDocument(
         collection.getSelfLink(),
         doc,
         function (err, newDoc) {
             if (err) throw new Error('Error' + err.message);
             context.getResponse().setBody(newDoc);
         }
     );
     if (!accepted) return;
 }
 ```
 
 Click on execute and provide input params:
 
  ![image](/images/step-3.jpg)
  
  ![image](/images/step-3a.png)
  
  ![image](/images/step=3b.png)

 **Step 4:** Creation of UDF for calculation of tax

UDF script

```
function getTax(price) {
        if(price == undefined)
            throw 'no input';
        if (price < 100)
            return price * 0.1;
        else
            return price * 0.2;
}
```

![image](/images/step-4.png)

Execution of UDF:

![image](/images/step-4a.png)
