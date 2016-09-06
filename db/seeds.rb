# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.all

2.times { User.create(email: Faker::Internet.email, password: '123456') }
3.times { Question.create( user: users.sample, title: Faker::Hipster.sentence + 'What should i do?', content: Faker::Hipster.paragraph ) }
6.times { Answer.create(user: users.sample, question: Question.all.sample, content: Faker::Hipster.paragraph  ) }
5.times { Note.create(user: users.sample, answer: Answer.all.sample, content: Faker::ChuckNorris.fact, agreement: true )}
