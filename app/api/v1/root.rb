require 'grape-swagger'

module V1
  class Root < Grape::API
    prefix 'api'
    format :json
    version 'v1', using: :path

    before do
      header['Access-Control-Allow-Origin'] = '*'
      header['Access-Control-Request-Method'] = '*'
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
      error!(result: false, message: I18n.t("activerecord.errors.messages.record_not_found", record: e.model.constantize.model_name.human), status: 404)
    end

    rescue_from :all do |e|
      error!(result: false, message: e.message, status: 422)
    end

    helpers V1::Helpers
    mount V1::Premises
    # mount V1::Newses
    # mount V1::PaymentPlans
    # mount V1::Client::Sessions
    # mount V1::Client::Notifications
    # mount V1::Client::Institutions
    # mount V1::Client::Favourates
    # mount V1::Organisation::Actions
    # mount V1::Organisation::Dashboards
    # mount V1::Organisation::Sessions
    # mount V1::Organisation::Institutions
    # mount V1::Organisation::Users
    # mount V1::Organisation::Tags
    # mount V1::Organisation::Notifications
    # mount V1::Organisation::NotifyDetails
    add_swagger_documentation mount_path: '/swagger_doc',
                              api_version: 'v1',
                              info: {
                                title: 'AI API V1'
                              }
  end
end
