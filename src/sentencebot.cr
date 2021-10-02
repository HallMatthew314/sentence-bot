# TODO: Write documentation for `SentenceBot`

require "./filelist.cr"

module SentenceBot
  VERSION = "0.1.0"

  def self.main
    FileList.test

    # Get list of sentences
    sentences = FileList.new("test_data/sentences.txt", true)

    # Take one at random
    s = sentences.sample

    # Substitute every tag with a random string in that category
    s_modified = s

    # Print to STDOUT
    puts s_modified
  end
end

SentenceBot.main

