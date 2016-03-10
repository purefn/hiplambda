import System.Environment

serviceDescriptor :: String -> String
serviceDescriptor version = "{\n\
\   \"description\": \"Eval stuff\",\n\
\   \"name\": \"hiplambda\",\n\
\   \"organization\": \"RD:Identity\",\n\
\   \"externalAccess\": false,\n\
\   \"resources\": [{\n\
\      \"type\": \"postgres-db\",\n\
\      \"name\": \"db\"\n\
\   }],\n\
\   \"links\": {\n\
\      \"binary\": {\n\
\         \"name\": \"docker.atlassian.io/atlassian/hiplambda\",\n\
\         \"type\": \"docker\",\n\
\         \"tag\": \"" ++ version ++ "\"\n\
\      },\n\
\      \"healthcheck\": {\n\
\         \"uri\": \"heartbeat\"\n\
\      },\n\
\      \"source\": {\n\
\         \"url\": \"https://github.com/purefn/hiplambda.git\"\n\
\      }\n\
\   },\n\
\   \"owners\": [\n\
\      \"aknoll@atlassian.com\"\n\
\   ],\n\
\   \"notifications\": {\n\
\      \"pagerduty\": {\n\
\         \"cloudwatch\": \"https://events.pagerduty.com/adapter/cloudwatch_sns/v1/124e0f010f214a9b9f30b768e7b18e69\",\n\
\         \"apiKey\": \"5d11612f25b840faaf77422edeff9c76\"\n\
\      },\n\
\      \"email\": \"aknoll@atlassian.com\"\n\
\   },\n\
\   \"scaling\": {\n\
\      \"min\": 1\n\
\   },\n\
\   \"downstreamServices\": []\n\
\}"

versionEnvName = "RELEASE_VERSION"
descriptorFileName = "service-descriptor.json"

main = do
  ver <- getEnv versionEnvName
  writeFile descriptorFileName (serviceDescriptor ver)
