class AlbergueChildrenController < ApplicationController
  before_action :set_albergue_child, only: [:show, :edit, :update, :destroy]

  # GET /albergue_children
  # GET /albergue_children.json
  def index
    @albergue_children = AlbergueChild.all
  end

  # GET /albergue_children/1
  # GET /albergue_children/1.json
  def show
  end

  # GET /albergue_children/new
  def new
    @albergue_child = AlbergueChild.new
  end

  # GET /albergue_children/1/edit
  def edit
  end

  # POST /albergue_children
  # POST /albergue_children.json
  def create
    @albergue_child = AlbergueChild.new(albergue_child_params)

    respond_to do |format|
      if @albergue_child.save
        format.html { redirect_to @albergue_child, notice: 'Albergue child was successfully created.' }
        format.json { render :show, status: :created, location: @albergue_child }
      else
        format.html { render :new }
        format.json { render json: @albergue_child.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /albergue_children/1
  # PATCH/PUT /albergue_children/1.json
  def update
    respond_to do |format|
      if @albergue_child.update(albergue_child_params)
        format.html { redirect_to @albergue_child, notice: 'Albergue child was successfully updated.' }
        format.json { render :show, status: :ok, location: @albergue_child }
      else
        format.html { render :edit }
        format.json { render json: @albergue_child.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albergue_children/1
  # DELETE /albergue_children/1.json
  def destroy
    @albergue_child.destroy
    respond_to do |format|
      format.html { redirect_to albergue_children_url, notice: 'Albergue child was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_albergue_child
      @albergue_child = AlbergueChild.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def albergue_child_params
      params.require(:albergue_child).permit(:first_name, :last_name, :avatar, :birthday)
    end
end
