clear

cd "C:\Users\Tung Anh\Dropbox\Tank diss code"
import excel "C:\Users\Tung Anh\Dropbox\Tank diss code\rawdata.xlsx", sheet("Sheet1") firstrow allstring


generate month = substr(qdate, 5,.)

destring month, replace

replace month = round(month*12)
gen year = substr(qdate, 1,4)
destring year, replace
drop qdate
gen qdate = ym(year,month)

drop month year
destring jfr, replace
destring v, replace
destring u, replace

order qdate

tsset qdate

tssmooth ma jfrma = jfr, window(6 1 6)
tssmooth ma vma = v, window(6 1 6)
tssmooth ma uma = u, window(6 1 6)

drop jfr v u qdate
drop if jfrma == .

outfile using "C:\Users\Tung Anh\Dropbox\Tank diss code\jfrvudata.raw", replace

correlate uma vma