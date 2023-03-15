class Api::V1::JobVacanciesController < ApplicationController
     # GET /job_vacancies
  def index
    @job_vacancies = Apply.all

    render json: @job_vacancies.map { |apply| apply.new_attributes }
  end

  # GET /job_vacancies/1
  def show
    render json: @apply.new_attributes
  end

  # POST /job_vacancies
  def create
    @apply = Apply.new(apply_params)

    if @apply.save
      render json: @apply.new_attributes, status: :created, location: @apply
    else
      render json: @apply.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /job_vacancies/1
  def update
    if @job_vacancy.update(job_vacancy_params)
      render json: @job_vacancy.new_attributes
    else
      render json: @job_vacancy.errors, status: :unprocessable_entity
    end
  end

  # DELETE /job_vacancies/1
  def destroy
    @job_vacancy.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_vacancy
      @job_vacancy = Job_vacancy.find_by_id(params[:id])
      if @job_vacancy.nil?
        render json: { error: "Job_vacancy not found" }, status: :not_found
      end
    end

    # Only allow a trusted parameter "white list" through.
    def job_vacancy_params
      params.require(:job_vacancy).permit(:user_id, :position_name, :description, :requirement, :close_date)
    end
end