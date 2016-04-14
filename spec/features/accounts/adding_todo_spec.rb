require "rails_helper"
    feature "Adding todos" do
    let(:account) { FactoryGirl.create(:account) }
    context "as the account's owner" do
    before do
    login_as(account.owner)
    end
    it "can add a todo" do
    visit root_url(subdomain: account.subdomain)
    click_link "Add todo"
    fill_in "Title", with: "Markdown Todo Test"
   
    click_button "Add Todo"
    expect(page).to have_content(
    "Markdown Todo Test has been enqueued for processing."
    )
    end
end
end