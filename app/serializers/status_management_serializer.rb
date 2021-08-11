class StatusManagementSerializer
  include JSONAPI::Serializer
  belongs_to :performer, serializer: :user
  belongs_to :receiver, serializer: :user

  attributes :action, :created_at
end
