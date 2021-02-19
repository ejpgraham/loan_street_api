module Api::V1
  class LoansController < ApplicationController
    def show
      @loan = find_loan_by_id_and_api_key
      if @loan
        render json: @loan, status: 200
      else
        render json: { status: 404 }
      end
    end

    def create
      @loan = Loan.new(create_params)
      if @loan.save!
        render json: @loan, status: 201
      else
        render json @loan.errors, status: 400
      end
    end

    def destroy
      @loan = find_loan_by_id_and_api_key
      if @loan
        @loan.destroy!
        render json: { status: 200 }
      else
        render json: { status: 404 }
      end
    end

    private

    def create_params
      params.permit(:amount, :interest, :length, :monthly_payment_amount, :api_key)
    end

    def find_loan_by_id_and_api_key
      Loan.find_by(id: params[:id], api_key: params[:api_key])
    end
  end
end
