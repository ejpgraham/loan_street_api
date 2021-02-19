class AddApiKeyToLoans < ActiveRecord::Migration[6.1]
  def change
    add_column :loans, :api_key, :string
  end
end
