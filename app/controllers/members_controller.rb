# frozen_string_literal: true

class MembersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_member, only: %i[show update edit destroy]

  def index
    @members = Member.all.order(:last_name)
    @import = Member::Import.new
    @diaspora = Member.where.not(away_zip: nil).where.not(email: nil)
  end

  def import
    @import = Member::Import.new member_import_params
    if @import.save
      redirect_to members_path, notice: "Imported #{@import.imported_count} members"
    else
      @members = Member.all
      flash[:alert] = "There were #{@import.errors.count} errors in your CSV file"
      render action: :index
    end
  end


  def update
    @member.update(member_params)
    @member.save
    redirect_to members_path
  end

  def edit; end

  def show; end

  def destroy
    @member.destroy
    redirect_to members_path, notice: "Member successfully deleted"
  end



  private

  def member_import_params
    params.require(:member_import).permit(:file)
  end

  def set_member
    @member = Member.find(params[:id])
  end

  def member_params
    params.require(:member).permit(:last_name, :first_name, :membership_id,:birthday, :email, :yday, :away_zip)
  end
end
