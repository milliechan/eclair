require 'pokitdok'

module UsersHelper

	$pokitdok_call = [{"drug"=>"MEMANTINE HCL 10 MG TABLET", "tier"=>3, "tier_name"=>"preferred brand", "prior_auth"=>true, "limit_amount"=>"60", "step_therapy"=>false, "quantity_limit"=>true, "limit_days"=>30, "retail"=>{"oop_30_day"=>{"amount"=>"35.00", "currency"=>"USD"}, "total_cost_30_day"=>{"amount"=>"46.71", "currency"=>"USD"}, "ins_pay_30_day"=>{"amount"=>"11.71", "currency"=>"USD"}}, "mail"=>{"oop_90_day"=>{"amount"=>"90.00", "currency"=>"USD"}, "total_cost_90_day"=>{"amount"=>"135.39", "currency"=>"USD"}, "ins_pay_90_day"=>{"amount"=>"45.39", "currency"=>"USD"}}}, {"drug"=>"TAMSULOSIN HCL 0.4 MG CAPSULE", "tier"=>2, "tier_name"=>"generic", "prior_auth"=>false, "step_therapy"=>false, "quantity_limit"=>false, "retail"=>{"oop_30_day"=>{"amount"=>"8.00", "currency"=>"USD"}, "total_cost_30_day"=>{"amount"=>"12.44", "currency"=>"USD"}, "ins_pay_30_day"=>{"amount"=>"4.44", "currency"=>"USD"}}, "mail"=>{"oop_90_day"=>{"amount"=>"0.00", "currency"=>"USD"}, "total_cost_90_day"=>{"amount"=>"33.84", "currency"=>"USD"}, "ins_pay_90_day"=>{"amount"=>"33.84", "currency"=>"USD"}}}, {"drug"=>"METOPROLOL TARTRATE 50 MG TAB", "tier"=>1, "tier_name"=>"preferred generic", "prior_auth"=>false, "step_therapy"=>false, "quantity_limit"=>false, "retail"=>{"oop_30_day"=>{"amount"=>"4.00", "currency"=>"USD"}, "total_cost_30_day"=>{"amount"=>"6.85", "currency"=>"USD"}, "ins_pay_30_day"=>{"amount"=>"2.85", "currency"=>"USD"}}, "mail"=>{"oop_90_day"=>{"amount"=>"0.00", "currency"=>"USD"}, "total_cost_90_day"=>{"amount"=>"19.01", "currency"=>"USD"}, "ins_pay_90_day"=>{"amount"=>"19.01", "currency"=>"USD"}}}, {"drug"=>"LISINOPRIL 30 MG TABLET", "tier"=>1, "tier_name"=>"preferred generic", "prior_auth"=>false, "limit_amount"=>"60", "step_therapy"=>false, "quantity_limit"=>true, "limit_days"=>30, "retail"=>{"oop_30_day"=>{"amount"=>"4.00", "currency"=>"USD"}, "total_cost_30_day"=>{"amount"=>"5.91", "currency"=>"USD"}, "ins_pay_30_day"=>{"amount"=>"1.91", "currency"=>"USD"}}, "mail"=>{"oop_90_day"=>{"amount"=>"0.00", "currency"=>"USD"}, "total_cost_90_day"=>{"amount"=>"16.15", "currency"=>"USD"}, "ins_pay_90_day"=>{"amount"=>"16.15", "currency"=>"USD"}}}, {"drug"=>"METFORMIN HCL 1,000 MG TABLET", "tier"=>1, "tier_name"=>"preferred generic", "prior_auth"=>false, "limit_amount"=>"75", "step_therapy"=>false, "quantity_limit"=>true, "limit_days"=>30, "retail"=>{"oop_30_day"=>{"amount"=>"4.00", "currency"=>"USD"}, "total_cost_30_day"=>{"amount"=>"6.52", "currency"=>"USD"}, "ins_pay_30_day"=>{"amount"=>"2.52", "currency"=>"USD"}}, "mail"=>{"oop_90_day"=>{"amount"=>"0.00", "currency"=>"USD"}, "total_cost_90_day"=>{"amount"=>"18.04", "currency"=>"USD"}, "ins_pay_90_day"=>{"amount"=>"18.04", "currency"=>"USD"}}}, {"drug"=>"SIMVASTATIN 80 MG TABLET", "tier"=>1, "tier_name"=>"preferred generic", "prior_auth"=>false, "limit_amount"=>"30", "step_therapy"=>false, "quantity_limit"=>true, "limit_days"=>30, "retail"=>{"oop_30_day"=>{"amount"=>"4.00", "currency"=>"USD"}, "total_cost_30_day"=>{"amount"=>"6.68", "currency"=>"USD"}, "ins_pay_30_day"=>{"amount"=>"2.68", "currency"=>"USD"}}, "mail"=>{"oop_90_day"=>{"amount"=>"0.00", "currency"=>"USD"}, "total_cost_90_day"=>{"amount"=>"18.60", "currency"=>"USD"}, "ins_pay_90_day"=>{"amount"=>"18.60", "currency"=>"USD"}}}, {"drug"=>"TAMSULOSIN HCL 0.4 MG CAPSULE", "tier"=>2, "tier_name"=>"generic", "prior_auth"=>false, "step_therapy"=>false, "quantity_limit"=>false, "retail"=>{"oop_30_day"=>{"amount"=>"8.00", "currency"=>"USD"}, "total_cost_30_day"=>{"amount"=>"12.44", "currency"=>"USD"}, "ins_pay_30_day"=>{"amount"=>"4.44", "currency"=>"USD"}}, "mail"=>{"oop_90_day"=>{"amount"=>"0.00", "currency"=>"USD"}, "total_cost_90_day"=>{"amount"=>"33.84", "currency"=>"USD"}, "ins_pay_90_day"=>{"amount"=>"33.84", "currency"=>"USD"}}}, {"drug"=>"ALENDRONATE SODIUM 5 MG TABLET", "tier"=>1, "tier_name"=>"preferred generic", "prior_auth"=>false, "limit_amount"=>"30", "step_therapy"=>false, "quantity_limit"=>true, "limit_days"=>30, "retail"=>{"oop_30_day"=>{"amount"=>"4.00", "currency"=>"USD"}, "total_cost_30_day"=>{"amount"=>"7.50", "currency"=>"USD"}, "ins_pay_30_day"=>{"amount"=>"3.50", "currency"=>"USD"}}, "mail"=>{"oop_90_day"=>{"amount"=>"0.00", "currency"=>"USD"}, "total_cost_90_day"=>{"amount"=>"20.54", "currency"=>"USD"}, "ins_pay_90_day"=>{"amount"=>"20.54", "currency"=>"USD"}}}, {"drug"=>"LEVOTHYROXINE 100 MCG VIAL", "tier"=>5, "tier_name"=>"specialty tier", "prior_auth"=>false, "step_therapy"=>false, "quantity_limit"=>false, "retail"=>{"oop_30_day"=>{"amount"=>"24.67", "currency"=>"USD"}, "total_cost_30_day"=>{"amount"=>"74.76", "currency"=>"USD"}, "ins_pay_30_day"=>{"amount"=>"50.09", "currency"=>"USD"}}, "mail"=>{"oop_90_day"=>{"amount"=>"73.45", "currency"=>"USD"}, "total_cost_90_day"=>{"amount"=>"222.57", "currency"=>"USD"}, "ins_pay_90_day"=>{"amount"=>"149.12", "currency"=>"USD"}}}, {"drug"=>"SERTRALINE HCL 25 MG TABLET", "tier"=>1, "tier_name"=>"preferred generic", "prior_auth"=>false, "step_therapy"=>false, "quantity_limit"=>false, "retail"=>{"oop_30_day"=>{"amount"=>"4.00", "currency"=>"USD"}, "total_cost_30_day"=>{"amount"=>"6.20", "currency"=>"USD"}, "ins_pay_30_day"=>{"amount"=>"2.20", "currency"=>"USD"}}, "mail"=>{"oop_90_day"=>{"amount"=>"0.00", "currency"=>"USD"}, "total_cost_90_day"=>{"amount"=>"16.82", "currency"=>"USD"}, "ins_pay_90_day"=>{"amount"=>"16.82", "currency"=>"USD"}}}, {"drug"=>"HYDROCHLOROTHIAZIDE 12.5 MG TB", "tier"=>1, "tier_name"=>"preferred generic", "prior_auth"=>false, "step_therapy"=>false, "quantity_limit"=>false, "retail"=>{"oop_30_day"=>{"amount"=>"4.00", "currency"=>"USD"}, "total_cost_30_day"=>{"amount"=>"6.03", "currency"=>"USD"}, "ins_pay_30_day"=>{"amount"=>"2.03", "currency"=>"USD"}}, "mail"=>{"oop_90_day"=>{"amount"=>"0.00", "currency"=>"USD"}, "total_cost_90_day"=>{"amount"=>"16.37", "currency"=>"USD"}, "ins_pay_90_day"=>{"amount"=>"16.37", "currency"=>"USD"}}}]

	$total_cost = []
	$pt_costs_monthy_no_dh = []
	$pt_costs_monthy_during_dh = []
	$costs_toward_dh = []
	pt_costs_monthy_after_dh = []


	#grand total drug(what patient pays and insurance so the total rx cost)
	def get_grand_total_one_month
		$pokitdok_call.each do |drug|
		$total_cost << drug['retail']['total_cost_30_day']['amount'].to_f
		end
		
		sum_total_cost = $total_cost.inject(:+)
	end

	def is_in_donut_hole_this_year?
		get_grand_total_one_month * 12 > 3310
	end

	def months_not_in_dh
		$total_cost = []
		i = 1
		while i <= 12
			if  get_grand_total_one_month * i >= 3310
				return i 
				break
			end
			i += 1
		end
		return 12
	end

	#does not include dispensing fee? does not factor deductable
	def patient_monthly_costs_before_dh
		$pt_costs_monthy_no_dh = []

		$pokitdok_call.each do |drug|
			$pt_costs_monthy_no_dh << drug['retail']['oop_30_day']['amount'].to_f
		end

		$pt_costs_monthy_no_dh.inject(:+).round(2)
	end

	#does not include dispensing fee?
	def patient_monthly_costs_during_dh
		$pt_costs_monthy_during_dh = []

		$pokitdok_call.each do |drug|	
			#Patient pays no more than 45% of ⇒ plan’s cost for covered brand-name prescription drugs + pharmacy’s dispensing fee
			if drug['tier'] == 1
				$pt_costs_monthy_during_dh << (drug['retail']['total_cost_30_day']['amount'].to_f * 0.58)

			#patient pays 58% of cost, 58% of cost goes toward geting out of donut hole			
			elsif drug['tier'] == 2 
				$pt_costs_monthy_during_dh << (drug['retail']['total_cost_30_day']['amount'].to_f * 0.45)
			elsif drug['tier'] == 3
				$pt_costs_monthy_during_dh << (drug['retail']['total_cost_30_day']['amount'].to_f * 0.45)
			else
				$pt_costs_monthy_during_dh << drug['retail']['total_cost_30_day']['amount'].to_f
			end
		end

		$pt_costs_monthy_during_dh.inject(:+).round(2)
	end

	#different than patient costs because only includes tier 1 and 2
	def monthly_costs_toward_getting_out_dh
		$costs_toward_dh = []

		$pokitdok_call.each do |drug|	
			#Patient pays no more than 45% of ⇒ plan’s cost for covered brand-name prescription drugs + pharmacy’s dispensing fee
			if drug['tier'] == 1
				$costs_toward_dh << drug['retail']['total_cost_30_day']['amount'].to_f * 0.58

			#patient pays 58% of cost, 58% of cost goes toward geting out of donut hole			
			elsif drug['tier'] == 2
				$costs_toward_dh << drug['retail']['total_cost_30_day']['amount'].to_f * 0.45

			elsif drug['tier'] == 3
				$costs_toward_dh << drug['retail']['total_cost_30_day']['amount'].to_f * 0.45
			end
		end

		$costs_toward_dh.inject(:+).round(2)
	end

	def months_in_dh
		i = 1
		while i <= 12
			if monthly_costs_toward_getting_out_dh * i >= 1540
				return i
				break
			end
			i += 1
		end
		return 12 - months_not_in_dh
	end

	def patient_monthly_costs_after_dh
		$pt_costs_monthy_after_dh = []

		$pokitdok_call.each do |drug|	
			#Patient pays no more than 45% of ⇒ plan’s cost for covered brand-name prescription drugs + pharmacy’s dispensing fee
			if drug['tier'] == 1
				$pt_costs_monthy_after_dh << 2.65

			#patient pays 58% of cost, 58% of cost goes toward geting out of donut hole			
			elsif drug['tier'] == 2
				$pt_costs_monthy_after_dh << 2.65	
			elsif drug['tier'] == 3
				$pt_costs_monthy_after_dh << 2.65	
			else
				$pt_costs_monthy_during_dh << 6.60
			end
		end

		$pt_costs_monthy_after_dh.inject(:+).round(2)
	end



	def graph_output
		output_hash = {}
		if is_in_donut_hole_this_year?
			months_not_in_dh.times do |i|
				output_hash[i + 1] = { cost: patient_monthly_costs_before_dh,in_dh: false}
			end
			months_in_dh.times do |i|
				output_hash[i + 1 + months_not_in_dh] = { cost: patient_monthly_costs_during_dh, in_dh: true }
			end
			(12 - (months_in_dh + months_not_in_dh)).times do |i|
				output_hash[i + 1 + months_in_dh + months_not_in_dh] = { cost: patient_monthly_costs_after_dh, in_dh: false }
			end
		else
			12.times do |i|
			output_hash[i + 1] = { cost: patient_monthly_costs_before_dh,in_dh: false}			
			end
		end
		output_hash
	end



end
