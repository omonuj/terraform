terraform {
    backend "s3" {
        bucket = "dev-applications-backend-state-in28minutes-abc"
        #key = "07-backend-state-users-dev"
        key = "dev/07-backend-state/users/backend-state"
        region = "us-east-1"
        dynamodb_table = "dev_application_locks"