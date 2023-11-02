# frozen_string_literal: true

require 'csv'
require 'date'
require 'facets'
require 'uri'

CSV_PATH = 'public/resultado.csv'

COMPLETENES = %w(provide_metadata provide_descriptive_metadata provide_data_license_information
                 provide_data_provenance_information provide_a_version_indicator
                 gather_feedback_from_data_consumers)

PRIMACY = %w(provide_data_provenance_information gather_feedback_from_data_consumers)

TIMELINESS = %w(provide_a_version_indicator use_persistent_URIs_as_identifiers_of_datasets provide_bulk_download 
                possivel_api)

EASE_PHYS_ELECT_ACCESS = %w(use_persistent_URIs_as_identifiers_of_datasets provide_bulk_download possivel_api)

MACHINE_READABILITY = %w(use_machine_readable_standardized_data_formats use_persistent_URIs_as_identifiers_of_datasets
                         provide_data_in_multiple_formats)

NON_DISCRIMINATION = %w(use_persistent_URIs_as_identifiers_of_datasets provide_bulk_download possivel_api
                        cite_the_original_publication provide_data_license_information provide_metadata
                        provide_descriptive_metadata gather_feedback_from_data_consumers)

COMMONLY_OWNED_OPEN_STANDARDS = %w(use_machine_readable_standardized_data_formats provide_data_in_multiple_formats 
                                   gather_feedback_from_data_consumers provide_bulk_download
                                   use_persistent_URIs_as_identifiers_of_datasets
                                   possivel_api)

LICENSING = %w(gather_feedback_from_data_consumers cite_the_original_publication)

PERMANENCE = %w(use_persistent_URIs_as_identifiers_of_datasets cite_the_original_publication
                provide_bulk_download possivel_api provide_a_version_indicator)

USAGE_COSTS = %w(use_machine_readable_standardized_data_formats provide_bulk_download
                 possivel_falso_positivo
                 gather_feedback_from_data_consumers)
=begin
sample = {"idJson"=>"5806", "site"=>"https://dados.gov.br/dados/conjuntos-dados/25709-quantidade-de-tomadores-de-credito-pessoa-juridica-por-porte-microempresa", 
          "data_avaliacao"=>"19/10/2023", "possivel_falso_positivo"=>"0", "provide_metadata"=>"1", "provide_descriptive_metadata"=>"1", 
          "provide_data_license_information"=>"1", "provide_data_provenance_information"=>"1", "provide_a_version_indicator"=>"1", 
          "gather_feedback_from_data_consumers"=>"0", "provide_bulk_download"=>"0", "provide_data_up_to_date"=>"0", 
          "use_persistent_URIs_as_identifiers_of_datasets"=>"0", "use_machine_readable_standardized_data_formats"=>"1", 
          "provide_data_in_multiple_formats"=>"1", "cite_the_original_publication"=>"0"}
=end

def us_date(pt_br_date)
  ptbr = Date.strptime(pt_br_date, '%d/%m/%Y')
  us = ptbr.strftime('%Y/%m/%d')
end

def str_to_boolean(str)
  b = ActiveModel::Type::Boolean.new.cast(str)
end

def has_principle(row, attributes, conditional)
  has_items = []
  attributes.each do |item|
    has_items << row[item].to_i if row.key?(item)
  end
  ret = (has_items.reduce(:+)) >= conditional ? true : false
end

def completeness(row, conditional = 3)
  has_principle(row, COMPLETENES, conditional)
end

def primacy(row, conditional = 2)
  has_principle(row, PRIMACY, conditional)
end

def timeliness(row, conditional = 3)
  has_principle(row, TIMELINESS, conditional)
end

def ease_of_physical_and_eletronic_access(row, conditional = 2)
  has_principle(row, EASE_PHYS_ELECT_ACCESS, conditional)
end

def machine_readability(row, conditional = 2)
  has_principle(row, MACHINE_READABILITY, conditional)
end

def non_discrimination(row, conditional = 5)
  has_principle(row, NON_DISCRIMINATION, conditional)
end

def commonly_owned_or_open_standards(row, conditional = 5)
  has_principle(row, COMMONLY_OWNED_OPEN_STANDARDS, conditional)
end

def licensing(row, conditional = 1)
  has_principle(row, LICENSING, conditional)
end

def permanence(row, conditional = 3)
  has_principle(row, PERMANENCE, conditional)
end

def usage_costs(row, conditional = 3)
  has_principle(row, USAGE_COSTS, conditional)
end

csv_data = []
CSV.foreach(CSV_PATH, headers: true) do |row|
  csv_data << row.to_hash
end

csv_data.each do |sample|
  site = Site.create!(domain: URI.parse(sample['site']).host, title: URI.parse(sample['site']).host)
  page = Page.create!(title: URI.parse(sample['site']).host, url: sample['site'], site: site)
  ogp = OpenGovPrinciple.create!(completeness: completeness(sample), 
                                 primacy: primacy(sample),
                                 timeliness: timeliness(sample), 
                                 easy_physical_or_electronic_access: ease_of_physical_and_eletronic_access(sample), 
                                 machine_readability: machine_readability(sample), 
                                 non_discrimination: non_discrimination(sample), 
                                 commonly_owned_or_open_standards: commonly_owned_or_open_standards(sample), 
                                 licensing: licensing(sample), 
                                 permanence: permanence(sample), 
                                 usage_costs: usage_costs(sample), 
                                 page: page)
  dwbp = DwBestPratice.create!(provide_metadata: str_to_boolean(sample['provide_metadata']), 
                               provide_descriptive_metadata: str_to_boolean(sample['provide_descriptive_metadata']), 
                               provide_data_license_info: str_to_boolean(sample['provide_data_license_information']), 
                               provide_data_provenance_info: str_to_boolean(sample['provide_data_provenance_information']), 
                               provide_version_info: str_to_boolean(sample['provide_a_version_indicator']), 
                               provide_feedback_info: str_to_boolean(sample['gather_feedback_from_data_consumers']), 
                               provide_bulk_download: str_to_boolean(sample['provide_bulk_download']), 
                               provide_data_up_to_date: str_to_boolean(sample['provide_data_up_to_date']), 
                               use_machine_readable_standardized_formats: str_to_boolean(sample['use_machine_readable_standardized_data_formats']),
                               use_persistent_uri_as_dataset_identifier: str_to_boolean(sample['use_persistent_URIs_as_identifiers_of_datasets']), 
                               provide_multiple_formats_data: str_to_boolean(sample['provide_data_in_multiple_formats']), 
                               cite_original_publication: str_to_boolean(sample['cite_the_original_publication']), 
                               page: page, open_gov_principle: ogp)
  anal = Analysis.create!(maybe_false_positive: str_to_boolean(sample['possivel_falso_positivo']),
                          analysis_date: us_date(sample['data_avaliacao']),
                          provide_api_reference: str_to_boolean('0'),
                          page: page,
                          open_gov_principle: ogp,
                          dw_best_pratice: dwbp)
end
=begin
site = Site.create!(domain: URI.parse(sample['site']).host, title: URI.parse(sample['site']).host)
page = Page.create!(title: URI.parse(sample['site']).host, url: sample['site'], site: site)
ogp = OpenGovPrinciple.create!(completeness: completeness(sample), 
                               primacy: primacy(sample),
                               timeliness: timeliness(sample), 
                               easy_physical_or_electronic_access: ease_of_physical_and_eletronic_access(sample), 
                               machine_readability: machine_readability(sample), 
                               non_discrimination: non_discrimination(sample), 
                               commonly_owned_or_open_standards: commonly_owned_or_open_standards(sample), 
                               licensing: licensing(sample), 
                               permanence: permanence(sample), 
                               usage_costs: usage_costs(sample), 
                               page: page)
dwbp = DwBestPratice.create!(provide_metadata: str_to_boolean(sample['provide_metadata']), 
                             provide_descriptive_metadata: str_to_boolean(sample['provide_descriptive_metadata']), 
                             provide_data_license_info: str_to_boolean(sample['provide_data_license_information']), 
                             provide_data_provenance_info: str_to_boolean(sample['provide_data_provenance_information']), 
                             provide_version_info: str_to_boolean(sample['provide_a_version_indicator']), 
                             provide_feedback_info: str_to_boolean(sample['gather_feedback_from_data_consumers']), 
                             provide_bulk_download: str_to_boolean(sample['provide_bulk_download']), 
                             provide_data_up_to_date: str_to_boolean(sample['provide_data_up_to_date']), 
                             use_machine_readable_standardized_formats: str_to_boolean(sample['use_machine_readable_standardized_data_formats']),
                             use_persistent_uri_as_dataset_identifier: str_to_boolean(sample['use_persistent_URIs_as_identifiers_of_datasets']), 
                             provide_multiple_formats_data: str_to_boolean(sample['provide_data_in_multiple_formats']), 
                             cite_original_publication: str_to_boolean(sample['cite_the_original_publication']), 
                             page: page, open_gov_principle: ogp)
anal = Analysis.create!(maybe_false_positive: str_to_boolean(sample['possivel_falso_positivo']),
                        analysis_date: us_date(sample['data_avaliacao']),
                        provide_api_reference: str_to_boolean('0'),
                        page: page,
                        open_gov_principle: ogp,
                        dw_best_pratice: dwbp)
=end
