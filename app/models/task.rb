class Task < ApplicationRecord
  belongs_to :user
  mount_uploader :task_image, TaskImageUploader
  validates :content, presence: true
  validates :expired_at, presence: true
end
