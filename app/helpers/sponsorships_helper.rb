module SponsorshipsHelper


  def sponsorship_type
  	if @sponsorship.amount >= 275
  		"your sponsorship of a child "
  	else
  		"your donation towards a sponsorship of a child "
  	end
  end

  def plan_type
  	if @sponsorship.plan == "full"
  		" now in full"
  	elsif @sponsorship.plan == "monthly"
  		" in 12 monthly payments of $#{((@sponsorship.amount.to_f)/12).round(2)} each, beginning Jan. 1, 2018."
  	elsif @sponsorship.plan == "quarterly"
  		" in four quarterly payments of $#{((@sponsorship.amount.to_f)/4).round(2)} each, beginning Jan. 1, 2018."
  	end
  end
   
end
