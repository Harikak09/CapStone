# Incident Note

Incident: Docker container stopped - manual chaos test

Description:
A Docker container running an Nginx application was intentionally stopped to simulate a service failure and observe recovery behavior.

Impact:
- Application became temporarily unavailable
- HTTP requests failed during container downtime

Root Cause:
- Container stopped manually as part of project24

Recovery:
- Container restarted manually using docker start
- Application availability restored successfully

Time to Recovery:
- Approximately 1 minute
