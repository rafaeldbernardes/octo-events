class CreateIssues < ActiveRecord::Migration[5.0]
  def up
    create_table :issues do |t|
      t.timestamps null: false
    end
  end

  def down
    drop_table :issues
  end
end
