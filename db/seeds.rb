# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

users = User.create!([
                       { name: 'Michael', surname: 'Petrov' },
                       { name: 'Sergey', surname: 'Ivanov' },
                       { name: 'Ilya', surname: 'Sergeev' },
                       { name: 'Maria', surname: 'Petrova' }
                     ])

categories = Category.create!([
                                { id: 0, title: 'Simple' },
                                { id: 1, title: 'Intermediate' },
                                { id: 2, title: 'Complex' }
                              ])

tests = Test.create!([
                       { title: 'Logical operations', level: 1, category_id: categories[1].id },
                       { title: 'Information and information processes', category_id: categories[0].id },
                       { title: 'Input devices', category_id: categories[0].id },
                       { title: 'Computer networks', level: 1, category_id: categories[1].id }
                     ])
questions = Question.create!([
                               { body: 'Which scientist developed the basics of logic algebra?',
                                 test_id: tests[0].id },
                               { body: 'What operation is called "disjunction"?',
                                 test_id: tests[0].id },
                               { body: 'What is the name of the operation corresponding to "if and only if" statement?',
                                 test_id: tests[0].id },
                               { body: 'What is the name of the operation corresponding to "if ... then" statement?',
                                 test_id: tests[0].id },

                               { body: 'What does computer science study?',
                                 test_id: tests[1].id },
                               { body: 'Mark the types of information which a computer cannot process yet.',
                                 test_id: tests[1].id },
                               { body: 'Select processes that can be called information processing.',
                                 test_id: tests[1].id },
                               { body: 'Which phrase can serve as the definition of sorting?',
                                 test_id: tests[1].id },

                               { body: 'Which data exchange method is used when typing from a keyboard?',
                                 test_id: tests[2].id },
                               { body: 'What units is the resolution of an optical mouse sensor usually measured in?',
                                 test_id: tests[2].id },
                               { body: 'Select minimum resolution of a scanner sufficient to recognize scanned text.',
                                 test_id: tests[2].id },
                               { body: 'What is needed to enter audio into the computer?',
                                 test_id: tests[2].id },

                               { body: 'Mark the means by which data can be transmitted in a computer network.',
                                 test_id: tests[3].id },
                               { body: 'What is needed to connect computers to a local network?',
                                 test_id: tests[3].id },
                               { body: 'What tasks are assigned to the system administrator?',
                                 test_id: tests[3].id },
                               { body: 'What benefits do we get by connecting computers to a network?',
                                 test_id: tests[3].id }
                             ])

answers = Answer.create!([
                           # 'Logical operations'
                           { body: 'Louis Pasteur', value: 0, correct: false, question_id: questions[0].id },
                           { body: 'George Boole', value: 1, correct: true, question_id: questions[0].id },
                           { body: 'Claude Shannon', value: 0, correct: false, question_id: questions[0].id },

                           { body: 'AND', value: 0, question_id: questions[1].id },
                           { body: 'NOT', value: 0, question_id: questions[1].id },
                           { body: 'OR', value: 1, correct: true, question_id: questions[1].id },

                           { body: 'equivalence', value: 1, correct: true, question_id: questions[2].id },
                           { body: 'disjunction', value: 0, question_id: questions[2].id },
                           { body: 'implication', value: 0, question_id: questions[2].id },

                           { body: 'disjunction', value: 0, question_id: questions[3].id },
                           { body: 'implication', value: 1, correct: true, question_id: questions[3].id },
                           { body: 'equivalence', value: 0, question_id: questions[3].id },

                           # 'Information and information processes'
                           { body: 'any processes and phenomena related to information',
                             value: 0.5, correct: true, question_id: questions[4].id },
                           { body: 'computer programming', value: 0.5, correct: true, question_id: questions[4].id },
                           { body: 'interrelation of phenomena in nature', value: 0, question_id: questions[4].id },

                           { body: 'smell', value: 0.5, correct: true, question_id: questions[5].id },
                           { body: 'taste', value: 0.5, correct: true, question_id: questions[5].id },
                           { body: 'human speech', value: 0, question_id: questions[5].id },

                           { body: 'encryption', value: 1, correct: true, question_id: questions[6].id },
                           { body: 'information transition', value: 0, question_id: questions[6].id },
                           { body: 'data storage', value: 0, question_id: questions[6].id },

                           { body: 'selecting the necessary elements', value: 0, question_id: questions[7].id },
                           { body: 'arranging the list items in the specified order',
                             value: 1, correct: true, question_id: questions[7].id },
                           { body: 'changing the order of elements', value: 0, question_id: questions[7].id },

                           # 'Input devices'
                           { body: 'software-controlled data exchange', value: 0, question_id: questions[8].id },
                           { body: 'exchange by interrupts', value: 1, correct: true, question_id: questions[8].id },
                           { body: 'direct memory access', value: 0, question_id: questions[8].id },

                           { body: 'dots per inch (dpi)', value: 1, correct: true, question_id: questions[9].id },
                           { body: 'pixels per inch (ppi)', value: 0, question_id: questions[9].id },
                           { body: 'dots per centimeter', value: 0, question_id: questions[9].id },

                           { body: '200 ppi', value: 0, question_id: questions[10].id },
                           { body: '300 ppi', value: 1, correct: true, question_id: questions[10].id },
                           { body: '600 ppi', value: 0, question_id: questions[10].id },

                           { body: 'sound card', value: 0.5, correct: true, question_id: questions[11].id },
                           { body: 'high-speed processor', value: 0, question_id: questions[11].id },
                           { body: 'microphone', value: 0.5, correct: true, question_id: questions[11].id },

                           # 'Computer networks'
                           { body: 'radio waves', value: 0.5, correct: true, question_id: questions[12].id },
                           { body: 'telephone communication channels',
                             value: 0.5, correct: true, question_id: questions[12].id },
                           { body: 'air', value: 0, question_id: questions[12].id },

                           { body: 'network devices on each computer',
                             value: 1, correct: true, question_id: questions[13].id },
                           { body: 'network data exchange software',
                             value: 0.5, correct: true, question_id: questions[13].id },
                           { body: 'availability of a dedicated server computer',
                             value: 0, question_id: questions[13].id },

                           { body: 'user rights differentiation',
                             value: 0.5, correct: true, question_id: questions[14].id },
                           { body: 'software development', value: 0, question_id: questions[14].id },
                           { body: 'data backup', value: 0.5, correct: true, question_id: questions[14].id },

                           { body: 'sharing external devices',
                             value: 0.5, correct: true, question_id: questions[15].id },
                           { body: 'data protection enhancement', value: 0, question_id: questions[15].id },
                           { body: 'data exchange simplification',
                             value: 0.5, correct: true, question_id: questions[15].id }
                         ])

# TestsUsers.create!([
#                      { user_id: 1, test_id: 1, score: 10, date: '2021-10-08' },
#                      { user_id: 1, test_id: 2, score: 8.5, date: '2021-10-18' },
#                      { user_id: 1, test_id: 3, score: 4.25, date: '2021-10-20' },
#                      { user_id: 2, test_id: 1, score: 10, date: '2021-10-11' },
#                      { user_id: 2, test_id: 2, score: 6, date: '2022-01-10' },
#                      { user_id: 1, test_id: 4, score: 8, date: '2022-01-21' },
#                      { user_id: 2, test_id: 4, score: 6, date: '2022-01-24' }
#                    ])
