require 'rails_helper'

RSpec.feature "Add to cart:", type: :feature, js: true do
  before :each do

    @user = User.create!(
      first_name: 'First',
      last_name: 'Last',
      email: 'first@user.com',
      password: '12345678',
      password_confirmation: '12345678'
    )

    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )      
    end
  end

  scenario "users can add a product to cart" do
    visit '/login'
    within 'form' do
      fill_in id: 'email', with: 'first@user.com'
      fill_in id: 'password', with: '12345678'
      click_button 'Submit'
    end

    first('article.product').find_link('Add').click
    visit '/cart'
    
    expect(page).to have_selector("a", :text =>"My Cart (1)")
  end

end