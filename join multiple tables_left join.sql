# project 2 [join multiple tables]
-- Objective: Given our Segment table below, add 2 new columns “Household” (number of households in a postal code) and “PopulationSize” using other 
-- reference tables. 
-- Describe how you would approach this problem.
--  PopulationSize is defined as follows:
-- • 1= when population > 750,000 
-- • 2= when population between 200,000 to 750,000
-- • 3= when population <200,000

-- Segment
-- ECID Age PostalCode Segment
-- 1111 30   L6C1C3      2
-- 2222 25   M2M0A8      3
-- 3333 47   L4A0Z6      1
-- 4444 58   L6L6X2      5

#Reference Tables are on the pdf file

select a.*, case when b.Population > 750000 then 1
when 200000 <= b.Population <= 750000 then 2
when b.Population < 200000 then 3
else "undefined" end as PopulationSize, b.Household from Segment as a left join
Prizm5 as c on a.PostalCode = c.FSALDU left join DemoStats as b on b.CODE = c.Code;

# Remember using left join to make sure the integrity after join in the multiple tables