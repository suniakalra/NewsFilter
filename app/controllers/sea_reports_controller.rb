class SeaReportsController < ApplicationController
  before_action :set_sea_report, only: [:show, :edit, :update, :destroy]

  def create_ship_particular
    current_sea_report = SeaReport.find(session[:current_sea_report_id].to_i)
    current_sea_report.create_ship_particular(:vessel_name => params[:vessel_name], :vessel_imo_no => params[:imo_no], :captain_name => params[:captain], :chief_engineer => params[:chief], :vessel_id => 1)

    flash[:notice] = 'Ship particulars have been updated successfully'
    redirect_to sea_report_path(current_sea_report.id)
  end

  # GET /sea_reports/1
  # GET /sea_reports/1.json
  def show
    session[:current_sea_report_id] = params[:id]
    @sea_report = SeaReport.find(params[:id]) 
    @count = @sea_report.report_count

    # Store the Session values


    # Save the Port names in session
    @sea_port = SeaPort.where(:first_sea_report_id =>  session[:first_sea_report_id]).first

    session[:starting_port] = Port.find(@sea_port.starting_port_id).name
    session[:reached_port] =  Port.find(@sea_port.reached_port_id).name
  end

  def index
    @sea_reports = SeaReport.all
  end

  # GET /sea_reports/new
  def new
    @sea_report = SeaReport.new
  end

  # GET /sea_reports/1/edit
  def edit
    session[:current_sea_report_id] = params[:id]
    @sea_report = SeaReport.find(params[:id])
    @sea_port = SeaPort.find(@sea_report.sea_port_id)
  end

  # POST /sea_reports
  # POST /sea_reports.json
  def create
    @sea_report = SeaReport.new(sea_report_params)

    respond_to do |format|
      if @sea_report.save
        format.html { redirect_to @sea_report, notice: 'Sea report was successfully created.' }
        format.json { render :show, status: :created, location: @sea_report }
      else
        format.html { render :new }
        format.json { render json: @sea_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sea_reports/1
  # PATCH/PUT /sea_reports/1.json
  def update
    respond_to do |format|
      if @sea_report.update(sea_report_params)
        format.html { redirect_to @sea_report, notice: 'Sea report was successfully updated.' }
        format.json { render :show, status: :ok, location: @sea_report }
      else
        format.html { render :edit }
        format.json { render json: @sea_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sea_reports/1
  # DELETE /sea_reports/1.json
  def destroy
    @sea_report.destroy
    respond_to do |format|
      format.html { redirect_to sea_reports_url, notice: 'Sea report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sea_report
      @sea_report = SeaReport.find(params["id"])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sea_report_params
      params[:sea_report]
    end
end