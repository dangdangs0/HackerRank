select sum(city.population)
from city, country
where city.countrycode=country.code
and continent='Asia';
