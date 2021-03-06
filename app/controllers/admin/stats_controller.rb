# frozen_string_literal: true

module Admin
  # Controller used to override Administrate default behaviour
  class StatsController < Admin::ApplicationController
    def index
      @number_of_users = User.where.not(role: 'Admin').count
      @unanswered_questions = Question.where(:answers.empty?).count
      @top_ten_fav = Product.order(favourite_counter: :desc).first(10)
      @top_ten_questions = Product.order(questions_counter: :desc).first(10)
    end
  end
end
