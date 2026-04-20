from leakix import Client

client = Client(api_key="YOUR_API_KEY")
# Use the plugins list endpoint and filter by name
response = client.get_plugins()
for plugin in response.json():
    if plugin.name == "ElasticSearchOpenPlugin":
        print(plugin)
