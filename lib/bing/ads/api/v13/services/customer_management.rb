module Bing
  module Ads
    module API
      module V13
        module Services
          # Bing::Ads::API::V13::Services::CustomerManagement
          class CustomerManagement < Base
            def initialize(options = {})
              super(options)
            end

            def get_accounts_info(customer_id = @customer_id, only_parent_accounts = false)
              payload = {
                customer_id: customer_id,
                only_parent_accounts: (only_parent_accounts == true).to_s
              }
              response = call(:get_accounts_info, payload.compact)
              response_body = response_body(response, __method__)
              response_body[:accounts_info][:account_info]
            end

            def get_account(account_id)
              payload = {
                account_id: account_id
              }
              response = call(:get_account, payload.compact)
              response_body = response_body(response, __method__)
              response_body[:account]
            end

            # TODO operations: https://msdn.microsoft.com/en-us/library/bing-ads-customer-management-service-operations.aspx

            private

            def service_name
              'customer_management'
            end
          end
        end
      end
    end
  end
end
