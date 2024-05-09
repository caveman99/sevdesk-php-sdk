#!/bin/sh

openapi-generator generate\
    -i sevdesk-api/openapi.yaml\
    -g php\
    -o ./\
    --package-name itsmind/sevdesk-php-client\
    --additional-properties=disallowAdditionalPropertiesIfNotPresent=false,invokerPackage=Itsmind\\Sevdesk,packageName=itsmind/sevdesk-client\
    --git-user-id itsmindcom\
    --git-repo-id sevdesk-php-client
