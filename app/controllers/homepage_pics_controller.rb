class HomepagePicsController < ApplicationController
  before_action :set_homepage_pic, only: [:show, :edit, :update, :destroy]
  before_action :ensure_admin_role

  # GET /homepage_pics
  # GET /homepage_pics.json
  def index
    @homepage_pics = HomepagePic.all
  end

  # GET /homepage_pics/1
  # GET /homepage_pics/1.json
  def show
  end

  # GET /homepage_pics/new
  def new
    @homepage_pic = HomepagePic.new
  end

  # GET /homepage_pics/1/edit
  def edit
  end

  # POST /homepage_pics
  # POST /homepage_pics.json
  def create
    @homepage_pic = HomepagePic.new(homepage_pic_params)

    respond_to do |format|
      if @homepage_pic.save
        format.html { redirect_to @homepage_pic, notice: 'Homepage pic was successfully created.' }
        format.json { render :show, status: :created, location: @homepage_pic }
      else
        format.html { render :new }
        format.json { render json: @homepage_pic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /homepage_pics/1
  # PATCH/PUT /homepage_pics/1.json
  def update
    respond_to do |format|
      if @homepage_pic.update(homepage_pic_params)
        format.html { redirect_to @homepage_pic, notice: 'Homepage pic was successfully updated.' }
        format.json { render :show, status: :ok, location: @homepage_pic }
      else
        format.html { render :edit }
        format.json { render json: @homepage_pic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /homepage_pics/1
  # DELETE /homepage_pics/1.json
  def destroy
    @homepage_pic.destroy
    respond_to do |format|
      format.html { redirect_to homepage_pics_url, notice: 'Homepage pic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_homepage_pic
      @homepage_pic = HomepagePic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def homepage_pic_params
      params.require(:homepage_pic).permit(:content, :alt_text)
    end
end
