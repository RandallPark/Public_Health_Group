# This python file holds has all the database queries as a python dictionary
# for access by data_functions.py
db_queries_dict = {'drug_deaths_by_state': 'SELECT state_de, deaths FROM drug_deaths;',
                    'drug_deaths_by_region': 'SELECT region, sum(deaths) total_deaths FROM drug_deaths GROUP BY region;',
                    'most_popular_substance': 'SELECT sub1_de, count(*) FROM adm_lookups GROUP BY sub1_de ORDER BY count(*) desc;', 
                    'pct_by_gender': 'CREATE TABLE mf_counts SELECT year_de\
                                        sum( case when gender = 1 then 1 else 0 end ) male_count,\
                                        sum( case when gender = 2 then 1 else 0 end ) female_count\
                                        FROM adm_lookups\
                                        WHERE year_de = \'2016\';',
                    'pct of male vs. female': 'SELECT\
                                                round(((male_count /(male_count + female_count)) * 100), 2) \'male_addicts_pct\',\
                                                round(((female_count /(male_count + female_count)) * 100), 2) \'female_addicts_pct\'\
                                                FROM\
                                                mf_counts\
                                                WHERE\
                                                year_de = \'2016\';'
                    # Continue adding with queries...
                    }