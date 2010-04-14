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
require "models/reputation.rb"

so = Stackoverflow.new("speakfriendandenter")

user_id     = 90691
user_name   = "marcgg"
question_id = 2568604
answer_id   = 2568774
from_id     = 90691
to_id       = 97142
comment_id  = 2647214
comment_on_question_id = 2149091
comment_on_answer_id = 2574992

puts "# USING USERS"
user = Stackoverflow::User.find(user_id)
puts Stackoverflow::User.find(user_id).to_yaml
puts Stackoverflow::User.all.to_yaml
puts user.questions.to_yaml
puts user.id

puts "# USING ANSWERS"
answer = Stackoverflow::Answer.find(answer_id)
puts Stackoverflow::Answer.find(answer_id).to_yaml
puts answer.question.to_yaml
puts answer.body.to_yaml
puts answer.creation_date
answer.creation_date = Time.now
puts answer.creation_date
puts answer.id
puts answer.user.to_yaml

puts "# USING QUESTIONS"
question = Stackoverflow::Question.find(question_id)
puts Stackoverflow::Question.find(question_id).to_yaml
puts Stackoverflow::Question.all.to_yaml
puts question.answers.to_yaml
puts question.user.to_yaml
puts question.id

puts "# USING TAGS"
puts Stackoverflow::Tag.all.to_yaml

puts "# USING COMMENTS"
comment = Stackoverflow::Comment.find(comment_id)
comment_on_question = Stackoverflow::Comment.find(comment_on_question_id)
comment_on_answer = Stackoverflow::Comment.find(comment_on_answer_id)
puts Stackoverflow::Comment.find(comment_id).to_yaml
puts comment.user.to_yaml
puts comment.post.to_yaml
puts comment_on_question.post.to_yaml
puts comment_on_answer.post.to_yaml
puts comment.id

puts "# USING REPUTATION"
reputations = Stackoverflow::Reputation.find_by_user_id(user_id)
puts Stackoverflow::Reputation.find_by_user_id(user_id).to_yaml
reputations.each{|r| puts r.post.to_yaml}

puts "# USING STATS"
puts Stackoverflow::Stat.fetch.to_yaml


puts "==========================================================="


puts "##########################################"
puts "#   QUESTIONS METHODS"
puts "##########################################"
puts "# GENERAL"
puts so.questions
puts so.active_questions
puts so.newest_questions
puts so.featured_questions
puts so.hot_questions
puts so.weekly_hot_questions
puts so.monthly_hot_questions
puts so.highest_voted_questions
puts so.unanswered_questions
puts so.newest_unanswered_questions
puts so.unanswered_questions_by_votes

puts "# QUESTIONS CREATED BY A SPECIFIC USER"
puts so.user_questions(user_id).to_yaml
puts so.user_recent_questions(user_id).to_yaml
puts so.user_questions_by_views(user_id).to_yaml
puts so.user_newest_questions(user_id).to_yaml
puts so.user_questions_by_votes(user_id).to_yaml

puts "# QUESTIONS MARKED AS FAVORITE BY A SPECIFIC USER"
puts so.user_favorites(user_id).to_yaml
puts so.user_recent_favorites(user_id).to_yaml
puts so.user_favorites_by_views(user_id).to_yaml
puts so.user_newest_favorites(user_id).to_yaml

puts "# QUESTION TIMELINE"
puts so.question_timeline(user_id).to_yaml

puts "# SINGLE QUESTION"
puts so.question_by_id(question_id).to_yaml
puts so.question_by_id(question_id, :query => {:body => true}).to_yaml

puts "##########################################"
puts "#   USERS METHODS"
puts "##########################################"
puts "# GENERAL"
puts so.users
puts so.user_by_id(user_id).to_yaml
puts so.users_by_reputation
puts so.newest_users
puts so.users_by_name.to_yaml
puts so.users_by_name(:query => {:filter => user_name}).to_yaml
puts so.users_by_name(:query => {:pagesize => 10}).to_yaml
puts so.users_by_name(:query => {:pagesize => 10, :page => 3}).to_yaml

puts "# MENTIONS"
puts so.user_mentions(user_id).to_yaml

puts "##########################################"
puts  "BADGES METHODS"
puts "##########################################"
puts "GENERAL"
puts so.badges
puts so.badges_by_name
puts so.tags_badges
puts so.badges_for_user_id(user_id).to_yaml
puts so.badges

puts "##########################################"
puts "#   TAGS METHODS"
puts "##########################################"
puts "# GENERAL"
puts so.tags.to_yaml
puts so.popular_tags
puts so.tags_by_name
puts so.recent_tags
puts so.tags_for_user(user_id).to_yaml
puts so.popular_tags(:query => {:pagesize => 5}).to_yaml
puts so.popular_tags(:query => {:pagesize => 5, :page => 10}).to_yaml


puts "##########################################"
puts "#   ANSWERS METHODS"
puts "##########################################"
puts "# GENERAL"
puts so.answers_by_user(user_id).to_yaml
puts so.recent_answers_by_user(user_id).to_yaml
puts so.answers_by_user_by_views(user_id).to_yaml
puts so.newest_answers_by_user(user_id).to_yaml
puts so.answers_by_user_by_votes(user_id).to_yaml

puts "# SINGLE ANSWER"
answer = so.answer_by_id(answer_id)
puts so.answer_by_id(answer_id).to_yaml
puts so.answer_by_id(answer_id, :query => {:body => true}).to_yaml


puts "##########################################"
puts "#   COMMENTS METHODS"
puts "##########################################"
puts "# GENERAL"
puts "# Comments created by a specific user"
puts so.comments_by_user(user_id).to_yaml
puts so.recent_comments_by_user(user_id).to_yaml
puts so.comments_by_user_by_score(user_id).to_yaml

puts "# Comments created by a specific user {id} directed at {toid}:"
puts so.comments_by_user_directed_to(from_id, to_id).to_yaml
puts so.recent_comments_by_user_directed_to(from_id, to_id).to_yaml
puts so.comments_by_user_directed_to_by_score(from_id, to_id).to_yaml

puts "# Single Comment Method"
puts so.comment_by_id(comment_id).to_yaml

puts "#########################################"
puts "#  REPUTATION METHODS"
puts "#########################################"
puts so.reputation_for_user(user_id).to_yaml

puts "##########################################"
puts "#   STATS METHODS"
puts "##########################################"
puts so.stats.to_yaml

