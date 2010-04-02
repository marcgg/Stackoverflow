require "rubygems"
require "httparty"
require "stackoverflow"
require "models/model.rb"

class Stackoverflow::User < Stackoverflow::Model
  attr_accessor :display_name, :up_vote_count, :about_me, :location, :accept_rate, :down_vote_count, :creation_date, :question_count, :website_url, :answer_count, :reputation, :user_type, :last_access_date, :email_hash, :user_id, :display_name, :age, :view_count
  
  def self.find(id)
    u = Stackoverflow::User.new
    so.user_by_id(id)["user"].each{ |data| u.send("#{data[0]}=", data[1])}
    u
  end
  
  def self.all
    res = so.users["users"].map do |user|
      u = Stackoverflow::User.new 
      user.each{ |data| u.send("#{data[0]}=", data[1])}
      u
    end
  end
  
  def questions
    Stackoverflow::Question.find_by_user_id(self.user_id)
  end
  
  def id
    self.user_id
  end
end