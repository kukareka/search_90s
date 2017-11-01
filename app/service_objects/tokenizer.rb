class Tokenizer < Struct.new(:text)
  def tokens
    text.nil? ? [] : text.split(/\W/).map(&:downcase)
  end
end