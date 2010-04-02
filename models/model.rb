class Stackoverflow::Model
  def self.so
    so = Stackoverflow.new("knockknock")
  end
  
  def self.map(data)
    res = data.map do |entry_data|
      entry = self.new 
      entry_data.each{ |data| entry.send("#{data[0]}=", data[1])}
      entry
    end
  end
  
end