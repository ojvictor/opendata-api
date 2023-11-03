class Analysis < ApplicationRecord

  paginates_per 25

  belongs_to :page
  belongs_to :dw_best_pratice
  belongs_to :open_gov_principle

  def as_json(options={})
    h = super(
      include: [:page, :open_gov_principle, :dw_best_pratice]
    )
    h[:analysis_date] = (I18n.l(self.analysis_date) unless self.analysis_date.blank?)
    h
  end
end
