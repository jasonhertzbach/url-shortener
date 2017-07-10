class UrlsController < ApplicationController
  def index
    @url = Url.new
    @urls = Url.all
  end


  def create
    @url = Url.new(params.require(:url).permit(:long_url))
    @url.short_url = SecureRandom.base64(6)

    if @url.long_url.start_with?("https://") || @url.long_url.start_with?("http://")
      @url.save
      redirect_to urls_path
    else
      @url.long_url = "https://#{@url.long_url}"
      @url.save
      redirect_to urls_path
    end
  end
  def show
    @url = Url.find(params[:short_url])
    redirect_to @url.long_url
  end
end
