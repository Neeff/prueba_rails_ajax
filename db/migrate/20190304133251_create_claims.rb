class CreateClaims < ActiveRecord::Migration[5.2]
  def change
    create_table :claims do |t|
      t.text :claim

      t.timestamps
    end
  end
end
