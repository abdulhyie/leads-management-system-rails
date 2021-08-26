class DropDateCraetedColumns < ActiveRecord::Migration[6.1]
  def change
    remove_column :phases, :creation_date
    remove_column :leads, :date_generated
  end
end
