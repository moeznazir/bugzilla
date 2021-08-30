class CreateBugs < ActiveRecord::Migration[6.0]
  
  def change
    create_table :bugs do |t|
      t.string :title
      t.text   :description
      t.string :priority
      t.string :status
      t.string :estimated_day_for_completion
      t.string :assigned_to
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    
  end
end
