class CreateContacts < ActiveRecord::Migration[7.2]
  def change
    create_table :contacts do |t|
      t.string :email
      t.text :message

      t.timestamps
    end
  end
end
