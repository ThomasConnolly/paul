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
        flash[:alert] = "There were #{@import.errors.count} errors in your csv file."
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
  end

  


   private

   def member_import_params
    params.require(:member_import).permit(:file)
  end

   def set_member
    @member = Member.find(params[:id])
  end

  def member_params
    params.require(:member).permit(:last_name, :first_name, :email, :birthday, :anniversary, :membership_id)
  end
end
