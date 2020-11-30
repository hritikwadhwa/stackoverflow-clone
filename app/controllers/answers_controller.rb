class AnswersController < ApplicationController
  def create
    if logged_in?
      @answer = Answer.new(answer_params)
      if @answer.save
        flash[:success] = "Answer saved successfully."
      else
        flash[:danger] = "Error saving answer."
      end

    else
      redirect_to sessions_new_path
    end
  end

  def update
  end

  def delete
    if logged_in?
      @answer = Answer.find(params[:id], user_id: @current_user.id, question_id: params[:question_id])
      if @answer.destroy
        flash[:success] = "Answer deleted successfully."
      else
        flash[:danger] = "Error deleting answer."
      end
    else
      redirect_to sessions_new_path
    end
  end


  private
    def answer_params
      print @current_user.nil?
      params.permit(:body).merge(user_id: @current_user.id, question_id: params[:question_id])
    end
end
