class Types::TarificationType < Types::BaseObject
  field :id, ID, null: false
  field :subgroupId, ID, null: false, method: :sub_group_id
  field :amount, Integer, null: false
  field :label, String, null: true
  field :description, String, null: true
  field :recurrence, String, null: true
end
