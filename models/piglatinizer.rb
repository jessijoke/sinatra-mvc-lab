class PigLatinizer

    def piglatinize(input_str)
      input_str.split(" ").map{ |word| piglatinize_word(word)}.join(" ")
    end
  
    private
  
    def vowel?(char)
      char.match(/[aAeEiIoOuU]/)
    end
  
    def piglatinize_word(word)
      # word starts with vowel
      if vowel?(word[0])
        word + "way"
      else
      # word starts with one or more consonants
        vowel_index = word.index(/[aAeEiIoOuU]/)
        consonants = word.slice(0..vowel_index-1)
        word_leftover = word.slice(vowel_index..word.length)
        word_leftover + consonants + "ay"
      end
    end
  
  end



=begin
class PigLatinizer
    attr_accessor :text

    def initialize(text)
        @text = text.downcase
        if @text.split.size > 1
            piglatin_word
        else
            piglatin_sentence
        end
    end

    def wordsplit
        @split_word = @text.split(" ")
    end

    def piglatin_word
        vowels = ["a", "e", "i", "o", "u"]
        blends = ["bl", "br", "cl", "cr", "dr", "fr", "th", "tr", "fl", "gl", "gr", "pl", "pr", "sl", "sm", "sp", "st"]

        if vowels.include?(@text[0])
            newword = (@text + "way")
            pl_array << newword
        elsif blends.include?(@text[0..1])#begins with blend
            newword = (@text + @text[0..1] + "ay")
            newword = newword[2..(newword.length - 1)]
            pl_array << newword
        else #anything else is a single consonant word
            newword = (@text + @text[0] + "ay")
            newword = newword[1..(newword.length - 1)]
            pl_array << newword
        end
    }
    end

    def piglatin_sentence
        vowels = ["a", "e", "i", "o", "u"]
        blends = ["bl", "br", "cl", "cr", "dr", "fr", "th", "tr", "fl", "gl", "gr", "pl", "pr", "sl", "sm", "sp", "st"]
        pl_array = []

        @split_word.each { |word|
            if vowels.include?(word[0])
                newword = (word + "way")
                pl_array << newword
            elsif blends.include?(word[0..1])#begins with blend
                newword = (word + word[0..1] + "ay")
                newword = newword[2..(newword.length - 1)]
                pl_array << newword
            else #anything else is a single consonant word
                newword = (word + word[0] + "ay")
                newword = newword[1..(newword.length - 1)]
                pl_array << newword
            end
        }

        pl_array.join(" ").strip
    end
end
=end