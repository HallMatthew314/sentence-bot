# TODO: Write documentation for `SentenceBot`

require "option_parser"
require "./sentence_list.cr"
require "./file_list.cr"

module SentenceBot
  VERSION = "0.1.0"

  def self.main
    sentence_count = 1

    parser = OptionParser.parse do |parser|
      parser.banner = "Usage: sentence-bot [OPTIONS] [source-directory]"
      parser.on("-n", "--sentences=SENTENCES", "Set the number of sentences to generate. Only generates 1 by default.") do |n|
        sentence_count = n.to_i
        if sentence_count < 1
          STDERR.puts("Number of sentences must be an integer greater than zero.")
          exit(1)
        end
      end
      parser.on("-h", "--help", "Show this help") do
        puts parser
        exit
      end
      parser.invalid_option do |flag|
        STDERR.print("Invalid option: ")
        STDERR.puts(flag)
        STDERR.puts(parser)
        exit(1)
      end
    end

    parser.parse

    if ARGV.empty?
      STDERR.puts("No source directory given.")
      STDERR.puts(parser)
      exit(1)
    end

    # Load sentences and words
    data_dir_path = Path.new(ARGV[0])
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
      STDERR.puts("Couldn't find 'sentences.txt'")
      exit(1)
    end

    # Take one at random
    s_list = sentences.sample(sentence_count)

    # Substitute every tag with a random string in that category
    s_modified = s_list.map { |s| s.substitue(categories) }

    # Print to STDOUT
    s_modified.each { |s| puts s }
  end
end

SentenceBot.main
