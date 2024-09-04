import { StrictMode } from "react";
import { createRoot } from "react-dom/client";
import App from "./App.jsx";
import "./index.css";
import keycloak from "./keycloak";
import { ReactKeycloakProvider } from "@react-keycloak/web";

createRoot(document.getElementById("root")).render(
  <ReactKeycloakProvider
    authClient={keycloak}
    initOptions={{
      onLoad: "check-sso",
    }}
  >
    <StrictMode>
      <App />
    </StrictMode>
  </ReactKeycloakProvider>,
);
