require 'csv'
require 'time'
require 'bigdecimal'
require_relative 'lib/flight_data/point'
require_relative 'lib/flight_data/file'

out = CSV.open('output.fdr', 'w')
out << ['A']
out << [2]

out << ['ACFT','Aircraft/Laminar Research/Cessna 172SP/Cessna_172SP_G1000.acf',nil]
out << ['TAIL','N12345',nil]
out << ['DATE','03/23/2019',nil]
out << ['TIME','01:01:01',nil]
out << ['PRES',29.92,nil]
out << ['TEMP',65,nil]
out << ['WIND',230,1,nil]


start_time = nil

CSV.foreach(ARGV[0]) do |line|
	next unless line[0] =~ /[0-9]{13}/
	
	timestamp = DateTime.strptime(line[0], '%Q')

	start_time = timestamp if start_time.nil?

	lat = line[1].empty? ? 0 : BigDecimal(line[1])
	long = line[2].empty? ? 0 : BigDecimal(line[2])
	alt = line[3].empty? ? 0 : BigDecimal(line[3])
	course = line[4].empty? ? 0 : BigDecimal(line[4])
	speed = line[5].empty? ? 0 : BigDecimal(line[5])
	bank = line[6].empty? ? 0 : BigDecimal(line[6])
	pitch = line[7].empty? ? 0 : BigDecimal(line[7])

	next if alt < 0.0
	next if course < 0.0

	point = FlightData::Point.new time: timestamp.to_time, lat: lat, long: long, altitude: alt, heading: course, speed: speed
	point.start_time = start_time
	out << point.to_a
	
end

out.close
