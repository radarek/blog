class ChangeArticlesTextToNotNull < ActiveRecord::Migration[5.1]
  def change
    change_column_null :articles, :text, false
  end
end
