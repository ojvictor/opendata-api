class OpenGovPrinciple < ApplicationRecord
  paginates_per 25

  belongs_to :page
  has_one :dw_best_pratice
  has_one :analysis, through: :dw_best_pratice
  has_one :site, through: :page
  
  def as_json(options={})
    super(options.merge(
      root: true, 
      include: {
        page: { only: %i[id] },
        site: { only: %i[id] },
        dw_best_pratice: { only: %i[id] }
      },
      except: %i[page_id]
    ))
  end
end
