class User < ApplicationRecord
    has
    has_secure_password
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: true

    enum role: {
        admin: 1,
        recruiter: 2,
        applicant: 3
      }

      def new_attributes
        {
          id: self.id,
          name: self.name,
          email: self.email,
          password_digest: self.password_digest,
          company: self.company,
          address: self.address,
          role: self.role,
          cv: self.cv,
          bio: self.bio,
          created_at: self.created_at,
        }
      end
end
