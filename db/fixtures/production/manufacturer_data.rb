manufacturers = ['HONDA', 'YAMAHA', 'KAWASAKI', 'SUZUKI']
i = 0

manufacturers.each do |manufacturer|
  id = i + 1
  name = manufacturer

  i += 1

  Manufacturer.seed(:id) do |s|
    s.id = id
    s.name = name
  end
end