class Discussion < ApplcationRecord
  belongs_to :channel
  belongs_to
  has_many :replies, dependent: :destroy

  validates :title, :content, presence: true
  resourcify

  extend FriendlyId
  frienly_id :title, user: [:slugged, :finders]

  def should_generate_new_friendly_id?
    title_changed?
  end
end
