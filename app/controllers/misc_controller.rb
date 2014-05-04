class MiscController < ApplicationController
	skip_before_filter :authenticate_user!

  def about
  end

  def home
  end
end
