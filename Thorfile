class Default < Thor
  desc "search [QUERY] -t [TYPES]", "Perform search"
  method_option :types, type: :array, aliases: '-t'
  def search(query)
    require File.expand_path('config/environment.rb')

    benchmark = Benchmark.measure do
      DocumentQuery.new(query, options[:types]).results.find_each do |document|
        document.decorate.print
      end
    end

    puts "Search benchmark: #{benchmark}"
  end
end