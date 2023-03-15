class JobVacancy < ApplicationRecord

    has_many :applicants, class_name:"Apply", foreign_key:"applicant_id"
    belongs_to :job_vacancies, class_name: "User", foreign_key: "recruiter_id", optional: true

    validates :recruiter_id, presence: true
    validates :position_name, presence: true
    validates :description, presence: true
    validates :requirement, presence: true
    validates :close_date, presence: true


    def data
        {
            id: self.id,
            recruiter_id: self.recruiter_id,
            position_name: self.position_name,
            description: self.description,
            requirement: self.requirement,
            close_date: self.close_date,
            created_at: self.created_at,
        }
    end
end
