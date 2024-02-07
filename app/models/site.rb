class Site < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :search_by_domain, against: :domain, using: { trigram: { word_similarity: true } }
  paginates_per 25

  has_many :pages

  def pages_count
    pages.count
  end
=begin
  def as_json( options={} )
    super(options.merge(
      #root: true,
      include: {
        pages: { only: %i[id title url] }
      },
      methods: [:pages_count]
    ))
  end
=end
end
