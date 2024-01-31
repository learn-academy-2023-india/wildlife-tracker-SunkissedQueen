class ChangeTypetoVariant < ActiveRecord::Migration[7.0]
  def change
    rename_column :chicken_coops, :type, :variant
  end
end
