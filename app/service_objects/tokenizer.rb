# A very simple and naive tokenizer.

class Tokenizer < Struct.new(:text)
  def tokens
    text.present? ? text.split(/\W+/).map(&:downcase) : []
  end
end
