require 'json'
require 'rest-client'

# VERSIÓN 2 
=begin 
En esta versión se incluyeron mejoras en el desarrollo del código, 
generalizando mediante un ciclo las variables requeridas para consumir la API.
Tambien se efectuo una generalizacion de las variables asociadas a las fechas 
(tanto la de consulta input_date como la de referencia )
=end
# INPUT VALUES
print "Escriba fecha de consulta en formato DD/MM/AAAA"
input_date = (Date.parse(gets.chomp.to_s)).to_s

print "Escriba la cantidad de dinero que desea invertir (pesos)"
input_money = gets.chomp.to_i

investment_fund = {}
print "Escriba el porcentaje de su dinero destinado al fondo risky morris (%)"
investment_fund['risky morris'] = gets.chomp.to_f/100

print "Escriba el porcentaje de su dinero destinado al fondo moderate pitt (%)"
investment_fund['moderate pitt']  = gets.chomp.to_f/100

print "Escriba el porcentaje de su dinero destinado al fondo conservative_clooney (%)"
investment_fund['conservative clooney'] = gets.chomp.to_f/100

# PARAMETERS AND GLOBAL VARIABLES
i = 0
value = ''
value_ref = ''
accum = 0
ids = ['186','187','188']
urls =[]
inv_date =[]
ref_date = []

ids.each do |id|  
    urls[i] = 'https://fintual.cl/api/real_assets/'+ id +'/days?from_date='+ input_date
    inv_date[i] = id +'-'+ input_date
    time = Time.new
    ref_date[i] = id +'-'+ time.year.to_s + '-' + time.month.to_s.rjust(2, "0") + '-' + ((time.day-1).to_s).rjust(2, "0")
    i = i+1
end

#RISKY MORRIS
url = urls[0]
investment_date = inv_date[0]
reference_date = ref_date[0]

# API data
response = RestClient.get(url)
results = JSON.parse(response)
puts 'Inversion inicial en fondo risky morris (pesos)'
puts initial_money = input_money*investment_fund['risky morris'] 

# Getting info from API
counter = 0
results["data"].each do |result|
    if result["id"] == investment_date
        value = result["attributes"]["price"].to_f     
    end
    if result["id"] == reference_date
        value_ref = result["attributes"]["price"].to_f   
    end
    if value != '' && value_ref != '' && counter != 1
        puts 'Crecimiento de la inversion'
        puts benefit = (value_ref - value)/value_ref
        puts 'Saldo + Ganancia risky morris (pesos)'
        puts money_increase = (initial_money*benefit) + initial_money
        
        accum = accum + money_increase
        counter = counter +1
    end
    i = i+1
end

#MODERATE PITT
url = urls[1]
investment_date = inv_date[1]
reference_date = ref_date[1]

# API data
response = RestClient.get(url)
results = JSON.parse(response)
puts 'Inversion inicial en fondo moderate pitt (pesos)'
puts initial_money = input_money*investment_fund['moderate pitt'] 

# Getting info from API
counter = 0
results["data"].each do |result|
    if result["id"] == investment_date
        value = result["attributes"]["price"].to_f     
    end
    if result["id"] == reference_date
        value_ref = result["attributes"]["price"].to_f   
    end
    if value != '' && value_ref != '' && counter != 1
        puts 'Crecimiento de la inversion'
        puts benefit = (value_ref - value)/value_ref
        puts 'Saldo + Ganancia moderate pitt (pesos)'
        puts money_increase = (initial_money*benefit) + initial_money

        accum = accum+ money_increase
        counter = counter +1
    end
    i = i+1
end

#CONSERVATIVE CLOONEY
url = urls[2]
investment_date = inv_date[2]
reference_date = ref_date[2]

# API data
response = RestClient.get(url)
results = JSON.parse(response)
puts 'Inversion inicial en fondo conservative clooney (pesos)'
puts initial_money = input_money*investment_fund['conservative clooney'] 

# Getting info from API
counter = 0
results["data"].each do |result|
    if result["id"] == investment_date
        value = result["attributes"]["price"].to_f     
    end
    if result["id"] == reference_date
        value_ref = result["attributes"]["price"].to_f   
    end
    if value != '' && value_ref != '' && counter != 1
        puts 'Crecimiento de la inversion'
        puts benefit = (value_ref - value)/value_ref
        puts 'Saldo + Ganancia conservative clooney (pesos)'
        puts money_increase = (initial_money*benefit) + initial_money

        puts 'El saldo total en los tres fondos es de: '
        puts accum = accum+ money_increase
        counter = counter +1
    end
    i = i+1
end