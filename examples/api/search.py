from leakix import Client

client = Client(api_key="YOUR_API_KEY")

response = client.search("+plugin:HttpNTLM +country:France", scope="leak")
for event in response.json():
    print(event.ip, event.host)
