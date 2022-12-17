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
|email|string|null:false|
|password|string|null:false|
|first_name_kanji|string|null:false|
|last_name_kanji|string|null:false|
|first_name_kana|string|null:false|
|last_name_kana|string|null:false|
|birthday_year|integer|null:false|
|birthday_month|integer|null:false|
|birthday_day|integer|null:false|
 
### association

-has_many :items
-has_many :records

## itemsテーブル

|column|type|options|
|------|----|-------|
|item_name|string|null:false|
|content|text|null:false|
|price|integer|null:false |
|user|references|null:false, foreign_key:true|

### association

-belongs_to :user
-has_one :record
-has_one :ship_addresses

## recordsテーブル

|column|type|options|
|------|----|-------|
|item|references|null:false, foreign_key:true|
|user|references|null:false, foreign_key:true|

### association

-belongs_to :user
-belongs_to :prototype

## ship_addressesテーブル

|column|type|options|
|------|----|-------|
|post|integer|null:false|
|city|string|null:false|
|line|string|null:false |
|build_name|text|null:true |
|tell|integer|null:false|
|item|references|null:false, foreign_key:true|

### association

-belongs_to :item