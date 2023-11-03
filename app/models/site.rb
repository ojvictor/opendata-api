class Site < ApplicationRecord
  paginates_per 25

  has_many :pages

  def as_json(options={})
    super(
      #root: true,
      #include: [:pages]
    )
  end
end
