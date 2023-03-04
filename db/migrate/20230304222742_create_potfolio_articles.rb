class CreatePotfolioArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :potfolio_articles do |t|
      t.string :title
      t.string :description
      t.string :url

      t.timestamps
    end
  end
end
