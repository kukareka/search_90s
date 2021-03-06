# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

benchmark = Benchmark.measure do
  {
      Project => 'db/seeds/projects.json',
      User => 'db/seeds/users.json'
  }.each do |klass, file|
    ActiveSupport::JSON.decode(File.read(file)).each do |json|
      klass.create!(metadata: json)
    end
  end
end

puts "Seed benchmark: #{benchmark}"
