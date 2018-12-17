# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Cart.destroy_all
#
# testuser = User.create!(username: "test1user", password_digest:BCrypt::Password.create('password'), name: "steven")
# testuser2 = User.create!(username: "test2user", password_digest:BCrypt::Password.create('password'), name: "steven2")
#
# cart1 = Cart.create!(name: "testcart", quantity: 2, total_price: 15, ordered: false, user: testuser)
# cart2 = Cart.create!(name: "testcart2", quantity: 1, total_price: 5, ordered: false, user: testuser2)

product1 = Product.create(name: "coffee1", title: "coffee1", description: "coffedesc", price: 10, quantity: 10 )
product1 = Product.create(name: "coffee2", title: "coffee2", description: "coffedesc", price: 20, quantity: 20 )
product1 = Product.create(name: "Stevens Coffee", title: "Best Coffee", description: "100% Colombian", price: 100, quantity: 100, sku: 1234, cost: 5, weight: 10, seller_id: 1 )
