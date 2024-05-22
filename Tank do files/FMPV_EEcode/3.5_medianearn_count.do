clear
cd "C:\Users\Tung Anh\Dropbox\Tank diss code\dta"

local x = 199505
while `x' <= 202306{
	di `x'
	if `x' != 197712 & `x' != 198506 & `x' != 198509 & `x' != 199312 & `x' != 199505 & `x' != 199506 & `x' != 199507 & `x' != 199508{
	use matched`x'.dta
	
	capture drop weekearn0
	replace weekearn1 = . if weekearn1 == -.01
	gen l50 = 0 if weekearn1 != .
	egen medianearn = median(weekearn1)
	replace l50 = 1 if weekearn1 <= medianearn
	drop medianearn 
	sort hrhhid hrhhid2 pulineno datem

	save, replace
	}
local x = `x' + 1
if (`x'-13)/100 == int((`x'-13)/100) {
    local x = `x' + 88
    }
}