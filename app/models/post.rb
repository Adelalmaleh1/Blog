class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	default_scope { where(deleted_at: nil) }

	def soft_delete
		self.deleted_at = Time.now
		self.comments.update_all(deleted_at: Time.now)
		self.save!
	end
end
