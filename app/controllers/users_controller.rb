require 'pry' # using 'binding.pry to debug'

class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end
end
