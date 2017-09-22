RSpec.describe "Admins" do
  describe "/login" do
    context "when valid credentials are provided" do
      let!(:admin) { Fabricate(:admin, login: "admin", password: "secret") }

      scenario "user is signed in" do
        visit "/login"

        fill_in "Login", with: "admin"
        fill_in "Password", with: "secret"
        click_button "Sign in"

        expect(page).to have_content("Successfully signed in")
      end
    end

    context "when invalid credentials are provided" do
      scenario "user is not signed in and login page is reloaded" do
        visit "/login"

        fill_in "Login", with: "admin"
        fill_in "Password", with: "123"
        click_button "Sign in"

        expect(current_path).to eq "/login"
      end
    end
  end
end