class ChangeColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :donations, :status, :string, default: 'aguardando doação'
  end
end
