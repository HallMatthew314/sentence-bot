class FileList

  def self.test : Nil
    puts "foo"
  end

  def initialize(path)
    @items = File.read_lines(path)
  end

  def sample(i, allow_duplicates=False) : Array(String)
    if allow_duplicates
      @items.sample(i)
    else
      [] of String
    end
  end
end

