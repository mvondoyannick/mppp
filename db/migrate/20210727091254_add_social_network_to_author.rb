class AddSocialNetworkToAuthor < ActiveRecord::Migration[6.0]
  def change
    add_reference :authors, :social_network, null: true, foreign_key: true
  end
end
