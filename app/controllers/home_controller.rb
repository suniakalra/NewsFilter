class HomeController < ApplicationController

  def index
  	@sea_reports ||= SeaReport.all
  end

end
