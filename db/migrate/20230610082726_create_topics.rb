class CreateTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :topics do |t|
      t.string :topic_title, null: false
      t.text :topic_content, null: false
      t.references :user,    foreign_key: true

      t.timestamps
    end
  end
end
