class User < Document
  private

  def fields_for_index
    [
        {
            text: metadata['name'],
            score: 1.0
        }
    ]
  end
end
