class ResourceSerializer
  include JSONAPI::Serializer
  attributes :state_id, :name, :website, :service, :active, :bipoc_focus
end
