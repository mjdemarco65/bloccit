class User < ActiveRecord::Base
  has_many :posts

  before_save { self.email = email.downcase }
  before_save {self.role ||= :member }
  before_save :format_name

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, length: { minimum: 1, maximum: 100 }, presence: true

  validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
  validates :password, length: { minimum: 6 }, allow_blank: true

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 100 },
            format: { with: EMAIL_REGEX }

  has_secure_password

  enum role: [:member, :admin]

    def format_name
      if name
        name_array = []
        name.split.each do |first_last|
        name_array << first_last.capitalize
    end
    self.name = name_array.join(" ")
    end
  end
end
