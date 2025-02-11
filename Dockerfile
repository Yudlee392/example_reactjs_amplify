# Dockerfile

# Sử dụng Node.js làm base image
FROM node:14

# Tạo thư mục làm việc trong container
WORKDIR /app

# Sao chép package files và cài đặt dependencies
COPY package*.json ./
RUN npm install

# Sao chép toàn bộ mã nguồn vào thư mục làm việc
COPY . .

# Xây dựng ứng dụng cho môi trường production
RUN npm run build

# Sử dụng nginx để phục vụ ứng dụng
FROM nginx:alpine
COPY --from=0 /app/build /usr/share/nginx/html

# Expose port 80 để có thể truy cập từ bên ngoài
EXPOSE 80

# Khởi chạy nginx
CMD ["nginx", "-g", "daemon off;"]
