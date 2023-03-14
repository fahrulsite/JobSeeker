class Apply < ApplicationRecord

    belongs_to :user
    belongs_to :job_vacancy

    validates :user_id, presence: true
    validates :job_vacancy_id, presence: true
    validates :status, presence: true

    enum status
    {
        process: 0,
        accepted: 1,
        rejected: 2,
    }

    
    def new_attributes
        {
            id: self.id,
            user_id: self.user_id,
            job_vacancy_id: self.job_vacancy_id,
            status: self.status,
            created_at: self.created_at,
        }
        
    end
end
