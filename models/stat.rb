require "rubygems"
require "httparty"
require "stackoverflow"
require "models/model.rb"

class Stackoverflow::Stat < Stackoverflow::Model
  attr_accessor :total_badges, :total_votes, :answers_per_minute, :total_users, :total_comments, :total_answers, :badges_per_minute, :total_questions, :questions_per_minute, :api_version, :total_unanswered
  
  def self.fetch
    s = Stackoverflow::Stat.new
    so.stats["stats"].each{ |data| s.send("#{data[0]}=", data[1])}
    s  
  end
end