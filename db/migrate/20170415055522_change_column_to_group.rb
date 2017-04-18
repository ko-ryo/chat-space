class ChangeColumnToGroup< ActiveRecord::Migration[5.0]
  def change
    change_column :Groups, :name, :string, null: true
  end
end
