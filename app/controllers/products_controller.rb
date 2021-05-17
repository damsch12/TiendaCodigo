# frozen_string_literal: true

# Actions to render products views
class ProductsController < ApplicationController
  before_action :set_product, only: %i[show]
  load_and_authorize_resource

  # GET /products or /products.json
  def index
    @products = Product.all
  end

  # GET /products/1 or /products/1.json
  def show
    @question = user_signed_in? ? Question.new(name: current_user.display_name, email: current_user.email) : Question.new
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end
end
