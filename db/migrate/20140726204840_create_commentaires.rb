class CreateCommentaires < ActiveRecord::Migration
  def change
    create_table :commentaires do |t|
      t.string :auteur
      t.text :corp
      t.references :article, index: true

      t.timestamps
    end
  end
end
