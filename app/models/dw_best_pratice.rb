class DwBestPratice < ApplicationRecord
  paginates_per 25

  belongs_to :page
  belongs_to :open_gov_principle
  has_one :analysis
  has_one :site, through: :page
  
  def as_json(options={})
    super(
      #root: true,
      include: [ :page, :site, :open_gov_principle ]
    )
  end
end
