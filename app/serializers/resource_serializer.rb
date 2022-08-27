class ResourceSerializer
  include JSONAPI::Serializer
  attributes :name, :service, :active, :bipoc_focus
  belongs_to :states
end
