class RootController < ApplicationController
  def index
    session[:has_seen_root] = true
  end
end
