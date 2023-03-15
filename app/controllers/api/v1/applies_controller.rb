class Api::V1::AppliesController < ApplicationController

    # GET /applies
  def index
    @applies = Apply.all

    render json: @applies.map { |apply| apply.new_attributes }
  end

  # GET /applies/1
  def show
    render json: @apply.new_attributes
  end

  # POST /applies
  def create
    @apply = Apply.new(apply_params)

    if @apply.save
      render json: @apply.new_attributes, status: :created, location: @apply
    else
      render json: @apply.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /applies/1
  def update
    if @apply.update(apply_params)
      render json: @apply.new_attributes
    else
      render json: @apply.errors, status: :unprocessable_entity
    end
  end

  # DELETE /applies/1
  def destroy
    @apply.destroy
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
