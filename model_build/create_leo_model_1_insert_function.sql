DROP FUNCTION IF EXISTS leo_model_1(zipinput char(5));
CREATE FUNCTION leo_model_1(zipinput char(5)) RETURNS void AS '
  
  BEGIN

	INSERT INTO leo_model_1 (select DISTINCT *,
				case when deliverable.date_of_birth_individual_year is not null then ''2015''::integer-deliverable.date_of_birth_individual_year::integer else
				case when deliverable.age_in_two_year_increments_1st_individual is not null then deliverable.age_in_two_year_increments_1st_individual::integer else
				case when (Adult_Present_in_Household_Unknown_Gender_75::integer    >=1 or Adult_Present_in_Household_Males_75::integer    >=1 or Adult_Present_in_Household_Females_75::integer >=1) then 80 else
				case when (Adult_Present_in_Household_Unknown_Gender_65_74::integer >=1 or Adult_Present_in_Household_Males_65_74::integer >=1 or Adult_Present_in_Household_Females_65_74::integer >=1) then 70 else
				case when (Adult_Present_in_Household_Unknown_Gender_55_64::integer >=1 or Adult_Present_in_Household_Males_55_64::integer >=1 or Adult_Present_in_Household_Females_55_64::integer >=1) then 60 else
				case when (Adult_Present_in_Household_Unknown_Gender_45_54::integer >=1 or Adult_Present_in_Household_Males_45_54::integer >=1 or Adult_Present_in_Household_Females_45_54::integer >=1) then 50 else
				case when (Adult_Present_in_Household_Unknown_Gender_35_44::integer >=1 or Adult_Present_in_Household_Males_35_44::integer >=1 or Adult_Present_in_Household_Females_35_44::integer >=1) then 40 else
				case when (Adult_Present_in_Household_Unknown_Gender_25_34::integer >=1 or Adult_Present_in_Household_Males_25_34::integer >=1 or Adult_Present_in_Household_Females_25_34::integer >=1) then 30 else
				case when (Adult_Present_in_Household_Unknown_Gender_18_24::integer >=1 or Adult_Present_in_Household_Males_18_24::integer >=1 or Adult_Present_in_Household_Females_18_24::integer >=1) then 21 else
				54 end end end end end end end end end as age_in_two_year_a

			from deliverable JOIN

			(select distinct recordid recordid2, email email2,

				case when
					COALESCE(Category_1::integer,Category_2::integer,
					Category_3::integer,Category_4::integer,Category_5::integer,
					Category_6::integer,Category_7::integer,
					Category_8::integer,Category_9::integer,Category_10::integer,
					Category_11::integer,Category_12::integer,Category_13::integer,Category_14::integer,
					Category_15::integer,Category_16::integer,Category_17::integer,Category_18::integer,Category_19::integer,
					Category_20::integer,Category_21::integer,
					Category_22::integer,Category_23::integer,Category_24::integer,
					Category_25::integer,Category_26::integer,Category_27::integer,Category_28::integer,
					Category_29::integer,Category_30::integer,Category_31::integer,Category_32::integer,Category_33::integer,
					Category_34::integer,Category_35::integer,
					Category_36::integer,Category_37::integer,Category_38::integer,
					Category_39::integer,Category_40::integer,Category_41::integer,Category_42::integer,
					Category_43::integer,Category_44::integer,Category_45::integer,
					Category_46::integer,Category_47::integer,Category_48::integer,Category_49::integer,
					Category_50::integer,Category_51::integer,Category_52::integer,
					Category_53::integer,Category_54::integer,Category_55::integer,Category_56::integer,
					Category_57::integer,Category_58::integer,Category_59::integer,Category_60::integer) is null then 0

				else

				(COALESCE(Category_1,0)::integer+COALESCE(Category_2,0)::integer
				+COALESCE(Category_3,0)::integer+COALESCE(Category_4,0)::integer+COALESCE(Category_5,0)::integer+COALESCE(Category_6,0)::integer
				+COALESCE(Category_7,0)::integer+COALESCE(Category_8,0)::integer+COALESCE(Category_9,0)::integer+COALESCE(Category_10,0)::integer
				+COALESCE(Category_11,0)::integer+COALESCE(Category_12,0)::integer+COALESCE(Category_13,0)::integer+COALESCE(Category_14,0)
				+COALESCE(Category_15,0)::integer+COALESCE(Category_16,0)::integer+COALESCE(Category_17,0)::integer+COALESCE(Category_18,0)::integer
				+COALESCE(Category_19,0)::integer+COALESCE(Category_20,0)::integer+COALESCE(Category_21,0)+COALESCE(Category_22,0)::integer
				+COALESCE(Category_23,0)::integer+COALESCE(Category_24,0)::integer+COALESCE(Category_25,0)::integer+COALESCE(Category_26,0)::integer
				+COALESCE(Category_27,0)::integer+COALESCE(Category_28,0)+COALESCE(Category_29,0)::integer+COALESCE(Category_30,0)::integer+COALESCE(Category_31,0)::integer
				+COALESCE(Category_32,0)::integer+COALESCE(Category_33,0)::integer+COALESCE(Category_34,0)::integer+COALESCE(Category_35,0)+COALESCE(Category_36,0)::integer
				+COALESCE(Category_37,0)::integer+COALESCE(Category_38,0)::integer+COALESCE(Category_39,0)::integer+COALESCE(Category_40,0)::integer+COALESCE(Category_41,0)::integer
				+COALESCE(Category_42,0)+COALESCE(Category_43,0)::integer+COALESCE(Category_44,0)::integer+COALESCE(Category_45,0)::integer+COALESCE(Category_46,0)::integer
				+COALESCE(Category_47,0)::integer+COALESCE(Category_48,0)::integer+COALESCE(Category_49,0)+COALESCE(Category_50,0)::integer+COALESCE(Category_51,0)::integer
				+COALESCE(Category_52,0)::integer+COALESCE(Category_53,0)::integer+COALESCE(Category_54,0)::integer+COALESCE(Category_55,0)::integer+COALESCE(Category_56,0)
				+COALESCE(Category_57,0)::integer+COALESCE(Category_58,0)::integer+COALESCE(Category_59,0)::integer+COALESCE(Category_60,0)::integer) END as num_cats1

				FROM deliverable WHERE 
				(deliverable.zip=$1 AND deliverable=2 AND cooking_food_grouping=1 AND age_in_two_year between 34 and 82)
				OR
				(deliverable.zip=$1 AND deliverable=2 AND cooking_general=1 AND age_in_two_year between 34 and 82)
				OR
				(deliverable.zip=$1 AND deliverable=2 AND ccooking_gourmet=1 AND age_in_two_year between 34 and 82)
			

				GROUP BY email2,recordid2,Category_1,Category_2,Category_3,Category_4,Category_5,Category_6,Category_7,Category_8,
					Category_9,Category_10,Category_11,Category_12,Category_13,Category_14,Category_15,
					Category_16,Category_17,Category_18,Category_19,Category_20,Category_21,Category_22,
					Category_23,Category_24,Category_25,Category_26,Category_27,Category_28,Category_29,
					Category_30,Category_31,Category_32,Category_33,Category_34,Category_35,Category_36,
					Category_37,Category_38,Category_39,Category_40,Category_41,Category_42,
					Category_43,Category_44,Category_45,Category_46,Category_47,Category_48,Category_49,
					Category_50,Category_51,Category_52,Category_53,Category_54,Category_55,Category_56,
					Category_57,Category_58,Category_59,Category_60  ) as d

					ON d.email2=deliverable.email AND deliverable.recordid=d.recordid2
					WHERE deliverable.zip=$1 AND recordid NOT in (SELECT recordid FROM leo_model_1 
					WHERE leo_model_1.recordid=deliverable.recordid AND deliverable.email=leo_model_1.email)
					);
					


      
  END;
' LANGUAGE 'plpgsql';