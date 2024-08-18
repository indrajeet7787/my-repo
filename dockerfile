# Use the official Golang image to build the app
FROM golang:1.19 AS builder

# Set the working directory
WORKDIR /app

# Copy the Go application
COPY . .

# Build the Go application
RUN go build -o my-go-app

# Use a lightweight image to run the binary
FROM alpine:latest
WORKDIR /root/

# Copy the binary from the builder image
COPY --from=builder /app/my-go-app .

# Expose the application port
EXPOSE 8080

# Run the Go application
CMD ["./my-go-app"]

