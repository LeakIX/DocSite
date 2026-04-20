from leakix import Client

client = Client(api_key="YOUR_API_KEY")
response = client.get_subdomains("leakix.net")
for sub in response.json():
    print(sub.subdomain, sub.distinct_ips)
