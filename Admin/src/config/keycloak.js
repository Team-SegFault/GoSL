import Keycloak from "keycloak-js";

const keycloak = new Keycloak({
  url: "http://localhost:8080/auth", // Keycloak server URL
  realm: "gosl", // Your realm name
  clientId: "gosl-admin", // Your client ID
});

export default keycloak;
