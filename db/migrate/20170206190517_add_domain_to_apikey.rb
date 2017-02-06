class AddDomainToApikey < ActiveRecord::Migration
  def change
    add_column(:apikey, :domain)
  end
end
