# This python file holds has all the database queries as a python dictionary
# for access by data_functions.py
# Set desired chunk_size for each fetch (helps to serve large data in manageable chunks)
__CHUNK_SIZE = 1000
LOG_FILENAME = 'data_func_error.log'
db_queries_dict = {'drug_deaths_by_state': 'SELECT state_de, deaths FROM drug_deaths;',
                    'drug_deaths_by_region': 'SELECT region, sum(deaths) total_deaths\
                                              FROM drug_deaths GROUP BY region;',
                    'most_popular_substance': 'SELECT sub1_de, count(*) FROM adm_lookups\
                                               GROUP BY sub1_de ORDER BY count(*) desc;', 
                     # Continue adding queries here. Please follow the python formar of breaking a long line as shown above.
                    }