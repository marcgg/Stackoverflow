require "rubygems"
require "httparty"
require "stackoverflow"
require "models/model.rb"

class Stackoverflow::Reputation < Stackoverflow::Model
  attr_accessor :title, :positive_rep, :post_id, :on_date, :post_type, :negative_rep
    
  def self.find_by_user_id(user_id)
    self.map(so.reputation_by_user(user_id)["reputations"])
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
  
  def on_date=(date)
    @on_date = ((date.class == Time)? date : Time.at(date)) 
  end
  
end