class FileList

  def self.test : Nil
    puts "foo"
  end

  def initialize(path, @allow_duplicates=false)
    @items = File.read_lines(path)
  end

  def sample : String
    sample(1)[0]
  end

  def sample(i) : Array(String)
    if @allow_duplicates
      @items.sample(i)
    else
      ["TODO"]
    end
  end
end

