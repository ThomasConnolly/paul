class RemoveInvitationsFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :member_id, :integer
    remove_column :users, :invitation_token, :string
    remove_column :users, :invitation_created_at, :datetimme
    remove_column :users, :invitation_sent_at, :datetime
    remove_column :users, :invitation_accepted_at, :datetime
    remove_column :users, :invitation_limit, :integer
    remove_column :users, :invited_by_id, :integer
    remove_column :users, :invited_by_type, :string
    remove_column :users, :invitations_count, :integer
  end
end
