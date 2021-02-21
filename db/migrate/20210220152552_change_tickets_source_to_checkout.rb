class ChangeTicketsSourceToCheckout < ActiveRecord::Migration[6.1]
  def change
    rename_column :tickets, :source, :checkout
  end
end
#adding this line for heroku
