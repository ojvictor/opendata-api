class DwBestPratice < ApplicationRecord
  belongs_to :page
  belongs_to :open_gov_principle
  has_one :analysis
end
