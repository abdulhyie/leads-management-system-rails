class RenameTypeAttributeInPhase < ActiveRecord::Migration[6.1]
  def change
    rename_column :phases, :type, :phase_type
  end
end
