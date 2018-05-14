This Docker Workshop was created with [reveal.js](https://github.com/hakimel/reveal.js).

A lof ot the content was taken from this repo [docker-workshop](https://github.com/gvilarino/docker-workshop).

# Docker Workshop

A simple docker workshop for anyone who wants to learn how to use docker effectively in their day-to-day dev work.

## Table of contents

- [Quickstart with Amazon Cloud9](#Quickstart-with-Amazon-Cloud9)
- [Full setup](#full-setup)

## Quickstart with Amazon Cloud9

Provision a [Cloud9](https://aws.amazon.com/cloud9/) environment using one of the CloudFormation templates below.

Cloud9 is available in 5 regions:

| Region | Launch with new VPC | Launch with Existing VPC |
|:------:|:-------------------:|:------------------------:|
| **N. Virginia** (us-east-1) | [Deploy to AWS](https://console.aws.amazon.com/cloudformation/home#/stacks/create/review?region=us-east-1&stackName=Cloud9-DockerWorkshop-201805&templateURL=https://s3-eu-west-1.amazonaws.com/docker-workshop-quickstart/lab-ide-vpc.template.yml) | [Deploy to AWS](https://console.aws.amazon.com/cloudformation/home#/stacks/create/review?region=us-east-1&stackName=Cloud9-DockerWorkshop-201805&templateURL=https://s3-eu-west-1.amazonaws.com/docker-workshop-quickstart/lab-ide-novpc.template.yml)  |
| **Ohio** (us-east-2) | [Deploy to AWS](https://console.aws.amazon.com/cloudformation/home#/stacks/create/review?region=us-east-2&stackName=Cloud9-DockerWorkshop-201805&templateURL=https://s3-eu-west-1.amazonaws.com/docker-workshop-quickstart/lab-ide-vpc.template.yml) | [Deploy to AWS](https://console.aws.amazon.com/cloudformation/home#/stacks/create/review?region=us-east-2&stackName=Cloud9-DockerWorkshop-201805&templateURL=https://s3-eu-west-1.amazonaws.com/docker-workshop-quickstart/lab-ide-novpc.template.yml)
| **Oregon** (us-west-2) | [Deploy to AWS](https://console.aws.amazon.com/cloudformation/home#/stacks/create/review?region=us-west-2&stackName=Cloud9-DockerWorkshop-201805&templateURL=https://s3-eu-west-1.amazonaws.com/docker-workshop-quickstart/lab-ide-vpc.template.yml) | [Deploy to AWS](https://console.aws.amazon.com/cloudformation/home#/stacks/create/review?region=us-west-2&stackName=Cloud9-DockerWorkshop-201805&templateURL=https://s3-eu-west-1.amazonaws.com/docker-workshop-quickstart/lab-ide-novpc.template.yml)
| **Ireland** (eu-west-1) | [Deploy to AWS](https://console.aws.amazon.com/cloudformation/home#/stacks/create/review?region=eu-west-1&stackName=Cloud9-DockerWorkshop-201805&templateURL=https://s3-eu-west-1.amazonaws.com/docker-workshop-quickstart/lab-ide-vpc.template.yml) | [Deploy to AWS](https://console.aws.amazon.com/cloudformation/home#/stacks/create/review?region=eu-west-1&stackName=Cloud9-DockerWorkshop-201805&templateURL=https://s3-eu-west-1.amazonaws.com/docker-workshop-quickstart/lab-ide-novpc.template.yml)
| **Singapore** (ap-southeast-1) | [Deploy to AWS](https://console.aws.amazon.com/cloudformation/home#/stacks/create/review?region=ap-southeast-1&stackName=Cloud9-DockerWorkshop-201805&templateURL=https://s3-eu-west-1.amazonaws.com/docker-workshop-quickstart/lab-ide-vpc.template.yml) | [Deploy to AWS](https://console.aws.amazon.com/cloudformation/home#/stacks/create/review?region=ap-southeast-1&stackName=Cloud9-DockerWorkshop-201805&templateURL=https://s3-eu-west-1.amazonaws.com/docker-workshop-quickstart/lab-ide-novpc.template.yml)

To open Cloud9 select the URL in the Outputs of the CloudFormation stack.

### Setup Script

Download and run the environment setup script

```bash
$ aws s3 cp s3://docker-workshop-quickstart/lab-ide-build.sh . && \
    chmod +x lab-ide-build.sh && \
    . ./lab-ide-build.sh
```

The output should show the endpoint for the environment:

```bash
 Details:
 --------
 Docker Workshop Version: May 2018
 Endpoint URL: https://ec2-34-216-12-241.us-west-2.compute.amazonaws.com
```

## Run your first Web Server with Docker

```bash
$ docker run -it --rm -p 80:80 nginx
```

Navigate to the Endpoint URL on port 80 (HTTP) to view the nginx welcome page.

## Full setup

Some reveal.js features, like external Markdown and speaker notes, require that presentations run from a local web server. The following instructions will set up such a server as well as all of the development tasks needed to make edits to the reveal.js source code.

1. Install [Node.js](http://nodejs.org/) (4.0.0 or later)

1. Clone the workshop repository
   ```sh
   $ git clone git@github.com:marcossantiago/docker-workshop.git
   ```

1. Navigate to the docker-workshop folder
   ```sh
   $ cd docker-workshop
   ```

1. Install dependencies
   ```sh
   $ npm install
   ```

1. Serve the presentation and monitor source files for changes
   ```sh
   $ npm start
   ```

1. Open <http://localhost:8000> to view your presentation

   You can change the port by using `npm start -- --port=8001`.