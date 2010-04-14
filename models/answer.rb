require "rubygems"
require "httparty"
require "stackoverflow"
require "models/model.rb"

class Stackoverflow::Answer < Stackoverflow::Model
  attr_accessor :last_edit_date, :question_id, :body, :up_vote_count, :title, :down_vote_count, :creation_date, :owner_user_id, :community_owned, :answer_id, :score, :owner_display_name, :accepted, :view_count, :last_activity_date
  alias_method :id, :answer_id
  alias_method :user_id, :owner_user_id
  findable!
  belongs_to :user
  belongs_to :question

  def self.find_by_user_id(user_id)
    self.map(so.answers_by_user(user_id)["answers"])
  end
  
  # ACCESSORS
  
  def body
    @body ||= self.class.so.answer_by_id(answer_id, :query => {:body => true})["answers"][0]["body"]
  end
  
  def creation_date=(date)
    @creation_date = ((date.class == Time)? date : Time.at(date)) 
  end
  
  def last_activity_date=(date)
    @last_activity_date = ((date.class == Time)? date : Time.at(date)) 
  end

end