class DwBestPratice < ApplicationRecord
  belongs_to :page
  belongs_to :open_gov_principle
  has_one :analysis
  
  def as_json(options={})
    super(
      root: true,
      include: [ :page, :open_gov_principle ]
    )
  end
end
