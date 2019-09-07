class AddColumnToProject < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :status, :string, default: 'Aberto'
  end
end
