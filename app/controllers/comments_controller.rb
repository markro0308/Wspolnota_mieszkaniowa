class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_commentable 
  

  def index
    @comments = @commentable.comments
  end

  def show
    @comment = @commentable.comments.find(params[:id])
  end

  def new
    @comment = @commentable.comments.build
    @comment.commenter=current_user.name<<" "<<current_user.surname
  end

  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.commenter=current_user.name<<" "<<current_user.surname
   
    if @comment.save
      redirect_to @commentable
    else
      render :action => "new"
    end
  end

  def edit
    @comment = @commentable.comments.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to @commentable, notice: "Komentarz został zaktualizowany"
    else
      render :action => "edit"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])  
    @comment.destroy 
    redirect_to @commentable
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :commenter, :commentable_type, :commentable_id)
  end

  def load_commentable
    resource, id = request.path.split('/')[1,2]
    @commentable=resource.singularize.classify.constantize.find(id)
  end

  def correct_user
    @comment=current_user.comments.find_by(id: params[:id])
    redirect_to [@commentable, :comments], notice: "Nie jesteś uprawniony do edycji tego komentarza" if @comment.nil?
  end


end
