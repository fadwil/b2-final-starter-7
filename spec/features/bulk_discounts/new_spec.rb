require "rails_helper"

RSpec.describe "bulk discounts index" do
  before :each do
    @merchant1 = Merchant.create!(name: "Hair Care")
    visit new_merchant_bulk_discount_path(@merchant1)
  end
  
  # Story 2
  it "I see a form to fill for a new bulk discount" do
    expect(page).to have_content("Create New Bulk Discount")
    expect(page).to have_field(:percentage_discount)
    expect(page).to have_field(:quantity_threshold)
    expect(page).to have_button("Create Bulk Discount")
  end

  # Story 2
  it "When I fill in the form with valid data it redirects to index and I see discount listed" do
    fill_in "Percentage Discount:", with: 15
    fill_in "Quantity Threshold:", with: 20
    click_button "Create Bulk Discount"
    expect(current_path).to eq(merchant_bulk_discounts_path(@merchant1))
    expect(page).to have_content("15% off 20 or more items")
  end
end