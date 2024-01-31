class Site < ApplicationRecord
  paginates_per 25

  has_many :pages

  def pages_count
    pages.count
  end

  def as_json( options={} )
    super(options.merge(
      #root: true,
      include: {
        pages: { only: %i[id title url] }
      },
      methods: [:pages_count]
    ))
  end
end
