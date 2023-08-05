class BulkDiscountsController < ApplicationController
  def index
    @merchant = find_merchant
  end
  
  def show
    @merchant = find_merchant
    @bulk_discount = BulkDiscount.find(params[:id])
  end

  def new
    @merchant = Merchant.find(params[:merchant_id])
    @bulk_discount = @merchant.bulk_discounts.new
  end
  
  def create
    @merchant = find_merchant
    @bulk_discount = @merchant.bulk_discounts.new(bulk_discount_params)
    if @bulk_discount.save
      flash.notice = "Discount successfully saved!"
      redirect_to merchant_bulk_discounts_path(@merchant)
    else
      flash.notice = "Field can't be blank"
      redirect_to new_merchant_bulk_discount_path(@merchant)
    end
  end

  def destroy
    @merchant = find_merchant
    @bulk_discount = @merchant.bulk_discounts.find(params[:id])
    @bulk_discount.destroy
    redirect_to merchant_bulk_discounts_path(@merchant)
  end

  private
  def find_merchant
    Merchant.find(params[:merchant_id])
  end
  
  def bulk_discount_params
    params.permit(:percentage_discount, :quantity_threshold)
  end
end