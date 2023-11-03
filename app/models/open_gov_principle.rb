class OpenGovPrinciple < ApplicationRecord
  paginates_per 25

  belongs_to :page
  has_one :dw_best_pratice
  has_one :analysis, through: :dw_best_pratice
  has_one :site, through: :page
  
  def as_json(options={})
    super(
      #root: true, 
      include: [:dw_best_pratice, :page, :site]
    )
  end
end
