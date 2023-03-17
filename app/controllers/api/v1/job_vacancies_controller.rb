class Api::V1::JobVacanciesController < ApplicationController
    before_action :set_job_vacancy, only: [:show, :update, :destroy]

    # GET /job_vacancies
    def index
      @job_vacancies = JobVacancy.all
  
      render json: @job_vacancies.map { |job_vacancy| job_vacancy.data }
    end
  
    # GET /job_vacancies/1
    def show
      render json: @job_vacancy.data
    end
  
    # POST /job_vacancies
    def create
      @job_vacancy = JobVacancy.new(job_vacancy_params)
  
      if @job_vacancy.save
        render json: @job_vacancy.data, status: :created
      else
        render json: @job_vacancy.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /job_vacancies/1
    def update
      if @job_vacancy.update(job_vacancy_params)
        render json: @job_vacancy.data
      else
        render json: @job_vacancy.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /job_vacancies/1
    def destroy
        @job_vacancy = JobVacancy.find(params[:id])
        if @job_vacancy
            @job_vacancy.destroy
            render json:{messages:'Job Vacancy successfully deleted' }, status:200
        else
            render error:{error:'Unable to delete Job Vacancy.'}, status:400
        end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_job_vacancy
        @job_vacancy = JobVacancy.find_by_id(params[:id])
        if @job_vacancy.nil?
          render json: { error: "Job_vacancy not found" }, status: :not_found
        end
      end
  
      # Only allow a trusted parameter "white list" through.
      def job_vacancy_params
        params.require(:job_vacancy).permit(:recruiter_id, :position_name, :description, :requirement, :close_date)
      end
  end
  