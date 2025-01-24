FROM python:3
RUN pip install django==3.2
WORKDIR /app

# Copy the requirements file and install dependencies
COPY requirements.txt /app/
RUN yum update && yum install -y python3-distutils
RUN pip install -r requirements.txt


COPY . /app
 
RUN python manage.py migrate
EXPOSE 8000
CMD ["python","manage.py","runserver","0.0.0.0:8000
