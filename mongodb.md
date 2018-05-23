# Mongo DB

### Delete duplicate records base in a attribute

```
db.getCollection('candidates').aggregate([
{$group: { 
          _id: {emailAddress: "$emailAddress"},
          dups: { $addToSet: "$_id"  },
          count: {$sum: 1} 
        }, 
},
{$match: { 
          count: {"$gt": 1}
        }
}
]).forEach(function(doc) {
   doc.dups.shift();
   db.candidates.remove({
       _id: {$in: doc.dups}
   });
})
```
### Count distinct documents given an attribute
```
db.getCollection('candidates').distinct("emailAddress").length
```

### Show distintct documents given an attribute
```
db.getCollection('candidates').distinct("emailAddress")
```
