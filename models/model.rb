require "ActiveSupport"

class Stackoverflow::Model
  
  @@stackoverflow = nil
  
  def self.so
    @@stackoverflow ||= Stackoverflow.new("speakfriendandenter")
  end
  
  def self.findable!
    class << self
      define_method(:find) do |id|
        obj = self.new
        so.send("#{self.to_s.demodulize.downcase}_by_id", id)[self.to_s.demodulize.downcase.pluralize][0].each{ |data| obj.send("#{data[0]}=", data[1])}
        obj
      end
    end  
  end
  
  def self.map(data)
    res = data.map do |entry_data|
      entry = self.new 
      entry_data.each{ |data| entry.send("#{data[0]}=", data[1])}
      entry
    end
  end
  
end