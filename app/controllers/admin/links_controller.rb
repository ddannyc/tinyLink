module Admin
  class LinksController < Admin::ApplicationController
    before_action :find_link

    def update
      @link.expire!
      redirect_to @link
    end

    def show
    end

    private

    def find_link
      @link = Link.find(params[:id])
    end
  end
end