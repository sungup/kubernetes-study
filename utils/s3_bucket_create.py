# this is the reference check source from server-world.info.

import sys
import boto
import boto.s3.connection

# user's access-key and secret-key you added on [2] section
ACCESS_KEY = 'NN2DTW3WALH1MH9BGHKZ'
SECRET_KEY = 'GWjENcoy5xGYGJ8rmnNC6lToPSMeyk9NCoRFEuez'

# Object Gateway's hostname and listeing port
HOST = 'rgw.sungup.io'
PORT = 8080

conn = boto.connect_s3(
    aws_access_key_id = ACCESS_KEY,
    aws_secret_access_key = SECRET_KEY,
    port = PORT,
    host = HOST,
    is_secure = False,
    calling_format = boto.s3.connection.OrdinaryCallingFormat(),
)

# create [my-new-bucket] bucket
bucket = conn.create_bucket('gf-loki')

# list own bucket list
for bucket in conn.get_all_buckets():
    print("{name}\t{created}".format(
        name = bucket.name,
        created = bucket.creation_date,
    ))