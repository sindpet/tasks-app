class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  def index
    @pagy, @tags = pagy(current_user.tags)
  end

  def show

  end

  def new
    @tag = current_user.tags.build()
  end

  def create
    @tag = current_user.tags.build(tag_params)

    if @tag.save
      redirect_to @tag
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    if @tag.update(tag_params)
      redirect_to @tag
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @tag.destroy

    redirect_to tags_path, status: :see_other
  end

  private
  def tag_params
    params.require(:tag).permit(:title)
  end

  def set_tag
    @tag = current_user.tags.find_by!(id: params[:id])

    # redirect_to tags_path if !@tag
  end
end
