class AddSiteRefToPages < ActiveRecord::Migration[5.2]
  def change
    add_reference :pages, :site, foreign_key: true, type: :uuid
  end
end
