class User < ApplicationRecord
    has_secure_password
    has_many :applies
    # validates :email, presence: true, length: { maximum: 255 },
    #                 format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
    #                 uniqueness: true
    
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
