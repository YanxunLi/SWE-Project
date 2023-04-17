import pika
from google.cloud import storage

# Set up RabbitMQ connection
connection = pika.BlockingConnection(pika.ConnectionParameters('localhost'))
channel = connection.channel()

# Declare queue for logs
channel.queue_declare(queue='logs')

# Set up GCS client
storage_client = storage.Client()
bucket = storage_client.bucket('my_bucket')


# Callback function to consume logs and write to GCS
def callback(ch, method, properties, body):
    # Get log message
    log_message = body.decode('utf-8')

    # Create GCS blob object
    blob = bucket.blob('logs/my_log.txt')

    # Write log message to blob
    blob.upload_from_string(log_message)

    # Print confirmation message
    print('Log written to GCS')


# Set up consumer to consume logs from RabbitMQ and call callback function
channel.basic_consume(queue='logs', on_message_callback=callback, auto_ack=True)

# Start consuming logs
print('Consuming logs...')
channel.start_consuming()
