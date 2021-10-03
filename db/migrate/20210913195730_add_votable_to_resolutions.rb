class AddVotableToResolutions < ActiveRecord::Migration[6.1]
  def change
    add_column :resolutions, :votable, :boolean, :default => true
  end
end
