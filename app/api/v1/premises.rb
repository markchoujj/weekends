module V1
  class Premises < Grape::API
    resources :premises do

      desc 'list all premises'
      params do
        requires :latitude, type: Float
        requires :longitude, type: Float
        requires :range, type: Integer
        optional :lowest_heat, type: Integer
        optional :highest_heat, type: Integer
        optional :name, type: String
        optional :drink, type: String
        optional :limit, type: Integer
        optional :customer_count, type: Integer
        optional :gaming, type: Boolean
      end
      get do
        limit = params[:limit] || 10
        premises = Premise.all
        if params[:name].present?
          premises = premises.where("LOWER(name) LIKE ?", "%#{params[:name].downcase}%")
        end
        if params[:highest_heat].present?
          premises = premises.where("heat <= ?", params[:highest_heat])
        end
        if params[:lowest_heat].present?
          premises = premises.where("heat >= ?", params[:lowest_heat])
        end
        if params[:customer_count].present?
          premises = premises.where("available - inside > ?", params[:customer_count])
        end
        if params[:drink].present?
          premises = premises.joins(:drinks).where("LOWER(drinks.name) LIKE ?", "%#{params[:drink]}%")
        end
        if params[:gaming].present?
          premises = premises.where(gaming: params[:gaming])
        end

        premises = premises.where("longitude > ? AND longitude < ? AND latitude > ? AND latitude < ?",
          params[:longitude] - 2,
          params[:longitude] + 2,
          params[:latitude] - 2,
          params[:latitude] + 2
        )

        coordinates = [params[:latitude].to_f, params[:longitude].to_f]

        range = params[:range]
        premises = premises.select{|pr| pr.get_distance(coordinates) <= range.to_f}

        premises.sort_by{|pr| pr.get_distance(coordinates)}.first(limit)

        present :data, premises, with: V1::Entities::Premise
        response_format
      end

      desc "Premise detail"
      get ":id" do
        premise = Premise.find(params[:id])
        response_format
        present :data, premise, with: V1::Entities::Premise, detail: true
      end
    end
  end
end
