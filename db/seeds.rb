# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([
                       { name: 'Tom', email: 'tom@example.com', first_name: 'Tom', last_name: 'Hanks', password: 'secretus' },
                       { name: 'Adamas', email: 'adamas@example.com', first_name: 'Adamas', last_name: 'Monti', password: 'secretus', type: 'Admin' }
                     ])

categories = Category.create!([
                                { title: 'Frontend' },
                                { title: 'Backend' },
                                { title: 'Machine Learning' }
                              ])

tests = Test.create!([
                       { title: 'HTML', level: 3, category_id: categories[0].id, user_id: users[0].id },
                       { title: 'CSS', level: 2, category_id: categories[0].id, user_id: users[0].id },
                       { title: 'JS', level: 1, category_id: categories[1].id, user_id: users[0].id },
                       { title: 'PHP', level: 1, category_id: categories[1].id, user_id: users[0].id },
                       { title: 'Java', level: 3, category_id: categories[1].id, user_id: users[0].id }
                     ])

questions = Question.create!([
                               { body: 'What do you know about html forms?', test_id: tests[0].id },
                               { body: 'What can you say about margins?', test_id: tests[1].id },
                               { body: 'What do you think about php cookies?', test_id: tests[4].id },
                               { body: 'Is it true JS - the most popular language?', test_id: tests[2].id },
                               { body: 'What java string methods do you know?', test_id: tests[3].id },
                             ])

answers = Answer.create!([
                           { correct: true, body: 'An HTML form is used to collect user input', question_id: questions[0].id },
                           { correct: true, body: 'Margins are used to create space around elements, outside of any defined borders.', question_id: questions[1].id },
                           { correct: true, body: "A cookie is a small file that the server embeds on the user's computer.", question_id: questions[4].id },
                           { correct: true, body: 'This is a difficult question.', question_id: questions[2].id },
                           { correct: true, body: 'I know methods as length(), concat() and charAt().', question_id: questions[3].id }
                         ])





