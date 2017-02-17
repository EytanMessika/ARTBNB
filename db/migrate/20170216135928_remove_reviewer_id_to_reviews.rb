class RemoveReviewerIdToReviews < ActiveRecord::Migration[5.0]
  def change
    remove_column :reviews, :reviewer_id, :integer
    remove_column :reviews, :reviewed_id, :integer
  end
end
