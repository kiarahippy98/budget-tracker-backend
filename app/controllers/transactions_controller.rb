class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_transaction, only: %i[show edit update destroy]

  def index
    @transactions = current_user.transactions.includes(:category)
  end

  def show
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = current_user.transactions.build(transaction_params)

    if @transaction.save
      redirect_to transactions_path, notice: # "Transaction created successfully.
    else
      render :new
    end
  end

  def edit
 end

 def update
  if @transaction.update(transaction_params)
    redirect_to transactions_path, notice: # "Transaction updated successfully"
  else
    render :edit
  end
 end

 def destroy
  @transaction.destroy
  redirect_to transactions_path, notice # "Transaction deleted."
 end

 private

 def set_transaction
  @transaction = current_user.transactions.find(params[:id])
 end

 def transaction_params
  params.require(:transaction).permit(:name, :amount, :category_id)
 end
end
