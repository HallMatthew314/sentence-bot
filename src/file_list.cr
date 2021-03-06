class FileList
  @items : Array(String)

  def initialize(path, @allow_duplicates = true)
    @items = File.read_lines(path).reject &.empty?
    @items.shuffle! unless @allow_duplicates
  end

  def sample : String
    sample(1)[0]
  end

  def sample(i) : Array(String)
    if @allow_duplicates
      @items.sample(i)
    else
      @items.shift(i)
    end
  end
end
