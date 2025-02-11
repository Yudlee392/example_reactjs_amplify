# Dockerfile

# Sử dụng node:14 làm base image
FROM node:14

# Tạo thư mục làm việc trong container
WORKDIR /app

# Sao chép package files và cài đặt dependencies
COPY frontend/package*.json ./
RUN npm install

# Sao chép mã nguồn vào thư mục làm việc
COPY frontend/. .

# Xây dựng ứng dụng
RUN npm run build

# Sử dụng nginx để phục vụ ứng dụng
FROM nginx:alpine
COPY --from=0 /app/build /usr/share/nginx/html

# Expose port 80 để có thể truy cập từ bên ngoài
EXPOSE 80

# Khởi chạy nginx
CMD ["nginx", "-g", "daemon off;"]
