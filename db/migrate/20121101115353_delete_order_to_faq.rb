class DeleteOrderToFaq < ActiveRecord::Migration
  def up
  	remove_column :faqs, :order
  end

  def down
  end
end
