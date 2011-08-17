class HomeController < ApplicationController
  def flashme
    flash[:notice] = "NOTICE NOTICE NOTICE NOTICE NOTICE"
    flash[:error] = "ERROR ERROR ERROR ERROR ERROR"
    flash[:warning] = "WARNING WARNING WARNING WARNING WARNING"
  end
end
