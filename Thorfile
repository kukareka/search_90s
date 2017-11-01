class Default < Thor
  desc "search [QUERY]", "Perform search"
  def search(query)
    require File.expand_path('config/environment.rb')

    benchmark = Benchmark.measure do
      DocumentQuery.new(query).results.find_each do |document|
        document.decorate.print
      end
    end

    puts "Search benchmark: #{benchmark}"
  end
end