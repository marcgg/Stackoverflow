require "rubygems"
require "httparty"
require "stackoverflow"
require "models/model.rb"
require "models/user.rb"

class Stackoverflow::Question < Stackoverflow::Model
  attr_accessor :bounty_closes_date, :bounty_amount, :answers, :question_id, :last_edit_date, :up_vote_count, :last_activity_date, :title, :down_vote_count, :creation_date, :favorite_count, :answer_count, :tags, :owner_user_id, :community_owned, :score, :accepted_answer_id, :owner_display_name, :view_count
  alias_method :id, :question_id
  alias_method :user_id, :owner_user_id

  def self.find(id)
    q = Stackoverflow::Question.new
    so.question_by_id(id)["questions"][0].each{ |data| q.send("#{data[0]}=", data[1])}
    q
  end
  
  def self.all
    self.map(so.questions["questions"])
  end
  
  def self.find_by_user_id(user_id)
    self.map(so.user_questions(user_id)["questions"])
  end
  
  # ACCESSORS
  def user
    Stackoverflow::User.find(owner_user_id)
  end
  
  def last_activity_date=(date)
    @last_activity_date = ((date.class == Time)? date : Time.at(date)) 
  end
  
  def last_edit_date=(date)
    @last_edit_date = ((date.class == Time)? date : Time.at(date)) 
  end
  
  def creation_date=(date)
    @creation_date = ((date.class == Time)? date : Time.at(date)) 
  end
  
  private
  
  def answers=(json)
    @answers = json.map do |answer|
      a = Stackoverflow::Answer.new 
      answer.each{ |data| a.send("#{data[0]}=", data[1])}
      a
    end
  end
  
  # todo: answers
  # todo: tags
end