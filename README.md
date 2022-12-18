# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## users　テーブル

|column|type|options|
|------|----|-------|
|nickname|string|null:false|
|email|string|null:false, unique: true|
|encrypted_password|string|null:false|
|first_name_kanji|string|null:false|
|last_name_kanji|string|null:false|
|first_name_kana|string|null:false|
|last_name_kana|string|null:false|
|birth_day|date|null:false|
 
### association

-has_many :items
-has_many :records

## itemsテーブル

|column|type|options|
|------|----|-------|
|item_name|string|null:false|
|content|text|null:false|
|price|integer|null:false|
|user|references|null:false, foreign_key:true|
|categoly_id|integer|null:false, foreign_key:true|
|status_id|integer|null:false, foreign_key:true|
|payer_id|integer|null:false, foreign_key:true|
|day_id|integer|null:false, foreign_key:true|
|place_id|integer|null:false, foreign_key:true|


### association

-belongs_to :user
-has_one :record

## recordsテーブル

|column|type|options|
|------|----|-------|
|item|references|null:false, foreign_key:true|
|user|references|null:false, foreign_key:true|

### association

-belongs_to :user
-belongs_to :item
-has_one :ship_address

## ship_addressesテーブル

|column|type|options|
|------|----|-------|
|post|string|null:false|
|city|string|null:false|
|line|string|null:false |
|build_name|string|-------|
|tell|integer|null:false|
|record|references|null:false, foreign_key:true|
|place_id|integer|null:false, foreign_key:true|

### association

-belongs_to :record