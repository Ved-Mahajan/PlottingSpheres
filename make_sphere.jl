using Plots
plotly()

function generate_sphere(x,y,z,r)
    n = 100
    u = range(-π, π; length = n)
    v = range(0, π; length = n)
    X = r .* cos.(u) * sin.(v)' .+ x
    Y = r .* sin.(u) * sin.(v)' .+ y
    Z = r * ones(n) * cos.(v)' .+ z
    return X,Y,Z
end

x = 10*rand(10)
y = 10*rand(10)
z = 10*rand(10)

p = plot()
x1 = 0
y1 = 0
z1 = 0
x2 = 0
y2 = 0
z2 = 0
for i in 1:10
    X,Y,Z = generate_sphere(x[i],y[i],z[i],0.7)
    if maximum(X) >= x1
        x1 = maximum(X)
    end 
    if maximum(Y) >= y1
        x1 = maximum(X)
    end
    if maximum(Z) >= z1
        x1 = maximum(X)
    end
    if minimum(X) <= x2
        x2 = minimum(X)
    end
    if minimum(Y) <= y2
        y2 = minimum(Y)
    end
    if minimum(Z) <= z2
        z2 = minimum(Z)
    end
    surface!(p,X, Y, Z,axis=([], false),color = :red,colorbar = false)
end

# plot!(p,[x1,y1,z1],[x2,y1,z1])
# plot!(p,[x1,y1,z1],[x1,y1,z2])
# plot!(p,[x1,y1,z1],[x1,y2,z1])
# plot!(p,[x2,y1,z1],[x2,y2,z1])
# plot!(p,[x2,y1,z1],[x2,y1,z2])
# plot!(p,[x2,y1,z2],[x2,y2,z2])
# plot!(p,[x2,y1,z2],[x1,y1,z2])
# plot!(p,[x2,y2,z1],[x2,y2,z2])
# plot!(p,[x1,y2,z2],[x2,y2,z2])
# plot!(p,[x1,y2,z1],[x1,y2,z2])
# plot!(p,[x1,y1,z2],[x1,y2,z2])

p