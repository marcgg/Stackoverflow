require "rubygems"
require "httparty"
require "stackoverflow"
require "models/model.rb"

class Stackoverflow::User < Stackoverflow::Model
  attr_accessor :display_name, :up_vote_count, :about_me, :location, :accept_rate, :down_vote_count, :creation_date, :question_count, :website_url, :answer_count, :reputation, :user_type, :last_access_date, :email_hash, :user_id, :display_name, :age, :view_count
  alias_method :id, :user_id
  
  def self.find(id)
    u = Stackoverflow::User.new
    so.user_by_id(id)["users"][0].each{ |data| u.send("#{data[0]}=", data[1])}
    u
  end
  
  def self.all
    self.map(so.users["users"])
  end
  
  def questions
    Stackoverflow::Question.find_by_user_id(self.user_id)
  end
  
  def answers
    Stackoverflow::Answer.find_by_user_id(self.user_id)
  end
  
  def creation_date=(date)
    @creation_date = ((date.class == Time)? date : Time.at(date)) 
  end

end