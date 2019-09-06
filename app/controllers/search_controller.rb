class SearchController < ApplicationController
  def index
    render locals: {
      facade: HouseMemberSearchResults.new(params[:house])
    }
  end
end
