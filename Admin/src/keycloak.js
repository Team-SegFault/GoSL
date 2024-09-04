import Keycloak from "keycloak-js";

const config = {
  url: "http://localhost:8080/", // Keycloak server URL
  realm: "gosl", // Your realm name
  clientId: "gosl-admin", // Your client ID
};

const keycloak = new Keycloak(config);

export default keycloak;
