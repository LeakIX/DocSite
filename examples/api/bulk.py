from leakix import Client
from leakix.query import RawQuery

client = Client(api_key="YOUR_API_KEY")

query = RawQuery('+plugin:"ElasticSearchOpenPlugin"')

# Stream results (memory efficient)
for aggregation in client.bulk_export_stream([query]):
    for event in aggregation.events:
        print(event.ip, event.host)
