require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.create(first_name: 'rspectest', last_name: 'rspectest', email: 'rspectest@test.com', password: 'testtest', password_confirmation: 'testtest')
  end

  describe "Validations:" do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:email) }
    it { should validate_confirmation_of(:password) }
    it { is_expected.to have_secure_password }
    it { should validate_length_of(:password).is_at_least(8) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should allow_value('test@test.com').for(:email) }
  end

  describe '.authenticate_with_credentials' do

    it "authenticates existing user" do
      user = User.authenticate_with_credentials('rspectest@test.com', 'testtest')
      expect(user).to eql(@user)
    end
  
    it "does not authenticate user with wrong password" do
      user = User.authenticate_with_credentials('rspectest@test.com', 'barbarbar')
      expect(user).to be_nil
    end

    it 'accepts email with spaces' do
      user = User.authenticate_with_credentials('    rspectest@test.com', 'testtest')
      expect(user).to eql(@user)
    end

    it "doesn't consider case in the email" do
      user = User.authenticate_with_credentials('rspectest@TEST.com', 'testtest')
      expect(user).to eql(@user)
    end
  end

end