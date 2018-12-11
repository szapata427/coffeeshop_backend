class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :type
      t.string :username
      t.string :password_digest
      t.string :email
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.string :zipcode
      t.string :auth_token


      t.timestamps
    end
  end
end
