
# scan nginx
trivy image nginx:1.21.6
trivy image --severity CRITICAL nginx:1.19.2
trivy image --severity CRITICAL nginx:1.21.6
<!-- TODO visualize exit code -->
trivy image --severity CRITICAL --exit-code 1 nginx:1.21.6

# scan alpine
trivy image alpine:3.15.4

# do an own image with faulty dependencies

<!-- TODO create own log4shell image -->
https://stackoverflow.com/questions/70565602/check-log4j-vulnerability-for-elasticsearch

trivy image --severity CRITICAL andylibrian/log4shell-vulnerable-app
