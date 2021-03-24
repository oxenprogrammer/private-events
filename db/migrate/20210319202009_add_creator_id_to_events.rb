class AddCreatorIdToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :creator_id, :integer, index: true, foreign_key: true
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
