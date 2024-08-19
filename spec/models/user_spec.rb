require 'rails_helper'

RSpec.describe User, type: :model do
  let(:email) { 'test@example.com' }
  let(:password) { '123456' }

  describe '.find_or_create_by!' do
    context 'when user exists' do
      before do
        # Создаем пользователя до выполнения теста
        @existing_user = User.create!(email: email, password: password, password_confirmation: password, admin: true)
      end

      it 'does not create a new user if one already exists' do
        expect {
          User.find_or_create_by!(email: email) do |u|
            u.password = 'new_password'
            u.password_confirmation = 'new_password'
            u.admin = false
          end
        }.not_to change(User, :count)

        user = User.find_by(email: email)
        expect(user.encrypted_password).to eq(@existing_user.encrypted_password) # Проверяем, что зашифрованный пароль не изменился
      end
    end
  end
end
