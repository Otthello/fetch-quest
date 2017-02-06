class AddDomainToApikey < ActiveRecord::Migration
  def change
    add_column(:apikeys, :domain, :string)
  end
end
