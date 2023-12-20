import boto3

connection = boto3.client('s3', aws_access_key_id='', aws_secret_access_key='', region_name='', endpoint_url='')

response=connection.list_objects(
        Bucket="timothee-bucket"
        )
print(response)
connection.download_file(
        Bucket='timothee-bucket',
        Key="5",
        Filename="/opt/backup.sql.gz"

        )

