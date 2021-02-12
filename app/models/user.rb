class User < ActiveRecord::Base
    has_many :teams, class_name: "Team", foreign_key: "trainer_id"
    has_many :pokemon, through: :teams
    has_secure_password
    validates :password, length: {in: 10..100}, confirmation: true
    validates :username, uniqueness: true, length: {in: 5..30}, exclusion: {in: %w(admin superadmin user)}
    validates :email, presence: true, uniqueness: true, email: true
end