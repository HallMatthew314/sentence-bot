# TODO: Write documentation for `SentenceBot`

require "./sentencelist.cr"

module SentenceBot
  VERSION = "0.1.0"

  def self.main
    data_dir_path = Path.new("test_data")
    data_dir = Dir.new(data_dir_path)
    sentences = nil
    categories = {} of String => FileList

    data_dir.each_child do |e|
      if e == "sentences.txt"
        sentences = SentenceList.new(data_dir_path / "sentences.txt")
      elsif e =~ /\.txt$/
        categories[e[0, e.size - 4]] = FileList.new(data_dir_path / e)
      end
    end

    if sentences.nil?
      STDERR.print("Couldn't find 'sentences.txt'\n")
      exit(1)
    end

    # # Take one at random
    # s = sentences.sample

    # # Substitute every tag with a random string in that category
    # s_modified = s

    # # Print to STDOUT
    # puts s_modified
  end
end

SentenceBot.main
