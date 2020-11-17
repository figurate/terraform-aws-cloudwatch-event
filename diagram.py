from diagrams import Diagram, Cluster
from diagrams.aws.management import Cloudwatch

with Diagram("AWS CloudWatch Event Rule", show=False, direction="TB"):

    with Cluster("cloudwatch event rule"):
        source = Cloudwatch("event source")
        target = Cloudwatch("event target")
