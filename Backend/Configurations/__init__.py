import os
from dotenv import load_dotenv


database_configurations:dict 

def get_database_configurations()->dict:
    try:
        database_configurations["host"] = os.environ.get("MYSQL_HOST")
        database_configurations["user"] = os.environ.get("MYSQL_USER")
        database_configurations["password"] = os.environ.get("MYSQL_PASSWORD")
        database_configurations["database"] = os.environ.get("MYSQL_DATABASE")
        database_configurations["port"] = os.environ.get("MYSQL_PORT")
        return database_configurations
    except:
        raise Exception("Error happened in getting enviorenmental variables")