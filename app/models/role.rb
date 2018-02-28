class Role < ApplicationRecord
  has_and_belongs_to_many :users, :join_table => :users_roles

  belongs_to :resources, :polymorphic => true, :optional => true

  validates :resource_type, :inclusion => { :in => Rolify.resource_type }, :allow_nil => true

  scopify
end
