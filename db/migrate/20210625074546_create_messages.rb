class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.references :user, foreign_key: true
      t.references :article, foreign_key: true
      t.text :text
      t.timestamps
    end
  end
end
