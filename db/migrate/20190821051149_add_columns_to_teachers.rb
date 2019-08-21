class AddColumnsToTeachers < ActiveRecord::Migration[5.2]
  def change
    add_column :teachers, :name, :string
    add_column :teachers, :last_name, :string
    add_column :teachers, :avatar, :string
    add_column :teachers, :registration_code, :string
    add_column :teachers, :course, :string
    add_column :teachers, :telephone, :string
  end
end
