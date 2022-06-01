
# scan nginx
trivy image nginx:1.21.6
trivy image --severity CRITICAL nginx:1.21.6
trivy image --severity CRITICAL nginx:1.19.2

# scan alpine
trivy image alpine:3.15.4

# do an own image with faulty dependencies

trivy image --severity CRITICAL elasticsearch:6.8.21
trivy image --severity CRITICAL elasticsearch:6.8.22
trivy image --severity CRITICAL elasticsearch:8.2.0

