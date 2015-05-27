class ProvincesController < Admin::BaseController
  before_action :set_provice, only: [:show, :edit, :update, :destroy]

  # GET /provices
  # GET /provices.json
  def index
    @provices = Provice.all
  end

  # GET /provices/1
  # GET /provices/1.json
  def show
  end

  # GET /provices/new
  def new
    @provice = Provice.new
  end

  # GET /provices/1/edit
  def edit
  end

  # POST /provices
  # POST /provices.json
  def create
    @provice = Provice.new(provice_params)

    respond_to do |format|
      if @provice.save
        format.html { redirect_to @provice, notice: 'Provice was successfully created.' }
        format.json { render :show, status: :created, location: @provice }
      else
        format.html { render :new }
        format.json { render json: @provice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /provices/1
  # PATCH/PUT /provices/1.json
  def update
    respond_to do |format|
      if @provice.update(provice_params)
        format.html { redirect_to @provice, notice: 'Provice was successfully updated.' }
        format.json { render :show, status: :ok, location: @provice }
      else
        format.html { render :edit }
        format.json { render json: @provice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /provices/1
  # DELETE /provices/1.json
  def destroy
    @provice.destroy
    respond_to do |format|
      format.html { redirect_to provices_url, notice: 'Provice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_provice
      @provice = Provice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def provice_params
      params.require(:provice).permit(:name)
    end
end
