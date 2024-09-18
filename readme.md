# deploy

- yêu cầu: docker, minikube, kubectl

1. khởi động minikube
    ```bash
    minikube start
    ```
2. cài đặt cert-manager và ingress-contrller
    - chạy câu lệnh trong file `command.txt`
3. chạy toàn bộ config k8s
    ```
    kubuctl apply -f .
    ```
4. mở tunnel minikube, cần chạy với quyền admin
    ```
    minikube tunnel
    ```
