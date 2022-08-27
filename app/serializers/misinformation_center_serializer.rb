class MisinformationCenterSerializer
  include JSONAPI::Serializer
  attributes :state_id, :name, :address, :source
end
