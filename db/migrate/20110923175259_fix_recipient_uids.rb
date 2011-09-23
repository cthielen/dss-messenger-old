class FixRecipientUids < ActiveRecord::Migration
  def up
    add_column :recipients, :uid, :integer
  end

  def down
    remove_column :recipients, :uid
  end
end
