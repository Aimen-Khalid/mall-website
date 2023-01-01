class ChangeEmail < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :email, :user_mail
  end
end
