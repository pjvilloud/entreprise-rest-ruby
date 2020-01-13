class EmployesController < ApplicationController
  include Response
  before_action :pagination_params, only: :index
  before_action :set_employe, only: [:show, :update, :destroy]

  def pagination_params
    params
        .with_defaults(page: 1, size:10, sortProperty:"matricule", sortDirection: "ASC")
  end

  # GET /employes/count
  def count
    json_response(Employe.count)
  end

  # GET /employes
  def index
    employes = Employe.inorder("#{pagination_params[:sortProperty]} #{pagination_params[:sortDirection]}").page(pagination_params[:page]).per(pagination_params[:size])
    json_page_response(employes)
  end

  # POST /employes
  def create
    @employe = Employe.create!(employe_params)
    json_response(@employe, :created)
  end

  # GET /employes/:id
  def show
    json_response_with(@employe, [:manager])
  end

  # PUT /employes/:id
  def update
    @employe.update(employe_params)
  end

  # DELETE /employes/:id
  def destroy
    @employe.destroy
    head :no_content
  end

  private

  def employe_params
    # whitelist params
    params.permit(:nom, :prenom, :matricule)
  end

  def set_employe
    @employe = Employe.find(params[:id]);
  end
end
