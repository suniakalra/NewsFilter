class SeaPortsController < ApplicationController

  # create new 'sea port' and 'sea report corresponding to it'
  # Redirect to edit page of the sea report.
  def create_sea_port

    session[:starting_port] = params[:starting_port]
    session[:reached_port] = params[:reached_port]

    @sea_port = SeaPort.new(starting_port_name: params[:starting_port], reached_port_name: params[:reached_port], description: params[:description], total_reports: 1)

    respond_to do |format|
      if @sea_port.save
       sea_report = @sea_port.sea_reports.create(:report_count => 1)

       format.html { redirect_to edit_sea_report_path(sea_report.id), notice: 'New Sea report was successfully created.' }

      else
        format.html { redirect_to sea_reports_path, notice: 'Please try again' }
      end
    end
  end


  def update_sea_port
  	debugger
  	puts 'H'
  end

end
