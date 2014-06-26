require 'faker'

20.times { User.create(username: Faker::Internet.user_name, email: Faker::Internet.email, password: "password")}

categories = ["Arrays", "Hashes", "OOP", "Parsing", "API", "methods", "recursion", "Sinatra", "iteration", "Nokogiri" ]

categories.each do |category|
  Category.create(title: category)
end

User.all.each do |user|
  5.times {user.questions <<Question.create(category_id: (rand(10) + 1) , title: Faker::Lorem.word, content: Faker::Lorem.paragraph)}
end



20.times {Answer.create(question_id: (rand(20) + 1) , content: Faker::Lorem.paragraph, user_id: (rand(20) +1) )}




20.times {Comment.create(parent_type: "Question", parent_id: rand((20)+1), user_id: (rand(20) + 1)) }



20.times {Comment.create(parent_type: "Answer", parent_id: rand((20)+1), user_id: (rand(20) + 1),content:Faker::Lorem.paragraph ) }
