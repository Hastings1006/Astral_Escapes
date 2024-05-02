class RenameReviewsTable < ActiveRecord::Migration[7.1]
  def change
    rename_column :reviews, :booking_id, :bookings_id
  end
end
