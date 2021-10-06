class Sentence
  def initialize(@text : String)
  end

  def substitue(category_set : Hash(String, FileList)) : String
    # Create a mapping each each variable category
    variables = {} of String => String
    @text.scan(/(?<=%)(\?.+?)(?=%)/) do |x|
      s = x[1]
      variables[s] = category_set.keys.sample unless variables.has_key?(s)
    end

    # Perform substitution
    @text.gsub(/%.+?%/) do |x|
      x = (x[0] == '%' ? x[1, x.size - 2] : x)
      index = variables.fetch(x, x)
      category_set[index].sample
    end
  end
end
