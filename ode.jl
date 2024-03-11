### A Pluto.jl notebook ###
# v0.19.40

using Markdown
using InteractiveUtils

# ╔═╡ 88de6714-fd1c-11ed-3458-89fc42c5e7e1
using DifferentialEquations

# ╔═╡ 7aa3b70a-827a-482c-8052-7d34413922d4
begin
	using Plots
	import PlotlyBase
	import PlotlyKaleido
	plotly()
end

# ╔═╡ ed6cee9a-c325-4141-bffe-8715a59dfe5d
begin
p = 10
r = 28
b = 8/3
end

# ╔═╡ 75bbd970-3f7c-4d6c-b40f-7a857478d358
function lorenz!(du, u, params, t)
    p = params[1]
    r = params[2]
    b = params[3]
    du[1] = -p * u[1] + p * u[2]
    du[2] = -u[1] * u[3] + r * u[1] - u[2] 
    du[3] = u[1] * u[2] - b * u[3]
	nothing
end

# ╔═╡ bcc6c1bc-69b1-4e15-8988-a08249afaeb1
begin
params = [p, r, b]
u0 = [1.0, 0.0, 0.0]
tspan = (0.0, 100.0)
end

# ╔═╡ 169b59c2-d2c2-4c0a-8b05-e6ffec918e25
prob = ODEProblem(lorenz!, u0, tspan, params)

# ╔═╡ d46b95d0-97ab-408b-b3ef-9ab3ebeb55b6
sol = solve(prob, Tsit5());

# ╔═╡ a2b8adc1-ba82-4a66-aac7-88bb8b717b72
plot(sol)

# ╔═╡ def2042c-5d56-4ddd-ab40-d36c1fca8970
sol

# ╔═╡ 67bd3b97-8dbe-41da-ae4c-dc92c326d8a1
plot(sol, idxs=(1,2,3), lw=1)

# ╔═╡ 9ddddc3a-bac3-446b-9602-7ff7a3e85a35
md"""
[https://www.dynamicmath.xyz/strange-attractors/](https://www.dynamicmath.xyz/strange-attractors/) にはおしゃれな例がいっぱいある．興味のある方は遊んでみると良いかも．
"""

# ╔═╡ Cell order:
# ╠═88de6714-fd1c-11ed-3458-89fc42c5e7e1
# ╠═7aa3b70a-827a-482c-8052-7d34413922d4
# ╠═ed6cee9a-c325-4141-bffe-8715a59dfe5d
# ╠═75bbd970-3f7c-4d6c-b40f-7a857478d358
# ╠═bcc6c1bc-69b1-4e15-8988-a08249afaeb1
# ╠═169b59c2-d2c2-4c0a-8b05-e6ffec918e25
# ╠═d46b95d0-97ab-408b-b3ef-9ab3ebeb55b6
# ╠═a2b8adc1-ba82-4a66-aac7-88bb8b717b72
# ╠═def2042c-5d56-4ddd-ab40-d36c1fca8970
# ╠═67bd3b97-8dbe-41da-ae4c-dc92c326d8a1
# ╟─9ddddc3a-bac3-446b-9602-7ff7a3e85a35
