

# データベース設計

## users

|column      |    type   |option     |
|:---------  |:--------- |:--------- |
|name        |string     |NOT NULL   |
|mail_address|text       |NOT NULL   |
|password    |text       |NOT NULL   |
|group_id    |reference  |foreign_key|
|message_id  |reference  |foreign_key|

## messages table

|column     |type       |option          |
|:--------- |:--------- |:-------------- |
|user_id    |reference  |foreign_key     |
|body       |text       |NOT NULL,index  |
|image      |text       |        ---     |
|group_id   |reference  |foreign_key     |



## groups table

|column     |type       |option     |
|:--------- |:--------- |:--------- |
|name       |string     |---        |
|user_id    |reference  |foreign_key|
|message_id |reference  |foreign_key|


## groups_users table

|column     |type       |option     |
|:--------- |:--------- |:--------- |
|user_id    |reference  |foreign_key|
|group_id   |reference  |foreign_key|
