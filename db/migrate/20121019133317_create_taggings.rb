class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
    	t.belongs_to :blog
    	t.belongs_to :tag
      t.timestamps
    end
  end
end
