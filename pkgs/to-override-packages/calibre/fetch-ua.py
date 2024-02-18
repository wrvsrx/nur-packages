import bz2
import ssl
from urllib.request import urlopen
import subprocess


def download_from_calibre_server(url):
    ca = 'result/resources/calibre-ebook-root-CA.crt'
    ssl_context = ssl.SSLContext(ssl.PROTOCOL_TLS_CLIENT)
    ssl_context.load_verify_locations(ca)
    return urlopen(url, context=ssl_context).read()


subprocess.check_call(['nix', 'build', '.#calibre.src'])
raw = download_from_calibre_server(
    'https://code.calibre-ebook.com/ua-popularity')
subprocess.check_call(['rm', 'result'])
cnt = bz2.decompress(raw).decode('utf-8')
with open('./ua-popularity.txt', 'w') as f:
    f.write(cnt)
