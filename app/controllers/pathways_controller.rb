class PathwaysController < ApplicationController
before_action :set_pathway, only: [:show, :edit, :update, :destroy]

def index
  @pathways = Pathway.all
end

def edit; end

def show; end

def new
  @pathway = Pathway.new
end


def create
  @pathway = Pathway.new(pathway_params)
  if @pathway.save
    redirect_to pathways_path
  else
    render :new
  end
end

def update
  if @pathway.update(pathway_params)
    redirect_to @pathway
  else
    render :edit
  end
end

def destroy
  @pathway.destroy
  redirect_to "/"
end


private

  def set_pathway
    @pathway = Pathway.find(params[:id])
  end

  def pathway_params
    params.require(:pathway).permit(:image, :link, :title)
  end
end
