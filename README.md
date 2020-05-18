# pg_activity
Useful for debugging live PostgreSQL performance. 
=======
A simple container that runs [pg_activity](https://github.com/dalibo/pg_activity) and accepts the connection parameters as a URL string.

## How to use ##

Do not attempt to build this repository. For expediency's sake, you should deploy the pre-built image of this repository from `aptible/pg_activity` using the following instructions:

1) Create a new App named "pgactivity": `aptible apps:create pgactivity`
1) Deploy the image: `aptible deploy --app pgactivity --docker-image aptible/pg_activity`
1) (Optional, to save costs) Scale the app to zero running containers: `aptible apps:scale --app pgactivity cmd --container-count 0`
1) SSH into the App, pulling and providing the connection credentials directly: `aptible ssh --app pgactivity $(aptible db:url $YOUR_DB_HANDLE)`

## Help ##

Refer directly to https://github.com/dalibo/pg_activity#interactives-commands for instructions on how to interact with pg_activity.
