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

  def edit
    @link = Link.find(params[:id])
  end

  def update
    link = Link.find(params[:id])

    if link
      link.update_attributes(update_params)
      @link = link
    else
      flash[:error] = link.errors.full_messages.join(", ")
    end

    redirect_to root_path
  end

  private

  def update_params
    params.require(:link).permit(:id, :read, :title, :url)
  end

  def validate_link(link)
    if link.valid?
      link.save
    else
      flash[:error] = link.errors.full_messages.join(", ")
    end
  end
end