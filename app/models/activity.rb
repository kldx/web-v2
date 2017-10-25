class Activity < ApplicationRecord
  mount_uploader :default_picture, DefaultPictureUploader

  belongs_to :user

  validates_presence_of :default_picture

  default_scope -> { order('activities.start_time ASC') }
  scope :today, -> { where(start_time: DateTime.now.beginning_of_day..DateTime.now.end_of_day) }
  scope :this_week, -> { where(start_time: Time.zone.now.all_week) }
  scope :this_month, -> { where(start_time: Time.now.beginning_of_month..Time.now.end_of_month) }
  scope :next_month, -> { where(start_time: 1.month.from_now.beginning_of_month..1.month.from_now.end_of_month) }

  STATUS_OPTIONS = [
    ["Normal", 0], ["Busy", 1], ["Unavailable", 2]
  ]
end
