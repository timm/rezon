"Coerce string to thing."
function coerce(s)
  for t in [Int64,Float64,Bool] if (x=tryparse(t,s)) != nothing return x end end 
  return strip(s) end

"Coerce rows to cells. Pass each row to `fun`."
function csv(src, fun)
  for line in eachline(file)
    line = strip(line)
    if sizeof(line) > 0 fun(map(coerce, split(line, ","))) end end end 


