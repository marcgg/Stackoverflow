require "rubygems"
require "httparty"
require "stackoverflow"
require "models/model.rb"

class Stackoverflow::Comment < Stackoverflow::Model
  attr_accessor :body, :creation_date, :post_id, :post_type, :owner_user_id, :score, :owner_display_name, :comment_id
  
  def self.find(id)
    c = Stackoverflow::Comment.new
    so.comment_by_id(id)["comment"].each{ |data| c.send("#{data[0]}=", data[1])}
    c
  end

  # ACCESSORS
  def user
    Stackoverflow::User.find(owner_user_id)
  end
  
  def post
    if post_type == "answer"
      return Stackoverflow::Answer.find(post_id)
    elsif post_type == "question"
      return Stackoverflow::Question.find(post_id)
    end
    nil
  end
  
  # ALIASES
  def id
    self.comment_id
  end
end