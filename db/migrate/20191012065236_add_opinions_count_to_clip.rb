class AddOpinionsCountToClip < ActiveRecord::Migration[5.2]
  def change
    add_column :clips, :opinions_count, :integer, default: 0
  end
end
