class SponsorshipsController < ApplicationController
  before_action :authenticate_user!, except: [:new]
  before_action :redirect_to_signup, only: [:new]
  before_action :set_sponsorship, only: [:show, :edit, :update, :destroy]
  before_action :change_sponsorship, only: :new

  def index
  end

  def show
  end

  def edit
  end

  def new
    @sponsorship = Sponsorship.new
  end

  def create
    @sponsorship = Sponsorship.new(sponsorship_params)
    @sponsorship.user_id = current_user.id if current_user

      if @sponsorship.save
        redirect_to sponsorship_path(@sponsorship)
      else
        render :new
    end
  end

  def update
    @sponsorship.update_attributes(sponsorship_params)

      if @sponsorship.save
        redirect_to sponsorship_path(@sponsorship)
      else
        render :edit
      end
  end

  def destroy
    @sponsorship.destroy
      redirect_to '/', notice: 'Sponsorship was successfully destroyed.'
  end


  private
  
    def set_sponsorship
      @sponsorship = Sponsorship.find(current_user.sponsorship.id)
    end

    def change_sponsorship
      if current_user.sponsorship.present?
        redirect_to edit_sponsorship_path
      end
    end


    def redirect_to_signup
      if !user_signed_in?
        session["user_return_to"] = new_sponsorship_path
        redirect_to new_user_registration_path
      end
    end
    
    def sponsorship_params
      params.require(:sponsorship).permit [:amount, :divisor, :pay_this, :plan, :customer_id, :source, :last_4, :expiraton_date, :email]
    end
end
