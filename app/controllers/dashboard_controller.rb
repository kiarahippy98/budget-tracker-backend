class DashboardController < ApplicationController
  def index
    @categories = Category.all
    @transactions = Transaction.all
  end
end
