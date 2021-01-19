class LinksController < ApplicationController

  def create
    url = Base64.urlsafe_encode64(params[:url])
    pool = CodePool.where(is_use: false).first
    unless pool
      pool = CodePool.generate
    end

    link = nil
    ActiveRecord::Base.transaction do
      link = Link.create(url_code: pool.code, origin_url: url, expire_at: Time.now + 5.minutes)
      pool.update(is_use: true)
    end
    redirect_to link_path(link)
  end

  def show
    @link = Link.find(params[:id])
  end
end
