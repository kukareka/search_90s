# The decorator is responsible for printing the models of corresponding type.
# Is it worth to invent some DSL here, WDYT?

class ProjectDecorator < Draper::Decorator
  def print
    puts "[PROJECT] #{object.name}".green
    puts "\tUrl: #{object.url}".blue if object.url.present?
    puts "\tDetails: #{object.details}".blue if object.details.present?
    puts "\tLocation: #{object.location.join(', ')}".blue if object.location.present?
    puts "\tCreated: #{object.created_at}".blue if object.created_at.present?
    puts "\tExternal ID: #{object.external_id}".blue if object.external_id.present?
    puts "\tInternal ID: #{object._id}".blue if object._id.present?
    puts "\tPublished: #{object.published}".blue
    puts "\tTags: #{object.tags.join(', ')}".blue if object.tags.present?
  end
end
