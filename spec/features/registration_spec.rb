require 'rails_helper'

feature 'new account' do
  let(:user) { build(:user) }
  let(:features) { FeaturesSpecHelper.new }

  scenario 'A user creates an account with valid data' do
    visit '/'
    click_on 'Inscription'

    fill_in 'user_first_name', with: user.first_name
    fill_in 'user_last_name', with: user.last_name
    fill_in 'user_cis', with: user.cis
    select 'Sergent', from: 'user_rank'
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password
    click_button "S'inscrire"

    last_email.to.should include(user.email)
    expect(page).to have_content 'Un message avec un lien
                                  de confirmation vous a été envoyé par mail'
  end

  scenario 'A user sign in with valid credentials' do
    features.sign_in(user)

    expect(page).to have_content "Connecté(e) avec succès. Bienvenue
                                  #{user.first_name} #{user.last_name}"
  end
end
