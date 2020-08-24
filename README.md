# ftp-action

Automate copying your files via ftp using this GitHub action.

View in [GitHub Marketplace](https://github.com/marketplace/actions/ftp-upload-action).
For details on how it works (and the options it sets, such as timeouts), read [`entrypoint.sh`](./entrypoint.sh). 
You may be especially interested to note that: 

- the `.git` folder is not (up/down)loaded
- only newer files are (up/down)loaded

## Example usage

```
name: Deploy via ftp
on: push
jobs:
  deploy:
    name: Deploy
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - name: Upload ftp
      uses: ftp-upload-action@v4
      with:
        host: ${{ secrets.FTP_SERVER }}
        user: ${{ secrets.FTP_USERNAME }}
        password: ${{ secrets.FTP_PASSWORD }}
        localDir: "dist"
        remoteDir: "www"
```

Note that the `secrets.FTP_{SERVER,USERNAME,PASSWORD}` variables have to be set in the repository settings.

## Input parameters

Input parameter | Description | Required | Default
--- | --- | --- | ---
host | FTP server name | Yes | N/A
user | FTP username | Yes | N/A
password | FTP password | Yes | N/A
localDir | The local directory to copy | No | .
remoteDir | The remote directory to copy to | No | .
forceSsl | Force SSL encryption | No | false
