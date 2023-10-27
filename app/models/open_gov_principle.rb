class OpenGovPrinciple < ApplicationRecord
  belongs_to :page
  has_one :dw_best_pratice
  has_one :analysis, through: :dw_best_pratice
end
