# frozen_string_literal: tru

require 'csv'
require 'date'
require 'facets'
require 'uri'

CSV_PATH = 'public/convertido.csv'
csv_data = []
CSV.foreach(CSV_PATH, headers: true) do |row|
  csv_data << row.to_hash
end

csv_data.each do |sample|
  definition = Definition.new(name: sample['name'], description: sample['description'], identifier: sample['identifier'])
  definition.save
end
