import boto3

connection = boto3.client('s3', aws_access_key_id='6G2M8JG62IKT0MEICI8O', aws_secret_access_key='I8UJFI9UZDPBFP4COXMIBY40Z7YYBWULDYHTWGZ7', region_name='eu-west-2', endpoint_url='https://oos.eu-west-2.outscale.com')

response=connection.list_objects(
        Bucket="timothee-bucket"
        )
print(response)
connection.download_file(
        Bucket='timothee-bucket',
        Key="5",
        Filename="/opt/backup.sql.gz"

        )

