class MembersController < ApplicationController
  before_action :authenticate_user!
  
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



   private

   def member_import_params
    params.require(:member_import).permit(:file)
  end
end

