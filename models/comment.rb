require "rubygems"
require "httparty"
require "stackoverflow"
require "models/model.rb"

class Stackoverflow::Comment < Stackoverflow::Model
  attr_accessor :body, :creation_date, :post_id, :post_type, :owner_user_id, :score, :owner_display_name, :comment_id
  alias_method :id, :comment_id
  alias_method :user_id, :owner_user_id
  findable!
  belongs_to :user
  timestamp :creation_date
  
  # ACCESSORS
  
  def post
    if post_type == "answer"
      return Stackoverflow::Answer.find(post_id)
    elsif post_type == "question"
      return Stackoverflow::Question.find(post_id)
    end
    nil
  end
  
end