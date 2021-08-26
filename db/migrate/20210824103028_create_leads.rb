class CreateLeads < ActiveRecord::Migration[6.1]
  def change
    create_table :leads do |t|
      t.string :project_name
      t.string :client_name
      t.text :client_address
      t.string :client_email
      t.string :client_contact
      t.string :platform
      t.string :status
      t.datetime :date_generated
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
