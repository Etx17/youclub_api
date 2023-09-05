module Mutations
  class CreateUser < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true
    argument :password_confirmation, String, required: true
    argument :sub_id, String, required: true
    argument :role, String, required: false

    type Types::UserType

    def resolve(email:, password:, password_confirmation:, sub_id:, role:)
      user = User.create!(
        email: email,
        password: password,
        password_confirmation: password_confirmation,
        sub_id: sub_id,
        role: role
      )
      user
    end

  end
end
