Creation of ComosDB and uploading items:

Step 1: Go to portal.azure.com, click on create new resource and search Azure Cosmos DB. From there click on create and select “Core (SQL) - Recommended”
After completion of the above process, we can perform the following tasks.

Step-2: We can start uploading the JSON data through the upload item option.

![image](https://user-images.githubusercontent.com/21151444/141668065-fb3c93e4-c999-416f-9ed2-ac12a51c73e8.png)

Step 3: Also, created the Stored Procedure named “insertingData” in JavaScript to upload items through it.

Stored Procedure script:

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
 
 ![image](https://user-images.githubusercontent.com/21151444/141668091-ae574142-3772-4185-973d-41f4b5b78b4b.png)
 
 ![image](https://user-images.githubusercontent.com/21151444/141668140-6e43b250-b867-438e-b4db-754e5aa14752.png)

 ![image](https://user-images.githubusercontent.com/21151444/141668154-44f72057-a04d-4bb6-aa73-22f0c131e17f.png)
 
 Step-4: Creation of UDF for calculation of tax

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

![image](https://user-images.githubusercontent.com/21151444/141668172-aea41f04-74a8-41cb-bc7e-69c8cc5ea115.png)


Execution of UDF:

![image](../images/step-4a.png)



