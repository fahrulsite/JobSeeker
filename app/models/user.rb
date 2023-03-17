class User < ApplicationRecord
    has_secure_password
    has_many :applicants, class_name:"Apply", foreign_key:"applicant_id", dependent: :destroy
    has_many :job_vacancy, class_name: "JobVacancy", foreign_key: "recruiter_id", dependent: :destroy

    # validates :email, presence: true, length: { maximum: 255 },
    #                 format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
    #                 uniqueness: true

    mount_uploader :cv, CvUploader

    def data
        {
          id: self.id,
          name: self.name, 
          email: self.email,
          password_digest: self.password_digest,
          company: self.company,
          address: self.address,
          role: self.role,
          cv: self.cv,
          created_at: self.created_at,
          updated_at: self.updated_at
        }
    end

    enum role: {
        admin: 1,
        recruiter: 2,
        applicant: 3,
    }

      
end
