module randEG

F = ["\\cos(t)",
    "\\sin(t)",
    "e^t",
    "\\frac{1}{1+t}",
    "\\frac{1}{\\sqrt{1+t}}",
    "\\sqrt{1+t}",
    "(t^2 + 1)",
    "t^{1/2}",
    "(t^3 + 2t)"]
function get_f(level)
    N = length(F)
    if level <3
        f = F[rand(1:N)]
    else
        f = string(F[rand(1:N)],F[rand(1:N)])
    end
end

int_wrap(y) =string("\\text{Compute the leading order term in the asymptotic expansion of} \n
                    I(x)=\\int_0^1",y,"dt,\\quad x\\to\\infty")

function Laplace(level)
    Φ = ["\\frac{1}{1+t}",
        "-t^2",
        "\\frac{1}{\\sqrt{1+t}}",
        "\\cos(t\\pi/2)"]
    N = length(Φ)
    if level <2
        ϕ = "-t"
    else
        ϕ = Φ[rand(1:N)]
    end
    f = get_f(level)
    return int_wrap(string(f,"\\exp(",ϕ,"x)"))
return F
end

function StationaryPhase(level)
    Φ1 = ["\\frac{1}{1+t}",
        "t",
        "\\sin(t\\pi/4)"]
    N1 = length(Φ1)
    Φ2 = ["\\frac{1}{1+t}",
        "t^2",
        "\\cos(t\\pi/4)",
        "\\cos^2(t\\pi/4)"]
    N2 = length(Φ2)
    if level ==1
        ϕ = "t"
    elseif level ==2
        ϕ = Φ1[rand(1:N1)]
    else
        ϕ = Φ2[rand(1:N2)]
    end
    f = get_f(level)
    return int_wrap(string(f,"\\exp(i",ϕ,"x)"))
return F
end

function random(level)
    r= rand()
    if r<0.5
        return StationaryPhase(level)
    else
        return Laplace(level)
    end
end

end
