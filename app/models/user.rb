class User < ApplicationRecord
  after_create :assign_default_role
  has_one_attached :profile_picture
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :Trackable, :validatable, :Lockable
  has_many :books
  has_many :bookings
  has_many :reservations
  #scopes
  scope :borrowed_books, ->(user) { user.bookings.map { |b| b.book if b.book.status.eql?("Borrowed") } }

  private
  def assign_default_role
    add_role(:member)
  end
end
