namespace :dev do
  desc 'Uploading data'
  task setup: :environment do
    summary_file = 'db/analyses.rb'
    load(summary_file) if File.exist?(summary_file)
  end

  desc 'Uploading definitions'
  task definitions: :environment do
    definitions_file = 'db/dwbp_definitions.rb'
    load(definitions_file) if File.exist?(definitions_file)
  end
end
