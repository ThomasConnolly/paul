# == Schema Information
#
# Table name: members
#
#  id            :integer          not null, primary key
#  last_name     :string
#  first_name    :string
#  email         :string
#  anniversary   :date
#  birthday      :date
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  membership_id :string
#  full_name     :string
#

class MembersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_member, only: [:edit, :update, :destroy]
 
  def index
    @members = Member.all
    @import = Member::Import.new
    end
  

  def import
    @import = Member::Import.new member_import_params
      if @import.save
        redirect_to members_path, notice: "Imported #{@import.imported_count} members"
      else
        @members = Member.all
        flash[:alert] = "There were #{@import.errors.count} errors with your CSV file"
        render action: :index
    end
  end

  def update
    @member.update_attributes(member_params)
      @member.save
      redirect_to members_path
  end

  def edit
  end


  def destroy
    @member.destroy
    redirect_to 'back'
  end

  


   private

   def member_import_params
    params.require(:member_import).permit(:file)
  end

   def set_member
    @member = Member.find(params[:id])
  end

  def member_params
    params.require(:member).permit(:last_name, :first_name, :email, :birthday, 
      :anniversary, :membership_id, :full_name)
  end
end
