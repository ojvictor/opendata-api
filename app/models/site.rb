class Site < ApplicationRecord
  def as_json(options={})
    super(
      root: true, 
      include: [:pages]
    )
  end
end
