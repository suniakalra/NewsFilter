class SeaPortsController < ApplicationController

  # create new 'sea port' and set total_reports => 1
  # 'sea report corresponding to it' n Set report_number 1
  # Redirect to edit page of the sea report.

  def create
    session[:starting_port] = params[:sea_port][:starting_port_name]
    session[:reached_port] = params[:sea_port][:destination_port_name]

    @sea_port = SeaPort.new(sea_port_params)

    respond_to do |format|
      if @sea_port.save

        @sea_port.update_attributes(:total_reports => 1)
        sea_report = @sea_port.sea_reports.create(:report_number => 1,  :zone_time => params[:sea_port][:zone_time], :is_closed => false)

        session[:current_sea_report_id] = sea_report.id
        format.html { redirect_to edit_sea_report_path(sea_report.id), notice: 'New Sea report was successfully created.' }

      else
        format.html { redirect_to sea_reports_path, notice: 'Please try again' }
      end
    end
  end

  def update
    @sea_port = SeaPort.find(params[:id])
    @sea_port.update(sea_port_params)
    
    respond_to do |format|
      if @sea_port.update(sea_port_params)  

        session[:starting_port] = @sea_port.starting_port_name
        session[:reached_port] =  @sea_port.reached_port_name
        format.html { redirect_to edit_sea_report_path(session[:current_sea_report_id]), notice: 'Information updated successfully' }
      else
        format.html { redirect_to edit_sea_report_path(session[:current_sea_report_id]), notice: 'Please try again' }
      end  
    end
  end

  private

  def sea_port_params
    params.require(:sea_port).permit(:starting_port_name, :id, :reached_port_name, :description,  :vessel_name, :vessel_imo_no, :captain_name, :chief_engineer, :total_reports, :zone_time)
  end

end

