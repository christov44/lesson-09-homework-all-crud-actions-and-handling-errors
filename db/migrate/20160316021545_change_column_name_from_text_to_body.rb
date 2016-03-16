class ChangeColumnNameFromTextToBody < ActiveRecord::Migration
  def change
    rename_column :articles, :text, :body
  end
end
