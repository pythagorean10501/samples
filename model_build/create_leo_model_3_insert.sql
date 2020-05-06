
	INSERT INTO leo_model_3 (select
		(				  -2.9 	   +
		(Gmail::integer				* -3.3509 )+
		(SBCGlobal::integer			*  1.1919 )+
		(MSN::integer				*  1.0713 )+
		(Hotmail::integer			*  0.8979 )+
		(Yahoo::integer				*  0.5771 )+
		(length_handle_gt12::integer		*	-0.1807)+
		(dot_inmail::integer 		*	-0.2065)+
		(state_TX::integer			*  0.1825 )+
		(Pacific::integer			*  0.0938 )+
		(Bankcard_rate::integer			* -0.1014 )+
		(Exercise_Walking1::integer		*  0.0478 )+
		(Travel_Domestic1::integer		*  0.0618 )+
		(Travel_International1::integer		*  0.0755 )+
		(Upscale_Living1::integer		*  0.0715 )+
		(Home_Assessed_Value::integer		*  0.0254 )+
		(age_in_two_year_a::integer				*  0.00848)+
		(age_in_two_yearlt30::integer			* -0.9882 )+
		(age_in_two_year60pl::integer			*  0.1499 )+
		(vaca_prop_ownership_high::integer	*  0.1303 )+
		(num_cats::integer			* -0.0128 )+
		(Cooking_Connoisseur::integer		*  0.00937 )    ) as lg_score, b.*
	from leo_model_2 b
	);
