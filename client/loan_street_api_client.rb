module LoanStreet
  class ApiClient

    def intialize(api_key)
      @api_key = api_key
    end

    # params: { id, amount, monthly_payment_amount, interest, length }
    def create_loan(params)
      set_api_key(params)
      post('api/v1/loan', params)
    end

    # params: { id }
    def load_loan(params)
      set_api_key(params)
      get('api/v1/loan', params)
    end

    # params: { id }
    def delete_loan(params)
      set_api_key(params)
      delete('api/v1/loan', params)
    end

    # TODO: Implement requesting an API key from API server.
    # def request_api_key
    #
    # end

    private

    def set_api_key(params)
      params['api_key'] = @api_key
    end
  end
end
