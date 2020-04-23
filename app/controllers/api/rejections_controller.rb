class Api::RejectionsController < ApplicationController
  def index
    render "index.json.jb"
  end

  def create
    render "create.json.jb"
  end

  def show
    render "show.json.jb"
  end

  def update
    render "update.json.jb"
  end

  def destroy
    render "destroy.json.jb"
  end

end
