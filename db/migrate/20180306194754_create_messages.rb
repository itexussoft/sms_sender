class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :content
      t.references :template, foreign_key: { to_table: :message_templates }
      t.references :recipient, foreign_key: true

      t.timestamps
    end
  end
end
