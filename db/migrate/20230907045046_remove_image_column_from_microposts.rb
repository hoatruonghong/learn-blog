class RemoveImageColumnFromMicroposts < ActiveRecord::Migration[7.0]
  def change
    remove_column :microposts, :image
  end
end
