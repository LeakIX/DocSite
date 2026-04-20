from leakix import Client, MustQuery, PluginField, Plugin

client = Client(api_key="YOUR_API_KEY")

queries = [MustQuery(PluginField(Plugin.ElasticSearchOpenPlugin))]

# Stream results (memory efficient)
for aggregation in client.bulk_export_stream(queries):
    for event in aggregation.events:
        print(event.ip, event.host)
