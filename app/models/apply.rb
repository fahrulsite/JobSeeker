class Apply < ApplicationRecord

    belongs_to :applicant, class_name:"User", foreign_key:"applicant_id", optional:true
    belongs_to :job_vacancy, class_name:"JobVacancy", foreign_key: "job_vacancy_id"

    validates :applicant_id, presence: true
    validates :job_vacancy_id, presence: true
    validates :status, presence: true

    enum status:
    {
        process: 0,
        accepted: 1,
        rejected: 2,
    }

    def data
        {
            id: self.id,
            applicant_id: self.applicant.name,
            job_vacancy_id: self.job_vacancy.position_name,
            status: self.status,
            created_at: self.created_at,
        }
        
    end
end
