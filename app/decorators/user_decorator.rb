class UserDecorator < Draper::Decorator
  def print
    puts "[USER] #{object.name}".yellow
    puts "\tInternal ID: #{object._id}".red if object._id.present?
    puts "\tActive: #{object.active}".red
    puts "\tAlias: #{object.alias}".red if object.alias.present?
    puts "\tCreated: #{object.created_at}".red if object.created_at.present?
    puts "\tEmail: #{object.email}".red if object.email.present?
    puts "\tExternal ID: #{object.external_id}".red if object.external_id.present?
    puts "\tLast login: #{object.last_login_at}".red if object.last_login_at.present?
    puts "\tLocale: #{object.locale}".red if object.locale.present?
    if object.location.present?
      puts "\tLocation:".red
      object.location.each do |(key, value)|
        puts "\t\t#{key.humanize}: #{value}".red
      end
    end
    puts "\tOrganization ID: #{object.organization_id}".red if object.organization_id.present?
    puts "\tPhone: #{object.phone}".red if object.phone.present?
    puts "\tRole: #{object.role}".red if object.role.present?
    puts "\tShared: #{object.shared}".red if object.shared.present?
    puts "\tSignature: #{object.signature}".red if object.signature.present?
    puts "\tSuspended: #{object.suspended}".red if object.suspended.present?
    puts "\tTags: #{object.tags.join(', ')}".red if object.tags.present?
    puts "\tTimezone: #{object.timezone}".red if object.timezone.present?
    puts "\tVerified: #{object.verified}".red if object.verified.present?
  end
end
