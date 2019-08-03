class AddColumnOpinions < ActiveRecord::Migration[5.2]
  def change
  	 add_column :opinions, :name, :string
  end
end
