set :environment, "development"
# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
 set :output, "cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end
every 2.minutes do
  runner "Order.create(:buyer_id => 1, :total => 10001, :active => true)"
end

every 10.minutes do
  runner "Order.deactivate_old(5.minutes)"
end

# Learn more: http://github.com/javan/whenever
