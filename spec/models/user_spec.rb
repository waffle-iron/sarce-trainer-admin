# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  last_name              :string           not null
#  first_name             :string           not null
#  cis                    :string           not null
#  rank                   :string           not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  is_admin               :boolean          default("false")
#

require 'rails_helper'

RSpec.describe User do
  subject { build(:user) }

  describe 'validations' do
    it { is_expected.to be_valid } # test that factory is valid

    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to validate_presence_of(:cis) }
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:rank) }

    it { is_expected.to validate_confirmation_of(:password) }
  end
end
