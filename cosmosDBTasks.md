Creation of ComosDB and uploading items:

Step 1: Go to portal.azure.com, click on create new resource and search Azure Cosmos DB. From there click on create and select “Core (SQL) - Recommended”
After completion of the above process, we can perform the following tasks.

Step-2: We can start uploading the JSON data through the upload item option.

![image](https://user-images.githubusercontent.com/21151444/141668065-fb3c93e4-c999-416f-9ed2-ac12a51c73e8.png)

Step 3: Also, created the Stored Procedure named “insertingData” in JavaScript to upload items through it.

Stored Procedure script:

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
 
 Click on execute and provide input params:
 
 ![image](https://user-images.githubusercontent.com/21151444/141668091-ae574142-3772-4185-973d-41f4b5b78b4b.png)

