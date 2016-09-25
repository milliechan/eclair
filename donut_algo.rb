require 'pokitdok'

medication_array = ['simvastatin', 'lisinopril', 'metformin']

pd = PokitDok::PokitDok.new("y4jW3nkyhfXhZMGBdJVx", "FvP5MsbZYWZV6VPV8QyGemgjQgdsvOlECAcOWEsu")

pokitdok_call = []
total_cost = []
pt_costs_monthy_no_dh = []
pt_costs_monthy_during_dh = []
costs_toward_dh = []
pt_costs_monthy_after_dh = []

output_hash = {}


#calling pokitdok api for each med in array
medication_array.each do |medication|
	test = pd.pharmacy_formulary(trading_partner_id: 'medicare_national', plan_number: 'S5820003', drug: medication)
	pokitdok_call << test['data'][0]
end


#grand total drug(what patiend pays and insurance)
def get_grand_total
	pokitdok_call.each do |drug|
	total_cost << drug['retail']['total_cost_30_day']['amount'].to_f

	sum_total_cost = total_cost.inject(:+)
end

def is_in_donut_hole?
	get_grand_total < 3310
end

#does not include dispensing fee?
def patient_monthly_costs_before_dh
	pt_costs_monthy_no_dh = []

	pokitdok_call.each do |drug|
		pt_costs_monthy_no_dh << drug['retail']['oop_30_day']['amount'].to_f
	end

	pt_costs_monthy_no_dh.inject(:+)
end

#does not include dispensing fee?
def patient_monthly_costs_during_dh
	pt_costs_monthy_during_dh = []

	pokitdok_call.each do |drug|	
		#Patient pays no more than 45% of ⇒ plan’s cost for covered brand-name prescription drugs + pharmacy’s dispensing fee
		if drug['drug']['tier'] == 1
			pt_costs_monthy_during_dh << drug['retail']['total_cost_30_day']['amount'].to_f * 0.45

		#patient pays 58% of cost, 58% of cost goes toward geting out of donut hole			
		elsif drug['drug']['tier'] == 2
			pt_costs_monthy_during_dh << drug['retail']['total_cost_30_day']['amount'].to_f * 0.58
		
		else
			pt_costs_monthy_during_dh << drug['retail']['total_cost_30_day']['amount'].to_f
		end
	end

	pt_costs_monthy_during_dh.inject(:+)
end

def costs_toward_getting_out_dh
	costs_toward_dh = []

	pokitdok_call.each do |drug|	
		#Patient pays no more than 45% of ⇒ plan’s cost for covered brand-name prescription drugs + pharmacy’s dispensing fee
		if drug['drug']['tier'] == 1
			costs_toward_dh << drug['retail']['total_cost_30_day']['amount'].to_f * 0.45

		#patient pays 58% of cost, 58% of cost goes toward geting out of donut hole			
		elsif drug['drug']['tier'] == 2
			costs_toward_dh << drug['retail']['total_cost_30_day']['amount'].to_f * 0.58	
		end
	end

	costs_toward_dh.inject(:+)
end

def out_of_dh?
	costs_toward_getting_out_dh >= 1540
end

def patient_monthly_costs_after_dh
	pt_costs_monthy_after_dh = []

	pokitdok_call.each do |drug|	
		#Patient pays no more than 45% of ⇒ plan’s cost for covered brand-name prescription drugs + pharmacy’s dispensing fee
		if drug['drug']['tier'] == 1
			pt_costs_monthy_after_dh << 2.65

		#patient pays 58% of cost, 58% of cost goes toward geting out of donut hole			
		elsif drug['drug']['tier'] == 2
			pt_costs_monthy_after_dh << 2.65	
		else
			pt_costs_monthy_during_dh << 6.60
		end
	end

	pt_costs_monthy_after_dh.inject(:+)
end




	
	sum_total_cost = total_cost.inject(:+)

	#check if deductable is met in first month
	if total_cost.inject(:+) < 360 #deductable
		output_hash[1] = { cost: sum_total_cost }
	else 
		output_hash[1] = { cost: sum_total_cost }
	end

end



# plans = pd.pharmacy_plans(trading_partner_id:'medicare_national', plan_number:'S5820003')
# Retrieve provider information by NPI
# test = pd.providers(npi: '1467560003')


# test.each do |el|
#   puts el 
# end

# plans.each do |plan| 
#   ap plan 
# end