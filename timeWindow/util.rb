

"BIRPT, CMRPT, DCRPT, DDRPT, DFRPT, DIRPT, DMRPT, DPMRP, DVRPT, DXRPT, DYRPT, MCRPT, NHRPT, PTRPT, SBRPT, SSRPT, TFRPT".split(", ").each do |screen|
	puts "/ui/bi/#{screen.downcase.strip}.xhtml"
	puts "/ui/cm/#{screen.downcase.strip}.xhtml"
	puts "/ui/di/#{screen.downcase.strip}.xhtml"
	puts "/ui/wp/#{screen.downcase.strip}.xhtml"
	puts "/ui/sm/#{screen.downcase.strip}.xhtml"
	puts "rptNamePeriod.xhtml"
end