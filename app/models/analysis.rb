class Analysis < ApplicationRecord
  paginates_per 25

  belongs_to :page
  belongs_to :dw_best_pratice
  belongs_to :open_gov_principle

  def as_json(options={})
    super(options.merge(
      #root: true,
      include: {
        page: { only: %i[id] },
        open_gov_principle: { only: %i[id] },
        dw_best_pratice: { only: %i[id] }
      },
      except: %i[page_id open_gov_principle_id dw_best_pratice_id]
    ))
  end
end
