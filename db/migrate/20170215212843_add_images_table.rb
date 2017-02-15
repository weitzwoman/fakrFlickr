class AddImagesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.column :image_source, :string
      t.column :owner_id, :integer
    end
    create_table :tags do |t|
      t.column :image_id, :integer
      t.column :user_id, :integer
    end
  end
end
