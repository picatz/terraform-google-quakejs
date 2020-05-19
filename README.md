# terraform-google-quakejs

[Terraform](https://www.terraform.io/) Module for [QuakeJS](https://github.com/treyyoder/quakejs-docker) servers on [GCP](https://cloud.google.com/).

<img alt="Quake JS Screen Shot" src="https://raw.githubusercontent.com/picatz/terraform-google-quakejs/master/screen_shot.png" height="400" />

## Bootstrap a brand new GCP project using gcloud

I created a project named `quakejs-server` using the following command (you will need to use a different project name):

```console
$ bash setup_gcp.sh quakejs-server
...
```

## Use Generated account.json

```console
$ export GOOGLE_APPLICATION_CREDENTIALS=$(realpath account.json)
$ export GOOGLE_PROJECT="quakejs-server"
```

## Build Infrastructure

```console
$ terraform init
...
$ terraform plan -var="project=quakejs-server"
...
$ terraform apply -var="project=quakejs-server"
...
Apply complete! Resources: 8 added, 0 changed, 0 destroyed.

Outputs:

public_ip = W.X.Y.Z
```

> **Note**: The `public_ip` will be your server's public IP to share with friends. Just put it in your browser, and you'll be frag'n like it's 1999!

## Destroy Infrastructure

```console
$ terraform destroy -var="project=quakejs-server"
...
```
