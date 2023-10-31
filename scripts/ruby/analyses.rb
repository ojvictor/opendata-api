# frozen_string_literal: true

require 'csv'

COMPLETENES = %w( provide_metadata provide_descriptive_metadata provide_data_license_information
                  provide_data_provenance_information provide_a_version_indicator
                  gather_feedback_from_data_consumers )

PRIMACY = %w( provide_data_provenance_information gather_feedback_from_data_consumers)

TIMELINESS = %w( provide_a_version_indicator use_persistent_URIs_as_identifiers_of_datasets provide_bulk_download 
                 possivel_api )

EASE_PHYS_ELECT_ACCESS = %w( use_persistent_URIs_as_identifiers_of_datasets provide_bulk_download, possivel_api)

MACHINE_READABILITY = %w( use_machine_readable_standardized_data_formats use_persistent_URIs_as_identifiers_of_datasets
                          provide_data_in_multiple_formats )

NON_DISCRIMINATION = %w( use_persistent_URIs_as_identifiers_of_datasets provide_bulk_download possivel_api
                         cite_the_original_publication provide_data_license_information, provide_metadata
                         provide_descriptive_metadata gather_feedback_from_data_consumers )

sample = {"idJson"=>"5806", "site"=>"https://dados.gov.br/dados/conjuntos-dados/25709-quantidade-de-tomadores-de-credito-pessoa-juridica-por-porte-microempresa", 
          "data_avaliacao"=>"19/10/2023", "possivel_falso_positivo"=>"False", "provide_metadata"=>"1", "provide_descriptive_metadata"=>"1", 
          "provide_data_license_information"=>"1", "provide_data_provenance_information"=>"1", "provide_a_version_indicator"=>"1", 
          "gather_feedback_from_data_consumers"=>"0", "provide_bulk_download"=>"0", "provide_data_up_to_date"=>"0", 
          "use_persistent_URIs_as_identifiers_of_datasets"=>"0", "use_machine_readable_standardized_data_formats"=>"1", 
          "provide_data_in_multiple_formats"=>"1", "cite_the_original_publication"=>"0"}

def has_principle(row, attributes, conditional)
  has_items = []
  attributes.each do |item|
    has_items << row[item].to_i if row.key?(item)
  end
  ret = (has_items.reduce(:+)) >= conditional ? true : false
end

CSV_PATH='../data/resultado.csv'

csv_data = []

puts has_principle(sample, COMPLETENES, 7)

#CSV.foreach(CSV_PATH, headers: true) do |row|
#  csv_data << row.to_hash
#end

#puts csv_data
