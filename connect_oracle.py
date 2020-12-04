import cx_Oracle
import pandas as pd

"""
Some quick start guides:
* cx_Oracle 8: https://cx-oracle.readthedocs.io/en/latest/user_guide/installation.html
* pandas: https://pandas.pydata.org/pandas-docs/stable/user_guide/10min.html
"""
# TODO change path of Oracle Instant Client to yours
cx_Oracle.init_oracle_client(lib_dir = "instantclient_19_9")

# TODO change credentials
# Connect as user "user" with password "mypass" to the "CSC423" service
# running on lawtech.law.miami.edu
connection = cx_Oracle.connect(
    "gugacsc423", "c02724", "lawtech.law.miami.edu/CSC_423")


cursor = connection.cursor()
cursor.execute("""
    SELECT *
    FROM Course
    """)

# get column names from cursor
columns = [c[0] for c in cursor.description]
# fetch data
data = cursor.fetchmany(5)
# bring data into a pandas dataframe for easy data transformation
df = pd.DataFrame(data, columns = columns)
print('All courses:')
print(df) # examine
#print(df.columns)
# print(df['FIRST_NAME']) # example to extract a column

cursor.execute("""
    SELECT tfname, tlname
    FROM tutor 
    WHERE tutorid = 6
    """)

# get column names from cursor
columns = [c[0] for c in cursor.description]
# fetch data
data = cursor.fetchmany(5)
# bring data into a pandas dataframe for easy data transformation
df = pd.DataFrame(data, columns = columns)
print('Tutor with id of 6:')
print(df)  


cursor.execute("""
    SELECT c.courseTitle
    FROM Course c
    RIGHT JOIN offering o  ON c.courseID = o.courseID
    WHERE o.timeOfDay = 'morning'
    """)

# get column names from cursor
columns = [c[0] for c in cursor.description]
# fetch data
data = cursor.fetchmany(5)
# bring data into a pandas dataframe for easy data transformation
df = pd.DataFrame(data, columns = columns)
print('Courses offered in the morning:')
print(df) 

cursor.execute("""
    SELECT *
    FROM Offering
    """)

# get column names from cursor
columns = [c[0] for c in cursor.description]
# fetch data
data = cursor.fetchall()
# bring data into a pandas dataframe for easy data transformation
df = pd.DataFrame(data, columns = columns)
print('All course offerings:')
print(df) # examine



cursor.execute("""
    SELECT c.coursetitle 
    FROM course c 
    LEFT JOIN offering o 
    ON c.courseID = o.courseID 
    WHERE o.endMonth = 'May'
    """)

# get column names from cursor
columns = [c[0] for c in cursor.description]
# fetch data
data = cursor.fetchall()
# bring data into a pandas dataframe for easy data transformation
df = pd.DataFrame(data, columns = columns)
print('All course offerings that end in May:')
print(df) # examine
