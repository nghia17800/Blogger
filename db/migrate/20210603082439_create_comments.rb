class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :author
      t.string :content
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
