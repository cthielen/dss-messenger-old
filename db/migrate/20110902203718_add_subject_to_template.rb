class AddSubjectToTemplate < ActiveRecord::Migration
  def self.up
    add_column :templates, :subject, :string
  end

  def self.down
    remove_column :templates, :subject
  end
end
