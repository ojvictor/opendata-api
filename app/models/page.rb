class Page < ApplicationRecord
  has_many :analyses
  has_many :dw_best_pratices
  has_many :open_gov_principles, through: :dw_best_pratices

  def as_json(options={})
    super(
      root: true, 
      include: [:dw_best_pratices,:open_gov_principles]
    )
  end
end
