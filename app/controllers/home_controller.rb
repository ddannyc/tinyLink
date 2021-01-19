class HomeController < ApplicationController
  def index
  end

  def url_code
    code = params[:code]
    link = code.present? && Link.find_by(url_code: code)
    if link&.active?
      link.increment!(:view_count, 1)
      redirect_to Base64.urlsafe_decode64(link.origin_url)
    else
      render file: "#{Rails.root}/public/404.html" , status: :not_found
    end
  end
end
