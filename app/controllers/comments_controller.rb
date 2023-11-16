class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]


  # GET /comments/1/edit
  def edit
  end

  # POST /comments or /comments.json
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to comment_url(@comment), notice: "Comment was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    if @comment.update(comment_params)
      redirect_to comment_url(@comment), notice: "Comment was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def delete
  end
  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment.destroy
    redirect_to club_url(@comment.club), notice: "Comment was successfully destroyed."
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:user_id, :club_id, :content, :feeling)
  end
end
