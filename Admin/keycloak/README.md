## Setup Keycloak
1. Run the sh or bat file to start the docker container
2. Open the browser and go to localhost:8080
3. Login with the following credentials:
   - Username: admin
   - Password: admin
4. Create a new realm
   - Import `realm-export.json` in this folder to create a new realm
Client will be automatically created and you can use it to test the application.
5. Create a new user
   - Go to Users > Add User
   - Give the username and click create
6. Set the credentials for the user
   - Go to Credentials tab and set the password, (uncheck Temporary to make it permanent)

## Usage
1. Run the application
2. Go to localhost:5143
3. Login with the user you created in Keycloak
