class SignSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :email, :phone, :birthdate
end
