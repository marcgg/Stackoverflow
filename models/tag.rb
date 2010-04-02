require "rubygems"
require "httparty"
require "stackoverflow"
require "models/model.rb"

class Stackoverflow::Tag < Stackoverflow::Model
  attr_accessor :name, :count
  
  def self.all
    self.map(so.tags["tags"])
  end

  
  def id
    self.user_id
  end
end