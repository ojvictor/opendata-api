class DwBestPratice < ApplicationRecord
  paginates_per 25

  belongs_to :page
  belongs_to :open_gov_principle
  has_one :analysis
  has_one :site, through: :page

  def as_json(options={})
    super(options.merge(
      #root: true,
      include: {
        page: { only: %i[id] },
        site: { only: %i[id] }
      },
      except: %i[page_id open_gov_principle_id]
    ))
  end
end
