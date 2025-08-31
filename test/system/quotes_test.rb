require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
  setup do
    @quote = quotes(:first) # references the first fixture quote
  end

  test "Creating a new quote" do
    # when we visit the quotes#index page
    # we expect to see a title with the test Quotes
    visit quotes_path
    assert_selector "h1", text: "Quotes"

    # when we click on the link with the text "New Quote"
    # we expect to land on a page with the title "New Quote"
    click_on "New quote"
    assert_selector "h1", text: "New quote"

    # when we fill in the name input with "Capybara quote"
    # and we click on "Create Quote"
    fill_in "Name", with: "Capybara quote"
    click_on "Create quote"

    # we expect to be back on the page with the title "Quotes"
    # and to see our "Capybara quote" added to the list
    assert_selector "h1", text: "Quotes"
    assert_text "Capybara quote"
  end

  test "Showing a quote" do
    visit quotes_path
    click_link @quote.name

    assert_selector "h1", text: @quote.name
  end

  test "Updating quote" do
    visit quotes_path
    assert_selector "h1", text: "Quotes"

    click_on "Edit", match: :first
    assert_selector "h1", text: @quote.name

    fill_in "Name", with: "Updated quote"
    click_on "Update quote"

    assert_selector "h1", text: "Quotes"
    assert_text "Updated quote"
  end

  test "Destroy quote" do
    visit quotes_path
    assert_text @quote.name

    click_on "Delete", match: :first
    assert_no_text @quote.name
  end

  test "Submit a blank quote" do
    visit quotes_path
    assert_selector "h1", text: "Quotes"
    click_on "New quote"

    click_on "Create quote"
    assert_selector "div.error-messages", text: "Name can't be blank"
  end
end
