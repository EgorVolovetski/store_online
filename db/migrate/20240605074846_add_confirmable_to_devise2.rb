class AddConfirmableToDevise2 < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :unconfirmed_email, :string
  end
end
