require "./filelist.cr"
require "./sentence.cr"

class SentenceList
  def initialize(path, allow_duplicates = false)
    @file_list = FileList.new(path, allow_duplicates)
  end

  def sample : Sentence
    sample(1)[0]
  end

  def sample(i) : Array(Sentence)
    @file_list.sample(i).map { |e| Sentence.new(e) }
  end
end
