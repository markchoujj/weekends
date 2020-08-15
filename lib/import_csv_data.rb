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
        data[0].find_index("Licence Name"),    #0
        data[0].find_index("Address"),         #1
        data[0].find_index("Right to Keep Gaming"),  #2
        data[0].find_index("Longitude"),   #3
        data[0].find_index("Latitude"), #4
        data[0].find_index("Licence No."), #5
        data[0].find_index("Postcode"), #6
        data[0].find_index("Suburb"), #7
        data[0].find_index("Trading Status"), #8
        data[0].find_index("After 12am"), #9
        data[0].find_index("After 3am"),  #10
        data[0].find_index("After 5am"), #11
      ]
      data.each_with_index do |row, index|
        next if index == 0 || row[indexes[8]] != "Trading"
        if row[indexes[11]] == "Yes"
          close_time = 8
        elsif row[indexes[10]] == "Yes"
          close_time = 5
        elsif row[indexes[9]] == "Yes"
          close_time = 3
        else
          close_time = 0
        end

        Premise.create(
          name: row[indexes[0]],
          address: row[indexes[1]],
          gaming: row[indexes[2]] == 'Yes',
          latitude: row[indexes[3]].to_d,
          longitude: row[indexes[4]].to_d,
          license_no: row[indexes[5]],
          post_code: row[indexes[6]],
          suburb: row[indexes[7]],
          close_time: close_time
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