class HomeController < ApplicationController
  def index
    tmp = @sem3.get_products()
    @productsHash = construct_platform tmp

    if !params['platform'].to_s.blank?
      if !params['search'].to_s.blank?
        platform_and_search
      else
        platform_only
      end
    elsif !params['search'].to_s.blank?
      search_only
    else
      all_games
    end
      
  end

  def platform_only
    tmp_all_games = @sem3
    tmp_all_games.products_field( "platform",  params['platform'])
    @all_games = tmp_all_games.get_products()
  end

  def platform_and_search
    tmp_all_games = @sem3
    tmp_all_games.products_field( "search",  params['search'])
    tmp_all_games.products_field( "platform",  params['platform'])
    @all_games = tmp_all_games.get_products()
  end

  def search_only
    tmp_all_games = @sem3
    tmp_all_games.products_field( "search",  params['search'])
    @all_games = tmp_all_games.get_products()
  end

  def all_games
    @all_games = @sem3.get_products()
  end

  def construct_platform(tmp)
    to_return = []
    tmp['results'].each do |game|
      to_return << game['platform']
    end
    return to_return.uniq
  end
end
