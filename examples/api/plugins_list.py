from leakix import Client

client = Client(api_key="YOUR_API_KEY")
response = client.get_plugins()
for plugin in response.json():
    print(plugin.name, plugin.description)
