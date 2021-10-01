# TODO: Write documentation for `SentenceBot`

require "./filelist.cr"

module SentenceBot
  VERSION = "0.1.0"

  def self.main
    FileList.test

    # Get list of sentences
    # Take one at random
    # Substitute every tag with a random string in that category
    # Print to STDOUT
  end
end

SentenceBot.main

