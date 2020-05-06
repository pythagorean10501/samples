INSERT INTO leo_model_2 (select
			case when age_in_two_year_a < 30 then 1 else 0 end as age_in_two_yearlt30,
			case when age_in_two_year_a >= 60 then 1 else 0 end as age_in_two_year60pl,
			case when State in ('TX') then 1 else 0 end as state_TX,
			case when State in ('WA','OR','NV','CA','HI','AK') then 1 else 0 end as Pacific,
			case when Vacation_Property_Ownership_Propensity >= '60.5' then 1 else 0 end as vaca_prop_ownership_high,

			num_cats1 as num_cats,

			case when Bankcard_Utilization_Rate in ('000-010%','011-020%','021-030%') then 1
		 		when Bankcard_Utilization_Rate in ('031-040%') then 2
		 		when Bankcard_Utilization_Rate in ('041-050%','051-060%','061-070%','071-080%','081-090%','091-100%') then 3
		 		else 3 end as Bankcard_rate,

			case when Cooking_Food_Connoisseur = 3 then 1
		 		when Cooking_Food_Connoisseur = 2 then 2
		 		when Cooking_Food_Connoisseur = 1 then 3
		 		else 0 end as Cooking_Connoisseur,

			case when Exercise_Walking is null then '0' else Exercise_Walking end as Exercise_Walking1,
			case when Travel_Domestic is null then '0' else Travel_Domestic end as Travel_Domestic1,
			case when Travel_International is null then '0' else Travel_International end as Travel_International1,
			case when Upscale_Living is null then '0' else Upscale_Living end as Upscale_Living1,
			case when Home_Assessed_Value_Ranges = 'A' then 1
		 		when Home_Assessed_Value_Ranges = 'B' then 2
		 		when Home_Assessed_Value_Ranges = 'C' then 3
				when Home_Assessed_Value_Ranges = 'D' then 4
		 		when Home_Assessed_Value_Ranges = 'E' then 5
		 		when Home_Assessed_Value_Ranges = 'F' then 6
		 		when Home_Assessed_Value_Ranges = 'G' then 7
		 		when Home_Assessed_Value_Ranges = 'H' then 8
		 		when Home_Assessed_Value_Ranges = 'I' then 9
		 		when Home_Assessed_Value_Ranges = 'J' then 10
		 		when Home_Assessed_Value_Ranges = 'K' then 11
		 		when Home_Assessed_Value_Ranges = 'L' then 12
		 		when Home_Assessed_Value_Ranges = 'M' then 13
		 		when Home_Assessed_Value_Ranges = 'N' then 14
		 		when Home_Assessed_Value_Ranges = 'O' then 15
		 		when Home_Assessed_Value_Ranges = 'P' then 16
		 		when Home_Assessed_Value_Ranges = 'Q' then 17 else 0 end as Home_Assessed_Value,

			case when upper(split_part(a.email, '@', 1)) LIKE '%.%' then 1 else 0 end as dot_inmail,

			/*--------------------------------------------------------------------------------------------*/
			/* IF LENGTH IS GREATER THAN 12 THEN 1 ELSE 0 */
			case when LENGTH(upper(split_part(a.email,'@',1))) > 12 then 1 else 0 end length_handle_gt12,
			/*--------------------------------------------------------------------------------------------*/


			case when upper(split_part(email, '@', 2)) = 'GMAIL.COM' then 1 else 0 end as Gmail,
			case when upper(split_part(email, '@', 2)) = 'YAHOO.COM' then 1 else 0 end as Yahoo,
			case when upper(split_part(email, '@', 2)) = 'HOTMAIL.COM' then 1 else 0 end as Hotmail,
			case when upper(split_part(email, '@', 2)) = 'SBCGLOBAL.NET' then 1 else 0 end as SBCGlobal,
			case when upper(split_part(email, '@', 2)) = 'MSN.COM' then 1 else 0 end as MSN,a.*
		from leo_model_1 a WHERE state IN ('SD','TN','TX','UT','VA','VT')
		);
