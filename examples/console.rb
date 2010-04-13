require 'rubygems'
require 'httparty'
require "stackoverflow.rb"
require "pp"
require "models/user.rb"
require "models/question.rb"
require "models/answer.rb"
require "models/tag.rb"
require "models/comment.rb"
require "models/stat.rb"

so = Stackoverflow.new("speakfriendandenter")

user_id     = 90691
user_name   = "marcgg"

user = Stackoverflow::User.find(user_id)
stats = Stackoverflow::Stat.fetch

puts "============================================================"
puts "#{user.display_name.upcase}"
puts "#{user.about_me}"
puts "Reputation: (#{user.reputation} rep)"
puts "Questions count: #{user.questions.size} / #{stats.total_questions}"
puts "Answers count: #{user.answers.size} / #{stats.total_answers}"
puts ""
puts "RECENT ANSWER:"
puts "#{user.answers.first.title}"
puts ""
puts "RECENT QUESTION:"
puts "#{user.questions.first.title}"
puts "============================================================"