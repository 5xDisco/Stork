# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# users = User.create([{email: 'mobydick@example.com', encrypted_password: '123456789'}, {email: 'cruelshoes@example.com', encrypted_password: '123456789'}])

users = User.create([{email: '123@example.com', password: '123456789', password_confirmation: '123456789'}, {email: '456@example.com', password: '123456789', password_confirmation: '123456789'}])
