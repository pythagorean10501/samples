CREATE TABLE leo_model_ntile AS
SELECT DISTINCT

	case when lg_score is null then 0

		 when lg_score::float >= 10 then exp(10)/(1+exp(10))

		 else exp(lg_score::float)::float/(1+exp(lg_score::float)::float) end as model_score,

	NTILE(10) OVER (ORDER BY lg_score DESC) AS model_decile,
	c.*

FROM leo_model_3 c