# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Seeding..."

Expense.destroy_all
User.destroy_all

u1 = User.create(username: "Sara", password: "sara123")
u2 = User.create(username: "Max", password: "max123")
u3 = User.create(username: "Vera", password: "vera123")

e1 = u1.expenses.create(name:"salary", amount: "5000")
e2 = u1.expenses.create(name:"utilities", amount: "300")
e3 =  u1.expenses.create(name:"transportation", amount: "100")


e1 = u2.expenses.create(name:"salary", amount: "6000")
e2 = u2.expenses.create(name:"utilities", amount: "200")
e3 =  u2.expenses.create(name:"transportation", amount: "300")

e1 = u3.expenses.create(name:"salary", amount: "8000")
e2 = u3.expenses.create(name:"utilities", amount: "500")
e3 =  u3.expenses.create(name:"transportation", amount: "1000")

puts "Seeding complete!"