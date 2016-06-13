class CommentsController < ApplicationController
  def new
    @thing = Thing.find(params[:thing_id])
    form Comment::Create
  end

  def create
    run Comment::Create do |op|
      flash[:notice] = "Created comment for #{op.model.thing.name}"
      return redirect_to thing_path(op.model.thing)
    end

    @thing = Thing.find(params[:thing_id])
    render :new
  end
end
