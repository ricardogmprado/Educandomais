class AddColumnsToDonators < ActiveRecord::Migration[5.2]
  def change
    add_column :donators, :name, :string
    add_column :donators, :last_name, :string
    add_column :donators, :cpf, :string
    add_column :donators, :telephone, :string
  end
end
