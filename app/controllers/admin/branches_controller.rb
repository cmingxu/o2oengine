class Admin::BranchesController < Admin::BaseController
  before_action :set_branch, only: [:show, :edit, :update, :destroy]
  before_filter do
    push_breadcrumb(OpenStruct.new(:text => "门店管理", :href => admin_branches_path))
  end

  # GET /branches
  # GET /branches.json
  def index
    @branches = Branch.all.page params[:page]
  end

  def list
    @branches = Branch.all.page params[:page]
  end

  # GET /branches/1
  # GET /branches/1.json
  def show
  end

  # GET /branches/new
  def new
    push_breadcrumb(OpenStruct.new(:text => "新建门店", :href => new_admin_branch_path))
    @branch = Branch.new
    render layout: false
  end

  # GET /branches/1/edit
  def edit
    render layout: false
  end

  # POST /branches
  # POST /branches.json
  def create
    @branch = Branch.new(branch_params)

    respond_to do |format|
      if @branch.save
        format.html { redirect_to admin_branches_path, notice: 'Branch was successfully created.' }
        format.json { render :show, status: :created, location: @branch }
      else
        format.html { render :new }
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /branches/1
  # PATCH/PUT /branches/1.json
  def update
    respond_to do |format|
      if @branch.update(branch_params)
        format.html { redirect_to admin_branches_path, notice: 'Branch was successfully updated.' }
        format.json { render :show, status: :ok, location: @branch }
      else
        format.html { render :edit }
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /branches/1
  # DELETE /branches/1.json
  def destroy
    @branch.destroy
    respond_to do |format|
      format.html { redirect_to admin_branches_url, notice: 'Branch was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_branch
      @branch = Branch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def branch_params
      params.require(:branch).permit(:name, :address, :contact, :lng, :lat)
    end
end
