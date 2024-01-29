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
        dw_best_pratice: {
          except: %i[page_id open_gov_principle_id]
        },
        page: { only: %i[id url] },
        site: { only: %i[id domain] }
      },
      except: %i[page_id]
    ))
  end
end
