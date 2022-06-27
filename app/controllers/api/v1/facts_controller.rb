class Api::V1::FactsController < ApplicationController
  before_action :set_fact, only: [:show, :update, :destroy]

  def index
    @facts = Fact.all
    render json: @facts
  end

  def show
    render json: @fact
  end

  def create
    @fact = Fact.new(fact_params)

    if @fact.save
      render json: @fact
    else
      render json: {error: 'Unable to create fact.'}, status: 400
    end
  end


  def update
    if @fact.update(fact_params)
      render json: @fact, status: 200
    else
      render json: {error: 'Unable to  update fact.'}, status: 400
    end
  end

  def destroy
    if @fact.destroy
      render json: {message: 'fact deleted successfully.'}, status: 200
    else
      render json: {error: 'Unable to  uupdate fact.'}, status: 400
    end
  end

  private
    def fact_params
      params.require(:fact).permit(:fact, :likes, :user_id)
    end

    def set_fact
      @fact = fact.find(params[:id])
    end
end
