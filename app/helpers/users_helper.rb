require 'pokitdok'

module UsersHelper

	$pokitdok_call = []
	$total_cost = []
	$pt_costs_monthy_no_dh = []
	$pt_costs_monthy_during_dh = []
	$costs_toward_dh = []
	pt_costs_monthy_after_dh = []


	#calling pokitdok api for each med in array
	def pokitdok_api(user)
		pd = PokitDok::PokitDok.new("RrslJ6itUf2akQHs1Zal", "NdHPmIQXiBGGTwRGYqh1qsKuDGVbgyQlqSzc4q5n")
		user.medications.each do |medication|
			test = pd.pharmacy_formulary(trading_partner_id: 'medicare_national', plan_number: user.insurance_plan_number, drug: medication.name.downcase)
			p test['data'][0]
			p '4'*80
			$pokitdok_call << test['data'][0]
		end
		p $pokitdok_call
		p '8'*80
	end

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
				if $costs_toward_dh == 0
					
				else
					$costs_toward_dh.inject(:+).round(2)
				end

			#patient pays 58% of cost, 58% of cost goes toward geting out of donut hole
			elsif drug['tier'] == 2
				$costs_toward_dh << drug['retail']['total_cost_30_day']['amount'].to_f * 0.45
				if $costs_toward_dh == 0
					
				else
					$costs_toward_dh.inject(:+).round(2)
				end

			elsif drug['tier'] == 3
				$costs_toward_dh << drug['retail']['total_cost_30_day']['amount'].to_f * 0.45
				$costs_toward_dh.inject(:+).round(2)
			else
				$costs_toward_dh = 0
			end
		end

		$costs_toward_dh
	end

	def months_in_dh
		i = 1
		while i <= 12
			if monthly_costs_toward_getting_out_dh * i >= 4850
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



	def graph_output(user)
		pokitdok_api(user)
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
