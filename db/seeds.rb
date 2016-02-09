# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
include RandomData

5.times do
  user = User.create!(
    name:     RandomData.random_name,
    email:    RandomData.random_email,
    password: RandomData.random_sentence
    )
end
users = User.all

# Create Topics
15.times do
  Topic.create!(
    name:         RandomData.random_sentence,
    description:  RandomData.random_paragraph
  )
end
topics = Topic.all


50.times do

  Post.create!(
    user:   users.sample,
    topic:  topics.sample,
    title: RandomData.random_sentence,
    body:  RandomData.random_paragraph

  )
end
posts = Post.all

100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

#create questions

100.times do
  Question.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph,
    resolved: false
  )
end

 user = User.first
 user.update_attributes!(
   email: 'michael.demarco65@gmail.com',
   password: 'helloworld'
 )

Post.find_or_create_by(title: "Post title", body: "Post body")

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Question.count} questions created"
