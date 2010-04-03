require "rubygems"
require "httparty"
require "stackoverflow"
require "models/model.rb"

class Stackoverflow::Answer < Stackoverflow::Model
  attr_accessor :last_edit_date, :question_id, :body, :up_vote_count, :title, :down_vote_count, :creation_date, :owner_user_id, :community_owned, :answer_id, :score, :owner_display_name, :accepted, :view_count
  
  def self.find(id)
    a = Stackoverflow::Answer.new
    so.answer_by_id(id)["answer"].each{ |data| a.send("#{data[0]}=", data[1])}
    a
  end
  
  def self.find_by_user_id(user_id)
    self.map(so.answers_by_user(user_id)["answers"])
  end
  
  # ACCESSORS
  
  def body
    @body ||= self.class.so.answer_by_id(answer_id, :query => {:body => true})["answer"]["body"]
  end
  
  def user
    Stackoverflow::User.find(owner_user_id)
  end
  
  def answer
    Stackoverflow::Answer.find(answer_id)
  end
  
  def question
    Stackoverflow::Question.find(question_id)
  end
  
  # ALIASES
  def id
    answer_id
  end

end