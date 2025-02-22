import pandas as pd
import json
import glob
import os

new_file_final = ""

def proccess_new_file(file):

    try:
            
        current_data = f"{os.getenv("current_data")}{file}"
        df = pd.read_json(current_data)
        df = df.drop_duplicates()
        df['age'] = pd.to_numeric(df['age'], errors='coerce')
        df['age'].fillna(df['age'].median(), inplace=True)
        df = df.applymap(lambda x: x.strip() if isinstance(x, str) else x)

    except Exception as p:
        return p




def check_file():
    new_file = ""
    path = ""
    files = glob.glob(f"{os.getenv("path")}/*.json")  # List of full file paths

    try:
        with open(f"{os.getenv("metadatatxt")}", "r") as file:
            data = file.read().splitlines()


        new_files = [file for file in files if file not in data]
            
        if not new_files:
            print("Up to date")
            return
        

        for new_file in new_files:
            global new_file_final
            new_file_final = new_file
            proccess_new_file(new_file)
            update_metadata(new_file)
    except Exception as c:
        return c          

def update_metadata(new_file):
    with open (f"{os.getenv("metadatatxt")}", "a") as up:
        up.write(f"\n{new_file}")


if __name__ == "__main__":
    check_file()
    
