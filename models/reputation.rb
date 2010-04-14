require "rubygems"
require "httparty"
require "stackoverflow"
require "models/model.rb"

class Stackoverflow::Reputation < Stackoverflow::Model
  attr_accessor :user_id, :title, :positive_rep, :post_id, :on_date, :post_type, :negative_rep
  timestamp :on_date
  
  def self.find_by_user_id(user_id)
    @user_id = user_id
    self.map(so.reputation_for_user(user_id)["repchanges"])
  end

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