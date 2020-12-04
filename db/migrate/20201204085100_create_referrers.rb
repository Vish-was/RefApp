class CreateReferrers < ActiveRecord::Migration[5.2]
  def change
    create_table :referrers do |t|
      t.column :name, :string
      t.column :email, :string
      t.column :mob, :string
      t.column :amount, :float
      t.column :points, :int
      t.timestamps
    end
  end
end
