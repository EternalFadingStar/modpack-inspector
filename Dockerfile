# Use an official Python runtime as a parent image
FROM python:3.9-slim as backend

# Set the working directory in the container for the backend
WORKDIR /usr/src/app

# Copy the backend directory contents into the container
COPY ./backend .

# Install any needed packages specified in requirements.txt for the Flask backend
RUN pip install --no-cache-dir -r requirements.txt

# Use Node.js official image to build the React frontend
FROM node:14 as frontend

# Set the working directory in the container for the frontend
WORKDIR /usr/src/app

# Copy the frontend directory contents into the container
COPY ./frontend .

# Install any needed packages and build the React application
RUN npm install
RUN npm run build

# Final stage: Create an image that will run the application
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the backend build from the backend stage
COPY --from=backend /usr/src/app .

# Copy the frontend build from the frontend stage
COPY --from=frontend /usr/src/app/build ./static

# Make port 80 available to the world outside this container
EXPOSE 80

# Run modpack_inspector.py when the container launches
CMD ["python", "./modpack_inspector.py"]
