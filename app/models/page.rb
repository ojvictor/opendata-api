class Page < ApplicationRecord
  paginates_per 25

  belongs_to :site
  has_many :analyses
  has_many :dw_best_pratices
  has_many :open_gov_principles, through: :dw_best_pratices

  def as_json(options={})
    super(options.merge(
      root: true, 
      include: {
        site: { only: %i[id domain] },
        dw_best_pratices: {},
        open_gov_principles: {}
      }
    ))
  end
end
