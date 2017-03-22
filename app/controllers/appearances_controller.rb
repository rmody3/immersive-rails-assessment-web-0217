class AppearancesController < ApplicationController

  def new
    @guest = Guest.find(params[:guest_id])
    @appearance = Appearance.new
  end

  def create
    guest = Guest.find(params[:appearance][:guest_id])
    episode = Episode.find_by(number: params[:appearance][:episode])
    appearance = Appearance.new(guest: guest, episode: episode, rating: params[:appearance][:rating])
    if appearance.save
      redirect_to guest_path(guest)
    else
      flash[:notice] = "Could not save the appearance"
      redirect_to new_appearance_path(guest_id: guest.id)
    end
  end

end
