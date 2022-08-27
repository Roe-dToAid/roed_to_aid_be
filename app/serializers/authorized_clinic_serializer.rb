class AuthorizedClinicSerializer
  include JSONAPI::Serializer
  attributes :state_id, :name, :address, :city, :zip, :phone, :services, :website
end
