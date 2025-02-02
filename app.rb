require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:homepage)
end

get("/square/new") do
  erb(:square_new)
end

get("/square/result") do
  @num = params.fetch("num").to_f

  @final = (@num * @num).round(4)

  erb(:square_result)
end

get("/square_root/new") do
  erb(:root_new)
end

get("/square_root/result") do
  @num = params.fetch("num").to_f

  @final = Math.sqrt(@num).round(4)
  
  erb(:root_result)
end

get("/random/new") do
  erb(:random_new)
end

get("/random/result") do
  @min = params.fetch("min").to_f

  @max = params.fetch("max").to_f

  @output = rand(@min..@max)

  erb(:random_result)
end

get("/payment/new") do
  erb(:payment_new)
end

get("/payment/result") do
  @apr = params.fetch("apr").to_f
  @years = params.fetch("years").to_i
  @pv = params.fetch("pv").to_f

  @r = @apr / 1200.0
  @n = @years * 12

  @numerator = @r * @pv
  @denominator = 1 - ((1 + @r)**-@n)

  @output = (@numerator/@denominator).to_fs(:currency)

  @apr_formatted = @apr.to_fs(:percentage, {:precision => 4})
  @pv_formatted = @pv.to_fs(:currency)
  erb(:payment_result)
end
