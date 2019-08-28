class RemoveNeighbourhoodFromSchools < ActiveRecord::Migration[5.2]
  def change
    remove_column :schools, :neighbourhood, :string
  end
end
