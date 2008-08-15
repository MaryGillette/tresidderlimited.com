# 0 0 * * * cd /web/sites/pcgi.com/professionalconsultinggroupinc.com/current/ && /usr/bin/rake RAILS_ENV=production utils:send_opportunities_emails
namespace :utils do
  desc "Send new industry specific opportunities to members"

  task(:send_opportunities_emails => :environment) do

    # if tehre is atl least one opp to send
    if Opportunity.ready_for_notification.length > 0

      # Find users to email       
      Member.to_receive_opportunity_notifications.each do |member|
        
        member_opportunities = []
        
        # go through the members industries
        # consolodate them the industry specific oppps into one email
        member.industries.each do |industry|
          member_opportunities << Opportunity.ready_for_notification.for_industry(industry.id)
        end
        
        # send away
        if member_opportunities.length > 0
          # puts "Emailing #{member.name} <#{member.email}> #{member_opportunities.length} opps"
          UserMailer.deliver_opportunities(member_opportunities,member) 
        end

      end

      # timestamp delivery
      Opportunity.ready_for_notification.each do |o| 
        o.update_attribute(:last_delivered_at, Time.new)
      end
    end
  end
end


# namespace :db do
#   desc 'Create YAML test fixtures from data in an existing database.  Defaults to development database. Set RAILS_ENV to override.'
# 
#   task :extract_fixtures => :environment do
#     sql = "SELECT * FROM %s"
#     skip_tables = ["schema_info", "sessions"]
#     ActiveRecord::Base.establish_connection
#     tables = ENV['FIXTURES'] ? ENV['FIXTURES'].split(/,/) : ActiveRecord::Base.connection.tables - skip_tables
#     tables.each do |table_name|
#       Object.const_get(table_name.classify).to_fixture rescue puts "Unable to load #{table_name}"
#     end
#   end
# end



