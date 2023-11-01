namespace :dev do
  desc "TODO"
  task setup: :environment do
    summary_file = 'db/analyses.rb'
    load(summary_file) if File.exists?(summary_file)
  end
end
