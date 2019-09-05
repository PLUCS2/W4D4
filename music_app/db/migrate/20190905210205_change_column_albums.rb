class ChangeColumnAlbums < ActiveRecord::Migration[5.2]
  def change
    remove_column :albums, :type, :string 
    add_column :albums, :recordings, :string
  end
end
