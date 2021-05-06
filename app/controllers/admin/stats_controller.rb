module Admin
  class StatsController < Admin::ApplicationController
    def index
      @stats = {
      }

      @number_of_users = User.count
      @unanswered_questions = Question.where(:answers.empty?).count
      #@top_products_with_questions = (Product.order('COUNT(questions.id) DESC')).take(10)
      byebug
    end
  end
end
