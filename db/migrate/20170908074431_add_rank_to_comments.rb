class AddRankToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :rank, :integer, default: 0, null: false
  end
end
