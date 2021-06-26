class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :messages, dependent: :destroy
         has_one_attached :image
         has_many :articles, dependent: :destroy
         has_many :reviews, dependent: :destroy
         extend ActiveHash::Associations::ActiveRecordExtensions 
         belongs_to :gender

         validates :gender_id, numericality: { other_than: 1 } 

end
