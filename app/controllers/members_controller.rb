class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]
  before_action :set_organization, only: [:show, :new, :edit, :create, :update]

  # GET /organizations/1/members/1
  def show
  end

  # GET /organizations/1/members/new
  def new
    @member = @organization.members.build
  end

  # GET /organizations/1/members/1/edit
  def edit
  end

  # POST /organizations/1/members
  # POST /organizations/1/members.json
  def create
    @member = @organization.members.build(member_params)

    respond_to do |format|
      if @member.save
        format.html { redirect_to organization_path(@organization), notice: 'Member was successfully created.' }
        #format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organizations/1/members/1
  # PATCH/PUT /organizations/1/members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to organization_path(@organization), notice: 'Member was successfully updated.' }
        format.json { render :show, status: :ok, location: @organization }
      else
        format.html { render :edit }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizations/1/members/1
  # DELETE /organizations/1/members/1.json
  def destroy
    organization = @member.organization 

    @member.destroy
    respond_to do |format|
      format.html { redirect_to organization, notice: 'Member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    def set_organization
      @organization = Organization.find(params[:organization_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:first_name, :last_name, :title, :organization_id, :summary, :full_text_bio, :url, :picture)
    end
end
