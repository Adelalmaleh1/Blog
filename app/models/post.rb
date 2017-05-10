class Post < ActiveRecord::Base
	validates :title, presence: true, length: { minimum: 3, maximum: 50}
	validates :body, presence: true, length: {minimim: 10, maximum: 2000 }
	has_many :comments, dependent: :destroy
	default_scope { where(deleted_at: nil) }

	def soft_delete
		self.deleted_at = Time.now
		self.comments.update_all(deleted_at: Time.now)
		self.save!
	end
end
