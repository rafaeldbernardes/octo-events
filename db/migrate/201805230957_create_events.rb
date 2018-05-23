class CreateEvents < ActiveRecord::Migration[5.0]
  def up
    create_table :events do |t|
      t.string :action, null: false
      t.belongs_to :issue, index: true, foreign_key: true

      t.timestamps null: false
    end
  end

  def down
    drop_table :events
  end
end
