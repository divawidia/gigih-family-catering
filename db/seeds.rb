# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
customers = Customer.create([
    {
        email: "user1@gmail.com"
    },
    {
        email: "wiartha@gmail.com"
    }
])

menus = Menu.create([
    {
        name: "Nasi Goreng",
        price: "10000",
        description: "Nasi goreng is a Southeast Asian fried rice dish, usually cooked with pieces of meat and vegetables."
    },
    {
        name: "Teh manis",
        price: "5000",
        description: "Teh Manis is a beverage made from a sweetened tea solution, usually cane sugar, before the drink is ready to be served."
    }
])

categories = Category.create([
    {
        category_name: "Main Dishes"
    },
    {
        category_name: "Asians"
    },
    {
        category_name: "Baverages"
    },
    {
        category_name: "Cooked Grains"
    }
])

menus_categories = MenusCategory.create([
    {
        menu: menus.first,
        category: categories.first
    }
])