local myfiles: dir "$raw_folder" files "*.cps"

foreach file of local myfiles {
	local subfile = "cpsb" + ///
	cond(substr("`file'", 4,1) == "9", "19", "20") + ///
	substr("`file'", 4, 2) + ///
	cond(substr("`file'", 1,3) == "jan", "01", ///
	cond(substr("`file'", 1,3) == "feb", "02", ///
	cond(substr("`file'", 1,3) == "mar", "03", ///
	cond(substr("`file'", 1,3) == "apr", "04", ///
	cond(substr("`file'", 1,3) == "may", "05", ///
	cond(substr("`file'", 1,3) == "jun", "06", ///
	cond(substr("`file'", 1,3) == "jul", "07", ///
	cond(substr("`file'", 1,3) == "aug", "08", ///
	cond(substr("`file'", 1,3) == "sep", "09", ///
	cond(substr("`file'", 1,3) == "oct", "10", ///
	cond(substr("`file'", 1,3) == "nov", "11", "12"))))))))))) ///
	+ ".raw"
	!rename "`file'" "`subfile'"
}


local myfiles: dir "$raw_folder" files "*.dat"

foreach file of local myfiles {
	local subfile = "cpsb" + ///
	cond(substr("`file'", 4,1) == "9", "19", "20") + ///
	substr("`file'", 4, 2) + ///
	cond(substr("`file'", 1,3) == "jan", "01", ///
	cond(substr("`file'", 1,3) == "feb", "02", ///
	cond(substr("`file'", 1,3) == "mar", "03", ///
	cond(substr("`file'", 1,3) == "apr", "04", ///
	cond(substr("`file'", 1,3) == "may", "05", ///
	cond(substr("`file'", 1,3) == "jun", "06", ///
	cond(substr("`file'", 1,3) == "jul", "07", ///
	cond(substr("`file'", 1,3) == "aug", "08", ///
	cond(substr("`file'", 1,3) == "sep", "09", ///
	cond(substr("`file'", 1,3) == "oct", "10", ///
	cond(substr("`file'", 1,3) == "nov", "11", "12"))))))))))) ///
	+ ".raw"
	!rename "`file'" "`subfile'"
}

