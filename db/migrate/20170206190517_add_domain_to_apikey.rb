class AddDomainToApikey < ActiveRecord::Migration
  def change
    add_column(:apikey, :domain, :string)
  end
end
