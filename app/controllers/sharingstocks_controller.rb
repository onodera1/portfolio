class SharingstocksController < ApplicationController
	def create
    @sharingstock = current_user.sharingstocks.create(sharing_id: params[:sharing_id])
    @sharingstock.save!
    redirect_back(fallback_location: sharings_path)
  end

  def destroy
    @sharingstock = current_user.  sharingstocks.find_by(sharing_id: params[:sharing_id])
    @sharingstock.destroy!
    redirect_back(fallback_location: sharings_path)
  end
end
