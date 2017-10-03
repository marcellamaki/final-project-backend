class Api::V1::QuestionsController < ApplicationController

    def index
      user = User.find(params[:id])
      questions = user.questions

      render json: questions
    end

    def create
      byebug
      question = Question.create(question_params)
      render json: question
    end

    def question_params
      params.require(:data).permit(:text, :user_id, :question_id)
    end

  end
