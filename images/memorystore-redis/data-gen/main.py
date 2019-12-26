import redis
import requests
import time
import uuid
from google.cloud import redis_v1
from google.oauth2 import service_account
import sys, os
from faker import Faker

# INSTANCE METADATA
location='us-west1'
instance_id= os.environ.get('INSTANCE_ID', 'us-cache')

#WRITE SETTINGS
BATCH_SIZE = 128
ITERS=True

def initVariables(retry=3):
    print("Getting project ID...")
    metadata_path = "http://metadata.google.internal/computeMetadata/v1/"
    headers = {'Metadata-Flavor': 'Google'}
    try:
        return requests.get(metadata_path + 'project/project-id', headers=headers).text
    except:
        time.sleep(0.6*(3-retry))
        retry -= 1
        if retry == 0:
            sys.exit(1)
        initVariables(retry)


def writeFakeData(host, port):
    r = redis.Redis(host=host, port=port)

    print(r.ping())
    
    fake = Faker(['en_US', 'es_ES'])
    
    n = 0

    pipe = r.pipeline()

    while ITERS:
        n += 1
        # Gen fake data
        name = fake.name()

        key = name.lower().replace(" ", "_")

        address = fake.address()

        building_number = fake.building_number()

        country = fake.country()

        postalcode = fake.postalcode_plus4()

        phone_number = fake.phone_number()

        user_id = str(uuid.uuid4())

        data = {
            "address": address,
            "building_number": building_number,
            "country": country,
            "postalcode": postalcode,
            "user_id": user_id
            }

        pipe.hmset(key+"_"+user_id[:5], data)

        if n == BATCH_SIZE:
            print("Writing to the instance...")
            pipe.execute() 

            n = 0

            pipe = r.pipeline()

            time.sleep(0.1)


if __name__=='__main__':
    print("Starting redis app...")
    
    print("Loading default credentials...")

    credentials = service_account.Credentials.from_service_account_file('key.json')

    print("Initializing client...")
    client = redis_v1.CloudRedisClient(credentials=credentials)
    
    #project_id = initVariables()


    project_id = 'spanner-latency-test-262609'

    print(project_id)
    
    instance_name = client.instance_path(project_id, location, instance_id)

    instance = client.get_instance(instance_name)

    host = instance.host

    port = instance.port

    print(host)

    writeFakeData(host, port)

