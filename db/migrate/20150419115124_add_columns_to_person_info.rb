class AddColumnsToPersonInfo < ActiveRecord::Migration
  def change
  	add_column :person_infos, :phone, :string
  	add_column :person_infos, :facebook, :string
  	add_column :person_infos, :line, :string
  end
end
