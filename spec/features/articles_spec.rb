def signin_admin(login, password)
  visit "/login"
  fill_in "Login", with: login
  fill_in "Password", with: password

  click_button "Sign in"
end

RSpec.describe "Articles" do
  describe "creating articles" do
    context "when admin is signed in" do
      let(:admin) { Fabricate(:admin, password: "secret") }

      scenario "is successfull" do
        signin_admin(admin.login, "secret")

        visit new_article_path

        fill_in "Title", with: "Nice title"
        fill_in "Text", with: "Lorem ipsum..."
        click_on "Create Article"

        expect(page).to have_content "Nice title"
        expect(page).to have_content "Lorem ipsum..."
      end
    end

    context "when admin is not signed in" do
      scenario "is forbidden" do
        visit new_article_path

        expect(page).to have_content "Sorry, you have no access to this url"
      end
    end
  end
end