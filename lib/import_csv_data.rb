require "csv"
module ImportCsvData
  class << self
    def parse_file_data(file_path)
      file = File.read(file_path).scrub
      data = CSV.parse(file)
    end

    def implement_premise_data(data_source)
      data = parse_file_data(data_source)
      indexes = [
        data[0].find_index("Licence Name"),
        data[0].find_index("Address"),
        data[0].find_index("Right to Keep Gaming"),
        data[0].find_index("Longitude"),
        data[0].find_index("Latitude"),
        data[0].find_index("Licence No."),
        data[0].find_index("Postcode"),
        data[0].find_index("Suburb"),
        data[0].find_index("Trading Status")
      ]
      data.each_with_index do |row, index|
        next if index == 0 || row[indexes[8]] != "Trading"
        Premise.create(
          name: row[indexes[0]],
          address: row[indexes[1]],
          gaming: row[indexes[2]] == 'Yes',
          latitude: row[indexes[3]].to_d,
          longitude: row[indexes[4]].to_d,
          license_no: row[indexes[5]],
          post_code: row[indexes[6]],
          suburb: row[indexes[7]]
        )
      end
    end

    def implement_drink_data(data_source)
      data = parse_file_data(data_source)
      indexes = [data[0].find_index("brand"), data[0].find_index("name")]
      data.each_with_index do |row, i|
          Drink.create(brand: row[indexes[0]],name: row[indexes[1]]) unless i == 0
      end
    end
  end
end