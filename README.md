Terraform Open Telekom Cloud Quickstart
=======================================

Intro
=====

Deutsche Telekom offers since March 2016 an IaaS Service named
Open Telekom Cloud (OTC). The service includes

* Virtual Private Cloud (VPC)
* Elastic Cloud Server (ECS)
* Elastic Load Balancer (ELB)
* Elastic Volume Service (EVS)
* Image Management Service (IMS)
* Object Storage Service (OBS)
* Dynamic Name Service (DNS)
* Relational Database Service (RDS)

and other useful things. The portfolio will rapidly developed.


Content
=======

Terraform provider for OTC: https://www.terraform.io/docs/providers/opentelekomcloud/index.html

With the Quickstart the following resources will created for you:

* VPC
* Subnet
* Security Group
* EIP
* ECS

```
cp terraform.tfvars.example terraform.tfvars
```

Adjust access\_key, secret\_key with your own OTC credentials

Adjust public\_key with your own SSH Public Key

All other settings are defined in `variables.tf`, you can overwrite them in terraform.tfvars

Init Terraform:

```
    terraform init
```

Plan Terraform:

```
    terraform plan
```

Apply Terraform:

```
    terraform apply
```

As output you can see the EIP to connect with ssh. Security Groups are almost open to work with your VM.


Destroy Terraform:

```
    terraform destroy
```

Contributing
------------

1. Fork it.
2. Create a branch (`git checkout -b my_markup`)
3. Commit your changes (`git commit -am "Added Snarkdown"`)
4. Push to the branch (`git push origin my_markup`)
5. Open a [Pull Request][1]
6. Enjoy a refreshing Diet Coke and wait

