require 'rails_helper'

RSpec.describe Api::V1::LoansController, type: :controller do
  let(:valid_loan_params) do
    {
      amount: 100_000_000,
      interest: 12.5,
      length: 48,
      monthly_payment_amount: 50_000,
      api_key: "API_KEY"
    }
  end

  describe "GET #show" do
    let!(:loan) do
      Loan.create!(valid_loan_params)
    end

    before do
      get :show, params: { id: loan.id, api_key: "API_KEY" }
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "JSON response contains expected loan attributes" do
      expect(JSON.parse(response.body).keys).to eq(loan.attributes.keys)
    end
  end

  describe "POST #create" do
    before do
      get :create, params: valid_loan_params
    end

    it "returns http success" do
      expect(response).to have_http_status(:created)
    end

    it "creates the loan" do
      expect(Loan.all.count).to eq(1)
    end
  end

  describe "DELETE #destroy" do
    let!(:loan) { Loan.create!(valid_loan_params) }

    before do
      get :destroy, params: { id: loan.id, api_key: "API_KEY" }
    end

    it "returns http success status" do
      expect(response).to have_http_status(:success)
    end

    it "destroys the resource" do
      expect(Loan.all.count).to eq(0)
    end
  end
end
