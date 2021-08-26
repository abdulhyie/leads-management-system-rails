class CreatePhases < ActiveRecord::Migration[6.1]
  def change
    create_table :phases do |t|
      t.string :type
      t.datetime :start_date
      t.datetime :due_date
      t.datetime :creation_date
      t.string :phase_status
      t.references :lead, null: false, foreign_key: true

      t.timestamps
    end
  end
end
