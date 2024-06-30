class FeedbacksController < ApplicationController
  before_action :set_feedback, only: %i[ show ]

  # GET /feedbacks/1 or /feedbacks/1.json
  def show
  end

  # GET /feedbacks/new
  def new
    @feedback = Feedback.new
  end

  # POST /feedbacks or /feedbacks.json
  def create
    @feedback = Feedback.new(feedback_params)

    respond_to do |format|
      if @feedback.save
        format.html { redirect_to feedback_url(@feedback), notice: "Feedback was successfully created." }
        format.json { render :show, status: :created, location: @feedback }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feedback
      @feedback = Feedback.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def feedback_params
      params.require(:feedback).permit(:message, :email)
    end
end
