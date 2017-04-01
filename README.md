#データベース設計

##users table
|column     |    type   |option     |
|:---------:|:---------:|:---------:|
|name       |string     |NOT NULL   |
|mail_adress|text       |NOT NULL   |
|password   |text       |NOT NULL   |
|group_id   |integer    |---        |
|message_id |integer    |---        |

##messages table
|column     |type       |option|
|:---------:|:---------:|:---------:|
|user_id    |integer    |---        |
|body       |text       |NOT NULL,index  |
|image      |text       |        ---|
|group_id   |integer    |        ---|



##groups table
|column     |type       |option     |
|:---------:|:---------:|:---------:|
|name       |string     |---        |
|user_id    |integer    |---        |
|message_id |integer    |---        |


##users_groups table
|column     |type       |option     |
|:---------:|:---------:|:---------:|
|user_id    |integer    |---        |
|group_id   |integer    |---        |
