# Backend - Final Project Assignment

Aplikasi ini merupakan tugas dari bagian final project yang berbasis api mengenai aplikasi katering gigih.
Testing API bisa dilakukan di rest client tool seperti Postman, Insomnia, dll.

Aplikasi ini menggunakan:

* Ruby version: `3.0.3`
* Rails version: `7.0.1`
* Database: `sqlite`

## Menjalankan Aplikasi

Untuk menjalankan aplikasi ini pada replit, bisa dengan mengikuti step berikut:
1. run `bundle install`
2. run `bundle exec rails db:migrate`
3. Klik tombol run

Jika ingin menjalankan aplikasi ini di local bisa dengan mengikuti step berikut:
1. run `bundle install`
2. run `rails db:migrate`
3. run `rails server`
4. navigate to `http://127.0.0.1:3000`

## Use Case
1. Pengguna dapat menampilkan, menambah, mengubah, dan menghapus data kategori, dimana berguna untuk menambahkan data kategori pada menu. 
2. Pengguna dapat menampilkan, menambah, mengubah, dan menghapus data menu. Menu makanan dapat diisikan dengan banyak kategori.
3. Pengguna dapat menampilkan, menambah, mengubah, dan menghapus data customer.
4. Pengguna dapat menambahkan data order. Pengguna hanya dapat data status status pembayaran (NEW, PAID, CANCELED) pada order. Setiap jam 5 sore untuk order yang belum dibayarkan akan pengguna rubah statusnya menjadi "CANCELED".
5. Pengguna dapat melihat reports order berdasarkan indikator hari, customer, range total harga, dan range tanggal order.


## API Documentations

### 1. Category Feature
### GET
##### Menampilkan semua data kategori
> ### Method:
> GET
> ### URL:
> /api/v1/categories

##### Menampilkan salah satu data kategori dengan Id
> ### Method:
> GET
> ### URL:
> /api/v1/categories/:id

### POST
##### Menambahkan data kategori
> ### Method:
> POST
> ### URL:
> /api/v1/categories
> ### API Parameter with Example:
> ```
> {
> 	"category_name": "drink"
> }

### PUT
##### Mengedit data salah satu kategori
> ### Method:
> PUT
> ### URL:
> /api/v1/categories/:id
> ### API Parameter with Example:
> ```
> {
> 	"category_name": "Main Dish"
> }
### DELETE
##### Menghapus data salah satu kategori
> ### Method:
> DELETE
> ### URL:
> /api/v1/categories/:id
### 2. Fitur Menu
#### GET
##### Menampilkan semua data menu
> ### Method:
> GET
> ### URL:
> /api/v1/menus

##### Menampilkan data salah satu menu dengan Id
> ### Method:
> GET
> ### URL:
> /api/v1/menus/:id

### POST
##### Menambahkan data kategori
> ### Method:
> POST
> ### URL:
> /api/v1/menus
> ### JSON API Parameter with Example:
> ```
> {
>    "name": "Nasi Goreng",
>    "price": 10000,
>    "description": "Nasi goreng is a Southeast Asian fried rice dish, usually cooked with pieces of meat and vegetables.",
>     "menus_categories": [
>       {
>    			"category_id": 1
>       },
>       {
>    			"category_id": 2
>       },
>    	]
>}

### PUT
##### Mengedit data salah satu kategori
> ### Method:
> PUT
> ### URL:
> /api/v1/menus/:id
> ### JSON API Example:
> Editing menu's name attribute
> ```
> {
>    "name": "Nasi Uduk"
>}
>```
> Editing menu's price attribute
> ```
> {
>    "price": 10000
>}
>```
> Editing menu's price attribute
> ```
> {
>    "description": "description example"
>}
>```
> Editing menu's categories attribute
> ```
> "menus_categories": [
>   {
>     "category_id": 2
>   },
>   {
>     "category_id": 4
 >  }
> ]
>```
>NOTE:
>You can edit multiple menu attribute, for example:
> ```
> {
>    "name": "Nasi Uduk",
>     "menus_categories": [
>       {
>    			"category_id": 3
>       },
>       {
>    			"category_id": 5
>       }
>    	]
>}
>```
### DELETE
##### Menghapus data salah satu menu
> ### Method:
> DELETE
> ### URL:
> /api/v1/Menus/:id

### 3. Customer Feature
### GET
##### Menampilkan semua data customer
> ### Method:
> GET
> ### URL:
> /api/v1/customers

##### Menampilkan salah satu data customer dengan Id
> ### Method:
> GET
> ### URL:
> /api/v1/customers/:id

### POST
##### Menambahkan data customer
> ### Method:
> POST
> ### URL:
> /api/v1/customers
> ### API Parameter with Example:
> ```
> {
> 	"email": "customer@gmail.com"
> }
> ```

### PUT
##### Mengedit data salah satu customer
> ### Method:
> PUT
> ### URL:
> /api/v1/customers/:id
> ### API Parameter with Example:
> ```
> {
> 	"email": "user@gmail.com"
> }
### DELETE
##### Menghapus data salah satu kategori
> ### Method:
> DELETE
> ### URL:
> /api/v1/customers/:id
### 4. Order Feature
#### GET
##### Menampilkan semua data order
> ### Method:
> GET
> ### URL:
> /api/v1/orders

##### Menampilkan data salah satu order dengan Id
> ### Method:
> GET
> ### URL:
> /api/v1/orders/:id

### POST
##### Menambahkan data order
> ### Method:
> POST
> ### URL:
> /api/v1/orders
> ### JSON API Parameter with Example:
> ```
> {
>    "customer_id": 1,
>    "order_date": "2022-05-01",
>     "menu_orders": [
>       {
>    			"menu_id": 1,
>         "qty": 2
>       },
>       {
>    			"menu_id": 2,
>         "qty": 2
>       }
>    	]
>}

### PUT
##### Mengedit status order
> ### Method:
> PUT
> ### URL:
> /api/v1/orders/:id
> ### JSON API Example:
> ```
> {
>    "status": "PAID"
>}
### DELETE
##### Menghapus data salah satu menu
> ### Method:
> DELETE
> ### URL:
> /api/v1/orders/:id

### 5. Report Feature
##### Menampilkan reports data order berdasarkan hari
> ### Method:
> GET
> ### URL:
> /api/v1/orders?order_date=YYYY-MM-DD
> ### Example:
> /api/v1/orders?order_date=2022-05-01

##### Menampilkan reports data order berdasarkan customer
> ### Method:
> GET
> ### URL:
> /api/v1/orders?customer_id=:id
> ### Example:
> /api/v1/orders?customer_id=1
> 
##### Menampilkan reports data order berdasarkan total harga
> ### Method:
> GET
> ### URL:
> /api/v1/orders?total=:price
> ### Example:
> /api/v1/orders?total=10000

##### Menampilkan reports data order berdasarkan rage total harga
> ### Method:
> GET
> ### URL:
> /api/v1/orders?total_min=:price&total_max=:price
> ### Example:
> /api/v1/orders?total_min=10000&total_max=30000
##### Menampilkan reports data order berdasarkan rage tanggal order
> ### Method:
> GET
> ### URL:
> /api/v1/orders?order_date_min=YYYY-MM-DD&order_date_max=YYYY-MM-DD
> ### Example:
> /api/v1/orders?order_date_min=2022-05-01&total_max=2022-05-05