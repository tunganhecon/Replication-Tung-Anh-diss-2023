clear
cd "C:\Users\Windows\Dropbox\Tank diss code\data\raw"

import delimited "ALPcali.txt"

drop seriesid

destring period, replace

gen str qday = string(year) + " " + period

gen qdate = quarterly(qday, "YQ")

format qdate %tq

drop year period qday

order qdate value

tsset qdate

gen logropp = log(value)

tsfilter hp logropp_hp = logropp, smooth(100000)

correlate logropp_hp L.logropp_hp

reg logropp_hp L.logropp_hp

local aralp_targ_Q = _b[L.logropp_hp]
dis aralp_targ_Q

predict double resid, residuals
summarize resid