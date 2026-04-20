from leakix import Client, MustQuery, CountryField, PluginField, Plugin

client = Client(api_key="YOUR_API_KEY")

# Simple string search
response = client.search("searchquery", scope="leak")
for event in response.json():
    print(event.ip, event.host)

# Structured query search
queries = [
    MustQuery(PluginField(Plugin.HttpNTLM)),
    MustQuery(CountryField("France")),
]
response = client.get_leak(queries=queries)
