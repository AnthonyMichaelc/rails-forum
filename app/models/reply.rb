class Reply < ApplicationRecord
  belongs_to :discussion
  belongs_to :user
  validates :reply, presence: true

  extends FriendlyId
  friendly_id :reply, user, [:slugged, :finders]

  def should_generate_new_friendly_id?
    reply_changed?
  end
end
