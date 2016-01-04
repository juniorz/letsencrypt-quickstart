# Lets Encrypt quickstart

```
git clone https://github.com/twstrike/letsencrypt letsencrypt-client
git clone https://github.com/juniorz/letsencrypt-quickstart

cd letsencrypt-quickstart
docker-compose run client
```

You can follow the instructions at
https://letsencrypt.readthedocs.org/en/latest/contributing.html. You just need
to activate the virtualenv before running any command:

```
source /home/letsencrypt/client/venv/bin/activate
```

You can dump things on `~/letsencrypt-quickstart` and they will appear at your
`letsencrypt-quickstart/out` directory.

There are some commands I use for testing:

- `auth-and-install`: Authenticates and install a new certificate on nginx
- `certonly`: Only authenticates a new certificate
- `deploy-nginx`: Deploy the currently generate certificate

They all use a hypothetical `letsencrypt.you` domain, and all commands to
authenticate a certificate require a boulder server listening at
`localhost:4000` with access to `letsencrypt.you` pointing to `127.0.0.1`.

