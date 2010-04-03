require 'rubygems'
require 'httparty'
require "stackoverflow.rb"
require "pp"
require "models/user.rb"
require "models/question.rb"
require "models/answer.rb"
require "models/tag.rb"
require "models/comment.rb"

so = Stackoverflow.new("knockknock")

user_id     = 90691
user_name   = "marcgg"

user = Stackoverflow::User.find(user_id)

puts "============================================================"
puts "#{user.display_name.upcase}"
puts "#{user.about_me}"
puts "Reputation: (#{user.reputation} rep)"
puts "Questions count: #{user.questions.size}"
puts "Answers count: #{user.answers.size}"
puts ""
puts "RECENT ANSWER:"
puts "#{user.answers.first.title}"
puts ""
puts "RECENT QUESTION:"
puts "#{user.questions.first.title}"
puts "============================================================"