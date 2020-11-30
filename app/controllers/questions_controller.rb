class QuestionsController < ApplicationController
  def index
    @question = Question.all
  end

  def new
    if !logged_in?
      redirect_to sessions_new_path
    end
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to @question.id
    else
      flash[:danger] = "Error saving question"
      return 'new'
    end
  end

  def view
    @question = Question.find(params[:id])
    @answers = Answer.where(question_id: params[:id])
  end

  def update
  end

  def destroy
    @question = Question.find(params[:id])
    if @question.destroy
      flash[:success] = "Question delete successfully"
    else
      flash[:danger] = "Error saving question"
      return 'new'
    end
  end

  private
    def question_params
      params.require(:question).permit(:title, :body)
    end
end
