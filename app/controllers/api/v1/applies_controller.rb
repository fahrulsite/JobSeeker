class Api::V1::AppliesController < ApplicationController
    before_action :set_apply, only: [:show, :update, :destroy]

    # GET /applies
  def index
    @applies = Apply.all

    render json: @applies.map { |apply| apply.data }
  end

  # GET /applies/1
  def show
    render json: @apply.data
  end

  # POST /applies
  def create
    @apply = Apply.new(apply_params)

    if @apply.save
      render json: @apply.data, status: :created
    else
      render json: @apply.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /applies/1
  def update
    if @apply.update(apply_params)
      render json: @apply.data
    else
      render json: @apply.errors, status: :unprocessable_entity
    end
  end

  # DELETE /applies/1
  def destroy
    @apply = Apply.find(params[:id])
    if @apply
        @apply.destroy
        render json:{messages:'Apply successfully deleted' }, status:200
    else
        render error:{error:'Unable to delete Apply.'}, status:400
    end
end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apply
      @apply = Apply.find_by_id(params[:id])
      if @apply.nil?
        render json: { error: "Apply not found" }, status: :not_found
      end
    end

    # Only allow a trusted parameter "white list" through.
    def apply_params
      params.require(:apply).permit(:user_id, :job_vacancy_id, :status)
    end
end
