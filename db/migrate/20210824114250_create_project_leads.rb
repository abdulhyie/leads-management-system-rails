class CreateProjectLeads < ActiveRecord::Migration[6.1]
  def change
    create_table :project_leads do |t|
      t.string :project_name
      t.references :lead, null: false, foreign_key: true

      t.timestamps
    end
  end
end
