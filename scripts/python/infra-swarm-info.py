json_data=open(file_directory).read()

data = json.loads(json_data)
pprint(data)