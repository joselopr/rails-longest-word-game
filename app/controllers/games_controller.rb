require 'json'

class GamesController < ApplicationController
  def new
    @letters = []
    10.times { @letters << ('A'..'Z').to_a.sample }
  end

  def score
    word_letters = params[world].upcase.split('')
    word.letters.each do |word_letter|
      if word_letters.count(word_letter) > @letters.count(word_letter)
        @score = "sorry but #{word_letters.uppercase} cant be built out of #{letters.join(', ')}";
      elsif dictionary?(@word) == false;
        @score = "sorry but #{word_letters.uppercase} dont seems to be a valid Enlgish word..";
      else
        @score = "Congratulation! #{word_letters.uppercase} is a valid word!"
      end
    end
  end
  def dictionary?(word)
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    serialized_words = File.read(url)

    words = json.parse(serialized_words)
    words['found']
  end
end
