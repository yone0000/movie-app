class Article < ApplicationRecord
#     extend ActiveHash::Associations::ActiveRecordExtensions
 
  belongs_to :user
  has_many :messages, dependent: :destroy
  has_many :reviews, dependent: :destroy
    
    mount_uploader :video, VideoUploader


    validates :title, :body, :video, presence: true
    def avg_score
      unless self.reviews.empty?
        reviews.average(:score).round(1).to_f
      else
        0.0
      end
    end
  
    def review_score_percentage
      unless self.reviews.empty?
        reviews.average(:score).round(1).to_f*100/5
      else
        0.0
      end
    end

  
end

