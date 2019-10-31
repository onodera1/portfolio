class SharingStocksController < ApplicationController
  def create
    @sharingstock = current_user.sharing_stocks.create(sharing_id: params[:sharing_id])
    @sharingstock.save!
    redirect_back(fallback_location: sharings_path)
  end

  def destroy
    @sharingstock = current_user.  sharing_stocks.find_by(sharing_id: params[:sharing_id])
    @sharingstock.destroy!
    redirect_back(fallback_location: sharings_path)
  end
end
