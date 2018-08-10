echo off
echo showing AWS buckets:
aws s3 ls
echo press enter to remove bucket :: %1
pause
echo removing.... %1

aws s3 rb s3://%1 --force
echo please verify removal
aws s3 ls