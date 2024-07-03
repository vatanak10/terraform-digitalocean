# terraform-digitalocean
Repository for Terraform on DigitalOcean project


```bash
nano ~/.bashrc
```

```bash
. ~/.bashrc
```

```bash
terraform plan \
  -var "do_token=${DO_PAT}" \
  -var "pvt_key=$HOME/.ssh/id_rsa" 
```

```bash
terraform apply \
  -var "do_token=${DO_PAT}" \
  -var "pvt_key=$HOME/.ssh/id_rsa"
```

## Destroying the infrastructure

```bash
terraform plan -destroy -out=terraform.tfplan \
  -var "do_token=${DO_PAT}" \
  -var "pvt_key=$HOME/.ssh/id_rsa"
```

```bash
terraform apply terraform.tfplan
```