class LinksController < ApplicationController
  before_action :authorize

  def index
    @links = current_user.links
  end

  def create
    new_link = Link.new(title: params[:link][:title], url: params[:link][:url], user: current_user)
    
    validate_link(new_link)

    redirect_to root_path
  end

  private

  def validate_link(link)
    if link.valid?
      link.save
    else
      flash[:error] = link.errors.full_messages.join(", ")
    end
  end
end