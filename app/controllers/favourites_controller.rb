# frozen_string_literal: true

class FavouritesController < ApplicationController
  load_and_authorize_resource

  def index
    @title = 'Favourites'
    @favourites = current_user.favourites
    flash[:info] = 'There are no favourites yet!' unless @favourites.any?
    # @favourites = @favourites.paginate(page: params[:page]) if @favourites.any?
  end

  def create
    product = Product.find(params[:product_id])
    current_user.add_favourite params[:product_id]
    redirect_to product
  end

  def destroy
    fav = Favourite.find(params[:id])
    product = fav.product
    current_user.remove_favourite fav
    redirect_to product
  end
end
