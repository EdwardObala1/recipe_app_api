class Recipe < ApplicationRecord
    belongs_to :user
    validates :title, presence: true, length: {minimum: 20}
    validates :body, presence: true, length: {min: 30}
end
