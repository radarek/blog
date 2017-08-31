class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end

    create_join_table :articles, :categories
    add_foreign_key :articles_categories, :articles
    add_foreign_key :articles_categories, :categories
  end
end
