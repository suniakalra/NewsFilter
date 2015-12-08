class SeaReportsController < ApplicationController
  before_action :set_sea_report, only: [:show, :edit, :update, :destroy]

  # GET /sea_reports/1
  # GET /sea_reports/1.json
  def show
    session[:current_sea_report_id] = params[:id]
    @sea_report = SeaReport.find(params[:id]) 
    @count = @sea_report.report_number
  end

  def index
    @open_report = SeaReport.where(session[:current_sea_report_id]).first
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
        format.html { redirect_to sea_reports_path, notice: 'Sea report was successfully updated.' }
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

  def close_report
      @sea_report = SeaReport.find(session[:current_sea_report_id])

      time_difference_in_seconds  = @sea_report.updated_at - @sea_report.created_at
      report_interval = (time_difference_in_seconds/60/60)
      #report_interval = helper.distance_of_time_in_words(time_difference_in_seconds)

      updated = @sea_report.update_attributes(:is_closed => true, :closed_time_in_utc => DateTime.now, :report_interval => report_interval)

      # Find the smt time for the zonetime

      # Time.zone = @sea_report.time_zone
      # Time.zone.now # shows current time according to @user.time_zone
      respond_to do |format|
        if updated
          format.html { redirect_to sea_reports_path, notice: 'Sea report was successfully updated.' }
          format.json { render :show, status: :ok, location: @sea_report }
        else
          format.html { render :edit }
          format.json { render json: @sea_report.errors, status: :unprocessable_entity }
        end
      end


  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sea_report
      @sea_report = SeaReport.find(params["id"])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sea_report_params
      params.require(:sea_report).permit(:is_closed, :closed_time_in_smt, :closed_time_in_utc, :report_number,  :zone_time, :report_interval)
    end
end