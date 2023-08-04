class ChangePercentageDiscountToIntegerInBulkDiscounts < ActiveRecord::Migration[7.0]
  def change
    change_column :bulk_discounts, :percentage_discount, :integer
  end
end
