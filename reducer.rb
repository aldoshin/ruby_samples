log = [{time:2004, x:1},
	{time:2005, y:2},
	{time:2005, a:3},
	{time:2004, b:6},
	{time:2004, c:4}]

mapRecude = log.inject({}) do |acc,e|
	if acc.has_key?(e[:time])
		acc[e[:time]] = e.merge(acc[e[:time]])
	else
		acc[e[:time]] = e 
	end
	acc
end

puts mapRecude.values