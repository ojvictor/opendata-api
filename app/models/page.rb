class Page < ApplicationRecord
  has_many :analyses
  has_many :dw_best_pratices
  has_many :open_gov_principles, through: :dw_best_pratices
end
