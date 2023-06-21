import boto3
import glob
import os
from datetime import datetime

connection = boto3.client('s3', aws_access_key_id='6G2M8JG62IKT0MEICI8O', aws_secret_access_key='I8UJFI9UZDPBFP4COXMIBY40Z7YYBWULDYHTWGZ7', region_name='eu-west-2', endpoint_url='https://oos.eu-west-2.outscale.com')
list_of_files = glob.glob('/usr/local/bin/backup_sql/*') # * means all if need specific format then *.csv
latest_file = max(list_of_files, key=os.path.getctime)
dt= datetime.now()
dt= dt.weekday()

try:
	connection.create_bucket(
		Bucket='timothee-bucket')
except:
	connection.put_object(
		Bucket="timothee-bucket",
		Key=str(dt))

	connection.upload_file(
		Filename= latest_file,
		Bucket='timothee-bucket',
		Key=str(dt))

try:
	connection.delete_object(
		Bucket="timothee-bucket",
		Key=str(int((sqrt((dt-7)**2)))))
except:
	print('No bucket to delete')





