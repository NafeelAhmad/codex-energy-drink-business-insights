-- Q1. Demographic Insights (examples)
-- a. Who prefers energy drink more? (male/female/non-binary?)

SELECT Gender,count(Consume_frequency) Frequency FROM 
codex.dim_respondents r join fact_survey_respodents f
on r.Respodents_ID=f.Respodent_ID group by Gender;

-- b. Which age group prefers energy drinks more?

SELECT Age,count(Consume_frequency) Frequency FROM 
codex.dim_respondents r join fact_survey_respodents f
on r.Respodents_ID=f.Respodent_ID group by Age order by Frequency desc;

-- c. Which type of marketing reaches the most Youth (15-30)?

SELECT Marketing_channels, count(Marketing_channels) Count FROM 
codex.dim_respondents r join fact_survey_respodents f
on r.Respodents_ID=f.Respodent_ID where Age in ("15-18","19-30") 
group by Marketing_channels order by Count desc;

-- Q2. Consumer Preferences:
-- a. What are the preferred ingredients of energy drinks among respondents?

select Ingredients_expected, count(Ingredients_expected) Count from
fact_survey_respodents group by Ingredients_expected order by Count desc;

-- b. What packaging preferences do respondents have for energy drinks?

select Packaging_preference, count(Packaging_preference) Count from
fact_survey_respodents group by Packaging_preference order by Count desc;

-- Q3. Competition Analysis:
-- a. Who are the current market leaders?
select Current_brands, count(Current_brands) Count from
fact_survey_respodents group by Current_brands order by Count desc;

-- b. What are the primary reasons consumers prefer those brands over ours?

select Reason_for_choosing_brands, count(Reason_for_choosing_brands) Count from
fact_survey_respodents group by Reason_for_choosing_brands order by Count desc;


-- Q4. Marketing Channels and Brand Awareness:
-- a. Which marketing channel can be used to reach more customers?

select Marketing_channels, count(Marketing_channels) Count from
fact_survey_respodents group by Marketing_channels order by Count desc;

-- b. How effective are different marketing strategies and channels in reaching our 
-- customers?

-- Q5. Brand Penetration:
-- a. What do people think about our brand? (overall rating)

select Taste_experience as overall_rating, count(Taste_experience) Count from
fact_survey_respodents group by Taste_experience order by Count desc;

-- b. Which cities do we need to focus more on?

select city, count(city) count from dim_cities join dim_respondents using(city_id)
group by city order by count desc;

-- Q6. Purchase Behavior:
-- a. Where do respondents prefer to purchase energy drinks?
select Purchase_location , count(Purchase_location) Count from
fact_survey_respodents group by Purchase_location order by Count desc;

-- b. What are the typical consumption situations for energy drinks among respondents?
select Consume_time , count(Consume_time) Count from
fact_survey_respodents group by Consume_time order by Count desc;

-- c. What factors influence respondents' purchase decisions, such as price range and 
-- limited edition packaging?
select Price_range , count(Price_range) Count from
fact_survey_respodents group by Price_range order by Count desc;

select Limited_edition_packaging , count(Limited_edition_packaging) Count from
fact_survey_respodents group by Limited_edition_packaging order by Count desc;