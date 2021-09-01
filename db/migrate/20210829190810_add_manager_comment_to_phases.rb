class AddManagerCommentToPhases < ActiveRecord::Migration[6.1]
  def change
    add_column :phases, :manager_comment, :text
  end
end
