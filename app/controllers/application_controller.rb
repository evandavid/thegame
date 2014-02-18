class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :construct_api

  protected
  def construct_api
    @sem3 = Semantics3::Products.new(TheGame::Application::API_KEY,
      TheGame::Application::API_SECRET)
    @sem3.products_field( "cat_id", 11932 )
    @sem3.products_field( "category", "Video Game" )
  end
end
