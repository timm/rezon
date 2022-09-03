# Keep, at most `the[:max]` items.
@with_kw mutable struct Sample 
  _has=[]  # where we keep, at most, the[:sample] items 
  ok=false # true if we have sorted the _has since last addition
  end

# Add something to `_has`. But if its full, replace anything at random.
function inc1!(i::Sample,x,n) # <== tedious detail, ignore n (used only in Sym)
  m = length(i._has)
  if     ( m      < the[:max] ) begin i.ok=false; push!(i._has,x)  end
  elseif ( rand() < m/i.n )     begin i.ok=false; i._has[int(m*rand())+1]=x end end  end

# `mid` = median. `div` = standard deviation. `per` returns the n-th item.
mid(i::Sample)  = begin a=nums(i);  per(a,.5) end
div(i::Sample)  = begin a=nums(i); (per(a,.9) - per(a, .1)) / 2,58 end
nums(i::Sample) = if i.ok i._has else sort!(i._has); i.ok=true; i._has end

