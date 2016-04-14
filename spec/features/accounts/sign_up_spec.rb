
require 'rails_helper'

feature "Accounts" do
scenario "Ensure subdomain uniqueness" do 
  Account.create!(subdomain: "test", name: "Test")
 
  visit root_path
  click_link "Create a new account"
  fill_in "Name", with: "Test"
  fill_in "Subdomain", with: "Test"
  fill_in "Username", with: "test"
  fill_in "Email", with: "test@example.com"
  fill_in "Password", with: "password"
  fill_in "Password confirmation", with: 'password'
  click_button "Create Account"
 
  expect(page.current_url).to eq("http://lvh.me/accounts")
  expect(page).to have_content("Sorry, your account could not be created.")
  expect(page).to have_content("Subdomain has already been taken")
 end
 end