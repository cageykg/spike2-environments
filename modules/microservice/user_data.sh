#!/bin/bash
cat > index.html <<EOF
<h1>Hello, World</h1>
<p>I am the ${service_name} running in the ${vpc_name} VPC!</p>
<p>I have been created from a later version of the microservice module</p>
EOF

nohup busybox httpd -f -p "${service_port}" &