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
-has_many :orders

## itemsテーブル

|column|type|options|
|------|----|-------|
|item_name|string|null:false|
|content|text|null:false|
|price|integer|null:false|
|user|references|null:false, foreign_key:true|
|categoly_id|integer|null:false|
|status_id|integer|null:false|
|payer_id|integer|null:false|
|delivery_id|integer|null:false|
|place_id|integer|null:false|


### association

-belongs_to :user
-has_one :order

## ordersテーブル

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
|tell|string|null:false|
|order|references|null:false, foreign_key:true|
|delivery_id|integer|null:false|

### association

-belongs_to :order