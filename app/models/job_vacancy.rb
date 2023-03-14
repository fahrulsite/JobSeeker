class JobVacancy < ApplicationRecord

    has_many: applys

    validates :user_id, presence: true
    validates :position_name, presence: true
    validates :description, presence: true
    validates :requirement, presence: true
    validates :close_date, presence: true


    def new_attributes
        {
            id: self.id,
            user_id: self.user_id,
            position_name: self.position_name,
            description: self.description,
            requirement: self.requirement,
            close_date: self.close_date,
            created_at: self.created_at,
        }
end
