log = [
  {time: 201201, x: 2},
  {time: 201201, y: 7},
  {time: 201201, z: 2},
  {time: 201202, a: 3},
  {time: 201202, b: 4},
  {time: 201202, c: 0}
]

mapRecude = log.inject({}) do |acc,e|
	if acc.has_key?(e[:time])
		acc[e[:time]] = e.merge(acc[e[:time]])
	else
		acc[e[:time]] = e 
	end
	acc
end

puts mapRecude.values