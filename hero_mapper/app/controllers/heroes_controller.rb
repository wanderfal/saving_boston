require 'digest/md5'

class HeroesController < ApplicationController

  def index
    @popular_heroes = Heroe.order(comics: :desc).limit(15)
    render "heroes"
  end

end 