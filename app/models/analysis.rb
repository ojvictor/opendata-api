class Analysis < ApplicationRecord
  belongs_to :page
  belongs_to :dw_best_pratice
  belongs_to :open_gov_principle
  
  def as_json(options={})
    super(
      root: true, 
      include: [:page, :open_gov_principle, :dw_best_pratice]
    )
  end
end
