class CreateDwBestPratices < ActiveRecord::Migration[5.2]
  def change
    create_table :dw_best_pratices, id: :uuid do |t|
      t.boolean :provide_metadata
      t.boolean :provide_descriptive_metadata
      t.boolean :provide_data_license_info
      t.boolean :provide_data_provenance_info
      t.boolean :provide_version_info
      t.boolean :provide_feedback_info
      t.boolean :provide_bulk_download
      t.boolean :provide_data_up_to_date
      t.boolean :use_persistent_uri_as_dataset_identifier
      t.boolean :use_machine_readable_standardized_formats
      t.boolean :provide_multiple_formats_data
      t.boolean :cite_original_publication
      t.references :page, foreign_key: true, type: :uuid
      t.references :open_gov_principle, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
