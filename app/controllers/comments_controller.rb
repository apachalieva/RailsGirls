class CommentsController < ApplicationController
  
  before_action :set_idea
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @comments = @idea.comments.all
    respond_with(@comments)
  end

  def show
    respond_with(@comment)
  end

  def new
    @comment = @idea.comments.new
    respond_with(@comment)
  end

  def edit
  end

  def create
    @comment = @idea.comments.new(comment_params)
    @comment.save
    redirect_to idea_url(@idea)
  end

  def update
    @comment.update(comment_params)
    respond_with(@comment)
  end

  def destroy
    @comment.destroy
    redirect_to idea_url(@idea)
  end

  private
    def set_comment
      @comment = @idea.comments.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body).merge(user: current_user)
    end

    def set_idea
      @idea = Idea.find(params[:idea_id])
    end
end
