require 'json'
require 'rest-client'
# ==VERSIÓN 1 (DEPRECATED)
# Esta fue la primera versión desarrollada para el problema planteado. Esta solución fue sustituída porla versión 2

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
reference_date = []

ids.each do |id|
     
    urls[i] = 'https://fintual.cl/api/real_assets/'+ id +'/days?from_date='+ input_date
    inv_date[i] = id +'-'+ input_date
    time = Time.new
    reference_date[i] = id +'-'+ time.year.to_s + '-' + time.month.to_s.rjust(2, "0") + '-' + ((time.day-1).to_s).rjust(2, "0")
    i = i+1
end

#RISKY MORRIS
risky_morris_url = 'https://fintual.cl/api/real_assets/186/days?from_date='+ input_date
risky_morris_inv_date = '186-'+ input_date
time = Time.new
reference_date = '186-'+ time.year.to_s + '-' + time.month.to_s.rjust(2, "0") + '-' + ((time.day-1).to_s).rjust(2, "0")

# API data
risky_morris_response = RestClient.get(risky_morris_url)
results = JSON.parse(risky_morris_response)

# Getting info from API
puts 'Inversion inicial en fondo risky morris (pesos)'
puts risky_morris_money = input_money*investment_fund['risky morris'] 
counter = 0
results["data"].each do |result|
    if result["id"] == risky_morris_inv_date 
        value = result["attributes"]["price"].to_f     
    end
    if result["id"] == reference_date
        value_ref = result["attributes"]["price"].to_f   
    end
    if value != '' && value_ref != '' && counter != 1
        benefit = (value_ref - value)/value_ref
        puts 'Saldo + Ganancia risky morris (pesos)'
        puts money_increase = (risky_morris_money*benefit) + risky_morris_money
        accum = money_increase
        counter = counter +1
    end
    i = i+1
end

# MODERATE PITT
moderate_pitt_url = 'https://fintual.cl/api/real_assets/187/days?from_date='+ input_date
moderate_pitt_inv_date = '187-'+ input_date

# API data
moderate_pitt_response = RestClient.get(moderate_pitt_url)
results = JSON.parse(moderate_pitt_response)

# Getting info from API
puts 'Inversion inicial en fondo Moderate Pitt (pesos)'
puts moderate_pitt_money = input_money*investment_fund['moderate pitt']
counter = 0
results["data"].each do |result|
    if result["id"] == moderate_pitt_inv_date 
        value = result["attributes"]["price"].to_f     
    end
    if result["id"] == reference_date
        value_ref = result["attributes"]["price"].to_f   
    end
    if value != '' && value_ref != '' && counter != 1
        benefit = (value_ref - value)/value_ref
        puts 'Saldo + Ganancia Moderate Pitt (pesos)'
        puts money_increase = (moderate_pitt_money*benefit )+ moderate_pitt_money
        accum = accum + money_increase
        counter = counter +1
    end
    i = i+1
end

# CONSERVATIVE CLOONEY
conservative_clooney_url = 'https://fintual.cl/api/real_assets/188/days?from_date='+ input_date
conservative_clooney_inv_date = '188-'+ input_date

# API data
conservative_clooney_response = RestClient.get(conservative_clooney_url)
results = JSON.parse(conservative_clooney_response)

# Getting info from API

puts 'Inversion inicial en fondo Conservative Clooney (pesos)'
puts conservative_clooney_money = input_money*investment_fund['conservative clooney'] 
counter = 0
results["data"].each do |result|
    if result["id"] == conservative_clooney_inv_date 
        value = result["attributes"]["price"].to_f     
    end
    if result["id"] == reference_date
        value_ref = result["attributes"]["price"].to_f   
    end
    if value != '' && value_ref != '' && counter != 1
        puts benefit = (value_ref - value)/value_ref
        puts 'Saldo + Ganancia Conservative Clooney (pesos)'
        puts money_increase = (conservative_clooney_money*benefit)+ conservative_clooney_money
        
        puts 'Saldo total (tres fondos)'
        puts accum = accum + money_increase
        counter = counter +1
    end
    i = i+1
end