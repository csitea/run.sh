# csi-wpb INSTALL GUIDE

## Checkout All csi-wpb Projects

```bash
gh api orgs/csitea/teams/team-csi-wpb-int/repos | jq -r '.[].ssh_url' | xargs -L1 git clone
```

## Build the Infrastructure Local Development Setup

Ensure you have checked out all the necessary csi-wpb projects
```bash
make -C ../csi-wpb-utl do-setup-app-inf
``` 


## Step-by-Step Instructions
### Step 000: GCP Remote Bucket

#### STEP=000-gcp-remote-bucket for csi-wpb-dev
```bash
# generate Configuration for dev
clear ; export STEP=000-gcp-remote-bucket ORG=csi APP=wpb ENV=dev \
  TPL_SRC=/opt/csi/csi-wpb/csi-wpb-inf \
  SRC=/opt/csi/csi-wpb/csi-wpb-cnf/ \
  TGT=/opt/csi/csi-wpb/csi-wpb-cnf \
  ;make -C ../csi-wpb-utl do-generate-config-for-step
```

```bash

# provision for dev
clear ; export STEP=000-gcp-remote-bucket ORG=csi APP=wpb ENV=dev \
  ;make -C ../csi-wpb-utl do-provision 
```

```bash

# divest for dev
clear ; export STEP=000-gcp-remote-bucket ORG=csi APP=wpb ENV=dev \
  ;make -C ../csi-wpb-utl do-divest 

```

#### STEP=000-gcp-remote-bucket for csi-wpb-tst


```bash
# generate Configuration for tst
clear ; export STEP=000-gcp-remote-bucket ORG=csi APP=wpb ENV=tst \
TPL_SRC=/opt/csi/csi-wpb/csi-wpb-inf \
SRC=/opt/csi/csi-wpb/csi-wpb-cnf/ \
TGT=/opt/csi/csi-wpb/csi-wpb-cnf \
;make -C ../csi-wpb-utl do-generate-config-for-step
```

provision for tst
```bash
clear ; export STEP=000-gcp-remote-bucket ORG=csi APP=wpb ENV=tst \
  ;make -C ../csi-wpb-utl do-provision 
```

divest for tst

```bash
clear ; export STEP=000-gcp-remote-bucket ORG=csi APP=wpb ENV=tst \
  ;make -C ../csi-wpb-utl do-divest 
```

#### STEP=000-gcp-remote-bucket for csi-wpb-prd

Generate Configuration for prd
```bash
clear ; export STEP=000-gcp-remote-bucket ORG=csi APP=wpb ENV=prd \
  TPL_SRC=/opt/csi/csi-wpb/csi-wpb-inf \
  SRC=/opt/csi/csi-wpb/csi-wpb-cnf/ \
  TGT=/opt/csi/csi-wpb/csi-wpb-cnf \
  ;make -C ../csi-wpb-utl do-generate-config-for-step
```

provision for prd
```bash
clear ; export STEP=000-gcp-remote-bucket ORG=csi APP=wpb ENV=prd \
  ;make -C ../csi-wpb-utl do-provision 
``` 

divest for prd
```bash
clear ; export STEP=000-gcp-remote-bucket ORG=csi APP=wpb ENV=prd \
  ;make -C ../csi-wpb-utl do-divest 
```

### Step 008: GCP Subzones

generate Configuration for dev
```bash
clear ; export STEP=008-gcp-subzones ORG=csi APP=wpb ENV=dev \
  TPL_SRC=/opt/csi/csi-wpb/csi-wpb-inf \
  SRC=/opt/csi/csi-wpb/csi-wpb-cnf/ \
  TGT=/opt/csi/csi-wpb/csi-wpb-cnf \
  ;make -C ../csi-wpb-utl do-generate-config-for-step
```
provision for dev
```bash
clear ; export STEP=008-gcp-subzones ORG=csi APP=wpb ENV=dev \
  ;make -C ../csi-wpb-utl do-provision 
``` 

divest for dev
```bash
clear ; export STEP=008-gcp-subzones ORG=csi APP=wpb ENV=dev \
  ;make -C ../csi-wpb-utl do-divest 

```
#### STEP=STEP=008-gcp-subzones for csi-wpb-tst

Generate Configuration for tst
```bash
clear ; export STEP=008-gcp-subzones ORG=csi APP=wpb ENV=tst \
  TPL_SRC=/opt/csi/csi-wpb/csi-wpb-inf \
  SRC=/opt/csi/csi-wpb/csi-wpb-cnf/ \
  TGT=/opt/csi/csi-wpb/csi-wpb-cnf \
  ;make -C ../csi-wpb-utl do-generate-config-for-step
```

Provision for tst
```bash
clear ; export STEP=008-gcp-subzones ORG=csi APP=wpb ENV=tst \
  ;make -C ../csi-wpb-utl do-provision 
```
Divest for tst
```bash
clear ; export STEP=008-gcp-subzones ORG=csi APP=wpb ENV=tst \
  ;make -C ../csi-wpb-utl do-divest 


```

### Step 008-gcp-subzones for csi-wpb-prd

Generate Configuration for prd:
```bash
clear ; export STEP=008-gcp-subzones ORG=csi APP=wpb ENV=prd \
  TPL_SRC=/opt/csi/csi-wpb/csi-wpb-inf \
  SRC=/opt/csi/csi-wpb/csi-wpb-cnf/ \
  TGT=/opt/csi/csi-wpb/csi-wpb-cnf \
  ;make -C ../csi-wpb-utl do-generate-config-for-step
```

Provision for prd:
```bash
clear ; export STEP=008-gcp-subzones ORG=csi APP=wpb ENV=prd \
  ;make -C ../csi-wpb-utl do-provision 
```

Divest for prd:
```bash
clear ; export STEP=008-gcp-subzones ORG=csi APP=wpb ENV=prd \
  ;make -C ../csi-wpb-utl do-divest 

```
### Step 015: GCP Remote Bucket

### STEP 015-gcp-remote-bucket fo csi-wpb-dev
Generate Configuration for dev:
```bash
clear ; export STEP=015-gcp-remote-bucket ORG=csi APP=wpb ENV=dev \
  TPL_SRC=/opt/csi/csi-wpb/csi-wpb-inf \
  SRC=/opt/csi/csi-wpb/csi-wpb-cnf/ \
  TGT=/opt/csi/csi-wpb/csi-wpb-cnf \
  ;make -C ../csi-wpb-utl do-generate-config-for-step
```
Provision for dev:
```bash
clear ; export STEP=015-gcp-remote-bucket ORG=csi APP=wpb ENV=dev \
  ;make -C ../csi-wpb-utl do-provision 
```

Divest for dev:
```bash
clear ; export STEP=015-gcp-remote-bucket ORG=csi APP=wpb ENV=dev \
  ;make -C ../csi-wpb-utl do-divest 


```

### Step 015-gcp-remote-bucket for csi-wpb-tst

Generate Configuration for tst:
```bash
clear ; export STEP=015-gcp-remote-bucket ORG=csi APP=wpb ENV=tst \
  TPL_SRC=/opt/csi/csi-wpb/csi-wpb-inf \
  SRC=/opt/csi/csi-wpb/csi-wpb-cnf/ \
  TGT=/opt/csi/csi-wpb/csi-wpb-cnf \
  ;make -C ../csi-wpb-utl do-generate-config-for-step
```
Provision for tst:
```bash
clear ; export STEP=015-gcp-remote-bucket ORG=csi APP=wpb ENV=tst \
  ;make -C ../csi-wpb-utl do-provision 
```
Divest for tst:
```bash
clear ; export STEP=015-gcp-remote-bucket ORG=csi APP=wpb ENV=tst \
  ;make -C ../csi-wpb-utl do-divest 

```

### Step 015-gcp-remote-bucket for csi-wpb-prd

Generate Configuration for prd:
```bash
clear ; export STEP=015-gcp-remote-bucket ORG=csi APP=wpb ENV=prd \
  TPL_SRC=/opt/csi/csi-wpb/csi-wpb-inf \
  SRC=/opt/csi/csi-wpb/csi-wpb-cnf/ \
  TGT=/opt/csi/csi-wpb/csi-wpb-cnf \
  ;make -C ../csi-wpb-utl do-generate-config-for-step
```
Provision for prd:
```bash
clear ; export STEP=015-gcp-remote-bucket ORG=csi APP=wpb ENV=prd \
  ;make -C ../csi-wpb-utl do-provision 
```
Divest for prd:
```bash
clear ; export STEP=015-gcp-remote-bucket ORG=csi APP=wpb ENV=prd \
  ;make -C ../csi-wpb-utl do-divest 

```


###  Step 120: GitHub General Secrets

### Step 120-github-general-secrets for csi-wpb-dev

Generate Configuration for dev:
```bash
clear ; export STEP=120-github-general-secrets ORG=csi APP=wpb ENV=dev \
  TPL_SRC=/opt/csi/csi-wpb/csi-wpb-inf \
  SRC=/opt/csi/csi-wpb/csi-wpb-cnf/ \
  TGT=/opt/csi/csi-wpb/csi-wpb-cnf \
  ;make -C ../csi-wpb-utl do-generate-config-for-step
```
Provision for dev:
```bash
clear ; export STEP=120-github-general-secrets ORG=csi APP=wpb ENV=dev \
  ;make -C ../csi-wpb-utl do-provision 
```

Divest for dev
```bash
clear ; export STEP=120-github-general-secrets ORG=csi APP=wpb ENV=dev \
  ;make -C ../csi-wpb-utl do-divest 
```

### Step 120-github-general-secrets for csi-wpb-tst
Generate Configuration for tst:
```bash
clear ; export STEP=120-github-general-secrets ORG=csi APP=wpb ENV=tst \
  TPL_SRC=/opt/csi/csi-wpb/csi-wpb-inf \
  SRC=/opt/csi/csi-wpb/csi-wpb-cnf/ \
  TGT=/opt/csi/csi-wpb/csi-wpb-cnf \
  ;make -C ../csi-wpb-utl do-generate-config-for-step
```

Provision for tst:
```bash
clear ; export STEP=120-github-general-secrets ORG=csi APP=wpb ENV=tst \
  ;make -C ../csi-wpb-utl do-provision 
```

Divest for tst
```bash
clear ; export STEP=120-github-general-secrets ORG=csi APP=wpb ENV=tst \
  ;make -C ../csi-wpb-utl do-divest 
```

### Step 120-github-general-secrets for csi-wpb-prd
Generate Configuration for prd
```bash
clear ; export STEP=120-github-general-secrets ORG=csi APP=wpb ENV=prd \
  TPL_SRC=/opt/csi/csi-wpb/csi-wpb-inf \
  SRC=/opt/csi/csi-wpb/csi-wpb-cnf/ \
  TGT=/opt/csi/csi-wpb/csi-wpb-cnf \
  ;make -C ../csi-wpb-utl do-generate-config-for-step

```

### Step 130: GCP VM

#### Step 130-org-app-gcp-vm for csi-wpb-dev

Generate Configuration for dev:
```bash
clear ; export STEP=130-org-app-gcp-vm ORG=csi APP=wpb ENV=dev \
  TPL_SRC=/opt/csi/csi-wpb/csi-wpb-inf \
  SRC=/opt/csi/csi-wpb/csi-wpb-cnf/ \
  TGT=/opt/csi/csi-wpb/csi-wpb-cnf; \
  make -C ../csi-wpb-utl do-generate-config-for-step
``` 

Provision for dev:
```bash

clear ; export STEP=130-org-app-gcp-vm ORG=csi APP=wpb ENV=dev \
  ;make -C ../csi-wpb-utl do-provision 
``` 
Divest for dev:
```bash
clear ; export STEP=130-org-app-gcp-vm ORG=csi APP=wpb ENV=dev \
  ;make -C ../csi-wpb-utl do-divest 

```

### Step 130-org-app-gcp-vm for csi-wpb-tst

Generate Configuration for tst:
```bash
clear ; export STEP=130-org-app-gcp-vm ORG=csi APP=wpb ENV=tst \
  TPL_SRC=/opt/csi/csi-wpb/csi-wpb-inf \
  SRC=/opt/csi/csi-wpb/csi-wpb-cnf/ \
  TGT=/opt/csi/csi-wpb/csi-wpb-cnf \
  ;make -C ../csi-wpb-utl do-generate-config-for-step
``` 

Provision for tst:
```bash

clear ; export STEP=130-org-app-gcp-vm ORG=csi APP=wpb ENV=tst \
  ;make -C ../csi-wpb-utl do-provision 
``` 
Divest for tst:

```bash
clear ; export STEP=130-org-app-gcp-vm ORG=csi APP=wpb ENV=tst \
  ;make -C ../csi-wpb-utl do-divest  

```

### Step 130-org-app-gcp-vm for csi-wpb-prd

Generate Configuration for prd:
```bash
clear ; export STEP=130-org-app-gcp-vm ORG=csi APP=wpb ENV=prd \
  TPL_SRC=/opt/csi/csi-wpb/csi-wpb-inf \
  SRC=/opt/csi/csi-wpb/csi-wpb-cnf/ \
  TGT=/opt/csi/csi-wpb/csi-wpb-cnf \
  ;make -C ../csi-wpb-utl do-generate-config-for-step
``` 

Provision for prd:
```bash

clear ; export STEP=130-org-app-gcp-vm ORG=csi APP=wpb ENV=prd \
  ;make -C ../csi-wpb-utl do-provision 
``` 
Divest for prd:

```bash
clear ; export STEP=130-org-app-gcp-vm ORG=csi APP=wpb ENV=prd \
  ;make -C ../csi-wpb-utl do-divest 

```
### Step 131: GCP VM www-data Setup

Generate Configuration for dev
```bash
clear ; export STEP=131-gcp-vm-www-data-setup ORG=csi APP=wpb ENV=dev \
  TPL_SRC=/opt/csi/csi-wpb/csi-wpb-inf \
  SRC=/opt/csi/csi-wpb/csi-wpb-cnf/ \
  TGT=/opt/csi/csi-wpb/csi-wpb-cnf \
  ;make -C ../csi-wpb-utl do-generate-config-for-step
```
Provision for dev
```bash
clear ; export STEP=131-gcp-vm-www-data-setup ORG=csi APP=wpb ENV=dev \
  ;make -C ../csi-wpb-utl do-provision 
```

Divest for dev
```bash
clear ; export STEP=131-gcp-vm-www-data-setup ORG=csi APP=wpb ENV=dev \
  ;make -C ../csi-wpb-utl do-divest 
```

### Step 131-gcp-vm-www-data-setup for csi-wpb-tst

generate Configuration for tst
```bash
clear ; export STEP=131-gcp-vm-www-data-setup ORG=csi APP=wpb ENV=tst \
  TPL_SRC=/opt/csi/csi-wpb/csi-wpb-inf \
  SRC=/opt/csi/csi-wpb/csi-wpb-cnf/ \
  TGT=/opt/csi/csi-wpb/csi-wpb-cnf \
  ;make -C ../csi-wpb-utl do-generate-config-for-step
```

provision for tst
```bash

clear ; export STEP=131-gcp-vm-www-data-setup ORG=csi APP=wpb ENV=tst \
  ;make -C ../csi-wpb-utl do-provision 
```

divest for tst
```bash
clear ; export STEP=131-gcp-vm-www-data-setup ORG=csi APP=wpb ENV=tst \
  ;make -C ../csi-wpb-utl do-divest 
```

### Step 131-gcp-vm-www-data-setup for csi-wpb-prd

generate Configuration for prd
```bash
clear ; export STEP=131-gcp-vm-www-data-setup ORG=csi APP=wpb ENV=prd \
  TPL_SRC=/opt/csi/csi-wpb/csi-wpb-inf \
  SRC=/opt/csi/csi-wpb/csi-wpb-cnf/ \
  TGT=/opt/csi/csi-wpb/csi-wpb-cnf
  ;make -C ../csi-wpb-utl do-generate-config-for-step
```

provision for prd
```bash
clear ; export STEP=131-gcp-vm-www-data-setup ORG=csi APP=wpb ENV=prd \
  ;make -C ../csi-wpb-utl do-provision 
```

divest for prd
```bash
clear ; export STEP=131-gcp-vm-www-data-setup ORG=csi APP=wpb ENV=prd \
  ;make -C ../csi-wpb-utl do-divest 

```
