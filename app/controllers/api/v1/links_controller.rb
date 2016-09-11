class Api::V1::LinksController < ApiBaseController
  def update
    link = Link.find(params[:id])

    if link
      link.update_attributes(update_params)
      render json: link
    else
      render status: 500
    end
  end

  private

  def update_params
    params.permit(:id, :read, :title, :url)
  end
end