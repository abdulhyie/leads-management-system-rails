class CreatePhaseAssignments < ActiveRecord::Migration[6.1]
  def change
    create_table :phase_assignments do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :phase, index: true, foreign_key: true

      t.timestamps
    end
  end
end
