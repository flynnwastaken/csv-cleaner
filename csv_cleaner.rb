require "./flynn_methods.rb"
require "csv"

puts "What is the name of the CSV you want to clean?"
csv_name = getsc(csv_name)

CSV::Converters[:fixcaps] = ->(v) { v.split.map(&:capitalize).join(' ') rescue v }
data = CSV.parse(File.read(csv_name), converters: :fixcaps, headers: true)
File.write('output.csv', data.to_csv)
