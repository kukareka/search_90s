# A very simple and naive tokenizer. Would be great to extend it at least with some stemmer.

class Tokenizer < Struct.new(:text)
  def tokens
    text.present? ? text.split(/\W+/).map(&:downcase) : []
  end
end
