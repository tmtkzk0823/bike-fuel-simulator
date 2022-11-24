require 'csv'

csv_path = Rails.root.join('db', 'fixtures', 'csv', 'bike_data.csv' )

csv = CSV.read(csv_path) # パスが正しく読み込まれないため変数に格納
i = 1

csv.each do |line|
  id = i
  name = line[1]
  image = line[2]
  cruising_distance = line[3]
  displacement = line[4]
  illustration_id = 
    case line[5]
      when 'cat02', 'cat03', 'cat04'
        1 #スクーター
      when 'cat05', 'cat06', 'cat07', 'cat08', 'cat14'
        2 # ネイキッド
      when 'cat09', 'cat10'
        3 # ss
      when 'cat11'
        4 # アメリカン
      when 'cat12'
        5 # オフロード
    end
  manufacturer_id = line[6]

  i += 1

  Bike.seed(:id) do |s|
    s.id = id
    s.name = name
    s.image = image
    s.cruising_distance = cruising_distance
    s.displacement = displacement
    s.illustration_id = illustration_id
    s.manufacture_id = manufacturer_id  
  end
end