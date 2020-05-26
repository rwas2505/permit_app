class Api::JobsController < ApplicationController
  def index
    @jobs = Job.all
    render "index.json.jb"
  end

  def create
    @job = Job.new(
      installation_id: params[:installation_id],
      job_number: params[:job_number],
      state: params[:state],
      ahj: params[:ahj],
      office: params[:office]
      )
    if @job.save
      render "show.json.jb"
    else
      render json: {errors: @job.errors.full_messages}, status: :unprocessable_entity 
    end
  end

  def show
    @job = Job.find_by(id: params[:id])
    render "show.json.jb"
  end

  def update
    @job = Job.find_by(id: params[:id])
    @job.installation_id = params[:installation]
    @job.job_number = params[:job_number] || @job.job_number
    @job.state = params[:state] || @job.state
    @job.ahj = params[:ahj] || @job.ahj
    @job.office = params[:office] || @job.office

    if @job.save
      render "show.json.jb"
    else
      render json: {errors: @job.errors.full_messages}, status: :bad_request
    end
  end

  def destroy
    @job = Job.find_by(id: params[:id])
    @job.destroy
    render "destroy.json.jb"
  end

end
