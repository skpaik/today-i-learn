# MongoDB Cheatsheet

- Install Mongodb tools (mongodump)
- Move to your desired folder in Linux Terminal

## MongoDB Dump
- Generic Format
  - `mongodump --uri="mongodb://mongodb0.example.com:27017"`

- Dump from Localhost
  - `mongodump --uri="mongodb://localhost:27017/my_project_dev_1"`

- Dump from Mongodb Atlas
  - `mongodump --uri="mongodb://admin_user:admin_password_123@cluster0-shard-00-00.kakap.mongodb.net:27017,cluster0-shard-00-01.kakap.mongodb.net:27017,cluster0-shard-00-02.kakap.mongodb.net:27017/my_project_prod_1?ssl=true&replicaSet=atlas-natwne-shard-0&authSource=admin&retryWrites=true&w=majority"`


## MongoDB Restore (NOT WORKING)
- Generic Format
  - `mongodump --uri="mongodb://mongodb0.example.com:27017"`

- Dump from Localhost
  - `mongodump --uri="mongodb://localhost:27017/my_project_dev_1"`

- Dump from Mongodb Atlas
  - `mongodump --uri="mongodb://admin_user:admin_password_123@cluster0-shard-00-00.kakap.mongodb.net:27017,cluster0-shard-00-01.kakap.mongodb.net:27017,cluster0-shard-00-02.kakap.mongodb.net:27017/my_project_prod_1?ssl=true&replicaSet=atlas-natwne-shard-0&authSource=admin&retryWrites=true&w=majority"`
  


