class Api::V1::QuestionsController < ApplicationController

    def index
      questions = Question.all
      render json: questions
    end

    def create
      question = Question.create(question_params)
      render json: question
    end

    def question_params
      params.require(:data).permit(:text)
    end

  end
