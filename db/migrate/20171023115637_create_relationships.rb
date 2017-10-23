class CreateRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |t|
      t.references :user, foreigh_key: true
      t.references :follow, foreigh_key: { to_table: :users }

      t.timestamps
      
      t.index [:user_id, :follow_id], unique: true  
    end
  end
end
