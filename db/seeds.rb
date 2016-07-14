a = User.create(full_name: 'jin yao', email: 'jinyao@example.com', password: '123456', password_confirmation: '123456')
b = User.create(full_name: 'mandy', email: 'mandy@example.com', password: '123456', password_confirmation: '123456')

p a.errors
# 5.times do |i|
# 	Question.create(title: "Question #{i + 1}", user_id: a.id)
# end

# 5.times do |i|
# 	Question.create(title: "Question #{i + 6}", user_id: b.id)
# end

# q1 = Question.find(1)
# 2.times do |i|
# 	Answer.create(answer: "Answer #{i + 1}", question_id: q1.id, user_id: b.id)
# end

# q2 = Question.find(6)
# 2.times do |i|
# 	Answer.create(answer: "Answer #{i + 3}", question_id: q2.id, user_id: a.id)
# end