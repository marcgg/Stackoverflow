class Stackoverflow::Model
  def self.so
    so = Stackoverflow.new("knockknock")
  end
  
  def self.map(data)
    res = so.tags["tags"].map do |tag|
      t = self.new 
      tag.each{ |data| t.send("#{data[0]}=", data[1])}
      t
    end
  end
end