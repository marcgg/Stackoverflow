require "rubygems"
require "httparty"

# #
# http://dev.meta.stackoverflow.com/questions/34594/overall-api-method-list
# #

class Stackoverflow  
  include HTTParty
  base_uri "http://api.stackoverflow.com/0.5/"
  default_params :output => "json"
  format :json

  def initialize(key, version="")
    self.class.default_params :key => key
  end
  
  ##########################################
  #   QUESTIONS METHODS
  ##########################################
  # GENERAL
  def questions(options={})
    self.class.get("/questions", options)
  end

  def active_questions(options={})
    self.class.get("/questions/active", options)
  end
  
  def newest_questions(options={})
    self.class.get("/questions/newest", options)
  end
  
  def featured_questions(options={})
    self.class.get("/questions/featured", options)
  end
  
  def hot_questions(options={})
    self.class.get("/questions/hot", options)
  end
  
  def weekly_hot_questions(options={})
    self.class.get("/questions/week", options)
  end

  def monthly_hot_questions(options={})
    self.class.get("/questions/month", options)
  end
  
  def highest_voted_questions(options={})
    self.class.get("/questions/votes", options)
  end
  
  def unanswered_questions(options={})
    self.class.get("/questions/unanswered", options)
  end
  
  def newest_unanswered_questions(options={})
    self.class.get("/questions/unanswered/newest", options)
  end
  
  def unanswered_questions_by_votes(options={})
    self.class.get("/questions/unanswered/votes", options)
  end
  
  # QUESTIONS CREATED BY A SPECIFIC USER
  def user_questions(user_id, options={})
    self.class.get("/users/#{user_id}/questions", options)
  end
  
  def user_recent_questions(user_id, options={})
    self.class.get("/users/#{user_id}/questions/recent", options)
  end
  
  def user_questions_by_views(user_id, options={})
    self.class.get("/users/#{user_id}/questions/views", options)
  end
  
  def user_newest_questions(user_id, options={})
    self.class.get("/users/#{user_id}/questions/newest", options)
  end
  
  def user_questions_by_votes(user_id, options={})
    self.class.get("/users/#{user_id}/questions/votes", options)
  end
  
  # QUESTIONS MARKED AS FAVORITE BY A SPECIFIC USER
  def user_favorites(user_id, options={})
    self.class.get("/users/#{user_id}/favorites", options)
  end
  
  def user_recent_favorites(user_id, options={})
    self.class.get("/users/#{user_id}/favorites/recent", options)
  end
  
  def user_favorites_by_views(user_id, options={})
    self.class.get("/users/#{user_id}/favorites/views", options)
  end
  
  def user_newest_favorites(user_id, options={})
    self.class.get("/users/#{user_id}/favorites/newest", options)
  end
  
  def user_ordered_favorites(user_id, options={})
    self.class.get("/users/#{user_id}/favorites/added", options)
  end
  
  # QUESTION TIMELINE
  def question_timeline(question_id, options={})
    self.class.get("/questions/#{question_id}/timeline", options)
  end
  
  # SINGLE QUESTION
  def question_by_id(question_id, options={})
    self.class.get("/questions/#{question_id}", options)
  end

  ##########################################
  #   USERS METHODS
  ##########################################
  # GENERAL
  def users(options={})
    self.class.get("/users", options)
  end
  
  def user_by_id(user_id, options={})
    self.class.get("/users/#{user_id}", options)
  end

  def users_by_reputation(options={})
    self.class.get("/users/reputation", options)
  end

  def newest_users(options={})
    self.class.get("/users/newest", options)
  end

  def oldest_users(options={})
    self.class.get("/users/oldest", options)
  end

  def users_by_name(options={})
    self.class.get("/users/name", options)
  end

  # MENTIONS
  def user_mentions(user_id,options={})
    self.class.get("/users/#{user_id}/mentioned", options)
  end
  
  ##########################################
  #   BADGES METHODS
  ##########################################
  # GENERAL
  def badges(options={})
    self.class.get("/badges", options)
  end
  
  def badges_by_name(options={})
    self.class.get("/badges/name", options)
  end

  def tags_badges(options={})
    self.class.get("/badges/tags", options)
  end

  def badges_for_user_id(user_id, options={})
    self.class.get("/users/#{user_id}/badges", options)
  end
  
  ##########################################
  #   TAGS METHODS
  ##########################################
  # GENERAL
  def tags(options={})
    self.class.get("/tags", options)
  end
  
  def popular_tags(options={})
    self.class.get("/tags/popular", options)
  end

  def tags_by_name(options={})
    self.class.get("/tags/name", options)
  end

  def recent_tags(options={})
    self.class.get("/tags/recent", options)
  end
  
  def tags_for_user(user_id, options={})
    self.class.get("/user/#{user_id}/tag", options)
  end
  
  ##########################################
  #   ANSWERS METHODS
  ##########################################
  # GENERAL
  def answers_by_user(user_id,options={})
    self.class.get("/users/#{user_id}/answers", options)
  end
  
  def recent_answers_by_user(user_id, options={})
    self.class.get("/users/#{user_id}/answers/recent", options)
  end

  def answers_by_user_by_views(user_id, options={})
    self.class.get("/users/#{user_id}/answers/views", options)
  end
  
  def newest_answers_by_user(user_id, options={})
    self.class.get("/users/#{user_id}/answers/newest", options)
  end
  
  def answers_by_user_by_votes(user_id, options={})
    self.class.get("/users/#{user_id}/answers/votes", options)
  end
  
  # SINGLE ANSWER
  def answer_by_id(user_id, options={})
    self.class.get("/answers/#{user_id}", options)
  end
  ##########################################
  #   COMMENTS METHODS
  ##########################################
  # GENERAL
  # Comments created by a specific user
  def comments_by_user(user_id, options={})
    self.class.get("/users/#{user_id}/comments", options)
  end
  
  def recent_comments_by_user(user_id, options={})
    self.class.get("/users/#{user_id}/comments/recent", options)
  end
  
  def comments_by_user_by_score(user_id, options={})
    self.class.get("/users/#{user_id}/comments/score", options)
  end

  # Comments created by a specific user {id} directed at {toid}:
  def comments_by_user_directed_to(from_id, to_id, options={})
    self.class.get("/users/#{from_id}/comments/#{to_id}", options)
  end
  
  def recent_comments_by_user_directed_to(from_id, to_id, options={})
    self.class.get("/users/#{from_id}/comments/#{to_id}/recent", options)
  end
  
  def comments_by_user_directed_to_by_score(from_id, to_id, options={})
    self.class.get("/users/#{from_id}/comments/#{to_id}/score", options)
  end
  
  # Single Comment Method - Topic Here
  def comment_by_id(comment_id, options={})
    self.class.get("/comments/#{comment_id}", options)
  end
  
  ##########################################
  #   STATS METHODS
  ##########################################
  def stats
    self.class.get("/stats")
  end
  
end