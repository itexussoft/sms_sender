class CreateMessageTemplates < ActiveRecord::Migration[5.1]
  def change
    create_table :message_templates do |t|
      t.text :content
      t.string :msg_type

      t.timestamps
    end
  end
end
