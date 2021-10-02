class Sentence
  def initialize(@text : String)
  end

  def substitue(category_set : Hash(String, FileList)) : String
    @text.gsub(/%(.+?)%/) { |x| category_set[x[1, x.size - 2]].sample }
  end
end
