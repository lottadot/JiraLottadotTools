from jira.client import JIRA

jira = JIRA()

jac = JIRA(options={'server': 'http://apoc.local:2990/jira'})

# all values are samples and won't work in your code!
key_cert_data = None
with open('../atlastutorial/RSA.pem', 'r') as key_cert_file:
    key_cert_data = key_cert_file.read()

oauth_dict = {
    'access_token': 'jCKs2KSgzkbGL7JHk9161oK4clh62I8s', # BGzdx82lyTxppuYay7tHdNBayGZBYbnM
    'access_token_secret': 'iKRlPZSzEnHrkFRT36xNLp25hzdCDLmA', # AuYhdv6nnNb5DUSbBS4mXXRrivsB1oJV
    'consumer_key': 'oauth-sample-consumer',
    'key_cert': key_cert_data
}
authed_jira = JIRA(oauth=oauth_dict)

issue = authed_jira.issue('TP-1')
print authed_jira
print issue
