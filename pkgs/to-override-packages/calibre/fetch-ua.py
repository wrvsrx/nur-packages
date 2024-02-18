import bz2
import ssl
from urllib.request import urlopen
import subprocess
import json

subprocess.check_call(['nix', 'build', '.#calibre.src'])
from result.setup.browser_data import get_data
data = get_data()
with open('ua-popularity.json', 'w', encoding='utf-8') as f:
    json.dump(data, f, indent=2, ensure_ascii=False, sort_keys=True)
    # to pass nixpkgs eol check
    f.write('\n')
subprocess.check_call(['rm', 'result'])
