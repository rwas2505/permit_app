class Api::RejectionsController < ApplicationController
  def index
    @rejections = Rejection.all
    render "index.json.jb"
  end

  def create
    @rejection = Rejection.new(
      category: params[:category],
      sub_category: params[:sub_category],
      product: params[:product],
      office: params[:office],
      state: params[:state],
      ahj: params[:ahj],
      note: params[:note],
      case: params[:case],
      installation: params[:installation],
      level_reviewed: params[:level_reviewed],
      rejection_source: params[:rejection_source],
      corrections_uploaded: params[:corrections_uploaded]
    )
    if @rejection.save
      render "show.json.jb"
    else
      render json: {errors: @rejection.errors.full_messages}, status: :unprocessable_entity 
    end
  end

  def show
    @rejection = Rejection.find_by(id: params[:id])
    render "show.json.jb"
  end

  def update
    @rejection = Rejection.find_by(id: params[:id])
    @rejection.category = params[:category] || @rejection.category
    @rejection.sub_category = params[:sub_category] || @rejection.sub_category
    @rejection.product = params[:product] || @rejection.product
    @rejection.office = params[:office] || @rejection.office
    @rejection.state = params[:state] || @rejection.state
    @rejection.ahj = params[:ahj] || @rejection.ahj
    @rejection.note = params[:note] || @rejection.note
    @rejection.case = params[:case] || @rejection.case
    @rejection.installation = params[:installation] || @rejection.installation
    @rejection.level_reviewed = params[:level_reviewed] || @rejection.level_reviewed
    @rejection.rejection_source = params[:rejection_source] || @rejection.rejection_source
    @rejection.corrections_uploaded = params[:corrections_uploaded] || @rejection.corrections_uploaded
    if @rejection.save
      render "show.json.jb"
    else
      render json: {errors: @rejection.errors.full_messages}, status: :bad_request
    end
  end

  def destroy
    @rejection = Rejection.find_by(id: params[:id])
    @rejection.destroy
    render "destroy.json.jb"
  end

end
