class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show edit update destroy]
  load_and_authorize_resource

  # GET /questions or /questions.json
  # def index
  #   @questions = Question.all
  # end

  # GET /questions/1 or /questions/1.json
  def show; end

  # GET /questions/new
  # def new
  #   @question = Question.new
  # end

  # GET /questions/1/edit
  # def edit
  # end

  # POST /questions or /questions.json
  def create
    @question = Question.new(question_params)
    if @question.email.blank? && user_signed_in?
      @question.email = current_user.email
      @question.name = current_user.display_name.nil? ? current_user.email : current_user.display_name
    end

    product = Product.find(product_params[:product_id])
    product.add_question_counter

    if @question.save
      flash[:success] = 'Your question has been sucessfully submitted.'
      UserMailer.with(question: @question).question_submited_email.deliver_later
    else
      flash[:errors] = @question.errors.full_messages
    end

    redirect_to product
  end

  # PATCH/PUT /questions/1 or /questions/1.json
  # def update
  #   respond_to do |format|
  #     if @question.update(question_params)
  #       format.html { redirect_to @question, notice: "Question was successfully updated." }
  #       format.json { render :show, status: :ok, location: @question }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @question.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /questions/1 or /questions/1.json
  # def destroy
  #   @question.destroy
  #   respond_to do |format|
  #     format.html { redirect_to questions_url, notice: "Question was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_question
    @question = Question.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def question_params
    params.require(:question).permit(:question, :name, :email)
  end

  def product_params
    params.permit(:product_id)
  end
end
